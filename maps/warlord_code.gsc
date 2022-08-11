// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

spawn_allies()
{
    if ( !isdefined( level._id_4877 ) )
    {
        var_0 = getent( "price", "targetname" );
        level._id_4877 = var_0 maps\_utility::_id_166F( 1 );

        if ( !isdefined( level._id_4877._id_0D04 ) )
            level._id_4877 maps\_utility::_id_0D04();

        level._id_4877._id_1032 = "price";
        level._id_4877._id_0D0D = 1;
        level._id_4877.ignoresuppression = 1;
        level._id_4877 thread maps\warlord_utility::_id_6B90();
        level._id_4877._id_6BDD = "y";
    }

    if ( !isdefined( level._id_54E0 ) )
    {
        var_1 = getent( "soap", "targetname" );
        level._id_54E0 = var_1 maps\_utility::_id_166F( 1 );

        if ( !isdefined( level._id_54E0._id_0D04 ) )
            level._id_54E0 maps\_utility::_id_0D04();

        level._id_54E0._id_1032 = "soap";
        level._id_54E0._id_0D0D = 1;
        level._id_54E0.ignoresuppression = 1;
        level._id_54E0 thread maps\warlord_utility::_id_6B90();
        level._id_54E0.voice = "taskforce";
        level._id_54E0._id_0AB4 = "TF";
        level._id_54E0._id_6BDD = "g";
    }

    common_scripts\utility::flag_set( "allies_spawned" );
}

_id_6C52()
{
    thread maps\_introscreen::_id_1D97( 2.5, 5 );
    var_0 = [];
    var_0[var_0.size] = &"WARLORD_INTROSCREEN_LINE1";
    var_0["date"] = &"WARLORD_INTROSCREEN_LINE2";
    var_0[var_0.size] = &"WARLORD_INTROSCREEN_LINE3";
    var_0[var_0.size] = &"WARLORD_INTROSCREEN_LINE4";
    var_0[var_0.size] = &"WARLORD_INTROSCREEN_LINE5";
    wait 2;
    common_scripts\utility::flag_set( "river_allies_stand" );
    level waittill( "finished_water_emerge" );
    level._id_4877 maps\_utility::_id_109B();
    level._id_54E0 maps\_utility::_id_109B();
    maps\_utility::_id_26BF( "trig_intro_allies" );
    wait 3;
    level._id_4877 maps\_utility::_id_109E();
    level._id_54E0 maps\_utility::_id_109E();
    level._id_4877 thread maps\warlord_utility::_id_4E96();
    level._id_54E0 thread maps\warlord_utility::_id_4E96();
    common_scripts\utility::flag_wait( "river_intro_vo_done" );
    maps\_introscreen::_id_1D96( var_0 );
}

_id_6C53()
{
    level.player setwatersheeting( 1, 5.5 );
}

_id_6C54()
{
    spawn_allies();
    thread _id_6C55();
    level.player allowsprint( 0 );
    level.player thread _id_6C59();
    level._id_4877 thread _id_6C5A();
    level._id_54E0 thread _id_6C5A();
}

_id_6C55()
{
    common_scripts\utility::flag_set( "play_river_dialogue" );
    level.player disableweapons();
    level.player freezecontrols( 1 );
    thread _id_6C58();
    var_0 = common_scripts\utility::getstruct( "org_intro", "targetname" );
    var_1 = maps\_utility::_id_1287( "player_rig" );
    var_1 hide();
    var_2 = maps\_utility::_id_1287( "sniper_rifle" );
    thread maps\warlord_fx::_id_54E1( var_2, var_1 );
    var_2 hide();
    var_0 maps\_anim::_id_11CF( var_1, "water_emerge" );
    level.player thread _id_6C56( var_1, "tag_player" );
    var_3 = getanimlength( var_1 maps\_utility::_id_1281( "water_emerge" ) );
    level.player shellshock( "slowview", var_3 + 2 );
    level._id_4877 thread maps\_anim::_id_124E( level._id_4877, "water_crouch_idle", "water_emerge" );
    level._id_54E0 thread maps\_anim::_id_124E( level._id_54E0, "water_crouch_idle", "water_emerge" );
    common_scripts\utility::flag_wait( "river_allies_stand" );
    maps\_utility::delaythread( 1.5, common_scripts\utility::flag_set, "river_dialogue" );
    thread maps\warlord_fx::_id_54DF();
    var_4 = [];
    var_4[0] = level._id_4877;
    var_4[1] = level._id_54E0;
    var_4[2] = var_1;
    var_4[3] = var_2;
    level._id_54E0 notify( "water_emerge" );
    level._id_4877 notify( "water_emerge" );
    var_1 common_scripts\utility::delaycall( 0.2, ::show );
    var_2 maps\_utility::delaythread( 0.2, ::_id_6C57 );
    level._id_4877 thread maps\_shg_common::_id_16E9( "price_emerge_lines" );
    var_0 maps\_anim::_id_11DD( var_4, "water_emerge" );
    level.player playerlinktoblend( var_1, "tag_player", 0.2, 0.1, 0.1 );
    wait 0.2;
    var_1 delete();
    var_2 delete();
    common_scripts\utility::flag_wait( "player_show_gun" );
    common_scripts\utility::flag_set( "obj_first_follow_price" );
    level.player enableweapons();
    level.player unlink();
    level.player freezecontrols( 0 );
    level notify( "finished_water_emerge" );
}

_id_6C56( var_0, var_1 )
{
    self playerlinktodelta( var_0, var_1, 1, 0, 0, 0, 0, 1 );
    wait 2;
    self playerlinktodelta( var_0, var_1, 1, 15, 10, 15, 5 );
}

_id_6C57()
{
    self show();
    self hidepart( "TAG_FOREGRIP" );
    self hidepart( "TAG_THERMAL_SCOPE" );
    self hidepart( "TAG_ACOG_2" );
    self hidepart( "TAG_HEARTBEAT" );
    self hidepart( "TAG_MOTION_TRACKER" );
}

_id_6C58()
{
    level endon( "finished_water_emerge" );
    var_0 = getent( "interrupt_intro_anim_trigger", "targetname" );
    var_0 waittill( "trigger" );
    level._id_4877 notify( "single anim", "end" );
    level._id_4877 stopanimscripted();
    level._id_54E0 notify( "single anim", "end" );
    level._id_54E0 stopanimscripted();
}

_id_6C59()
{
    var_0 = getent( "deep_water_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 != self )
            continue;

        while ( level.player istouching( var_0 ) )
        {
            if ( level.player.origin[2] < -154 )
            {
                level.player allowcrouch( 0 );
                level.player allowprone( 0 );
                level.player allowjump( 0 );
            }
            else if ( level.player.origin[2] < -129 )
            {
                level.player allowcrouch( 1 );
                level.player allowprone( 0 );
                level.player allowjump( 0 );
            }
            else if ( level.player.origin[2] < -127 )
            {
                level.player allowcrouch( 1 );
                level.player allowprone( 1 );
                level.player allowjump( 1 );
            }

            var_2 = ( level.player.origin[2] + 167.875 ) / 40 * 100;
            var_2 = max( var_2, 30 );
            maps\_utility::_id_2797( var_2 );
            wait 0.05;
        }

        maps\_utility::_id_2797( 70 );
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
        level.player allowjump( 1 );
        level.player allowsprint( 1 );
    }
}

_id_6C5A()
{
    var_0 = getent( "deep_water_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 != self )
            continue;

        while ( var_1 istouching( var_0 ) )
        {
            var_2 = ( var_1.origin[2] + 167.875 ) / 40;
            var_2 = max( var_2, 0.4 );
            var_1._id_0FC6 = var_2;
            var_1._id_1199 = 1;
            wait 0.05;
        }

        var_1._id_0FC6 = 1;
        var_1._id_1199 = 0;
    }
}

_id_6C5B()
{
    var_0 = getentarray( "civ_river_corpse", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );

        if ( isdefined( var_3 ) )
            var_2 _id_6C5C( var_3, var_3.animation );
    }

    thread _id_6C5E();
}

_id_6C5C( var_0, var_1 )
{
    self.count = 1;
    var_2 = maps\_utility::_id_166F( 1 );
    var_2._id_1032 = "generic";
    var_3 = var_2 maps\_utility::_id_1281( var_1 );
    var_0 maps\_anim::_id_11C0( var_2, var_1 );
    var_4 = maps\_vehicle_aianim::_id_25C1( var_2 );
    var_4 setanim( var_3, 1, 0.2, 0 );
    var_4 notsolid();
    var_4 thread _id_6C5D();
}

_id_6C5D()
{
    common_scripts\utility::flag_wait( "clean_up_river" );

    if ( isdefined( self ) )
        self delete();
}

_id_6C5E()
{
    var_0 = common_scripts\utility::getstructarray( "org_body_pile", "targetname" );

    foreach ( var_2 in var_0 )
        _id_6C5F( var_2.origin, ( 0.0, 90.0, 0.0 ), 1 );
}
#using_animtree("generic_human");

_id_6C5F( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_0 );
    var_3.angles = ( 0.0, 0.0, 0.0 );
    var_4 = _id_6C60( var_3, var_0, ( 0.0, 0.0, 0.0 ) );
    var_4 useanimtree( #animtree );
    var_4 clearanim( %root, 0 );
    var_4 setanim( %covercrouch_death_1 );
    var_4 notsolid();
    var_4 = _id_6C60( var_3, var_0 + ( -25.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 useanimtree( #animtree );
    var_4 clearanim( %root, 0 );
    var_4 setanim( %covercrouch_death_2 );
    var_4 notsolid();
    var_4 = _id_6C60( var_3, var_0 + ( -20.0, 40.0, 0.0 ), ( 0.0, -135.0, 0.0 ) );
    var_4 useanimtree( #animtree );
    var_4 clearanim( %root, 0 );
    var_4 setanim( %covercrouch_death_3 );
    var_4 notsolid();

    if ( !isdefined( var_2 ) )
    {
        var_4 = _id_6C60( var_3, var_0 + ( -45.0, 20.0, -5.0 ), ( 6.0, 90.0, 0.0 ) );
        var_4 useanimtree( #animtree );
        var_4 clearanim( %root, 0 );
        var_4 setanim( %corner_standr_death_grenade_slump );
        var_4 notsolid();
    }

    if ( isdefined( var_1 ) )
    {
        var_3 rotateto( var_1, 0.1 );
        wait 0.15;
    }

    var_3 delete();
}

_id_6C60( var_0, var_1, var_2 )
{
    var_3 = getent( "river_deadguy_1", "script_noteworthy" );
    var_3.count = 1;
    var_4 = maps\_utility::_id_212D( var_3 );
    var_4.script_noteworthy = undefined;
    var_4.ignoreall = 1;
    var_4.ignoreme = 1;
    var_4.team = "neutral";
    var_4.origin = var_1;
    var_4.angles = var_3.angles + var_2;
    var_4 linkto( var_0 );
    wait 0.05;
    return var_4;
}

_id_6C61()
{
    common_scripts\utility::flag_init( "river_stop_soap_idle" );
    maps\_utility::_id_262C( "trigger_encounter_2" );
    thread _id_6C66();
    thread _id_6E39( 0.2 );
    thread _id_6C67();
    level._id_4877 thread _id_6C69();
    level._id_54E0 thread _id_6C69();
    thread _id_6C64();
    thread _id_6C6D();
    thread _id_6C86();
    wait 2;
    var_0 = _id_6C6F( "river_technical_1" );
    wait 1.5;
    var_1 = _id_6C6F( "river_technical_3" );
    level._id_6C62 = common_scripts\utility::array_combine( var_0._id_0A39, var_1._id_0A39 );
    thread _id_6C78( var_0, var_1 );
    thread _id_6C75();
    thread _id_6C6B();
    thread _id_6C65();
    thread _id_6C82();
    thread _id_6C8C();
    level._id_4877 thread _id_6C6A();
    level._id_54E0 thread _id_6C6A();
    var_2 = [ var_0, var_1 ];
    maps\_audio::aud_send_msg( "intro_river_technicals", var_2 );

    if ( !isdefined( level._id_6C63 ) )
        level._id_6C63 = [];

    common_scripts\utility::flag_wait( "river_encounter_done" );
    wait 1;
    maps\warlord_stealth::_id_6BC8();
    level notify( "enable_river_mantle" );
    common_scripts\utility::flag_set( "river_technicals_move_dialogue" );
    thread _id_6C8F();
    var_3 = getent( "trig_ally_river_mantle_done", "targetname" );
    var_3 waittill( "trigger" );
    common_scripts\utility::flag_set( "river_stop_soap_idle" );
    thread _id_6C90();
}

_id_6C64()
{
    var_0 = getent( "river_log_mantle", "targetname" );
    var_1 = var_0.origin;
    var_0.origin = ( 0.0, 0.0, 0.0 );
    level waittill( "enable_river_mantle" );
    var_2 = getent( "river_mantle_clip", "targetname" );
    var_2 delete();
    var_0.origin = var_1;
}

_id_6C65()
{
    level endon( "river_encounter_done" );

    if ( common_scripts\utility::flag( "river_encounter_done" ) )
        return;

    wait 30;
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    level notify( "enable_river_mantle" );
}

_id_6C66()
{
    level endon( "river_encounter_done" );
    level.player waittill( "death" );
    level notify( "new_quote_string" );
    setdvar( "ui_deadquote", &"WARLORD_STEALTH_DEATH" );
}

_id_6C67()
{
    var_0 = common_scripts\utility::getstruct( "org_soap_pulldown", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_54E0, "africa_soap_pulldown_entrance_guy1" );
    var_0 maps\_anim::_id_1246( level._id_54E0, "africa_soap_pulldown_entrance_guy1" );
    var_0 thread _id_6C68();
}

_id_6C68()
{
    self notify( "stop_loop" );
    level._id_54E0 notify( "stop_soap_crouch_idle" );
    level._id_54E0 endon( "stop_soap_crouch_idle" );
    thread maps\_anim::_id_124E( level._id_54E0, "africa_soap_pulldown_crouch_idle_guy1", "stop_loop" );
    common_scripts\utility::flag_wait_any( "river_stop_soap_idle", "_stealth_spotted" );
    self notify( "stop_loop" );
}

_id_6C69()
{
    var_0 = undefined;

    if ( self.goalradius > 32 )
    {
        var_0 = self.goalradius;
        self.goalradius = 32;
    }

    self pushplayer( 1 );
    common_scripts\utility::flag_wait_any( "river_encounter_done", "_stealth_spotted" );
    self pushplayer( 0 );

    if ( isdefined( var_0 ) )
        self.goalradius = var_0;
}

_id_6C6A()
{
    level endon( "river_encounter_done" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    _id_6CB2( "river_encounter_done" );
}

_id_6C6B()
{
    level endon( "river_encounter_done" );

    if ( common_scripts\utility::flag( "river_encounter_done" ) )
        return;

    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "technical_steal_broken_vo" );
    maps\_audio::aud_send_msg( "mus_river_first_encounter_spotted" );
    var_0 = getent( "river_bank_goal_volume", "targetname" );
    var_1 = [];
    var_1[var_1.size] = var_0;

    if ( common_scripts\utility::flag( "river_technicals_stop" ) )
    {
        var_2 = getentarray( "river_far_bank_goal_volume", "targetname" );

        foreach ( var_4 in var_2 )
            var_1[var_1.size] = var_4;
    }

    foreach ( var_7 in level._id_6C62 )
    {
        if ( isdefined( var_7 ) && isalive( var_7 ) )
        {
            if ( var_1.size == 1 )
            {
                var_7 thread _id_6C6C( var_1[0] );
                continue;
            }

            var_8 = undefined;
            var_9 = undefined;

            foreach ( var_11 in var_1 )
            {
                var_12 = distancesquared( var_11.origin, var_7.origin );

                if ( !isdefined( var_8 ) || var_12 < var_9 )
                {
                    var_8 = var_11;
                    var_9 = var_12;
                }
            }

            var_7 thread _id_6C6C( var_8 );
        }
    }
}

_id_6C6C( var_0 )
{
    self endon( "death" );

    if ( isdefined( self._id_2252 ) )
        self waittill( "jumpedout" );

    maps\_utility::_id_260D();
    self setgoalvolumeauto( var_0 );
}

_id_6C6D()
{
    level endon( "river_encounter_done" );

    if ( common_scripts\utility::flag( "river_encounter_done" ) )
        return;

    thread _id_6C6E( "river_encounter_done" );
    level endon( "enemy_bad_event" );
    thread maps\warlord_utility::_id_6BB0( "in_crouch_stealth_range", "flag_in_crouch_stealth_range", "river_encounter_done" );
    maps\warlord_stealth::_id_6BCA();

    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_in_crouch_stealth_range" );
        maps\warlord_stealth::_id_6BCC();
        common_scripts\utility::flag_waitopen( "flag_in_crouch_stealth_range" );
        maps\warlord_stealth::_id_6BCA();
    }
}

_id_6C6E( var_0 )
{
    level endon( var_0 );
    level waittill( "enemy_bad_event" );
    maps\warlord_stealth::_id_6BCB();
}

_id_6C6F( var_0 )
{
    var_1 = maps\_vehicle::_id_2881( var_0 );
    var_1 maps\_utility::_id_1402( "no_unload_zone" );
    var_1 thread _id_6C76();
    var_1 thread maps\warlord_stealth::_id_6BE8();
    var_1 thread _id_6C83();
    var_1 thread _id_6C72();
    var_1 thread _id_6C70();
    return var_1;
}

_id_6C70()
{
    self endon( "death" );
    waittillframeend;
    var_0 = undefined;

    foreach ( var_2 in self._id_0A39 )
    {
        if ( var_2._id_2252 == 1 )
            var_0 = var_2;
    }

    var_0 endon( "death" );
    var_0 maps\_utility::_id_13DB( "_stealth_normal" );

    while ( isdefined( self.mgturret[0] ) )
    {
        self.mgturret[0] waittill( "turretstatechange" );

        if ( self.mgturret[0]._id_488B )
        {
            var_0 notify( "dont_kill_me" );
            continue;
        }

        var_0 thread _id_6C71( 5 );
    }
}

_id_6C71( var_0 )
{
    self endon( "death" );
    self endon( "dont_kill_me" );
    wait(var_0);

    for (;;)
    {
        var_1 = self geteye();
        var_2 = undefined;

        if ( common_scripts\utility::cointoss() )
            var_2 = level._id_4877;
        else
            var_2 = level._id_54E0;

        var_3 = var_2 geteye();
        magicbullet( var_2.weapon, var_3, var_1 );
        wait 0.1;
    }
}

_id_6C72()
{
    foreach ( var_1 in self.mgturret )
        var_1 setturretcanaidetach( 0 );

    foreach ( var_4 in self._id_0A39 )
    {
        if ( var_4._id_2252 == 1 )
            var_4 thread _id_6C73( self );
    }
}

_id_6C73( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "flashed" );

        if ( isdefined( var_0 ) && isdefined( var_0.mgturret ) )
            var_0.mgturret[0] thread _id_6C74( 3, self );
    }
}

_id_6C74( var_0, var_1 )
{
    self endon( "death" );
    self notify( "disable_turret_for_time" );
    self endon( "disable_turret_for_time" );
    maps\warlord_utility::_id_6BA5( "TurretFireDisable" );
    var_1 common_scripts\utility::waittill_notify_or_timeout( "death", var_0 );
    maps\warlord_utility::_id_6BA7( "TurretFireDisable" );
}

_id_6C75()
{
    level endon( "river_encounter_done" );
    var_0 = 1;

    while ( var_0 )
    {
        var_0 = 0;

        foreach ( var_2 in level._id_6C62 )
        {
            if ( !var_2 maps\_utility::_id_133C( "river_passenger_patrol_done" ) || !var_2 maps\_utility::_id_1008( "river_passenger_patrol_done" ) )
                var_0 = var_0 || isalive( var_2 );
        }

        wait 0.05;
    }

    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    maps\_audio::aud_send_msg( "mus_river_first_encounter_all_clear" );
    wait 1;
    common_scripts\utility::flag_set( "river_encounter_done" );
}

_id_6C76()
{
    _id_6D1B( 10, 60, -45, 45 );

    if ( isdefined( self ) && isdefined( self.mgturret[0] ) )
    {
        if ( isdefined( self._id_6C77 ) )
            self._id_6C77 delete();

        self.mgturret[0] maps\warlord_utility::_id_6BA7( "TurretFireDisable" );
    }
}

_id_6C78( var_0, var_1 )
{
    var_0 endon( "stealth_broken_unload" );
    var_1 endon( "stealth_broken_unload" );
    common_scripts\utility::flag_wait( "river_technical_stopped" );
    waittillframeend;
    var_0 thread _id_6C7E( "river_passenger_path_1", 0.05 );
    wait 0.1;
    var_1 thread _id_6C7E( "river_passenger_path_2", 0.2 );
    _id_6C79();
    var_2 = var_0 maps\warlord_utility::_id_6BAB();
    var_3 = var_1 maps\warlord_utility::_id_6BAB();

    if ( isdefined( var_2 ) && isalive( var_2 ) && isdefined( var_3 ) && isalive( var_3 ) )
        common_scripts\utility::flag_set( "river_technicals_stop" );

    common_scripts\utility::flag_wait( "river_technicals_stop" );
    thread maps\warlord_fx::_id_5518();
    _id_6C7B();
    thread _id_6C7D();
}

_id_6C79()
{
    wait 7;

    if ( isdefined( level._id_6C7A ) )
    {
        level._id_6C7A endon( "death" );
        common_scripts\utility::flag_wait( "river_passenger_wait" );
    }
}

_id_6C7B()
{
    if ( !isdefined( level._id_6C7C ) || !isalive( level._id_6C7C ) )
        return;

    if ( !level._id_6C7C maps\_utility::_id_1008( "_stealth_normal" ) )
        return;

    level._id_6C7C endon( "death" );
    level._id_6C7C endon( "_stealth_normal" );
    var_0 = common_scripts\utility::getstruct( "org_soap_pulldown", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_6C7C, "river_pulldown" );
    var_1 = [];
    var_1[0] = level._id_54E0;
    var_1[1] = level._id_6C7C;
    var_2 = var_0 maps\warlord_utility::_id_6BA9( level._id_54E0, "river_pulldown" );

    for ( var_3 = var_0 maps\warlord_utility::_id_6BA9( level._id_6C7C, "river_pulldown" ); !var_2 || !var_3; var_3 = var_0 maps\warlord_utility::_id_6BA9( level._id_6C7C, "river_pulldown" ) )
    {
        if ( !var_2 && !var_3 )
            var_0 maps\_anim::_id_122A( var_1, "river_pulldown" );
        else if ( !var_2 )
            var_0 maps\_anim::_id_124A( level._id_54E0, "river_pulldown" );
        else if ( !var_3 )
            var_0 maps\_anim::_id_124A( level._id_6C7C, "river_pulldown" );

        var_2 = var_0 maps\warlord_utility::_id_6BA9( level._id_54E0, "river_pulldown" );
    }
}

_id_6C7D()
{
    var_0 = common_scripts\utility::getstruct( "org_soap_pulldown", "targetname" );
    var_1 = [];
    var_1[0] = level._id_54E0;
    var_1[1] = level._id_6C7C;

    if ( isalive( level._id_6C7C ) && !level._id_6C7C maps\_utility::_id_0D69() && level._id_6C7C maps\_utility::_id_1008( "_stealth_normal" ) )
    {
        var_0 notify( "stop_loop" );
        level._id_6C7C maps\_stealth_utility::_id_4344();
        waittillframeend;

        if ( isalive( level._id_6C7C ) && !level._id_6C7C maps\_utility::_id_0D69() )
        {
            level._id_6C7C notify( "start_pulldown_guy_kill" );
            level._id_6C7C thread maps\_utility::_id_0D72( 0 );
            level._id_6C7C.ignoreall = 1;
            level._id_6C7C.allowdeath = 0;
            level._id_6C7C maps\_utility::_id_1058( 1 );
            var_0 maps\_anim::_id_11DD( var_1, "river_pulldown" );
            level._id_6C7C maps\warlord_utility::_id_4BF3();
        }
    }

    var_0 thread _id_6C68();
    level._id_54E0 maps\_utility::_id_2688();
}

_id_6C7E( var_0, var_1 )
{
    self endon( "death" );
    var_2 = maps\_vehicle::_id_2514( "passengers" );
    var_3 = var_2[0];

    if ( isdefined( var_3 ) )
    {
        var_3 waittill( "jumpedout" );

        if ( isdefined( var_1 ) && var_1 > 0 )
            wait(var_1);

        var_3._id_164F = var_0;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;

        if ( var_3._id_164F == "river_passenger_path_1" )
        {
            level._id_6C7C = var_3;
            level._id_6C7C._id_1032 = "militia";
            level._id_6C7C thread _id_6C80();
            var_5 = 1;
        }
        else
            level._id_6C7A = var_3;

        var_3 thread maps\warlord_stealth::_id_6BE6( var_4 );
        var_3 thread _id_6C7F( var_4, var_5, var_6 );
    }
}

_id_6C7F( var_0, var_1, var_2 )
{
    self endon( "death" );
    wait 0.05;
    self._id_1032 = "militia";

    if ( !isdefined( var_0 ) )
        maps\_utility::_id_140C();

    self.alertlevel = "alert";

    if ( !isdefined( var_0 ) )
    {
        self.goalradius = 8;
        thread maps\_utility::_id_109B();
    }

    self._id_117F = var_1;
    self._id_1199 = var_2;
    maps\_utility::_id_1402( "river_passenger_patrol_done" );
    level._id_6C63 = maps\_utility::_id_0BC3( level._id_6C63, self );
}

_id_6C80()
{
    level endon( "_stealth_spotted" );
    self endon( "death" );
    thread _id_6C81();
    wait 2.5;
    maps\_utility::_id_140C();
    maps\_utility::_id_109E();
    maps\_utility::_id_26F7( "pulldown_walk" );
}

_id_6C81()
{
    self endon( "death" );
    self endon( "start_pulldown_guy_kill" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    maps\_utility::_id_1414();
    maps\_utility::_id_140C();
    maps\_utility::_id_109B();
}

_id_6C82()
{
    common_scripts\utility::flag_wait( "river_encounter_done" );

    foreach ( var_1 in level._id_6C63 )
    {
        if ( isdefined( var_1 ) && isalive( var_1 ) )
        {
            var_1.ignoreme = 1;
            var_1.ignoreall = 1;
        }
    }

    maps\_utility::_id_2756( level._id_6C63, 256 );
}

_id_6C83()
{
    self endon( "death" );
    self endon( "stealth_broken_unload" );
    _id_6C84();
    common_scripts\utility::flag_wait( "river_technical_stopped" );
    _id_6C85();
    common_scripts\utility::flag_wait( "river_technicals_stop" );
    _id_6C84();
    wait 5.7;
    _id_6C85();
}

_id_6C84()
{
    if ( isdefined( self ) && isalive( self ) )
    {
        self setcandamage( 0 );
        thread _id_6E09();
        maps\_utility::_id_13DC( "no_unload_zone" );
    }
}

_id_6C85()
{
    if ( isdefined( self ) && isalive( self ) )
    {
        self setcandamage( 1 );
        thread _id_6E0A();
        maps\_utility::_id_13DE( "no_unload_zone" );
    }
}

_id_6C86()
{
    wait 4;

    if ( maps\_stealth_utility::_id_4213() )
    {
        common_scripts\utility::flag_set( "river_technical_dialogue" );
        level._id_4877 maps\warlord_utility::_id_6BA5( "ignoreall" );
        level._id_54E0 maps\warlord_utility::_id_6BA5( "ignoreall" );
        thread _id_6C87();
        maps\_audio::aud_send_msg( "mus_river_first_encounter_start" );
        _id_6C8D();
        level._id_4877 maps\warlord_utility::_id_6BA7( "ignoreall" );
        level._id_54E0 maps\warlord_utility::_id_6BA7( "ignoreall" );
    }
}

_id_6C87()
{
    level endon( "_stealth_spotted" );
    level endon( "river_encounter_done" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    common_scripts\utility::flag_wait( "flag_in_crouch_stealth_range" );
    var_0 = level.player getstance();

    if ( var_0 == "stand" )
        thread _id_6C8A( "crouch" );
}

_id_6C88( var_0 )
{
    var_1 = level.hint_binding_map[var_0];

    foreach ( var_3 in var_1 )
    {
        var_4 = getkeybinding( var_3[0] );

        if ( !var_4["count"] )
            continue;

        return var_3[1];
    }

    return undefined;
}

_id_6C8A( var_0 )
{
    level notify( "end_display_hint_from_map" );
    level endon( "end_display_hint_from_map" );
    var_1 = _id_6C88( var_0 );

    if ( isdefined( var_1 ) )
    {
        maps\_utility::_id_1F61( var_1 );

        if ( !level.console )
        {
            level.player maps\_utility::_id_1654( "global_hint_in_use" );

            while ( level.player maps\_utility::_id_1008( "global_hint_in_use" ) )
            {
                if ( isdefined( level._id_13DD ) )
                {
                    var_1 = _id_6C88( var_0 );

                    if ( isdefined( var_1 ) && isdefined( level._id_1E9D[var_1] ) )
                        level._id_13DD settext( level._id_1E9D[var_1] );
                    else
                        level._id_13DD settext( "" );
                }

                wait 0.05;
            }
        }
    }
}

_id_6C8B()
{
    var_0 = level.player getstance();

    if ( var_0 != "stand" )
    {
        level notify( "end_display_hint_from_map" );
        return 1;
    }

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level notify( "end_display_hint_from_map" );
        return 1;
    }

    if ( !common_scripts\utility::flag( "flag_in_crouch_stealth_range" ) )
    {
        level notify( "end_display_hint_from_map" );
        return 1;
    }

    return 0;
}

_id_6C8C()
{
    common_scripts\utility::flag_wait( "river_birds" );
    wait 0.5;
    var_0 = common_scripts\utility::getstruct( "org_bird_fx", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = anglestoup( var_0.angles );
    playfx( common_scripts\utility::getfx( "bird_takeoff" ), var_0.origin, var_1, var_2 );
}

_id_6C8D()
{
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "river_encounter_done" );
}

_id_6C8E()
{
    maps\_utility::_id_262C( "trig_player_out_of_water" );
    maps\_utility::_id_2797( 100 );
    level.player allowsprint( 1 );
}

_id_6C8F()
{
    maps\_utility::_id_26BF( "trig_move_price_to_prone_log" );
    var_0 = common_scripts\utility::getstruct( "org_log_duck", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_4877, "price_log_duck" );
    var_0 maps\_anim::_id_1247( level._id_4877, "price_log_duck" );
    level._id_4877 maps\_utility::_id_2688();

    if ( !common_scripts\utility::flag( "river_encounter_3_complete" ) )
    {
        var_0 = common_scripts\utility::getstruct( "org_river_price_handsignal", "targetname" );
        var_0 maps\_anim::_id_124A( level._id_4877, "CornerStndR_alert_signal_enemy_spotted" );
        common_scripts\utility::flag_set( "price_past_log" );

        if ( var_0 maps\warlord_utility::_id_6BA9( level._id_4877, "CornerStndR_alert_signal_enemy_spotted" ) )
            var_0 maps\_anim::_id_1246( level._id_4877, "CornerStndR_alert_signal_enemy_spotted" );

        level._id_4877 maps\_utility::_id_2688();
    }

    wait 0.05;
    common_scripts\utility::flag_set( "price_ready_to_reach_door" );
}

_id_6C90()
{
    maps\_utility::_id_26BF( "trig_move_soap_to_prone_log" );
    var_0 = common_scripts\utility::getstruct( "org_log_duck", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_54E0, "soap_log_duck" );
    var_0 maps\_anim::_id_1247( level._id_54E0, "soap_log_duck" );
    maps\_utility::_id_26BF( "trig_post_log_duck" );
    level._id_54E0 maps\_utility::_id_109B();
    level._id_54E0 maps\_utility::_id_2686();
    wait 0.05;
    common_scripts\utility::flag_set( "soap_ready_to_reach_door" );
}

_id_6C91()
{
    common_scripts\utility::flag_init( "interrupt_body_toss" );
    common_scripts\utility::flag_init( "log_encounter_audio" );
    common_scripts\utility::flag_wait( "river_prone_encounter_spawn" );
    maps\_audio::aud_send_msg( "river_prone_encounter" );
    level._id_4877 maps\warlord_utility::_id_6BA8( "ignoreme" );
    level._id_54E0 maps\warlord_utility::_id_6BA8( "ignoreme" );
    common_scripts\utility::flag_init( "river_encounter_3_guy_1_dead" );
    thread _id_6C9B();
    thread _id_6C9D();
    thread _id_6C9E();
    thread _id_6C92();
    thread _id_6C95();
    thread _id_6CA0();
    var_0 = getentarray( "enemy_spawner_stealth_prone", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\_utility::_id_2734, 0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6C9F );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6C99 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6C9C );
    var_1 = maps\_utility::_id_272B( var_0, 1 );
    thread _id_6C96( var_1 );
}

_id_6C92()
{
    var_0 = getent( "river_house_dog", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F();
    var_1._id_1032 = "dog";
    var_1.ignoreme = 1;
    var_1.allowdeath = 1;
    var_1 endon( "death" );
    var_2 = common_scripts\utility::getstruct( "org_river_house_dog", "targetname" );
    var_1 thread _id_6C93( var_2 );
    var_1 thread maps\warlord_fx::_id_551D();
    var_2 maps\_anim::_id_124E( var_1, "dog_eat", "stop_eat_loop" );

    if ( isdefined( var_1 ) && isalive( var_1 ) )
    {
        var_1 maps\_anim::_id_1246( var_1, "dog_growl" );
        var_3 = getnode( "hyena_node", "targetname" );
        var_1.goalradius = 8;
        var_1 maps\_utility::_id_2053( var_3 );
        var_1 waittill( "goal" );

        if ( isdefined( var_1 ) && isalive( var_1 ) )
            var_1 delete();
    }
}

_id_6C93( var_0 )
{
    _id_6C94();
    var_0 notify( "stop_eat_loop" );
    maps\_utility::_id_1414();
}

_id_6C94()
{
    self endon( "death" );
    level endon( "player_close_to_dog" );

    for (;;)
    {
        var_0 = distance( level.player.origin, self.origin );

        if ( var_0 < 350 )
            level notify( "player_close_to_dog" );

        wait 0.05;
    }
}

_id_6C95()
{
    var_0 = [];
    var_0[0] = "africa_burnbody_1";
    var_0[1] = "africa_burnbody_2";
    var_0[2] = "africa_burnbody_3";
    var_0[3] = "africa_burnbody_4";
    var_0[4] = "africa_burnbody_5";
    var_1 = getent( "body_toss_corpse_pile_guy", "targetname" );
    var_2 = common_scripts\utility::getstruct( "org_body_toss_fire_pile", "targetname" );

    for ( var_3 = 0; var_3 < 5; var_3++ )
    {
        var_4 = var_1 maps\_utility::_id_166F( 1 );
        var_5 = maps\_vehicle_aianim::_id_25C1( var_4 );
        var_5 notsolid();
        var_5._id_1032 = "generic";
        var_5 thread _id_6C5D();
        var_2 thread maps\_anim::_id_124E( var_5, var_0[var_3] );
        wait 0.05;
    }
}

_id_6C96( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "org_body_toss_fire", "targetname" );
    var_2 = getent( "body_toss_corpse_1", "targetname" );
    var_3 = getent( "body_toss_corpse_2", "targetname" );
    var_4 = var_2 maps\_utility::_id_166F( 1 );
    var_5 = maps\_vehicle_aianim::_id_25C1( var_4 );
    var_5._id_1032 = "civ_1";
    var_6 = var_3 maps\_utility::_id_166F( 1 );
    var_7 = maps\_vehicle_aianim::_id_25C1( var_6 );
    var_7._id_1032 = "civ_2";
    var_8 = [ var_5, var_7 ];

    foreach ( var_10 in var_8 )
    {
        var_10 notsolid();
        var_10._id_012D = "pause";
    }

    var_0[0] maps\_utility::_id_24F5();
    var_0[0] thread _id_6C97( var_1, var_5, var_7 );
    var_0[1] thread _id_6C98( var_1 );
    thread _id_012E( var_0[0], var_0[1] );
    var_0[0] thread _id_012F();
    var_0[1] thread _id_012F();
    common_scripts\utility::flag_wait( "interrupt_body_toss" );
    var_1 notify( "stop_loop" );

    foreach ( var_10 in var_8 )
    {
        if ( var_10._id_012D == "pause" )
        {
            var_13 = var_10 maps\_utility::_id_1281( "burn_dragger_drag" );
            var_14 = var_10 getanimtime( var_13 );
            var_10 maps\_utility::_id_1414();
            var_10 setanim( var_13, 1, 0, 0 );
            var_10 setanimtime( var_13, var_14 );
            continue;
        }

        var_10 maps\_utility::_id_1414();
        var_10 startragdoll();
    }

    if ( isalive( var_0[0] ) )
    {
        var_0[0] maps\_utility::_id_257D();
        var_0[0] maps\_utility::_id_1414();
    }

    if ( isalive( var_0[1] ) )
        var_0[1] maps\_utility::_id_1414();
}

_id_012E( var_0, var_1 )
{
    level endon( "interrupt_body_toss" );
    wait 2;
    var_0 maps\_utility::_id_168C( "warlord_mlt1_didyouknow" );
    var_1 maps\_utility::_id_168C( "warlord_mlt2_ohreally" );
    var_1 maps\_utility::_id_168C( "warlord_mlt1_walkedright" );
    var_0 maps\_utility::_id_168C( "warlord_mlt1_poppedhim" );
    var_1 maps\_utility::_id_168C( "warlord_mlt3_wasanidiot" );
}

_id_012F()
{
    level waittill( "interrupt_body_toss" );

    if ( isdefined( self ) && isalive( self ) )
        self stopsounds();
}

_id_6C97( var_0, var_1, var_2 )
{
    self endon( "death" );
    level endon( "interrupt_body_toss" );
    var_3 = [];
    var_3[0] = self;
    var_3[1] = var_1;
    var_3[2] = var_2;
    level thread _id_0130( var_1, var_2 );
    var_0 maps\_anim::_id_11DD( var_3, "burn_dragger_drag" );
    var_0 maps\_anim::_id_124E( self, "burn_dragger_idle", "stop_loop" );
}

_id_0130( var_0, var_1 )
{
    level endon( "interrupt_body_toss" );
    wait 4.26667;
    var_1._id_012D = "";
    wait 9.8;
    var_1._id_012D = "pause";
    wait 7.23333;
    var_0._id_012D = "";
    wait 9.2;
    var_0._id_012D = "pause";
}

_id_6C98( var_0 )
{
    self endon( "death" );
    level endon( "interrupt_body_toss" );
    var_0 maps\_anim::_id_1246( self, "burn_watcher_watch" );
    var_0 thread maps\_anim::_id_124E( self, "burn_watcher_idle", "stop_loop" );
}

_id_6C99()
{
    level endon( "interrupt_body_toss" );
    self._id_1032 = "militia";
    self.allowdeath = 1;
    _id_6C9A();
    common_scripts\utility::flag_set( "interrupt_body_toss" );
}

_id_6C9A()
{
    self endon( "death" );

    if ( !maps\_utility::_id_1008( "_stealth_bad_event_listener" ) )
        self endon( "_stealth_bad_event_listener" );

    self endon( "flashbang" );
    maps\_utility::_id_13DB( "_stealth_normal" );
}

_id_6C9B()
{
    level endon( "river_encounter_3_complete" );

    if ( common_scripts\utility::flag( "river_encounter_3_complete" ) )
        return;

    common_scripts\utility::flag_wait( "log_encounter_audio" );
    maps\_audio::aud_send_msg( "mus_take_them_out_busted" );
}

_id_6C9C()
{
    level endon( "log_encounter_audio" );
    maps\_utility::_id_13DB( "_stealth_normal" );
    common_scripts\utility::flag_set( "log_encounter_audio" );
}

_id_6C9D()
{
    level endon( "river_encounter_3_complete" );

    if ( common_scripts\utility::flag( "river_encounter_3_complete" ) )
        return;

    thread _id_6E39( 0.2 );
    thread _id_6C6E( "river_encounter_3_complete" );
    level endon( "enemy_bad_event" );
    maps\warlord_stealth::_id_6BC8();

    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_in_crouch_stealth_range" );
        maps\warlord_stealth::_id_6BCC();
        common_scripts\utility::flag_waitopen( "flag_in_crouch_stealth_range" );
        maps\warlord_stealth::_id_6BCB();
    }
}

_id_6C9E()
{
    level endon( "price_dont_talk" );
    level endon( "river_encounter_3_complete" );
    common_scripts\utility::flag_wait( "price_past_log" );
    maps\_audio::aud_send_msg( "mus_take_them_out" );

    if ( maps\_stealth_utility::_id_4213() )
        common_scripts\utility::flag_set( "prone_encounter_start_dialogue" );
}

_id_6C9F()
{
    self waittill( "death", var_0 );
    level notify( "price_dont_talk" );

    if ( common_scripts\utility::flag( "river_encounter_3_guy_1_dead" ) )
    {
        maps\_audio::aud_send_msg( "mus_take_them_out_all_clear" );
        wait 1;
        common_scripts\utility::flag_set( "river_encounter_3_complete" );
    }
    else
        common_scripts\utility::flag_set( "river_encounter_3_guy_1_dead" );
}

_id_6CA0()
{
    common_scripts\utility::flag_wait( "interrupt_body_toss" );
    var_0 = gettime();
    common_scripts\utility::flag_wait( "river_encounter_3_complete" );
    var_1 = gettime() - var_0;

    if ( var_1 < 4000 )
        common_scripts\utility::flag_set( "prone_encounter_well_done_dialogue" );
}

_id_6CA1()
{
    var_0 = getentarray( "river_near_patrol", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6CE2 );
    level._id_6CA2 = maps\_utility::_id_272B( var_0, 1 );
    level._id_6CA2 thread _id_6CA3();
}

_id_6CA3()
{
    foreach ( var_1 in self )
    {
        var_1.ignoreme = 1;
        var_1.allowdeath = 1;
        var_1 maps\_utility::_id_0D72( 0 );
        var_2 = common_scripts\utility::getstruct( var_1.script_noteworthy, "targetname" );
        var_3 = undefined;

        if ( var_1.script_noteworthy == "river_jeer_1" || var_1.script_noteworthy == "river_jeer_3" )
            var_3 = "jeer_loop_3";
        else
            var_3 = "jeer_loop_2";

        var_1 thread _id_6CA4( var_2, var_3 );
        var_1 thread _id_6CA5();
    }
}

_id_6CA4( var_0, var_1 )
{
    self endon( "death" );
    var_0 thread maps\_anim::_id_11C8( self, var_1, "stop_loop" );
    self waittill( "stop_jeer_loop" );
    var_0 notify( "stop_loop" );
    maps\_utility::_id_1414();
}

_id_6CA5()
{
    self endon( "death" );
    thread _id_6CA6();
    _id_6C9A();
    self notify( "stop_jeer_loop" );
    self notify( "stop_jeer_patrol" );
    self.ignoreme = 0;
    self.ignoreall = 0;
}

_id_6CA6()
{
    level endon( "clean_up_river" );
    self endon( "death" );
    self endon( "stop_jeer_patrol" );
    common_scripts\utility::flag_wait( "jeer_guy_leave" );

    if ( isdefined( self._id_164F ) )
    {
        self notify( "stop_jeer_loop" );
        thread maps\warlord_stealth::_id_6BE6();
    }
}

_id_6CA7()
{
    common_scripts\utility::flag_wait( "river_encounter_3_complete" );
    maps\_utility::_id_26BF( "trig_price_path_to_dog_house" );
    maps\_utility::_id_26BF( "trig_soap_path_to_dog_house" );
    wait 0.05;
    common_scripts\utility::flag_wait( "price_ready_to_reach_door" );
    common_scripts\utility::flag_wait( "soap_ready_to_reach_door" );
    level._id_54E0 thread _id_6E35( "node_soap_river_stand" );
    var_0 = getent( "org_price_river_open_door", "targetname" );
    var_0 maps\_anim::_id_124B( level._id_4877, "sniper_open_door", undefined, "Cover Right" );
    common_scripts\utility::flag_wait( "river_house_door_open" );

    while ( !var_0 maps\warlord_utility::_id_6BA9( level._id_4877, "sniper_open_door" ) || level._id_4877 common_scripts\utility::isflashed() )
    {
        if ( level._id_4877 common_scripts\utility::isflashed() )
        {
            var_1 = level._id_4877.flashendtime - gettime();
            wait(var_1 / 1000);
        }

        var_0 maps\_anim::_id_124B( level._id_4877, "sniper_open_door", undefined, "Cover Right" );
    }

    common_scripts\utility::flag_set( "river_house_burn_execution_setup" );
    var_2 = getent( "river_house_door", "targetname" );
    var_2 thread maps\warlord_utility::_id_6B9F( 0.75 );
    var_2 thread _id_6CA8();
    var_0 maps\_anim::_id_1246( level._id_4877, "sniper_open_door" );
    level._id_4877 maps\_utility::_id_2688();
    level._id_4877 maps\_utility::_id_109B();
    level._id_54E0 maps\_utility::_id_109B();
    level._id_54E0 thread _id_6CA9( "soap_burn_in", "soap_burn_idle", "soap_burn_out" );
    level._id_4877 thread _id_6CA9( "price_burn_in", "price_burn_idle", "price_burn_out" );
    common_scripts\utility::flag_set( "river_house_burn_execution" );
    level.player._id_1FE1 = 0;
}

_id_6CA8()
{
    common_scripts\utility::flag_wait( "flag_player_first_beat" );
    maps\warlord_utility::_id_6BA0();
}

_id_6CA9( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::getstruct( "org_watch_burn_anims", "targetname" );
    var_4 = self setcontents( 0 );
    var_3 maps\_anim::_id_124A( self, var_0 );
    self setcontents( var_4 );
    maps\_utility::_id_2686();

    if ( var_3 maps\warlord_utility::_id_6BA9( self, var_0 ) && !common_scripts\utility::flag( "river_burn_interrupted" ) )
    {
        var_3 maps\_anim::_id_1246( self, var_0 );

        if ( !common_scripts\utility::flag( "river_burn_interrupted" ) )
            var_3 thread maps\_anim::_id_124E( self, var_1, "stop_burn_idle" );

        _id_6CAA();
        var_3 notify( "stop_burn_idle" );

        if ( common_scripts\utility::flag( "river_house_burn_anim_finished" ) )
            var_3 thread maps\_anim::_id_1246( self, var_2 );
        else
            maps\_utility::_id_1414();
    }
}

_id_6CAA()
{
    common_scripts\utility::flag_wait_any( "allies_path_to_big_moment", "river_burn_interrupted" );
}

_id_6CAB()
{
    common_scripts\utility::flag_wait( "river_prone_encounter_spawn" );
    var_0 = getent( "civ_village_corpse", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0 thread _id_6C5C( var_1, var_1.animation );
}

_id_6CAC()
{
    common_scripts\utility::flag_wait( "river_house_burn_ambient_guys" );
    var_0 = getent( "burn_ambient_civ", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_6CAE, "civilian_run_hunched_C" );
    var_1 = getent( "burn_ambient_militia", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_6CAF );
    var_2 = var_0 maps\_utility::_id_166F();
    level._id_6CAD = var_1 maps\_utility::_id_166F();
}

_id_6CAE( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_140B( "civ_captured" );
    common_scripts\utility::flag_wait_any( "river_house_burn_anim_finished", "river_burn_interrupted" );
    maps\_utility::_id_140B( var_0 );
    var_1 = getdvarint( "cg_fov" );
    var_2 = cos( var_1 );

    while ( maps\_utility::_id_26AD( self.origin, var_2 ) )
        wait 0.05;

    self delete();
}

_id_6CAF()
{
    self endon( "death" );
    level endon( "river_burn_interrupted" );
    self._id_0FC6 = 0.9;
    maps\_utility::_id_140B( "casual_killer_walk_f" );
    common_scripts\utility::flag_wait( "river_house_burn_anim_finished" );
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );

    while ( maps\_utility::_id_26AD( self.origin, var_1 ) )
        wait 0.05;

    self delete();
}

_id_6CB0()
{
    level endon( "river_burn_interrupted" );
    level endon( "house_burn_watchers_dead" );
    common_scripts\utility::flag_init( "allies_path_to_big_moment" );
    common_scripts\utility::flag_wait( "river_house_burn_execution_setup" );
    thread _id_6CB5();
    wait 0.05;
    thread _id_6CA1();
    thread _id_6CC3();
    thread _id_6CB9();
    thread _id_6CBA();
    thread _id_6CB1();
    var_0 = getent( "burn_victim", "targetname" );
    var_1 = getent( "burn_badguy", "targetname" );
    var_2 = common_scripts\utility::getstruct( "org_burn", "targetname" );
    var_3 = var_0 maps\_utility::_id_166F( 1 );
    var_3._id_1032 = "victim";
    var_3.allowdeath = 1;
    var_3 setmodel( "africa_civ_male_notburned" );
    var_4 = var_1 maps\_utility::_id_166F( 1 );
    var_4._id_1032 = "militia";
    var_4.allowdeath = 1;
    var_4 maps\_utility::_id_140B( "london_dock_soldier_walk" );
    var_4 thread _id_6CB6();
    var_4 thread _id_6CC9();
    thread _id_6CBB( var_4 );
    var_5 = [];
    var_5[0] = var_3;
    var_5[1] = var_4;
    var_3 thread _id_6CBC();
    thread _id_6CBE( var_4 );
    var_2 thread maps\_anim::_id_11DD( var_5, "burn" );
    wait 0.05;
    maps\_anim::_id_127F( var_5, "burn", 0.4 );
    maps\_anim::_id_127C( var_5, "burn", 0 );
    common_scripts\utility::flag_wait( "river_house_burn_execution" );
    childthread maps\warlord_fx::_id_54F5( var_5[1], var_3 );
    maps\_anim::_id_127C( var_5, "burn", 1 );
    var_4 thread _id_6CB4();
    var_2 waittill( "burn" );
    common_scripts\utility::flag_set( "river_house_burn_anim_finished" );

    if ( isalive( var_4 ) )
    {
        var_4 thread _id_6CB3();
        var_4 thread _id_6E35( "militia_house_burn_node" );
        wait 10;
        common_scripts\utility::flag_set( "allies_path_to_big_moment" );
    }
}

_id_0131( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "river_house_burn_execution" );
    var_1 maps\_utility::_id_168C( "warlord_mlt2_outsmart" );
    var_0 maps\_utility::_id_168C( "warlord_civ_notlikethat" );
    common_scripts\utility::flag_wait( "victim_burn_vo" );
    var_0 maps\_utility::_id_168C( "warlord_civ_scream" );
}

_id_6CB1()
{
    level endon( "allies_path_to_big_moment" );
    level waittill( "river_burn_interrupted" );
    level._id_4877 thread _id_6CB2( "allies_path_to_big_moment" );
    level._id_54E0 thread _id_6CB2( "allies_path_to_big_moment" );
}

_id_6CB2( var_0 )
{
    self allowedstances( "stand" );
    self._id_1117 = 1;
    common_scripts\utility::flag_wait( var_0 );
    self allowedstances( "stand", "crouch", "prone" );
    self._id_1117 = undefined;
}

_id_6CB3()
{
    self endon( "death" );
    self allowedstances( "stand" );
    self._id_1199 = 1;
    wait 0.1;
    self._id_1199 = undefined;
    self allowedstances( "stand", "crouch", "prone" );
}

_id_6CB4()
{
    self endon( "death" );
    wait 15;
    self notify( "unlink_gas_can" );
}

_id_6CB5()
{
    level endon( "allies_path_to_big_moment" );

    if ( common_scripts\utility::flag( "allies_path_to_big_moment" ) )
        return;

    thread _id_6E39( 0.2 );
    thread _id_6C6E( "allies_path_to_big_moment" );
    level endon( "enemy_bad_event" );
    maps\warlord_stealth::_id_6BCB();

    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_in_short_stealth_range" );
        maps\warlord_stealth::_id_6BC8();
        common_scripts\utility::flag_waitopen( "flag_in_short_stealth_range" );
        maps\warlord_stealth::_id_6BCB();
    }
}

_id_6CB6()
{
    self endon( "death" );
    level endon( "river_burn_interrupted" );
    _id_6CB8();
    level.player thread _id_6CB7();
    common_scripts\utility::flag_set( "river_burn_interrupted" );
}

_id_6CB7()
{
    level endon( "allies_path_to_big_moment" );

    for (;;)
    {
        self._id_1FE1 = 1000;
        wait 0.05;
    }
}

_id_6CB8()
{
    self endon( "flashbang" );
    maps\_utility::_id_1654( "_stealth_normal" );
    maps\_utility::_id_13DB( "_stealth_normal" );
}

_id_6CB9()
{
    level endon( "river_burn_interrupted" );
    level endon( "house_burn_watchers_dead" );
    level endon( "kill_river_burn_dialogue" );
    common_scripts\utility::flag_wait( "flag_house_burn_play" );
    common_scripts\utility::flag_set( "tire_necklace_dialogue" );
    maps\_audio::aud_send_msg( "mus_tire_burning_start" );
}

_id_6CBA()
{
    level endon( "river_second_leg" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    maps\_audio::aud_send_msg( "mus_tire_burning_busted" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    maps\_audio::aud_send_msg( "mus_tire_burning_all_clear" );
}

_id_6CBB( var_0 )
{
    level common_scripts\utility::waittill_any( "river_burn_interrupted", "allies_path_to_big_moment", "house_burn_watchers_dead" );

    if ( !common_scripts\utility::flag( "river_burn_interrupted" ) && common_scripts\utility::flag( "allies_path_to_big_moment" ) )
        return;

    if ( isdefined( var_0 ) && isalive( var_0 ) )
    {
        var_0 maps\_utility::_id_1414();
        var_0 waittill( "death" );
    }

    if ( isdefined( level._id_6CAD ) && isalive( level._id_6CAD ) )
        level._id_6CAD waittill( "death" );

    common_scripts\utility::flag_wait( "house_burn_watchers_dead" );
    common_scripts\utility::flag_set( "allies_path_to_big_moment" );
    wait 0.5;
    level.player._id_1FE1 = 0;
}

_id_6CBC()
{
    self endon( "burn_victim_interrupted" );
    thread _id_6CBD();
    self waittill( "victim_on_fire" );
    thread maps\warlord_fx::_id_54F7();

    if ( isdefined( self ) && isalive( self ) )
    {
        self notify( "burn_victim_uninterruptible" );
        level notify( "kill_river_burn_dialogue" );
        self.allowdeath = 0;
        self waittillmatch( "single anim", "end" );
        self.allowdeath = 1;
        maps\warlord_utility::_id_4BF3();
        var_0 = maps\_vehicle_aianim::_id_25C1( self );
        var_0._id_1032 = "victim";
        var_0 notsolid();
        var_1 = var_0 maps\_utility::_id_1281( "burn" );
        var_0 setmodel( "africa_civ_male_burned" );
        var_0 setanim( var_1, 1, 0, 0 );
        var_0 setanimtime( var_1, 1 );
    }
}

_id_6CBD()
{
    self endon( "death" );
    self endon( "burn_victim_uninterruptible" );
    common_scripts\utility::flag_wait( "river_burn_interrupted" );
    self notify( "killanimscript" );
    self notify( "burn_victim_interrupted" );
    var_0 = common_scripts\utility::getstruct( "org_burn", "targetname" );
    var_0 maps\_anim::_id_1246( self, "burn_escape" );
    maps\_utility::_id_140B( "civilian_run_hunched_C", 1 );
    var_1 = common_scripts\utility::getstruct( "burn_victim_escape_path", "targetname" );
    thread maps\_utility::_id_278D( var_1 );
    wait 10;
    maps\_utility::_id_2756( [ self ], 1024 );
}

_id_6CBE( var_0 )
{
    thread _id_6CBF( var_0 );
    thread _id_6CC1( var_0 );
}

_id_6CBF( var_0 )
{
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( "accessories_gas_canister_highrez" );
    var_1 show();
    var_1 linkto( var_0, "tag_inhand", ( 0.0, 0.0, -20.0 ), ( 0.0, 0.0, 0.0 ) );
    _id_6CC0( var_0 );
    var_1 unlink();
    var_1 physicslaunchclient( var_1.origin, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "clean_up_river" );
    var_1 delete();
}

_id_6CC0( var_0 )
{
    var_0 endon( "death" );
    level endon( "river_burn_interrupted" );

    if ( common_scripts\utility::flag( "river_burn_interrupted" ) )
        return;

    var_0 waittill( "unlink_gas_can" );
}

_id_6CC1( var_0 )
{
    var_0 animscripts\shared::_id_0C9B( var_0.weapon, "chest" );
    _id_6CC2( var_0 );

    if ( isdefined( var_0 ) && isalive( var_0 ) )
        var_0 animscripts\shared::_id_0C9B( var_0.weapon, "right" );
}

_id_6CC2( var_0 )
{
    var_0 endon( "death" );
    level endon( "river_burn_interrupted" );

    if ( common_scripts\utility::flag( "river_burn_interrupted" ) )
        return;

    common_scripts\utility::flag_wait( "river_house_burn_anim_finished" );
}

_id_6CC3()
{
    var_0 = getentarray( "river_house_burn_watchers", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\warlord_stealth::_id_6BE6, "london_dock_soldier_walk" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6CC4 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6CB6 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F, 1 );
}

_id_6CC4()
{
    self endon( "death" );
    level endon( "river_burn_interrupted" );
    maps\_utility::_id_1402( "post_burn_in_house" );
    thread _id_6CC9();
    thread _id_6CC5();
    thread _id_6CC6();
    common_scripts\utility::flag_wait( "river_house_burn_anim_finished" );
    maps\_utility::_id_1414();
}

_id_6CC5()
{
    self endon( "death" );

    if ( isdefined( self._id_164F ) )
    {
        var_0 = common_scripts\utility::getstruct( self._id_164F, "targetname" );

        if ( isdefined( var_0.animation ) )
        {
            thread _id_4BA7();
            var_1 = var_0.animation;
            thread maps\_anim::_id_11C8( self, var_1, "end_loop" );
        }
    }
}

_id_4BA7()
{
    self endon( "death" );
    common_scripts\utility::flag_wait_any( "river_burn_interrupted", "river_house_burn_anim_finished" );
    self notify( "end_loop" );
    maps\_utility::_id_1414();
}

_id_6CC6()
{
    if ( !isdefined( level._id_6CC7 ) )
        level._id_6CC7 = 1;

    self endon( "death" );
    maps\_utility::_id_1654( "post_burn_in_house" );
    var_0 = [];
    var_0[0] = "jeer_loop_2";
    var_0[1] = "jeer_loop_3";

    if ( level._id_6CC7 % 2 == 0 )
        self teleport( self.origin, ( 0.0, 225.0, 0.0 ) );

    level._id_6CC7 += 1;
    thread _id_6CC8();
    maps\_anim::_id_11C8( self, var_0[randomint( 2 )], "end_loop" );
}

_id_6CC8()
{
    self endon( "death" );
    _id_6C9A();
    self notify( "end_loop" );
    maps\_utility::_id_1414();
}

_id_6CC9()
{
    self endon( "death" );
    self.ignoreme = 1;
    common_scripts\utility::flag_wait( "river_burn_interrupted" );

    if ( !common_scripts\utility::flag( "allies_path_to_big_moment" ) )
    {
        if ( isdefined( self._id_164F ) )
        {
            var_0 = common_scripts\utility::getstruct( self._id_164F, "targetname" );

            if ( isdefined( var_0._id_164F ) )
            {
                waittillframeend;

                if ( !common_scripts\utility::isflashed() )
                {
                    self._id_1032 = "generic";
                    maps\_anim::_id_1246( self, var_0._id_164F );
                }
            }
        }
    }

    self.ignoreme = 0;
}

_id_6CCA()
{
    common_scripts\utility::flag_wait( "allies_path_to_big_moment" );
    maps\_utility::_id_26BF( "trig_path_to_big_moment" );
    level._id_4877 thread maps\warlord_utility::_id_4E98();
    level._id_54E0 thread maps\warlord_utility::_id_4E98();
    level._id_4877 thread maps\_utility::_id_109B();
    level._id_54E0 thread maps\_utility::_id_109B();
}

_id_6CCB()
{
    level endon( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_init( "river_moment_technical_driveup" );
    common_scripts\utility::flag_init( "river_moment_allies_run" );
    thread _id_6CD9();
    thread _id_6CDE();
    thread _id_6CD5();
    thread _id_6CCC();
    _id_6CF0();
    _id_6CFA();
    _id_6D06();
    _id_6D0A();
}

_id_6CCC()
{
    common_scripts\utility::flag_wait( "river_second_leg" );
    common_scripts\utility::flag_init( "river_execution_interrupted" );
    level._id_200E = ::_id_6CCD;
    var_0 = common_scripts\utility::getstruct( "org_execution_scene", "targetname" );
    var_1 = getent( "execution_soldier_1", "targetname" );
    var_2 = getent( "execution_soldier_2", "targetname" );
    var_3 = var_1 maps\_utility::_id_166F( 1 );
    var_3._id_1032 = "militia_1";
    var_3.allowdeath = 1;
    var_3._id_0FC6 = 1.15;
    var_3 thread _id_6CD0();
    var_4 = var_2 maps\_utility::_id_166F( 1 );
    var_4._id_1032 = "militia_2";
    var_4.allowdeath = 1;
    var_4._id_0FC6 = 1.15;
    var_3 thread _id_6CD1();
    var_4 thread _id_6CD1();
    var_5 = _id_6CCE( "execution_civ_1", "civ_1", var_0, "execution_loop_1", maps\_utility::_id_270F( "civ_crouch_death" ), "execution_blood_fx" );
    var_6 = _id_6CCE( "execution_civ_2", "civ_2", var_0, "execution_loop_2", maps\_utility::_id_270F( "civ_crouch_death2" ), "execution_blood_fx" );
    var_7 = _id_6CCE( "execution_civ_3", "civ_3", var_0, "execution_loop_3", maps\_utility::_id_270F( "civ_crouch_death" ), "execution_blood_fx_2" );
    var_8 = [];
    var_8[0] = var_3;
    var_8[1] = var_4;
    var_8[2] = var_5;
    var_8[3] = var_6;
    var_8[4] = var_7;
    var_0 maps\_anim::_id_11BF( var_8, "river_execution" );
    common_scripts\utility::flag_wait( "flag_player_first_beat" );
    var_0 maps\_anim::_id_11DD( var_8, "river_execution" );

    if ( !common_scripts\utility::flag( "river_execution_interrupted" ) )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) )
            var_3 thread _id_6CD4( "patrol_warlord_walk_1" );

        if ( isdefined( var_4 ) && isalive( var_4 ) )
            var_4 thread _id_6CD4( "patrol_warlord_walk_2" );

        common_scripts\utility::flag_set( "river_moment_allies_run" );
    }

    level._id_200E = undefined;
}

_id_0132( var_0, var_1, var_2 )
{
    level endon( "river_execution_interrupted" );
    var_0 maps\_utility::_id_168C( "warlord_mlt2_wouldnt" );
    var_1 maps\_utility::_id_168C( "warlord_civ_myfamily" );
    level waittill( "execution_victim_killed" );
    var_0 maps\_utility::_id_168C( "warlord_mlt2_whathewanted" );
    level waittill( "execution_victim_killed" );
    var_0 maps\_utility::_id_168C( "warlord_mlt2_timetopay" );
    var_2 maps\_utility::_id_168C( "warlord_civ_noplease" );
}

_id_6CCD( var_0 )
{
    waittillframeend;
    self notsolid();
    thread maps\_drone::_id_2011( 2 );

    if ( isdefined( self._id_0D50 ) )
    {
        common_scripts\utility::flag_set( "river_execution_interrupted" );
        maps\_drone::_id_2013( self._id_0D50, "deathplant" );
    }
}

_id_6CCE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getent( var_0, "targetname" );
    var_7 = var_6 maps\_utility::_id_166F( 1 );
    var_7._id_1032 = var_1;
    var_7._id_0EC6 = 1;
    var_7._id_200F = 1;
    var_7 thread _id_6CD3( var_2, var_3 );
    var_7 thread _id_6CCF( var_4, var_5 );
    var_7 thread _id_6C5D();
    return var_7;
}

_id_6CCF( var_0, var_1 )
{
    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( !common_scripts\utility::flag( "river_execution_interrupted" ) && isdefined( var_3 ) && isdefined( var_3._id_1032 ) && var_3._id_1032 == "militia_1" )
        {
            playfxontag( common_scripts\utility::getfx( var_1 ), var_3, "TAG_FLASH" );
            level notify( "execution_victim_killed" );
            continue;
        }

        if ( isdefined( var_5 ) && isdefined( var_6 ) )
        {
            if ( var_6 == "MOD_PISTOL_BULLET" || var_6 == "MOD_RIFLE_BULLET" || var_6 == "MOD_EXPLOSIVE_BULLET" )
            {
                if ( self.health <= 0 )
                    playfx( common_scripts\utility::getfx( "headshot" ), var_5 );
                else
                    playfx( common_scripts\utility::getfx( "bodyshot" ), var_5 );
            }
        }

        if ( self.health <= 0 )
        {
            self._id_0D50 = var_0;
            break;
        }
    }
}

_id_6CD0()
{
    self endon( "death" );
    maps\_utility::_id_104A( "fnfiveseven", "sidearm" );
    common_scripts\utility::flag_wait_either( "river_moment_allies_run", "river_execution_interrupted" );
    maps\_utility::_id_24F5();
    maps\_utility::_id_104A( self.primaryweapon, "primary" );
    maps\_utility::_id_257D();
    self._id_1005 = self.primaryweapon;
}

_id_6CD1()
{
    _id_6CD2();
    common_scripts\utility::flag_set( "river_execution_interrupted" );

    if ( isdefined( self ) && isalive( self ) )
        maps\_utility::_id_1414();
}

_id_6CD2()
{
    level endon( "river_execution_interrupted" );

    if ( common_scripts\utility::flag( "river_execution_interrupted" ) )
        return;

    _id_6C9A();
}

_id_6CD3( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "river_execution_interrupted" );
    maps\_utility::_id_1414();
    var_0 thread maps\_anim::_id_124E( self, var_1 );
}

_id_6CD4( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        thread maps\warlord_stealth::_id_6BE6( var_0 );
    else
        thread maps\warlord_stealth::_id_6BE6();
}

_id_6CD5()
{
    common_scripts\utility::flag_wait( "river_second_leg" );
    maps\_audio::aud_send_msg( "mus_river_big_moment_start" );
    thread _id_6CD6();
    level endon( "river_big_moment_stealth_spotted" );

    if ( common_scripts\utility::flag( "river_big_moment_stealth_spotted" ) )
        return;

    common_scripts\utility::flag_wait( "end_river_big_moment" );
    maps\_audio::aud_send_msg( "mus_river_big_moment_all_clear" );
}

_id_6CD6()
{
    level endon( "end_river_big_moment" );
    common_scripts\utility::flag_wait( "river_big_moment_stealth_spotted" );
    maps\_audio::aud_send_msg( "mus_river_big_moment_busted" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    maps\_audio::aud_send_msg( "mus_river_big_moment_all_clear" );
}

_id_6CD7()
{
    thread _id_6E39( 0.1 );
    maps\warlord_stealth::_id_6BCE();
    thread _id_6CD8();
}

_id_6CD8()
{
    level endon( "_stealth_enabled" );
    level endon( "clean_up_river" );

    if ( !common_scripts\utility::flag( "_stealth_enabled" ) )
        return;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        wait 1.3;

    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "river_big_moment_stealth_spotted" );
}

_id_6CD9()
{
    level endon( "_stealth_enabled" );
    level endon( "clean_up_river" );
    common_scripts\utility::flag_wait( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_set( "river_spotted_dialogue" );
    level._id_4877 thread _id_6CDA( "trig_price_post_bridge", "price_post_bridge" );
    level._id_54E0 thread _id_6CDA( "trig_soap_post_bridge", "soap_post_bridge" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
}

_id_6CDA( var_0, var_1 )
{
    self endon( "kill_ally_river_spotted" );
    self notify( "kill_pose_transition" );
    maps\warlord_utility::_id_6BA7( "ignoreall" );
    wait 0.05;
    self allowedstances( "stand", "crouch", "prone" );
    self.goalradius = 2048;
    self pushplayer( 0 );
    self._id_1240 = undefined;
    common_scripts\utility::flag_set( var_1 );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    wait 0.05;
    var_2 = getent( var_0, "targetname" );
    var_2 notify( "trigger", level.player );
}

_id_6CDB()
{
    if ( !isdefined( level._id_6CDC ) )
        level._id_6CDC = [];

    level._id_6CDC[level._id_6CDC.size] = self;
    self._id_1032 = "militia";
}

_id_6CDD()
{
    var_0 = getent( "clip_execution_blocker", "targetname" );
    common_scripts\utility::flag_wait_any( "river_big_moment_stealth_spotted", "flag_player_second_beat" );
    var_0 connectpaths();
    var_0 delete();
}

_id_6CDE()
{
    common_scripts\utility::flag_wait( "river_second_leg" );
    thread _id_6CFD();
    thread _id_6CD7();
    level._id_4877 maps\warlord_utility::_id_6BA5( "ignoreall" );
    level._id_54E0 maps\warlord_utility::_id_6BA5( "ignoreall" );
    var_0 = getentarray( "river_far_bank_patrol", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\warlord_stealth::_id_6BE6 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6CE5 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6CE2 );
    maps\_utility::_id_272B( var_0, 1 );
    var_1 = getentarray( "river_moment_prone_patrol", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6D03 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6CE2 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6CDB );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6CE4 );
    maps\_utility::_id_272B( var_1, 1 );
    var_2 = getentarray( "river_moment_end_guys", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6D09 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6CE2 );
    maps\_utility::_id_272B( var_2, 1 );
    var_3 = getentarray( "river_bridge_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\warlord_stealth::_id_6BE6 );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_6D14 );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_6D12 );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_6D13 );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_6D11 );
    var_4 = getent( "river_bridge_guy_1", "targetname" );
    var_5 = getent( "river_bridge_guy_2", "targetname" );
    level._id_6CDF = [];
    level._id_6CDF[0] = var_4 maps\_utility::_id_166F( 1 );
    level._id_6CDF[0]._id_6CE0 = common_scripts\utility::getstruct( "org_bridge_price", "targetname" );
    level._id_6CDF[0]._id_6CE1 = "bridge_death_1";
    level._id_6CDF[0]._id_0EC6 = 1;
    level._id_6CDF[0]._id_0F25 = 1;
    level._id_6CDF[1] = var_5 maps\_utility::_id_166F( 1 );
    level._id_6CDF[1]._id_6CE0 = common_scripts\utility::getstruct( "org_bridge_soap", "targetname" );
    level._id_6CDF[1]._id_6CE1 = "bridge_death_2";
    level._id_6CDF[1]._id_0EC6 = 1;
    level._id_6CDF[1]._id_0F25 = 1;
    thread _id_6CE7();
    thread _id_6CE6();
}

_id_6CE2()
{
    self._id_20AF = 3;
}

_id_6CE3()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "river_big_moment_stealth_spotted" );
    self.goalradius = 2048;
    maps\_utility::_id_140C();
    self._id_117F = undefined;
    self._id_1199 = undefined;
    self._id_0FC6 = 1;
    self.ignoreme = 0;
}

_id_6CE4()
{
    self endon( "death" );
    level endon( "river_big_moment_stealth_spotted" );

    if ( isdefined( self._id_164F ) && self._id_164F == "node_prone_patrol_2" )
    {
        maps\_utility::_id_1402( "prone_search_1" );
        maps\_utility::_id_1654( "prone_search_1" );
        self.allowdeath = 1;
        maps\_anim::_id_11C1( self, "prone_search_1" );
    }
    else if ( isdefined( self._id_164F ) && self._id_164F == "node_prone_patrol_3" )
    {
        maps\_utility::_id_1402( "prone_search_2" );
        maps\_utility::_id_1654( "prone_search_2" );
        self.allowdeath = 1;
        maps\_anim::_id_11C1( self, "prone_search_2" );
    }
}

_id_6CE5()
{
    self endon( "death" );
    level endon( "river_big_moment_stealth_spotted" );
    thread _id_6CE3();
    wait 0.05;
    self.alertlevel = "alert";
}

_id_6CE6()
{
    var_0 = maps\_vehicle::_id_2881( "river_moment_technical_driveup_2" );
    var_0 setcandamage( 0 );
    var_0._id_2955 = 1;
    var_0.mgturret[0] maketurretsolid();
    maps\_audio::aud_send_msg( "super_technical", var_0 );
    var_0 thread _id_6E09();
    var_0 thread _id_6E0B();
    var_1 = maps\_vehicle::_id_2A99( "river_moment_technical_driveup_3" );
    var_1._id_2955 = 1;
    var_1 thread _id_6CEC();
    var_1 thread maps\warlord_stealth::_id_6BE8();
    var_1 thread _id_6C72();
    var_1 thread _id_6CEE();
    var_1 thread _id_0133();
    wait 2.0;
    var_1 thread maps\_vehicle::_id_1FA6();
    maps\_audio::aud_send_msg( "technical_2", var_1 );
}

_id_6CE7()
{
    common_scripts\utility::flag_wait( "river_moment_technical_driveup" );
    level._id_6CE8 = maps\_vehicle::_id_2A99( "river_moment_technical_driveup" );
    level._id_6CE8._id_2955 = 1;
    level._id_6CE8 thread maps\warlord_stealth::_id_6BE8();
    level._id_6CE8._id_1032 = "technical";
    level._id_6CE8 thread _id_6CE9();
    level._id_6CE8 thread _id_6CEA();
    level._id_6CE8 thread _id_0133();
    maps\_audio::aud_send_msg( "river_technical_01", level._id_6CE8 );
    level._id_6CE8 endon( "death" );
    wait 0.5;
    level._id_6CE8 thread maps\_vehicle::_id_1FA6();
    level._id_6CE8 thread _id_6CEC();

    foreach ( var_1 in level._id_6CE8._id_0A39 )
        var_1.goalradius = 8;
}

_id_0133()
{
    level endon( "river_big_moment_stealth_spotted" );
    self endon( "death" );

    for (;;)
    {
        self playrumbleonentity( "subtle_tank_rumble" );
        wait 1;
    }
}

_id_6CE9()
{
    var_0 = maps\_utility::_id_1281( "open_gate" );
    self setanim( var_0[0] );
}

_id_6CEA()
{
    level endon( "river_big_moment_stealth_spotted" );
    self endon( "death" );
    common_scripts\utility::flag_wait( "swtich_truck_rider_anims" );
    var_0 = "";
    var_1 = "";
    var_2 = 0;

    foreach ( var_4 in self._id_0A39 )
    {
        switch ( var_4._id_2252 )
        {
            case 2:
                var_2 = 0;
                var_0 = "africa_technical_passenger_rside_idle_stopped";
                var_1 = "tag_guy1";
                break;
            case 3:
                var_2 = 0;
                var_0 = "africa_technical_passenger_lside_idle_stopped";
                var_1 = "tag_guy0";
                break;
            case 4:
                var_2 = 0;
                var_0 = "africa_technical_passenger_back_idle_stopped";
                var_1 = "tag_guy3";
                break;
            case 5:
                var_2 = 0;
                var_0 = "africa_technical_passenger_backside_idle_stopped";
                var_1 = "tag_guy2";
                break;
            default:
                var_2 = 1;
                break;
        }

        if ( !var_2 )
        {
            thread maps\_anim::_id_11C8( var_4, var_0, undefined, var_1 );
            var_4 thread _id_6CEB( self );
        }
    }
}

_id_6CEB( var_0 )
{
    self endon( "death" );
    self waittill( "stop_loop" );
    var_0 notify( "stop_loop" );
}

_id_6CEC()
{
    _id_6CED();
    self notify( "newpath" );
}

_id_6CED()
{
    self endon( "death" );
    self endon( "driver dead" );
    level waittill( "eternity" );
}

_id_6CEE()
{
    self endon( "death" );

    while ( !isdefined( level._id_6CE8 ) )
        wait 0.05;

    level._id_6CE8 _id_6CEF();

    if ( isdefined( level._id_6CE8 ) )
        self notify( "unload_on_stealth_broken" );
}

_id_6CEF()
{
    self endon( "death" );
    self endon( "driver dead" );
    self waittill( "stealth_broken_unload" );
}

_id_6CF0()
{
    common_scripts\utility::flag_wait( "flag_player_first_beat" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );

    if ( !common_scripts\utility::flag( "river_big_moment_stealth_spotted" ) )
    {
        level._id_4877._id_1240 = 1;
        level._id_4877 pushplayer( 1 );
        level._id_54E0._id_1240 = 1;
        level._id_54E0 pushplayer( 1 );
    }

    thread _id_6CF1();
    wait 3.0;
    common_scripts\utility::flag_set( "river_moment_technical_driveup" );
    thread maps\_utility::_id_25EE( "dont_be_stupid_dialogue", 7 );
    common_scripts\utility::flag_wait( "river_moment_allies_run" );
    common_scripts\utility::flag_set( "second_beat_move_dialogue" );
    thread _id_6CF4();
    thread _id_6CF5();
}

_id_6CF1()
{
    level endon( "river_moment_allies_run" );
    level endon( "river_big_moment_stealth_spotted" );
    thread _id_6C6E( "river_moment_allies_run" );
    level endon( "enemy_bad_event" );
    _id_6CF2();
    thread _id_6CF3();
}

_id_6CF2()
{
    level endon( "river_execution_interrupted" );

    if ( common_scripts\utility::flag( "river_execution_interrupted" ) )
        return;

    var_0 = getent( "big_moment_first_beat_aware", "targetname" );
    var_0 waittill( "trigger" );
}

_id_6CF3()
{
    level endon( "river_big_moment_stealth_spotted" );
    maps\warlord_stealth::_id_6BCB();
    common_scripts\utility::flag_wait( "river_moment_allies_run" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    maps\warlord_stealth::_id_6BCE();
}

_id_6CF4()
{
    level._id_4877 thread _id_6CF8( "node_river_moment_price" );
    wait 1;
    level._id_54E0 thread _id_6CF8( "node_river_moment_soap" );
}

_id_6CF5()
{
    level endon( "flag_player_second_beat" );
    level endon( "river_big_moment_stealth_spotted" );
    thread _id_6C6E( "flag_player_second_beat" );
    level endon( "enemy_bad_event" );
    childthread _id_6CF6();
    var_0 = getent( "big_moment_allies_move_aware", "targetname" );
    var_0 maps\_utility::_id_26E0( 12 );
    thread _id_6CF7();
}

_id_6CF6()
{
    wait 7;
    common_scripts\utility::flag_set( "jeer_guy_leave" );
}

_id_6CF7()
{
    level endon( "river_big_moment_stealth_spotted" );
    maps\warlord_stealth::_id_6BCB();
    common_scripts\utility::flag_wait( "flag_player_second_beat" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    maps\warlord_stealth::_id_6BCE();
}

_id_6CF8( var_0 )
{
    maps\_utility::_id_109B();
    thread _id_6E35( var_0 );
    wait 4;
    thread maps\_utility::_id_109E();
    maps\_utility::_id_2712();
    maps\_utility::_id_251F();
    var_1 = getnode( var_0, "targetname" );
    var_1 maps\_anim::_id_11C4( self, "prone_dive" );
    maps\_utility::_id_2520();
    maps\_utility::_id_2713();
    maps\_utility::_id_2688();

    if ( !common_scripts\utility::flag( "river_big_moment_stealth_spotted" ) )
    {
        self allowedstances( "prone" );
        var_1 maps\_anim::_id_11CE( self, "gravity", "prone_dive" );
        self.a._id_0D2B = "stop";
        self setproneanimnodes( -45, 45, %prone_legs_down, %exposed_modern, %prone_legs_up );
        maps\_utility::_id_1237( self.origin );
    }
}

_id_6CF9()
{
    var_0 = self.node;
    maps\_utility::_id_1237( self.origin );
    self.goalradius = 32;

    while ( self.a._id_0D26 != "stand" )
    {
        self allowedstances( "stand" );
        wait 0.1;
    }

    _id_21A4( var_0 );
    self allowedstances( "crouch", "stand", "prone" );
}

_id_6CFA()
{
    common_scripts\utility::flag_wait( "flag_player_second_beat" );
    var_0 = maps\_vehicle::_id_2881( "river_moment_burn_driveby" );
    maps\_audio::aud_send_msg( "river_big_moment_second_beat" );
    maps\_audio::aud_send_msg( "river_driveby_technical", var_0 );
    thread _id_6CFC();
    common_scripts\utility::flag_set( "off_the_road_dialogue" );
    thread _id_6D01();
    thread _id_6D00();
    maps\_audio::aud_send_msg( "mus_river_big_moment_grass_start" );
    wait 2;
    common_scripts\utility::flag_set( "river_burn_watchers_leave" );
    common_scripts\utility::flag_wait( "second_beat_prone_move" );
    wait 14.0;
    thread _id_6CFE();
    wait 2;
    common_scripts\utility::flag_set( "river_big_moment_done_dialogue" );
    level._id_54E0 thread _id_6E36( "node_river_soap_beat_2" );
    level._id_4877 thread _id_6E36( "node_river_price_beat_2" );
    wait 2;
    level notify( "river_moment_move_to_third_beat" );
    thread _id_6CFF();
    wait 2;
    level._id_4877 thread _id_6CF9();
    level._id_54E0 thread _id_6CF9();
    level notify( "end_aud_big_moment_grass" );
    maps\_audio::aud_send_msg( "mus_river_big_moment_grass_stop" );
    maps\_audio::aud_send_msg( "river_big_moment_end" );
}

_id_6CFB()
{
    var_0 = level.player getstance();

    if ( var_0 == "prone" )
    {
        level notify( "end_display_hint_from_map" );
        return 1;
    }

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level notify( "end_display_hint_from_map" );
        return 1;
    }

    return 0;
}

_id_6CFC()
{
    level endon( "river_moment_move_to_third_beat" );
    level.player waittill( "death" );
    level notify( "new_quote_string" );
    setdvar( "ui_deadquote", &"WARLORD_PRONE_DEATH" );
}

_id_6CFD()
{
    level endon( "flag_player_second_beat" );
    level.player waittill( "death" );
    level notify( "new_quote_string" );
    setdvar( "ui_deadquote", &"WARLORD_STEALTH_DEATH" );
}

_id_6CFE()
{
    if ( level.player getstance() == "prone" )
        maps\_utility::_id_1C32();
}

_id_6CFF()
{
    level endon( "flag_player_at_third_beat" );

    if ( common_scripts\utility::flag( "flag_player_at_third_beat" ) )
        return;

    thread _id_6C6E( "flag_player_at_third_beat" );
    level endon( "enemy_bad_event" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_move_to_third_beat" );
        maps\warlord_stealth::_id_6BCE();
        common_scripts\utility::flag_waitopen( "flag_move_to_third_beat" );
        maps\warlord_stealth::_id_6BC9();
    }
}

_id_6D00()
{
    level endon( "end_aud_big_moment_grass" );
    level endon( "river_big_moment_stealth_spotted" );

    while ( level.player getstance() != "prone" )
        wait 0.1;

    maps\_audio::aud_send_msg( "mus_river_big_moment_grass_prone" );
}

_id_6D01()
{
    level endon( "river_moment_move_to_third_beat" );
    level endon( "river_big_moment_stealth_spotted" );

    if ( isdefined( level._id_6CE8 ) )
        playfxontag( common_scripts\utility::getfx( "truck_dust_warlord" ), level._id_6CE8, "tag_fx_tire_right_r" );

    thread _id_6C6E( "river_moment_move_to_third_beat" );
    level endon( "enemy_bad_event" );
    thread maps\warlord_utility::_id_6BB0( "in_prone_stealth_area", "flag_in_prone_stealth_area", "river_moment_move_to_third_beat" );
    wait 5;
    maps\warlord_stealth::_id_6BCB();

    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_in_prone_stealth_area" );
        maps\warlord_stealth::_id_6BCF();
        common_scripts\utility::flag_waitopen( "flag_in_prone_stealth_area" );
        maps\warlord_stealth::_id_6BCB();
    }
}

_id_6D02()
{
    level endon( "river_big_moment_stealth_spotted" );

    if ( common_scripts\utility::flag( "river_big_moment_stealth_spotted" ) )
        return;

    common_scripts\utility::flag_wait( "flag_in_prone_stealth_area" );
    thread _id_6C8A( "prone" );
}

_id_6D03()
{
    self endon( "death" );
    level endon( "river_big_moment_stealth_spotted" );

    if ( !isdefined( level._id_0134 ) )
        level._id_0134 = [];

    level._id_0134 = maps\_utility::_id_0BC3( level._id_0134, self );
    thread _id_6CE3();
    self.goalradius = 8;
    self._id_1032 = "militia";
    common_scripts\utility::flag_wait( "flag_player_second_beat" );
    self.goalradius = 2048;
    self._id_117F = 1;
    self._id_1199 = 1;
    thread maps\warlord_stealth::_id_6BE6( "london_dock_soldier_walk" );
    wait 0.05;
    self.alertlevel = "alert";
}

_id_0135()
{
    level endon( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_wait( "flag_player_second_beat" );
    wait 4.5;
    var_0 = level._id_0134[0];
    var_1 = level._id_0134[1];
    var_0 maps\_utility::_id_168C( "warlord_mlt1_whydidthey" );
    var_1 maps\_utility::_id_168C( "warlord_mlt3_ratherbehere" );
    var_0 maps\_utility::_id_168C( "warlord_mlt1_thatstrue" );
    var_1 maps\_utility::_id_168C( "warlord_mlt3_howmuch" );
    var_0 maps\_utility::_id_168C( "warlord_mlt1_cigarette" );
    var_1 maps\_utility::_id_168C( "warlord_mlt3_makeitlast" );
    var_0 maps\_utility::_id_168C( "warlord_mlt1_sob" );
    var_1 maps\_utility::_id_168C( "warlord_mlt3_butyourwife" );
}

_id_6D04( var_0 )
{
    self endon( "kill_pose_transition" );
    maps\warlord_utility::_id_6BA5( "ignoreall" );
    thread _id_6D05();

    while ( self.a._id_0D26 != var_0 )
    {
        self.alertlevel = "noncombat";
        self allowedstances( var_0 );
        wait 0.05;
    }

    self notify( "done_pose_transition" );
}

_id_6D05()
{
    common_scripts\utility::waittill_any( "kill_pose_transition", "done_pose_transition" );
    maps\warlord_utility::_id_6BA7( "ignoreall" );
}

_id_6D06()
{
    common_scripts\utility::flag_wait( "flag_player_at_third_beat" );
    maps\_utility::_id_1C32();
    thread _id_6D07();
    thread _id_6D08();
    common_scripts\utility::flag_wait( "flag_go_to_bridge" );
    maps\warlord_stealth::_id_6BC9();
    thread _id_6C6E( "end_river_big_moment" );
    level._id_4877 maps\_utility::_id_1414();
    level._id_4877 _id_6E35( "price_river_node_4" );
    maps\_anim::_id_1284( level._id_54E0, "cqb_crouch_exit_8" );
    level._id_54E0 maps\_utility::_id_1414();
    level._id_54E0 _id_6E35( "soap_river_node_4" );
    maps\_utility::_id_1C32();
}

_id_6D07()
{
    level endon( "flag_go_to_bridge" );

    if ( common_scripts\utility::flag( "flag_go_to_bridge" ) )
        return;

    thread _id_6C6E( "flag_go_to_bridge" );
    level endon( "enemy_bad_event" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_player_at_third_beat" );
        maps\warlord_stealth::_id_6BCE();
        common_scripts\utility::flag_waitopen( "flag_player_at_third_beat" );
        maps\warlord_stealth::_id_6BC9();
    }
}

_id_6D08()
{
    level endon( "flag_go_to_bridge" );
    level endon( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_wait( "river_end_guys_dead" );

    while ( !maps\_stealth_utility::_id_4213() )
        wait 0.1;

    common_scripts\utility::flag_set( "flag_go_to_bridge" );
}

_id_6D09()
{
    self endon( "death" );
    level endon( "river_big_moment_stealth_spotted" );
    thread _id_6CE3();
    self.goalradius = 8;
    common_scripts\utility::flag_wait( "flag_player_at_third_beat" );
    self.goalradius = 2048;
    thread maps\warlord_stealth::_id_6BE6();
    wait 0.05;
    self.alertlevel = "alert";
    common_scripts\utility::flag_wait( "flag_go_to_bridge" );

    if ( isalive( self ) )
        self.ignoreme = 1;
}

_id_6D0A()
{
    common_scripts\utility::flag_wait( "flag_go_to_bridge" );
    common_scripts\utility::flag_init( "bridge_player_done_waiting" );

    if ( isalive( level._id_6CDF[0] ) && isalive( level._id_6CDF[1] ) )
    {
        level._id_6D0B = [];
        common_scripts\utility::flag_wait( "river_player_ready_for_bridge" );
        thread _id_6D0E();
        wait 1.0;

        if ( !common_scripts\utility::flag( "bridge_player_done_waiting" ) )
        {
            common_scripts\utility::flag_set( "church_mouse_dialogue" );
            maps\_audio::aud_send_msg( "mus_church_mouse" );
        }

        wait 1;
        level._id_6D0C = maps\_vehicle::_id_2881( "river_bridge_technical" );
        maps\_audio::aud_send_msg( "bridge_technical", level._id_6D0C );
        level._id_6D0C thread maps\warlord_stealth::_id_6BE8();
        common_scripts\utility::flag_wait( "river_bridge_technical_gone" );

        if ( !common_scripts\utility::flag( "bridge_player_done_waiting" ) )
        {
            common_scripts\utility::flag_set( "bridge_go_loud_dialogue" );
            common_scripts\utility::flag_wait( "bridge_player_done_waiting" );
        }

        level._id_4877 pushplayer( 0 );
        level._id_4877._id_1240 = undefined;
        level._id_54E0 pushplayer( 0 );
        level._id_54E0._id_1240 = undefined;
        level._id_4877 thread maps\warlord_utility::_id_6BA2( level._id_6CDF, 0.4 );
        thread _id_6D0D();
        thread _id_6D15( "river_guy_2_dead", 1, level._id_54E0, "soap", "org_bridge_soap", "bridge_pulloff_2", "trig_soap_post_bridge", "soap_post_bridge" );
        common_scripts\utility::flag_wait( "river_guy_1_dead" );
        common_scripts\utility::flag_wait( "river_guy_2_dead" );
        thread _id_6D15( "river_guy_1_dead", 0, level._id_4877, "price", "org_bridge_price", "bridge_pulloff_1", "trig_price_post_bridge", "price_post_bridge" );
    }
    else
    {
        level._id_4877 pushplayer( 0 );
        level._id_4877._id_1240 = undefined;
        level._id_54E0 pushplayer( 0 );
        level._id_54E0._id_1240 = undefined;
        common_scripts\utility::flag_set( "price_post_bridge" );
        var_0 = getent( "trig_price_post_bridge", "targetname" );
        var_0 notify( "trigger", level.player );
        common_scripts\utility::flag_set( "soap_post_bridge" );
        var_1 = getent( "trig_soap_post_bridge", "targetname" );
        var_1 notify( "trigger", level.player );
    }
}

_id_6D0D()
{
    common_scripts\utility::flag_wait( "river_guy_1_dead" );
    common_scripts\utility::flag_wait( "river_guy_2_dead" );
    common_scripts\utility::flag_set( "bridge_guys_dead_dialogue" );
    maps\_audio::aud_send_msg( "mus_bridge_guys_dead" );
}

_id_6D0E()
{
    level.player endon( "death" );

    if ( !common_scripts\utility::flag( "river_guy_1_dead" ) && !common_scripts\utility::flag( "river_guy_2_dead" ) )
    {
        var_0 = [ "river_guy_1_dead", "river_guy_2_dead" ];
        _id_6D0F( var_0 );

        if ( !common_scripts\utility::flag( "river_bridge_technical_gone" ) )
            common_scripts\utility::flag_set( "_stealth_spotted" );
    }

    common_scripts\utility::flag_set( "bridge_player_done_waiting" );
}

_id_6D0F( var_0 )
{
    if ( !isarray( var_0 ) )
        level endon( var_0 );
    else
    {
        foreach ( var_2 in var_0 )
            level endon( var_2 );
    }

    level endon( "_stealth_spotted" );
    level endon( "player_fired_weapon" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    childthread _id_6D10();
    wait 16.0;
}

_id_6D10()
{
    level.player waittill( "weapon_fired" );
    level notify( "price_dont_talk" );
    wait 2;
    level notify( "player_fired_weapon" );
}

_id_6D11()
{
    self endon( "death" );
    var_0 = [];
    var_1 = [];
    var_0[0][0] = %casual_stand_idle;
    var_0[0][1] = %casual_stand_idle_twitch;
    var_0[0][2] = %casual_stand_idle_twitchb;
    var_1[0][0] = 2;
    var_1[0][1] = 1;
    var_1[0][2] = 1;
    var_0[1][0] = %casual_stand_v2_idle;
    var_0[1][1] = %casual_stand_v2_twitch_radio;
    var_0[1][2] = %casual_stand_v2_twitch_shift;
    var_0[1][3] = %casual_stand_v2_twitch_talk;
    var_1[1][0] = 10;
    var_1[1][1] = 4;
    var_1[1][2] = 7;
    var_1[1][3] = 4;
    var_0[2][0] = %patrol_bored_idle;
    var_0[2][1] = %patrol_bored_twitch_bug;
    var_0[2][2] = %patrol_bored_twitch_stretch;
    var_1[2][0] = 4;
    var_1[2][1] = 1;
    var_1[2][2] = 1;
    var_2 = 0;
    self._id_0C89 = [];

    for (;;)
    {
        var_3 = randomint( var_0.size );

        if ( var_3 == var_2 )
            var_3 = ( var_2 + 1 ) % var_0.size;

        var_2 = var_3;
        self._id_0C89["stand"] = animscripts\utility::_id_10FF( var_0[var_3], var_1[var_3] );

        for (;;)
        {
            self waittill( "idle", var_4 );

            if ( isdefined( var_4 ) && var_4 == "end" )
                break;
        }

        waittillframeend;
    }
}

_id_6D12()
{
    self endon( "death" );
    self.goalradius = 8;
    common_scripts\utility::flag_wait( "river_big_moment_stealth_spotted" );
    self.goalradius = 2048;
}

_id_6D13()
{
    level endon( "flag_go_to_bridge" );
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    self waittill( "death" );
    wait 1;
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_6D14()
{
    level endon( "river_big_moment_stealth_spotted" );

    if ( common_scripts\utility::flag( "river_big_moment_stealth_spotted" ) )
        return;

    self.health = 50;
    self waittill( "death" );
    waittillframeend;

    if ( !isdefined( self ) )
        return;

    var_0 = undefined;

    for ( var_1 = 0; var_1 < level._id_6CDF.size; var_1++ )
    {
        if ( self == level._id_6CDF[var_1] )
        {
            var_0 = var_1;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    if ( self._id_6CE0 maps\warlord_utility::_id_6BA9( self, self._id_6CE1, undefined, "generic" ) && self.a._id_0D26 == "stand" )
    {
        self.a._id_0D55 = 1;
        maps\_utility::_id_24F5();
        level._id_6D0B[var_0] = maps\_vehicle_aianim::_id_25C1( self );
        level._id_6D0B[var_0]._id_1032 = "generic";
        level._id_6D0B[var_0] notsolid();
        level._id_6D0B[var_0] maps\_utility::_id_1402( "guy_done_dying" );
        self._id_6CE0 maps\_anim::_id_1246( level._id_6D0B[var_0], self._id_6CE1 );
        level._id_6D0B[var_0] maps\_utility::_id_13DC( "guy_done_dying" );
    }
}

_id_6D15( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_wait( var_0 );
    wait 0.05;

    if ( isdefined( level._id_6D0B[var_1] ) )
    {
        var_8 = level._id_6D0B[var_1];
        var_9 = common_scripts\utility::getstruct( var_4, "targetname" );
        var_9 maps\_anim::_id_124A( var_2, var_5 );
        var_8 maps\_utility::_id_1654( "guy_done_dying" );
        thread _id_6D16( var_8, var_2, var_3, var_9, var_5, var_6, var_7 );
    }
    else
        thread _id_6D17( var_2, var_6, var_7 );
}

_id_6D16( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_1 notify( "kill_ally_river_spotted" );

    if ( var_3 maps\warlord_utility::_id_6BA9( var_1, var_4 ) )
    {
        var_7 = [];
        var_7["generic"] = [ var_0, 0 ];
        var_7[var_2] = [ var_1, 0.3 ];
        var_3 thread maps\_shg_common::_id_16EB( var_7, var_4 );
        var_1 waittill( "anim_ended" );
    }

    thread _id_6D17( var_1, var_5, var_6 );
}

_id_6D17( var_0, var_1, var_2 )
{
    var_0 maps\_utility::_id_1237( var_0.origin );
    var_0 maps\_utility::_id_2688();
    var_3 = getent( var_1, "targetname" );
    var_3 notify( "trigger", level.player );
    common_scripts\utility::flag_set( var_2 );
}

_id_6D18()
{
    common_scripts\utility::flag_wait( "end_river_big_moment" );
    var_0 = getaiarray( "axis" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = 1;

        if ( isdefined( level._id_6D19 ) && level._id_6D19 == var_3 )
            var_4 = 0;

        if ( var_4 )
            var_1[var_1.size] = var_3;
    }

    common_scripts\utility::flag_wait( "clean_up_river" );

    if ( !common_scripts\utility::flag( "river_big_moment_stealth_spotted" ) )
    {
        level._id_4877 maps\warlord_utility::_id_6BA7( "ignoreall" );
        level._id_54E0 maps\warlord_utility::_id_6BA7( "ignoreall" );
    }

    maps\_utility::_id_2756( var_1, 1024 );
}

_id_6D1A( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );
    thread maps\_anim::_id_11C8( self, var_1 );
}

_id_6D1B( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "reached_dynamic_path_end" );
    self endon( "stealth_broken_unload" );
    self._id_6C77 = spawn( "script_origin", self.mgturret[0].origin );
    self.mgturret[0] maps\warlord_utility::_id_6BA5( "TurretFireDisable" );
    self.mgturret[0] settargetentity( self._id_6C77, ( 0.0, 0.0, 0.0 ) );
    var_4 = randomfloat( var_1 - var_0 ) + var_0;
    var_5 = var_4 * 0.05;
    var_6 = 0;

    for (;;)
    {
        if ( isdefined( self.mgturret ) )
        {
            var_7 = self.mgturret[0].angles;
            var_7 = ( var_7[0], var_7[1] + var_6, var_7[2] );
            var_8 = anglestoforward( var_7 );
            self._id_6C77.origin = self.mgturret[0].origin + var_8 * 72;
            var_6 = angleclamp180( var_6 + var_5 );

            if ( var_6 > var_3 )
            {
                var_6 = var_3;
                var_4 = randomfloat( var_1 - var_0 ) + var_0;
                var_5 = var_4 * 0.05 * -1;
            }
            else if ( var_6 < var_2 )
            {
                var_6 = var_2;
                var_4 = randomfloat( var_1 - var_0 ) + var_0;
                var_5 = var_4 * 0.05;
            }
        }
        else
        {
            self._id_6C77 delete();
            break;
        }

        wait 0.05;
    }
}

_id_6D1C( var_0 )
{
    level endon( "infiltration_over" );
    level.player endon( "death" );
    level endon( "_stealth_enabled" );
    level endon( "end_tower_stealth_settings" );
    var_1 = getent( "trig_tower_1", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_1 ) )
        {
            level notify( "player_at_tower" );
            maps\warlord_stealth::_id_6BD2();

            while ( level.player istouching( var_1 ) )
                wait 0.1;
        }

        thread _id_6D1D( var_0 );
        var_1 waittill( "trigger" );
    }
}

_id_6D1D( var_0 )
{
    level endon( "_stealth_enabled" );
    level endon( "player_at_tower" );
    level endon( "infiltration_over" );
    level endon( "end_tower_stealth_settings" );
    wait 1;
    maps\warlord_stealth::_id_6BD0();
    common_scripts\utility::flag_wait_any( "start_inf_snipe_encounter_1", "trig_yuri_advance" );
    maps\warlord_stealth::_id_6BD1();
}

_id_6D1E()
{
    level endon( "infiltration_over" );
    level endon( "_stealth_enabled" );

    if ( !common_scripts\utility::flag( "_stealth_enabled" ) )
        return;

    _id_6D1F();
    maps\_audio::aud_send_msg( "mus_overwatch_busted" );
    thread _id_6D20();
}

_id_6D1F()
{
    level endon( "enemy_bad_event" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
}

_id_6D20()
{
    var_0 = getentarray( "infiltrate_reinforce", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F );
    common_scripts\utility::flag_set( "inf_stealth_spotted" );
    common_scripts\utility::flag_set( "inf_spotted_dialogue" );
    level._id_4877.ignoreall = 0;
    level._id_54E0.ignoreall = 0;
    level._id_4877.goalradius = 2048;
    level._id_54E0.goalradius = 2048;
    wait 1;
    maps\_stealth_utility::_id_4342();
    common_scripts\utility::flag_set( "infiltration_over" );
    wait 0.1;
    common_scripts\utility::flag_set( "inf_factory_breach" );
}

_id_6D21()
{
    level notify( "one_infiltrate_autosave" );
    level endon( "one_infiltrate_autosave" );
    level._id_1C4B = ::_id_6D22;
    thread maps\_utility::_id_1C32();
    common_scripts\utility::flag_wait( "game_saving" );
    common_scripts\utility::flag_waitopen( "game_saving" );
    level._id_1C4B = undefined;
}

_id_6D22()
{
    level.player endon( "death" );

    if ( common_scripts\utility::flag( "warlord_advance" ) )
        return 1;

    var_0 = getent( "trig_tower_1", "targetname" );

    if ( level.player istouching( var_0 ) && !common_scripts\utility::flag( "inf_stealth_spotted" ) )
        return 1;

    return 0;
}

_id_6D23()
{
    common_scripts\utility::flag_init( "inf_civ_runner_go" );
    level._id_6D24 = [];
    thread _id_6D25();
}

_id_6D25()
{
    var_0 = getent( "inf_civ_door_1", "targetname" );
    var_0 rotateyaw( 90, 0.2, 0.1, 0.1 );
    var_0 connectpaths();
    common_scripts\utility::flag_wait( "inf_spawn_truck" );
    var_1 = getent( "inf_civ_runner", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F();

    if ( isdefined( var_2 ) )
    {
        var_2 endon( "death" );
        var_2._id_1FE6 = -2000;
        level._id_6D24 = maps\_utility::_id_0BC3( level._id_6D24, var_2 );
        common_scripts\utility::flag_wait( "inf_civ_runner_go" );
        var_2 thread _id_6E35( "inf_civ_runner_node" );
        var_2 waittill( "goal" );
        var_0 rotateyaw( -90, 0.3, 0.1, 0.1 );
    }
}

_id_6D26()
{
    thread _id_6D35();
    common_scripts\utility::flag_init( "price_door_triggered" );
    common_scripts\utility::flag_init( "price_post_kill_move_done" );
    common_scripts\utility::flag_wait( "infiltrate_encounter_1" );
    common_scripts\utility::flag_set( "aud_infiltrate_encounter_1" );
    var_0 = getent( "snipe_guy_1", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F();

    if ( isdefined( var_1 ) )
    {
        var_1._id_1032 = "generic";
        var_1.allowdeath = 1;
        var_1.grenadeammo = 0;
        level._id_54E0 thread _id_6D37( var_1 );
        thread _id_6D27();
        thread _id_6D2F( var_1 );
        _id_6D2B( var_1 );

        if ( isalive( var_1 ) )
            var_1 waittill( "death" );
    }

    level._id_4877 thread _id_6D36( "node_inf_price_house", "price_post_bridge" );
    _id_6D29();
    common_scripts\utility::flag_set( "large_group_dialogue" );
    maps\_audio::aud_send_msg( "mus_tower_snipe" );
    var_2 = getent( "org_price_sniper_door", "targetname" );
    var_2 maps\_anim::_id_124B( level._id_4877, "sniper_open_door", undefined, "Cover Right" );

    while ( !var_2 maps\warlord_utility::_id_6BA9( level._id_4877, "sniper_open_door" ) )
        var_2 maps\_anim::_id_124B( level._id_4877, "sniper_open_door", undefined, "Cover Right" );

    common_scripts\utility::flag_set( "start_inf_door_open" );
    var_3 = getent( "sniper_door", "targetname" );
    var_3 thread maps\warlord_utility::_id_6B9E( 0.75 );
    var_3 thread _id_6D28();
    var_2 maps\_anim::_id_1246( level._id_4877, "sniper_open_door" );
    common_scripts\utility::flag_set( "inf_civ_runner_go" );
    level._id_4877 maps\_utility::_id_2688();
    level._id_54E0 maps\_utility::_id_2688();
    maps\_utility::_id_26BF( "trig_sniper_post_door" );
    thread _id_6D2A();
    common_scripts\utility::flag_set( "obj_take_overwatch_position" );
    common_scripts\utility::flag_set( "cover_us_dialogue" );
}

_id_6D27()
{
    level endon( "start_inf_door_open" );

    if ( common_scripts\utility::flag( "start_inf_door_open" ) )
        return;

    var_0 = getent( "back_to_river_trigger", "targetname" );
    var_1 = getent( "start_infiltration_trigger", "targetname" );
    maps\warlord_stealth::_id_6BC4( "inf_patroller" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        maps\warlord_stealth::_id_6BC9();
        var_1 waittill( "trigger" );
        maps\warlord_stealth::_id_6BC4( "inf_patroller" );
    }
}

_id_6D28()
{
    common_scripts\utility::flag_wait( "advance_player_at_combat" );
    self rotateto( self.angles + ( 0.0, -110.0, 0.0 ), 0.2, 0.1, 0.1 );
}

_id_6D29()
{
    common_scripts\utility::flag_set( "clean_up_river" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "price_door_triggered" );
}

_id_6D2A()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        thread _id_6D20();
    else
    {
        level._id_4877.ignoreall = 1;
        level._id_54E0.ignoreall = 1;
        thread _id_6D1E();
        thread _id_6D1C( 10 );
    }
}

_id_6D2B( var_0 )
{
    level endon( "skip_encounter_1" );
    _id_6D32( var_0 );

    if ( isalive( var_0 ) && !var_0 maps\_utility::_id_0D69() )
    {
        thread _id_6D2C( var_0 );
        var_0 maps\_utility::delaythread( 4.3, ::_id_6D2E );
        var_1 = [];
        var_1[0] = [ var_0, 0 ];
        var_1[1] = [ level._id_4877, 0.35 ];
        var_2 = common_scripts\utility::getstruct( "struct_knife_anim", "targetname" );
        var_2 thread maps\_shg_common::_id_16EB( var_1, "price_corner_kill" );
        level._id_4877 waittill( "anim_ended" );
        level._id_4877 maps\_utility::_id_2688();
        maps\warlord_anim::_id_6B6C( level._id_4877 );
    }
}

_id_6D2C( var_0 )
{
    level endon( "paired_kill_uninterruptible" );
    _id_6D2D( var_0 );
    level notify( "paired_kill_interrupted" );
    level._id_4877 notify( "single anim", "end" );
    level._id_4877 stopanimscripted();
    level._id_4877 maps\_utility::_id_2688();
    maps\warlord_anim::_id_6B6C( level._id_4877 );

    if ( isdefined( var_0 ) && isalive( var_0 ) )
    {
        var_0 notify( "single anim", "end" );
        var_0 stopanimscripted();
    }

    level._id_4877.ignoreall = 0;
    level._id_54E0.ignoreall = 0;
}

_id_6D2D( var_0 )
{
    var_0 endon( "death" );
    level waittill( "skip_encounter_1" );
}

_id_6D2E()
{
    self endon( "death" );
    level endon( "skip_encounter_1" );
    maps\_stealth_utility::_id_4344();
    self.allowdeath = 0;
    level notify( "paired_kill_uninterruptible" );
}

_id_6D2F( var_0 )
{
    var_0 endon( "death" );
    level endon( "paired_kill_uninterruptible" );
    var_0 _id_6D30();
    level notify( "skip_encounter_1" );
    maps\_audio::aud_send_msg( "mus_corner_kill_busted" );
}

_id_6D30()
{
    _id_6D31();
    maps\warlord_stealth::_id_6BD0();
}

_id_6D31()
{
    self endon( "enemy" );
    var_0 = getent( "interrupt_snipe_guy_1", "targetname" );
    var_0 endon( "trigger" );
    maps\_utility::_id_13DB( "_stealth_normal" );
}

_id_6D32( var_0 )
{
    var_0 endon( "death" );
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_init( "enemy_reaches_price_corner_kill" );
    common_scripts\utility::flag_init( "price_reaches_price_corner_kill" );
    var_1 = common_scripts\utility::getstruct( "struct_knife_anim", "targetname" );
    var_2 = var_0.goalradius;
    var_0.goalradius = 0;
    var_1 thread _id_6D33( var_0 );
    var_1 thread _id_6D34( level._id_4877 );
    common_scripts\utility::flag_wait( "enemy_reaches_price_corner_kill" );
    common_scripts\utility::flag_wait( "price_reaches_price_corner_kill" );
    var_0.goalradius = var_2;
}

_id_6D33( var_0 )
{
    var_0 endon( "death" );
    level._id_4877 endon( "death" );
    maps\_anim::_id_124A( var_0, "price_corner_kill" );
    common_scripts\utility::flag_set( "enemy_reaches_price_corner_kill" );
}

_id_6D34( var_0 )
{
    var_0 endon( "death" );
    common_scripts\utility::flag_wait( "price_post_bridge" );
    wait 0.05;
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = ( self.angles[0], angleclamp180( self.angles[1] + 48 ), self.angles[2] );
    var_1 maps\_anim::_id_124B( var_0, "price_corner_kill", undefined, "Cover Right" );
    var_1 delete();
    wait 0.2;
    common_scripts\utility::flag_set( "price_reaches_price_corner_kill" );
    maps\_audio::aud_send_msg( "mus_corner_kill" );
}

_id_6D35()
{
    var_0 = getent( "trig_sniper_price_door", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_wait( "price_post_bridge" );
    common_scripts\utility::flag_wait( "soap_post_bridge" );
    common_scripts\utility::flag_set( "price_door_triggered" );
}

_id_6D36( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_1 );
    wait 0.05;

    if ( !maps\_utility::_id_133C( "_stealth_normal" ) || maps\_utility::_id_1008( "_stealth_normal" ) )
        maps\_utility::_id_109B();

    self notify( "kill_ally_river_spotted" );
    maps\_utility::_id_123B();
    thread _id_6E35( var_0 );
}

_id_6D37( var_0 )
{
    common_scripts\utility::flag_wait( "soap_post_bridge" );
    wait 0.05;
    var_1 = common_scripts\utility::getstruct( "org_soap_wall_cover", "targetname" );
    var_1 maps\_anim::_id_124A( level._id_54E0, "soap_wall_cover_enter" );

    if ( isdefined( var_0 ) && isalive( var_0 ) )
    {
        var_1 maps\_anim::_id_1246( level._id_54E0, "soap_wall_cover_enter" );

        if ( isdefined( var_0 ) && isalive( var_0 ) )
        {
            var_1 thread maps\_anim::_id_124E( level._id_54E0, "soap_wall_cover_idle", "end_loop" );
            var_0 waittill( "death" );
            wait 2;
            var_1 notify( "end_loop" );
        }

        var_1 maps\_anim::_id_1246( level._id_54E0, "soap_wall_cover_exit" );
    }

    level._id_54E0 maps\_utility::_id_2688();
    level._id_54E0 _id_6D36( "node_inf_soap_house", "soap_post_bridge" );
}

_id_6D38()
{
    var_0 = getent( "inf_guy_sleep", "targetname" );
    level._id_6D19 = var_0 maps\_utility::_id_166F();
    maps\_audio::aud_send_msg( "sleeping_guard_spawned", level._id_6D19 );
    thread _id_6D3A( level._id_6D19 );
    thread _id_6D39( level._id_6D19 );
}

_id_6D39( var_0 )
{
    level endon( "inf_stealth_spotted" );
    common_scripts\utility::flag_init( "throat_stab" );
    common_scripts\utility::flag_init( "sleeping_guy_dead" );
    maps\_utility::_id_262C( "trig_tower_1" );
    level._id_54E0 thread maps\_utility::_id_109E();
    level._id_4877 thread maps\_utility::_id_109E();

    if ( isdefined( var_0 ) && isalive( var_0 ) )
        var_0 waittill( "death" );

    common_scripts\utility::flag_set( "start_inf_snipe_encounter_1" );
}

_id_6D3A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0.allowdeath = 1;
    var_0.ignoreme = 1;
    var_0.ignoreall = 1;
    var_0._id_0F9F = 1;
    var_0.health = 50;
    var_0._id_1032 = "generic";
    var_0 maps\_utility::_id_24F5();
    var_0 maps\_utility::_id_0D72( 0 );
    var_1 = maps\_utility::_id_1287( "chair" );
    var_0 thread _id_6D40( var_1 );
    var_0 thread _id_6D42( var_1 );
    var_0 thread _id_6D43( var_1 );

    if ( isalive( var_0 ) )
    {
        var_0 waittill( "death" );
        common_scripts\utility::flag_set( "sleeping_guy_dead" );
    }

    if ( isdefined( level.player._id_6D3B ) )
        level.player waittill( "stab_finished" );

    var_1 thread _id_6D45();
    _id_6D3F();
}

_id_6D3C()
{
    if ( !isalive( level.player ) )
        return 1;

    if ( !isdefined( level.player._id_6D3D ) || !level.player._id_6D3D )
        return 1;

    if ( isdefined( level.player._id_6D3B ) && level.player._id_6D3B )
        return 1;

    return 0;
}

_id_6D3E()
{
    level.player allowmelee( 0 );
    level.player._id_6D3D = 1;
    level.player maps\_utility::_id_1F61( "neck_stab_hint" );
}

_id_6D3F()
{
    if ( isdefined( level.player._id_6D3D ) && level.player._id_6D3D )
    {
        level.player._id_6D3D = undefined;
        level.player allowmelee( 1 );
    }
}

_id_6D40( var_0 )
{
    self endon( "death" );
    level.player endon( "death" );
    self endon( "guy_waking_up" );
    var_1 = 15625;

    for (;;)
    {
        var_2 = distancesquared( level.player.origin, self.origin );
        var_3 = abs( angleclamp180( level.player.angles[1] - self.angles[1] ) );

        if ( var_3 < 45 && var_2 < var_1 )
        {
            _id_6D3E();

            if ( level.player meleebuttonpressed() && isalive( self ) && !level.player ismeleeing() && !level.player isthrowinggrenade() )
            {
                maps\_audio::aud_send_msg( "aud_kill_sleeping_guard" );
                thread _id_6D41( var_0 );
                return;
            }
        }
        else
            _id_6D3F();

        wait 0.05;
    }
}

_id_6D41( var_0 )
{
    level.player._id_6D3B = 1;
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player setstance( "stand" );
    level.player disableweapons();
    level.player disableweaponswitch();
    level.player disableoffhandweapons();
    var_1 = spawnstruct();
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_2 = maps\_utility::_id_1287( "player_rig" );
    var_2 hide();
    common_scripts\utility::flag_set( "throat_stab" );
    var_3 = [];
    var_3[0] = var_2;
    var_3[1] = self;
    var_1 maps\_anim::_id_11CF( var_2, "throat_stab" );
    var_4 = 0.4;
    level.player playerlinktoblend( var_2, "tag_player", var_4, 0.2, 0.2 );
    wait(var_4);

    if ( isalive( self ) )
    {
        var_2 show();
        var_2 attach( "weapon_parabolic_knife", "tag_weapon_right", 1 );
        var_0 thread _id_6D45();
        var_1 maps\_anim::_id_11DD( var_3, "throat_stab" );
        self kill();
        var_2 detach( "weapon_parabolic_knife", "tag_weapon_right", 1 );
        var_2 hide();
    }

    level.player unlink();
    var_2 delete();
    var_5 = ( level.player.origin[0], level.player.origin[1], level.player.origin[2] + 6 );
    var_6 = spawn( "script_origin", var_5 );
    var_6.angles = ( 20.0, -40.0, 0.0 );
    var_4 = 0.4;
    level.player playerlinktoblend( var_6, undefined, var_4, 0, 0.2 );
    level.player enableoffhandweapons();
    level.player enableweaponswitch();
    level.player enableweapons();
    wait(var_4);
    level.player unlink();
    maps\_shg_common::_id_1671();
    level.player._id_6D3B = undefined;
    level.player notify( "stab_finished" );
}

_id_6D42( var_0 )
{
    self endon( "death" );
    var_1 = getent( "org_guard_sleep", "targetname" );
    var_1 maps\_anim::_id_11CF( var_0, "sleep_react" );
    var_1 maps\_anim::_id_11C8( self, "sleep_idle" );
}

_id_6D43( var_0 )
{
    self endon( "death" );
    level endon( "throat_stab" );
    _id_6D44();
    maps\_audio::aud_send_msg( "aud_wake_sleeping_guard" );
    self notify( "guy_waking_up" );
    _id_6D3F();
    var_1 = getent( "org_guard_sleep", "targetname" );
    var_0 thread _id_6D45();
    var_1 maps\_anim::_id_11C1( self, "sleep_react" );
    self.ignoreme = 0;
    self.ignoreall = 0;
    self._id_0F9F = undefined;
    self.health = self.maxhealth;
    thread maps\_utility::_id_0D72( 1 );
    thread maps\_utility::_id_257D();
}

_id_6D44()
{
    self endon( "death" );
    self endon( "flashbang" );
    level endon( "inf_stealth_spotted" );
    common_scripts\utility::flag_wait( "start_inf_door_open" );
    self addaieventlistener( "gunshot" );
    self addaieventlistener( "bulletwhizby" );
    self addaieventlistener( "explode" );

    for (;;)
    {
        self waittill( "ai_event", var_0 );

        if ( var_0 == "gunshot" || var_0 == "bulletwhizby" || var_0 == "explode" )
            return;
    }
}

_id_6D45()
{
    if ( !isdefined( self._id_6D46 ) )
    {
        self._id_6D46 = 1;
        var_0 = getent( "org_guard_sleep", "targetname" );
        var_0 maps\_anim::_id_1246( self, "sleep_react" );
    }
}

_id_6D47()
{
    var_0 = getent( "sniper_tower_mantle", "targetname" );
    var_1 = var_0.origin;
    var_0.origin = ( 0.0, 0.0, 0.0 );
    common_scripts\utility::flag_wait_any( "inf_stealth_spotted", "infiltration_over" );
    var_0.origin = var_1;
}

_id_6D48( var_0, var_1 )
{
    self notify( "new_infiltrate_move" );
    self endon( "new_infiltrate_move" );
    maps\_utility::_id_2712();
    var_2 = self.goalradius;
    self.goalradius = 8;
    maps\_utility::_id_2053( var_0 );
    self waittill( "goal" );
    maps\_utility::_id_2713();

    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_set( var_1 );
}

_id_6D49()
{
    self.health = 1;
    self.grenadeammo = 0;

    if ( !isdefined( level._id_6D4A ) )
        level._id_6D4A = [];

    level._id_6D4A[level._id_6D4A.size] = self;
}

_id_6D4B()
{
    level endon( "inf_stealth_spotted" );
    common_scripts\utility::flag_init( "price_inf_kill_done" );
    common_scripts\utility::flag_init( "soap_inf_kill_done" );
    var_0 = getnode( "node_price_inf_4", "targetname" );
    var_1 = getnode( "node_soap_inf_6", "targetname" );
    thread _id_6D4D();
    thread _id_6D52();
    common_scripts\utility::flag_wait( "price_inf_kill_done" );
    thread _id_6D21();
    thread _id_6D58();
    common_scripts\utility::flag_wait_any( "inf_ramp_guys_dead", "inf_ramp_guys_gone" );
    common_scripts\utility::flag_set( "inf_nice_shot_vo" );
    common_scripts\utility::flag_wait( "inf_encounter_2_vo_done" );
    thread _id_6D59();
    common_scripts\utility::flag_wait( "inf_talkers_dead" );
    level._id_54E0 thread _id_6D48( var_0 );
    level._id_4877 thread _id_6D48( var_1 );
    thread _id_6D5A();
    common_scripts\utility::flag_set( "more_militia_dialogue" );
    common_scripts\utility::flag_wait( "tower_patrols_dead" );
    common_scripts\utility::flag_set( "inf_both_moving_dialogue" );
    common_scripts\utility::flag_set( "inf_factory_breach" );
    common_scripts\utility::flag_wait( "inf_factory_breach_done" );
    common_scripts\utility::flag_set( "infiltration_over" );
    maps\_stealth_utility::_id_4342();
    thread _id_6D5E();
}

_id_6D4C( var_0, var_1 )
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait_any( "inf_factory_breach", "infiltration_over", "inf_stealth_spotted" );
    var_2 = getent( "inf_fence_clip", "targetname" );
    var_0.origin = var_1;
    var_2 delete();
}

_id_6D4D()
{
    var_0 = getentarray( "inf_end_badguys", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D49 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D4E );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D51 );
    maps\_utility::_id_272B( var_0 );
    var_1 = getent( "inf_end_hyena", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_6D4E );
    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 maps\_utility::_id_1402( "_stealth_enabled" );
    var_2._id_0FC6 = 0.7;
}

_id_6D4E()
{
    self endon( "death" );
    maps\_utility::_id_0D72( 0 );
    self.goalradius = 8;
    maps\_utility::_id_1237( self.origin );
    common_scripts\utility::flag_wait( "infiltration_over" );
    maps\_utility::_id_13DE( "_stealth_enabled" );
    maps\_utility::_id_0D72( 1 );

    if ( common_scripts\utility::flag( "inf_stealth_spotted" ) )
    {
        self.ignoreall = 0;
        self.goalradius = 1024;

        if ( self.classname == "actor_enemy_dog_hyena" )
            maps\_utility::_id_1237( level._id_4877.origin );
    }
    else
        thread _id_6D4F();
}

_id_6D4F()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.goalradius = 8;
    maps\_utility::_id_1237( level._id_4877.origin );
    _id_6D50();
    self.ignoreall = 0;
    self.goalradius = 1024;
}

_id_6D50()
{
    self endon( "bulletwhizby" );
    wait 2;
}

_id_6D51()
{
    level endon( "inf_stealth_spotted" );
    level endon( "infiltration_over" );
    self waittill( "death" );
    wait 1.1;
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_6D52()
{
    level endon( "inf_stealth_spotted" );
    var_0 = common_scripts\utility::getstruct( "org_inf_price_teleport", "targetname" );
    var_1 = common_scripts\utility::getstruct( "org_inf_soap_teleport", "targetname" );
    common_scripts\utility::flag_wait_any( "throat_stab", "sleeping_guy_dead" );

    if ( common_scripts\utility::flag( "throat_stab" ) )
    {
        wait 0.5;
        var_2 = common_scripts\utility::getstruct( "org_inf_price_teleport_2", "targetname" );
        var_3 = common_scripts\utility::getstruct( "org_inf_soap_teleport_2", "targetname" );
        level._id_4877 maps\_utility::_id_279F( var_2 );
        level._id_4877 maps\_utility::_id_1237( level._id_4877.origin );
        level._id_54E0 maps\_utility::_id_279F( var_3 );
        level._id_54E0 maps\_utility::_id_1237( level._id_54E0.origin );
        wait 0.5;
        thread _id_6D54();
        thread _id_6D56();
    }
    else
    {
        common_scripts\utility::flag_set( "price_inf_kill_done" );
        level._id_4877 maps\_utility::_id_2052( var_0 );
        level._id_54E0 maps\_utility::_id_2052( var_1 );
    }
}

_id_6D53()
{
    var_0 = getent( "inf_graph_blocker", "targetname" );
    var_0 disconnectpaths();
    level common_scripts\utility::waittill_any( "inf_stealth_spotted", "inf_ramp_guys_dead" );
    var_0 connectpaths();
    var_0 delete();
}

_id_6D54()
{
    level endon( "inf_stealth_spotted" );
    var_0 = getent( "inf_price_melee_kill", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1._id_1032 = "generic";
    var_1 maps\_utility::_id_0D72( 0 );
    var_2 = common_scripts\utility::getstruct( "org_price_melee_kill", "targetname" );
    var_3 = [];
    var_3[0] = level._id_4877;
    var_3[1] = var_1;
    var_2 maps\_anim::_id_122A( var_3, "price_corner_kill_2" );
    thread _id_6D55( var_2, var_1 );
}

_id_6D55( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = level._id_4877;
    var_2[1] = var_1;
    wait 0.5;
    var_0 maps\_anim::_id_11DD( var_2, "price_corner_kill_2" );
    level._id_4877 animscripts\shared::_id_0C9B( level._id_4877.weapon, "right" );
    var_1 maps\warlord_utility::_id_4BF3();
    level._id_4877 maps\_utility::_id_2688();
    maps\_utility::_id_26BF( "trig_inf_price_melee_kill" );
    common_scripts\utility::flag_set( "price_inf_kill_done" );
}

_id_6D56()
{
    level endon( "inf_stealth_spotted" );
    var_0 = getent( "inf_soap_ambush", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1._id_1032 = "generic";
    var_1.ignoreme = 1;
    var_1.ignoreall = 1;
    var_1 maps\_utility::_id_0D72( 0 );
    var_2 = [];
    var_2[0] = level._id_54E0;
    var_2[1] = var_1;
    var_3 = common_scripts\utility::getstruct( "org_soap_door_kill", "targetname" );
    var_3 maps\_anim::_id_122A( var_2, "soap_door_kill" );
    thread _id_6D57( var_3, var_1 );
}

_id_6D57( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = level._id_54E0;
    var_2[1] = var_1;
    var_0 maps\_anim::_id_11DD( var_2, "soap_door_kill" );
    var_1 kill();
    level._id_54E0 maps\_utility::_id_2688();
    maps\_utility::_id_26BF( "trig_inf_soap_melee_kill" );
    common_scripts\utility::flag_set( "soap_inf_kill_done" );
}

_id_6D58()
{
    level endon( "inf_stealth_spotted" );
    wait 1;
    var_0 = getnode( "soap_inf_enc_1_node", "targetname" );
    var_1 = getnode( "price_inf_enc_1_node", "targetname" );

    if ( !common_scripts\utility::flag( "throat_stab" ) )
    {
        level._id_54E0 thread _id_6D48( var_0 );
        level._id_4877 _id_6D48( var_1 );
    }
    else
    {
        level._id_54E0 thread _id_6D48( var_0 );
        level._id_4877 thread _id_6D48( var_1 );
    }

    common_scripts\utility::flag_set( "multiple_guards_dialogue" );
    thread _id_6D60( 20, "inf_ramp_guys_dead" );
    wait 2;
    var_2 = getentarray( "inf_encounter_4", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6D5D );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6D49 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\warlord_stealth::_id_6BE6, "london_dock_soldier_walk" );
    maps\_utility::_id_272B( var_2 );
}

_id_6D59()
{
    level endon( "inf_stealth_spotted" );
    thread _id_6D60( 20, "inf_talkers_dead" );
    var_0 = getentarray( "inf_patrol", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\warlord_stealth::_id_6BE6, "london_dock_soldier_walk" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D49 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D5D );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F, 1 );
}

_id_6D5A()
{
    level endon( "inf_stealth_spotted" );
    thread _id_6D60( 30, "tower_patrols_dead" );
    var_0 = [];
    var_0[var_0.size] = getent( "inf_tower_patrol_1", "targetname" );
    var_0[var_0.size] = getent( "inf_tower_patrol_2", "targetname" );
    var_0[var_0.size] = getent( "inf_tower_patrol_3", "targetname" );
    var_0[0] maps\_utility::add_spawn_function( maps\warlord_stealth::_id_6BE6 );
    var_0[0] maps\_utility::add_spawn_function( ::_id_6D49 );
    var_0[1] maps\_utility::add_spawn_function( maps\warlord_stealth::_id_6BE6 );
    var_0[1] maps\_utility::add_spawn_function( ::_id_6D49 );
    var_0[2] maps\_utility::add_spawn_function( maps\warlord_stealth::_id_6BE6, "london_dock_soldier_walk" );
    var_0[2] maps\_utility::add_spawn_function( ::_id_6D49 );
    var_0[2] maps\_utility::add_spawn_function( ::_id_6D62 );
    var_1 = maps\_utility::_id_272B( var_0 );

    foreach ( var_3 in var_1 )
        var_3._id_0F25 = 1;
}

_id_6D5B()
{
    common_scripts\utility::flag_wait( "inf_factory_breach" );
    level._id_54E0 maps\_utility::delaythread( 1, maps\_utility::_id_2712 );
    level._id_4877 maps\_utility::delaythread( 1, maps\_utility::_id_2712 );
    var_0 = [];
    var_0[0] = level._id_4877;
    var_0[1] = level._id_54E0;
    var_1 = common_scripts\utility::getstruct( "org_factory_breach", "targetname" );
    var_1 maps\_anim::_id_122A( var_0, "factory_breach" );

    while ( !var_1 maps\warlord_utility::_id_6BA9( var_0, "factory_breach" ) )
        var_1 maps\_anim::_id_122A( var_0, "factory_breach" );

    var_1 maps\_anim::_id_11DD( var_0, "factory_breach" );
    common_scripts\utility::flag_set( "breaching_factory_dialogue" );
    level._id_4877 maps\_utility::_id_2688();
    level._id_54E0 maps\_utility::_id_2688();
    maps\_utility::_id_26BF( "trig_allies_post_factory_breach" );
    level._id_54E0 maps\_utility::_id_2713();
    level._id_4877 maps\_utility::_id_2713();
    common_scripts\utility::flag_wait( "breaching_factory_dialogue_done" );
    maps\_utility::_id_26BF( "trig_inf_allies_end" );
    common_scripts\utility::flag_set( "inf_factory_breach_done" );

    if ( common_scripts\utility::flag( "inf_stealth_spotted" ) )
        maps\_utility::_id_26BF( "trig_price_to_advance" );
    else
        thread _id_6D5C();
}

_id_6D5C()
{
    level._id_4877 waittill( "goal" );
    level._id_4877 endon( "goal_changed" );
    wait 5;
    maps\_utility::_id_26BF( "trig_price_to_advance" );
}

_id_6D5D()
{
    self endon( "death" );
    wait 0.05;
    self.alertlevel = "alert";
    self._id_0FC6 = 0.6;
    self.health = 1;
    self._id_0F25 = 1;
}

_id_6D5E()
{
    common_scripts\utility::flag_wait( "inf_end_guys_aggro" );
    var_0 = getentarray( "inf_end_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D5F );
    maps\_utility::_id_272B( var_0 );
}

_id_6D5F()
{
    self endon( "death" );
    self.health = 1;
}

_id_6D60( var_0, var_1 )
{
    level endon( "inf_stealth_spotted" );
    level endon( var_1 );

    if ( common_scripts\utility::flag( var_1 ) )
        return;

    if ( isdefined( var_0 ) )
        wait(var_0);

    thread _id_6D61( var_1 );
}

_id_6D61( var_0 )
{
    level endon( "inf_stealth_spotted" );
    level._id_4877 maps\warlord_utility::_id_6BA7( "ignoreme" );
    level._id_54E0 maps\warlord_utility::_id_6BA7( "ignoreme" );
    maps\warlord_stealth::_id_6BD1();
    level notify( "end_tower_stealth_settings" );
    common_scripts\utility::flag_wait( var_0 );
    level._id_4877 maps\warlord_utility::_id_6BA5( "ignoreme" );
    level._id_54E0 maps\warlord_utility::_id_6BA5( "ignoreme" );
    thread _id_6D1C( 5 );
}

_id_6D62()
{
    self endon( "death" );
    wait 0.05;
    self._id_0FC6 = 0.2;
    self.health = 1;
}

_id_6D63()
{
    common_scripts\utility::flag_wait( "advance_player_at_combat" );
    level._id_6D24 thread _id_6D64();

    if ( isdefined( level._id_6D4A ) )
        maps\_utility::_id_2756( level._id_6D4A, 1024 );
}

_id_6D64()
{
    foreach ( var_1 in self )
    {
        if ( isdefined( var_1 ) && isalive( var_1 ) )
            var_1 delete();
    }
}

_id_6D65()
{
    common_scripts\utility::flag_wait( "show_switch_hint" );
    maps\_utility::_id_1F61( "switch_hint" );
}

_id_6D66()
{
    common_scripts\utility::flag_wait( "infiltration_over" );
    level._id_54E0 thread maps\warlord_utility::_id_6BAC( "ak47_reflex", "primary" );
    level._id_4877 thread maps\warlord_utility::_id_6BAC( "ak47_reflex", "primary" );

    if ( common_scripts\utility::flag( "inf_stealth_spotted" ) )
    {
        common_scripts\utility::flag_wait_any( "inf_factory_breach_done", "start_spotted_advance_flag" );
        common_scripts\utility::flag_set( "obj_move_through_shanty_given" );
        common_scripts\utility::flag_wait( "start_spotted_advance_flag" );
    }
    else
    {
        common_scripts\utility::flag_set( "obj_move_through_shanty_given" );
        maps\_utility::_id_1425( "advance_through_shanty" );
        thread _id_6D67();
        common_scripts\utility::flag_wait( "start_stealth_advance_flag" );
    }

    common_scripts\utility::flag_set( "warlord_advance" );
}

_id_6D67()
{
    var_0 = common_scripts\utility::getstruct( "org_soap_dive_over_cover", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_54E0, "dive_over_cover" );
    var_0 maps\_anim::_id_11CF( level._id_54E0, "dive_over_cover" );
    level._id_54E0 maps\_utility::_id_1237( level._id_54E0.origin );
}

_id_6D68()
{
    var_0 = level.player getcurrentweapon();

    if ( var_0 != "m14ebr_scoped_silenced_warlord" )
        return 1;

    return 0;
}

_id_6D69()
{
    var_0 = getent( "soap_runs_for_cover_trigger", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 waittill( "trigger" );
    var_1 = getent( "advance_first_shooter", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F( 1 );

    if ( !isdefined( var_2 ) || common_scripts\utility::flag( "inf_stealth_spotted" ) )
        return;

    thread _id_6D6A( var_2 );
    var_2.ignoreme = 1;
    var_2.goalradius = 8;
    var_2 maps\_utility::_id_1237( var_2.origin );
    var_2 setlookatentity( level._id_54E0 );
    var_2.favoriteenemy = level._id_54E0;
    var_2._id_0F9F = 1;
    var_2.alertlevel = "combat";
    thread _id_6D6D( var_2 );
    var_2 endon( "death" );
    wait 0.2;
    var_2 _id_6D6C( level._id_54E0, 1.4, 20, 30, -20, 20, 1, 2, 1 );
    wait 0.3;
    var_2 _id_6D6C( level._id_54E0, 1.4, 20, 30, -35, -10, 1, 2, 0 );
    var_2 setlookatentity();
    var_2.ignoreme = 0;
    var_2.favoriteenemy = undefined;
    var_2._id_0F9F = undefined;
    var_2.goalradius = 2048;
    wait 1;
    level notify( "advance_intro_over" );
}

_id_6D6A( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "org_soap_dive_over_cover", "targetname" );

    if ( isalive( var_0 ) )
    {
        thread _id_6D6B( var_0, level._id_54E0 );
        var_1 maps\_anim::_id_1246( level._id_54E0, "dive_over_cover" );
        level._id_54E0 thread maps\_anim::_id_124E( level._id_54E0, "CornerCrL_alert_idle", "stop_loop" );
        level._id_54E0 maps\_utility::_id_2688();
        wait 0.5;
        level._id_54E0 notify( "stop_loop" );
    }
}

_id_6D6B( var_0, var_1 )
{
    var_2 = anglestoforward( var_1.angles );
    var_3 = anglestoright( var_1.angles );
    var_4 = common_scripts\utility::getstruct( "soap_dive_explosion", "targetname" );
    magicgrenademanual( "fraggrenade", var_4.origin, ( 0.0, 0.0, 0.0 ), 1.1 );
}

_id_6D6C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "death" );
    var_9 = var_0 geteye();

    while ( var_1 > 0 )
    {
        if ( var_8 )
            var_9 = var_0 geteye();

        var_10 = anglestoright( var_0.angles );
        var_11 = randomfloatrange( var_2, var_3 );

        if ( common_scripts\utility::cointoss() )
            var_11 *= -1;

        var_12 = var_9 + var_10 * var_11;
        var_12 = ( var_12[0], var_12[1], var_12[2] + randomfloatrange( var_4, var_5 ) );
        self shoot( 100, var_12 );
        var_13 = 0.05 * randomintrange( var_6, var_7 );

        if ( var_13 >= var_1 )
        {
            wait(var_1);
            var_1 = 0;
            continue;
        }

        wait(var_13);
        var_1 -= var_13;
    }
}

_id_6D6D( var_0 )
{
    level._id_4877.grenadeawareness = 0;
    level._id_54E0.grenadeawareness = 0;
    level._id_54E0.ignoreall = 1;
    level._id_54E0 maps\_utility::_id_2714();
    _id_6D6E( var_0 );
    level._id_4877.grenadeawareness = 0.9;
    level._id_54E0.grenadeawareness = 0.9;
    level._id_54E0.ignoreall = 0;
    level._id_54E0 maps\_utility::_id_2715();
    level._id_54E0.grenadeawareness = 0.9;
}

_id_6D6E( var_0 )
{
    var_0 endon( "death" );
    level waittill( "advance_intro_over" );
}

_id_6D6F()
{
    common_scripts\utility::flag_wait( "start_stealth_advance_flag" );
    thread _id_6D70();
    common_scripts\utility::flag_wait( "advance_player_at_combat" );
    thread _id_6D72();
    thread _id_6D73();
    level._id_54E0.goalradius = 2048;
    common_scripts\utility::flag_set( "obj_go_loud_given" );
    common_scripts\utility::flag_set( "go_noisy_dialogue" );
    common_scripts\utility::flag_wait( "inf_factory_breach_done" );
    common_scripts\utility::flag_wait( "advance_combat_complete" );
    wait 0.05;
    maps\_utility::_id_26BF( "trig_advance_combat_complete" );
}

_id_6D70()
{
    var_0 = getentarray( "advance_guys_forward", "targetname" );
    common_scripts\utility::flag_set( "push_forward_dialogue" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_6D71();
}

_id_6D71()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = getentarray( "advance_first_wave", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( isalive( var_3 ) )
        {
            var_3 maps\_utility::_id_1237( var_0.origin );
            var_3 maps\_utility::_id_2724( var_0.radius );
        }
    }
}

_id_6D72()
{
    common_scripts\utility::flag_wait( "advance_combat_complete" );
    common_scripts\utility::flag_set( "advance_go_loud_complete" );
    common_scripts\utility::flag_set( "obj_follow_price_advance_given" );
}

_id_6D73()
{
    common_scripts\utility::flag_wait_any( "advance_combat_complete", "advance_done" );
    maps\_audio::aud_send_msg( "mus_to_technical" );
}

_id_6D74()
{
    level endon( "stop_monitoring_advance_skip" );
    thread _id_6D76();
    var_0 = getent( "trig_at_technical_combat", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level.player )
        {
            common_scripts\utility::flag_set( "advance_done" );
            continue;
        }

        var_1._id_6D75 = 1;
    }
}

_id_6D76()
{
    common_scripts\utility::flag_wait( "player_technical_drivein" );
    common_scripts\utility::flag_wait( "inf_factory_breach_done" );

    if ( !isdefined( level._id_4877._id_6D75 ) || !isdefined( level._id_54E0._id_6D75 ) )
    {
        if ( !isdefined( level._id_4877._id_6D75 ) )
        {
            level._id_4877 maps\warlord_utility::_id_6B8D( "price_teleport_safeguard" );
            level._id_4877._id_6D75 = 1;
        }

        if ( !isdefined( level._id_54E0._id_6D75 ) )
        {
            level._id_54E0 maps\warlord_utility::_id_6B8D( "soap_teleport_safeguard" );
            level._id_54E0._id_6D75 = 1;
        }

        common_scripts\utility::flag_set( "advance_combat_complete" );
        waittillframeend;
        maps\_utility::_id_26BF( "trig_technical_combat" );
    }

    level notify( "stop_monitoring_advance_skip" );
}

_id_6D77()
{
    common_scripts\utility::flag_init( "technical_reached_end_node" );
    common_scripts\utility::flag_wait( "player_technical_spawn" );
    level._id_6D78 = getaiarray( "axis" );
    level._id_6D79 = maps\_vehicle::_id_2A99( "player_technical" );
    level._id_6D79 setcandamage( 0 );
    level._id_6D79._id_2955 = 1;
    level._id_6D79 thread _id_6D7C( 1 );
    level._id_6D79 thread _id_6D7D( 1 );
    thread _id_6D7E();
    wait 0.5;
    common_scripts\utility::flag_wait( "player_technical_drivein" );
    maps\_audio::aud_send_msg( "player_technical", level._id_6D79 );
    level._id_6D79 thread maps\_vehicle::_id_1FA6();
    level._id_6D79 thread _id_6D7C( 0 );
    level._id_6D79 thread _id_6C72();
    level._id_6D79 thread _id_6D7D( 0 );
    common_scripts\utility::flag_set( "technical_ahead_dialogue" );
    level._id_6D79 thread _id_6D80();
    var_0 = getent( "technical_target", "targetname" );
    level._id_6BF1 = level._id_6D79.mgturret[0];
    level._id_6BF1 setmode( "manual" );
    level._id_6BF1 settargetentity( var_0 );
    level._id_6BF1 thread _id_6DB5();

    foreach ( var_2 in level._id_6D79._id_0A39 )
    {
        if ( var_2._id_2252 == 0 )
        {
            level._id_6D79._id_252B = var_2;
            level._id_6D79._id_252B thread _id_6DAF();
            continue;
        }

        if ( var_2._id_2252 == 1 )
            var_2 thread _id_6DB1( level._id_6D79, level._id_6BF1 );
    }
}

_id_6D7A()
{
    level endon( "warlord_player_mortar" );
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "technical_kill_player" );
    var_0 = level.player getplayerangles();
    var_1 = ( 0, var_0[1], 0 );
    var_2 = vectornormalize( anglestoforward( var_1 ) );
    var_3 = randomintrange( 24, 60 );
    var_4 = var_2 * var_3;
    var_5 = vectornormalize( anglestoright( var_0 ) );
    var_6 = randomintrange( -36, 36 );
    var_7 = var_5 * var_6;
    var_8 = ( level.player.origin[0], level.player.origin[1], level.player.origin[2] + 240 );
    var_8 = var_8 + var_4 + var_7;
    var_9 = ( level.player.origin[0], level.player.origin[1], level.player.origin[2] - 120 );
    var_9 = var_9 + var_4 + var_7;
    var_10 = bullettrace( var_8, var_9, 0, undefined );

    if ( var_10["fraction"] < 1 )
    {
        var_11 = var_10["position"];
        var_12 = var_10;
        maps\_weapon_mortar60mm::_id_6C48( var_11, 240, 512, 512, var_12 );
    }

    wait 0.05;

    if ( isalive( level.player ) )
        level.player kill();
}

_id_6D7C( var_0 )
{
    if ( var_0 )
    {
        foreach ( var_2 in self._id_0A39 )
        {
            var_2.ignoreall = 1;
            var_2.ignoreme = 1;
        }
    }
    else
    {
        foreach ( var_2 in self._id_0A39 )
        {
            var_2.ignoreall = 0;

            if ( var_2._id_2252 == 0 )
                var_2.ignoreme = 0;
        }
    }
}

_id_6D7D( var_0 )
{
    if ( var_0 )
    {
        foreach ( var_2 in self._id_0A39 )
            var_2 maps\_utility::_id_0D04();
    }
    else
    {
        foreach ( var_2 in self._id_0A39 )
        {
            if ( isdefined( var_2._id_0D04 ) )
                var_2 maps\_utility::_id_1902();
        }
    }
}

_id_6D7E()
{
    var_0 = getentarray( "tech_arena_enemies_intro", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D7F );
    maps\_utility::_id_272B( var_0 );
}

_id_6D7F()
{
    self._id_20AF = 0.05;
}

_id_6D80()
{
    self endon( "death" );
    self waittill( "reached_end_node" );
    common_scripts\utility::flag_set( "technical_reached_end_node" );
}

_id_6D81()
{
    self endon( "death" );
    level endon( "technical_combat_complete" );
    common_scripts\utility::flag_wait( "turret_ready_to_use" );
    common_scripts\utility::flag_wait( "inf_factory_breach_done" );
    common_scripts\utility::flag_wait( "trig_technical_rear" );
    common_scripts\utility::flag_wait( "player_on_technical" );
    wait 1.0;
    thread _id_6D82();
}

_id_6D82()
{
    level._id_6D79 maps\_anim::_id_124A( self, "technical_driver_pull_out", "tag_body" );
    maps\_utility::_id_2686();

    if ( common_scripts\utility::flag( "mortar_technical" ) )
        return;

    common_scripts\utility::flag_wait( "technical_reached_end_node" );

    if ( isalive( level._id_6D79._id_252B ) )
        level._id_6D79._id_252B thread _id_6DB0();

    var_0 = [];
    var_0[0] = self;
    var_0[1] = level._id_6D83;
    level._id_6D79 maps\_anim::_id_11DD( var_0, "technical_driver_pull_out", "tag_body" );
    level._id_6D79 thread maps\_anim::_id_124E( self, "technical_driver_pull_out_idle", "end_driver_idle", "tag_body" );
    common_scripts\utility::flag_wait( "mortar_technical" );
    level._id_6D79 notify( "end_driver_idle" );
}

_id_6D84( var_0 )
{
    level endon( "technical_combat_complete" );
    wait 3.25;
    var_1 = maps\_vehicle::_id_2881( "tech_arena_technical_1" );
    maps\_audio::aud_send_msg( "arena_technical_01", var_1 );
    var_1 thread _id_6D85( var_0, 1 );
    var_1 thread _id_6D89();
    var_1 thread _id_6C72();
    var_1 thread _id_6D86();
    common_scripts\utility::flag_set( "technical_1_dialogue" );
    common_scripts\utility::flag_wait( "technical_drivein_combat_2_begin" );
    common_scripts\utility::flag_set( "technical_2_dialogue" );
    var_2 = maps\_vehicle::_id_2881( "tech_arena_technical_2" );
    maps\_audio::aud_send_msg( "arena_technical_02", var_2 );
    var_2 thread _id_6D85( var_0, 0 );
    var_2 thread _id_6D89();
    var_2 thread _id_6C72();
    var_2 thread _id_6D86();
}

_id_6D85( var_0, var_1, var_2 )
{
    self endon( "death" );
    self._id_2955 = 1;
    var_3 = undefined;

    foreach ( var_5 in self._id_0A39 )
    {
        var_5 thread _id_6DA5( var_0 );

        if ( var_1 )
            var_5 thread _id_6DA7();

        var_5.grenadeammo = 0;

        if ( var_5._id_2252 == 0 )
            var_5 thread _id_6D87( self );
    }

    self waittill( "reached_dynamic_path_end" );
    self._id_25A9 = 1;
    maps\_vehicle::_id_2514( "passenger_and_driver" );
}

_id_6D86()
{
    common_scripts\utility::flag_wait( "delete_destroyed_technicals" );

    if ( isdefined( self ) )
    {
        self notify( "delete_destructible" );
        self delete();
    }
}

_id_6D87( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_0D04();
    var_0 _id_6D88();
    maps\_utility::_id_1902();
}

_id_6D88()
{
    self endon( "reached_dynamic_path_end" );
    self waittill( "death" );
    wait 2;
}

_id_6D89()
{
    self endon( "reached_dynamic_path_end" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !maps\_vehicle::_id_1C07( var_1 ) && !maps\_vehicle::_id_2A65( var_1 ) )
            break;
    }

    self._id_2940 = "none";
    thread _id_6D8A();
}

_id_6D8A()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_24E6[self.classname].size; var_1++ )
    {
        var_2 = level._id_24E6[self.classname][var_1];
        var_0[var_1] = var_2._id_2598;
        var_2._id_2598 = 2.5;
    }

    common_scripts\utility::waittill_any( "death_finished", "reached_dynamic_path_end" );

    for ( var_1 = 0; var_1 < level._id_24E6[self.classname].size; var_1++ )
        level._id_24E6[self.classname][var_1]._id_2598 = var_0[var_1];
}

_id_6D8B()
{
    level endon( "technical_turret_combat_timer_complete" );
    common_scripts\utility::flag_init( "technical_drivein_combat_2_begin" );
    var_0 = getentarray( "tech_arena_enemies_wave_1", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D8E );
    var_1 = getentarray( "turret_spawners_1", "targetname" );
    var_2 = getentarray( "turret_spawners_2", "targetname" );
    var_3 = getentarray( "turret_spawners_3", "targetname" );
    var_4 = getentarray( "turret_spawners_4", "targetname" );
    var_5 = getentarray( "turret_spawners_5", "targetname" );
    var_6 = 57;
    level._id_6D8C = 0;
    common_scripts\utility::flag_wait( "player_technical_drivein" );

    if ( isdefined( level._id_6D78 ) )
    {
        foreach ( var_8 in level._id_6D78 )
        {
            if ( isdefined( var_8 ) && isalive( var_8 ) )
                var_8 kill();
        }

        level._id_6D78 = undefined;
    }

    thread _id_6D93();
    level thread _id_6D9A( var_0 );
    level._id_54E0 thread _id_6D81();
    common_scripts\utility::flag_wait( "turret_ready_to_use" );
    common_scripts\utility::flag_wait( "player_at_technical_arena" );
    common_scripts\utility::flag_set( "technical_combat_started" );
    thread _id_6DA4( var_6 );
    thread _id_6D8D( var_6 );
    level thread _id_6D84( "mortar_technical_hit" );
    wait 6.0;
    level thread _id_6D9D( var_0 );
    wait 2.0;
    level thread _id_6D9D( var_0 );
    wait 0.5;
    var_10 = common_scripts\utility::array_combine( var_3, var_2 );
    thread _id_6D92( 4, "roof_right_dialogue" );
    thread _id_6D9A( var_10, 15.0, 4 );
    level waittill( "next_combat_wave" );
    thread _id_6D92( 3, "contact_front_1_dialogue" );
    thread _id_6D9A( var_1, 10.0, 3 );
    level waittill( "next_combat_wave" );
    var_11 = common_scripts\utility::array_combine( var_5, var_4 );
    thread _id_6D92( 4, "contact_left_1_dialogue" );
    thread _id_6D9A( var_11, 12.0, 3 );
    thread _id_6D8F();
    level waittill( "next_combat_wave" );
    common_scripts\utility::flag_set( "technical_drivein_combat_2_begin" );
    wait 1.0;
    var_12 = common_scripts\utility::array_combine( var_2, var_1 );
    thread _id_6D92( 5, "contact_front_2_dialogue" );
    thread _id_6D9A( var_12, 15.0, 4 );
    level waittill( "next_combat_wave" );
    thread _id_6D92( 5, "contact_right_1_dialogue" );
    thread _id_6D9A( var_10, 10.0, 2 );
    level waittill( "next_combat_wave" );
    thread _id_6D92( 5, "contact_left_3_dialogue" );
    thread _id_6D9A( var_5, 10.0, 2 );
    level waittill( "next_combat_wave" );
    thread _id_6D92( 5, "contact_left_4_dialogue" );
    thread _id_6D9A( var_4, 10.0, 2 );
    level waittill( "next_combat_wave" );
    thread _id_6D92( 5, "contact_front_3_dialogue" );
    thread _id_6D9A( var_1, 10.0, 2 );
    level waittill( "next_combat_wave" );
    level notify( "technical_stalled_combat_complete" );
}

_id_6D8D( var_0 )
{
    level endon( "technical_combat_complete" );
    common_scripts\utility::flag_wait( "player_on_technical" );
    var_1 = getentarray( "turret_combat_badplace", "targetname" );

    foreach ( var_3 in var_1 )
        badplace_brush( "", var_0, var_3, "bad_guys" );
}

_id_6D8E()
{
    self endon( "death" );
    self.accuracy = 0.06;
}

_id_6D8F()
{
    if ( !common_scripts\utility::flag( "technical_combat_door_open" ) )
    {
        var_0 = getent( "technical_combat_door", "targetname" );
        var_0 rotateyaw( -110, 0.2, 0.1, 0.1 );
        var_0 connectpaths();
        common_scripts\utility::flag_set( "technical_combat_door_open" );
    }
}

_id_6D90()
{
    level endon( "player_on_technical" );
    level endon( "technical_combat_complete" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "trig_player_at_back_of_truck" );
        wait 10;

        if ( common_scripts\utility::flag( "trig_player_at_back_of_truck" ) )
        {
            thread _id_6D91();
            wait 20;
        }
    }
}

_id_6D91()
{
    var_0 = getentarray( "player_behind_truck_guys", "targetname" );
    maps\_utility::_id_272B( var_0 );
}

_id_6D92( var_0, var_1 )
{
    level endon( "technical_combat_complete" );
    level endon( "next_combat_wave" );

    if ( common_scripts\utility::flag( "technical_combat_complete" ) )
        return;

    wait(var_0);
    common_scripts\utility::flag_set( var_1 );
}

_id_6D93()
{
    level endon( "technical_combat_complete" );
    common_scripts\utility::flag_wait( "player_boarding_technical" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( !isalive( var_2 ) )
            continue;

        var_2._id_20AF = 0;
    }

    common_scripts\utility::flag_wait( "player_on_technical" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
        {
            if ( !isalive( var_2 ) )
                continue;

            if ( !var_2 maps\_utility::_id_133C( "can_lower_accuracy" ) )
            {
                var_2 maps\_utility::_id_1402( "can_lower_accuracy" );
                var_2 thread _id_6D94();
            }

            if ( !var_2 maps\_utility::_id_1008( "can_lower_accuracy" ) )
            {
                var_2._id_20AF = 0.2;
                continue;
            }

            var_5 = level.player getplayerangles();

            if ( maps\_utility::_id_26AB( level.player.origin, var_5, var_2.origin, cos( 60 ) ) )
                var_2._id_20AF = 0.2;
            else
                var_2._id_20AF = 0;

            wait 0.02;
        }

        wait 0.05;
    }
}

_id_6D94()
{
    self endon( "death" );
    maps\_utility::_id_13DC( "can_lower_accuracy" );
    wait 8;
    maps\_utility::_id_13DE( "can_lower_accuracy" );
}

_id_6D95()
{
    level.player endon( "death" );
    level common_scripts\utility::waittill_any( "technical_turret_combat_timer_complete", "technical_stalled_combat_complete" );
    common_scripts\utility::flag_set( "technical_combat_complete" );
    common_scripts\utility::flag_waitopen( "player_boarding_technical" );
    thread _id_6D96();

    if ( common_scripts\utility::flag( "player_on_technical" ) )
    {
        thread maps\warlord_fx::_id_5517();
        wait 1.3;
        level thread _id_6DB2( level._id_6D79 );
        thread _id_6D99();
    }
    else
    {
        var_0 = level._id_6D79 maps\_vehicle::_id_2514();

        if ( isdefined( var_0[0] ) )
            var_0[0] waittill( "jumpedout" );

        wait 0.05;
        thread _id_6DB6();
        level.player enabledeathshield( 1 );
        level._id_6D79 setcandamage( 1 );
        thread maps\_weapon_mortar60mm::_id_6C49( level._id_6D79.origin, 1, 150, 256, 3100, 3100 );
        common_scripts\utility::flag_set( "obj_commandeer_technical_done" );
        wait 1.0;
        level._id_4877 thread _id_6D98();
        level._id_54E0 thread _id_6D98();
        common_scripts\utility::flag_set( "mortar_technical" );
        common_scripts\utility::flag_set( "mortar_technical_hit" );
        level notify( "turret_finished" );
        var_1 = getentarray( "mortar_rubble", "targetname" );

        foreach ( var_3 in var_1 )
            var_3 show();

        var_5 = getentarray( "technical_blocker_graph", "targetname" );

        foreach ( var_7 in var_5 )
            var_7 connectpaths();

        var_9 = getent( "shanty_45_blocker_trigger", "targetname" );

        if ( isdefined( var_9 ) )
            var_9 notify( "trigger" );

        maps\_utility::_id_26BF( "trig_price_mortar_01" );
        maps\_utility::_id_26BF( "trig_soap_mortar_start" );
        wait 5;
        level.player enabledeathshield( 0 );
    }
}

_id_6D96()
{
    common_scripts\utility::flag_wait( "mortar_technical_hit" );

    if ( common_scripts\utility::flag( "player_on_technical" ) )
    {
        foreach ( var_1 in level._id_6D97 )
        {
            if ( isalive( var_1 ) )
                var_1 delete();
        }
    }
    else
    {
        var_3 = [];

        foreach ( var_1 in level._id_6D97 )
        {
            if ( isalive( var_1 ) )
            {
                var_1.goalradius = 8;
                var_1 maps\_utility::_id_1237( var_1.origin );
                var_3[var_3.size] = var_1;
            }
        }

        maps\_utility::_id_2756( var_3, 512 );
    }
}

_id_6D98()
{
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "delete_technical_arena_guys" );
    self.ignoreall = 0;
}

_id_6D99()
{
    var_0 = common_scripts\utility::getstruct( "mortar_explosion_technical_1", "targetname" );
    common_scripts\utility::flag_wait( "mortar_technical_hit" );
    maps\_audio::aud_send_msg( "mus_mortar_inbound" );
    thread maps\warlord_fx::_id_550E();
    wait 4.3;
    thread maps\_weapon_mortar60mm::_id_6C49( var_0.origin, 1, 150, 256, 100, 25 );
}

_id_6D9A( var_0, var_1, var_2 )
{
    level endon( "next_combat_wave" );
    level endon( "technical_combat_complete" );
    level notify( "reset_death_counter" );
    level._id_6D9B = 0;
    level._id_6D9C = 0;

    if ( isdefined( var_1 ) )
        level thread _id_6DA3( var_1 );

    if ( isdefined( var_0 ) )
        _id_6D9D( var_0 );

    if ( isdefined( var_2 ) )
    {
        while ( level._id_6D9B > var_2 )
            level waittill( "wave_guy_removed" );

        level notify( "next_combat_wave" );
    }
}

_id_6D9D( var_0 )
{
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6D9F );
    level._id_6D9C = var_0.size;

    foreach ( var_2 in var_0 )
    {
        while ( level._id_6D8C > 12 )
            level waittill( "foot_guy_removed" );

        level._id_6D8C++;
        var_2 thread _id_6D9E();
    }

    while ( level._id_6D9C > 0 )
        level waittill( "wave_spawner_done" );
}

_id_6D9E()
{
    level endon( "next_combat_wave" );
    maps\_utility::_id_166F();
    level._id_6D9C--;
    level notify( "wave_spawner_done" );
}

_id_6D9F()
{
    self endon( "death" );

    if ( !isdefined( level._id_6D97 ) )
        level._id_6D97 = [];

    level._id_6D97[level._id_6D97.size] = self;
    self.grenadeammo = 0;
    self.goalradius = 8;
    self._id_0D45 = ::_id_6DA2;
    thread _id_6DA0();
    thread _id_6DA1();
}

_id_6DA0()
{
    level endon( "reset_death_counter" );
    level._id_6D9B++;
    self waittill( "death" );
    level._id_6D9B--;
    level notify( "wave_guy_removed" );
}

_id_6DA1()
{
    self waittill( "death" );
    level._id_6D8C--;
    level notify( "foot_guy_removed" );
}

_id_6DA2()
{
    if ( self.damageweapon == "none" && self.damagetaken > 100 )
    {
        var_0 = animscripts\death::_id_0ED9();

        if ( isdefined( var_0 ) )
            self._id_0D50 = var_0;
    }

    return 0;
}

_id_6DA3( var_0 )
{
    level endon( "technical_combat_complete" );
    level endon( "next_combat_wave" );
    wait(var_0);
    level notify( "next_combat_wave" );
}

_id_6DA4( var_0 )
{
    level endon( "technical_stalled_combat_complete" );
    wait(var_0);
    level notify( "technical_turret_combat_timer_complete" );
}

_id_6DA5( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 );

    if ( isalive( self ) )
        self delete();
}

_id_6DA6( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    badplace_delete( self );
}

_id_6DA7()
{
    self endon( "death" );
    self._id_0FC6 = 0.5;
    common_scripts\utility::flag_wait_or_timeout( "player_on_technical", 10 );
    self._id_0FC6 = 1;
}
#using_animtree("vehicles");

_id_6DA8( var_0 )
{
    level endon( "technical_combat_complete" );
    var_1 = self gettagorigin( "tag_gunner" );
    var_0 makeunusable();
    var_2 = spawn( "script_origin", var_1 );
    var_2 sethintstring( &"PLATFORM_HOLD_TO_USE" );
    var_2 makeusable();
    var_3 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_3 hide();
    var_4 = [];
    var_4["player_rig"] = var_3;
    var_4["turret"] = var_0;
    var_4["gunner"] = level._id_6DA9;
    thread _id_6DAB( var_2, var_3, level._id_6DA9 );
    var_0 clearanim( %root, 0 );
    level._id_6DA9 unlink();
    maps\_anim::_id_11BF( var_4, "get_on_technical", "tag_body" );
    var_2 waittill( "trigger" );
    var_2 delete();
    thread _id_6DAA( var_3, var_0 );
}

_id_6DAA( var_0, var_1 )
{
    var_2 = [];
    var_2["player_rig"] = var_0;
    var_2["turret"] = var_1;
    var_2["gunner"] = level._id_6DA9;
    common_scripts\utility::flag_set( "player_boarding_technical" );
    maps\_audio::aud_send_msg( "player_using_tech_turret" );
    level.player._id_1005 = level.player getcurrentweapon();
    level.player disableweapons();
    level.player maps\_utility::_id_0A23( 1 );
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    thread maps\_utility::_id_273C( 2, 55 );
    level.player playerlinktoblend( var_0, "tag_player", 0.4, 0.2, 0.2 );
    wait 0.2;
    var_0 common_scripts\utility::delaycall( 0.2, ::show );
    maps\_anim::_id_11DD( var_2, "get_on_technical", "tag_body" );
    var_0 delete();
    level._id_6DA9 delete();
    var_1 clearanim( %root, 0 );
    thread _id_6DAD( var_1 );
    level._id_1B22 = 1;
    level.player thread _id_6DAC();
    level.player maps\_utility::_id_0A23( 0 );
    common_scripts\utility::flag_set( "player_on_technical" );
    maps\_audio::aud_send_msg( "mus_player_on_technical" );
    common_scripts\utility::flag_set( "obj_commandeer_technical_done" );
    common_scripts\utility::flag_clear( "player_boarding_technical" );
}

_id_6DAB( var_0, var_1, var_2 )
{
    var_0 endon( "trigger" );
    common_scripts\utility::flag_wait( "technical_combat_complete" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    if ( isdefined( var_1 ) )
        var_1 delete();

    wait 1;

    if ( isdefined( level._id_6DA9 ) )
        level._id_6DA9 delete();
}

_id_6DAC()
{
    level endon( "mortar_technical_hit" );

    for (;;)
    {
        var_0 = self playerads();

        if ( var_0 == 0 )
            maps\_art::_id_1B2A();
        else
            maps\_art::_id_1B26( var_0, 1, 50, 500, 500, 4.5, 1.8 );

        wait 0.05;
    }
}

_id_6DAD( var_0 )
{
    level endon( "mortar_technical_hit" );
    level.player enableweapons();
    level.player playerlinktodelta( self, "tag_gunner", 1, 180, 180, 180, 25 );
    var_0 makeusable();
    var_0 setmode( "manual" );
    var_0 useby( level.player );
    level.player disableturretdismount();
    var_0 makeunusable();
    var_0 attach( level._id_1F90["player_rig"], "tag_player" );
    level.player thread _id_6DAE( var_0 );
    var_1 = 0;
    var_2 = 0;
    var_3 = var_0 maps\_utility::_id_1281( "technical_turret_hands_idle" );
    var_4 = var_0 maps\_utility::_id_1281( "technical_turret_gun_idle" );
    var_0 setanim( var_3, 1, 0, 1 );
    var_0 setanim( var_4, 1, 0, 1 );
    var_0._id_4589 = var_3;
    var_0._id_458A = var_4;

    while ( isdefined( var_0 ) )
    {
        var_1 = level.player attackbuttonpressed();

        if ( var_2 != var_1 )
        {
            if ( var_1 )
                var_0 thread maps\warlord_anim::_id_6B66( "technical_turret_hands_idle2fire", "technical_turret_hands_fire", "technical_turret_gun_idle2fire", "technical_turret_gun_fire" );
            else
                var_0 thread maps\warlord_anim::_id_6B66( "technical_turret_hands_fire2idle", "technical_turret_hands_idle", "technical_turret_gun_fire2idle", "technical_turret_gun_idle" );
        }

        var_2 = var_1;
        wait 0.05;
    }
}

_id_6DAE( var_0 )
{
    level endon( "mortar_technical" );

    if ( isalive( self ) )
    {
        self waittill( "death" );
        var_0 detach( level._id_1F90["player_rig"], "tag_player" );
    }
}

_id_6DAF()
{
    maps\_utility::_id_0D04();
    common_scripts\utility::flag_wait( "technical_reached_end_node" );
    maps\_utility::_id_1902();
    maps\warlord_utility::_id_441E();
    thread _id_6DB0();
}

_id_6DB0()
{
    maps\_utility::_id_24F5();
    level._id_6D83 = maps\_vehicle_aianim::_id_25C1( self );
    level._id_6D83._id_1032 = "generic";
    level._id_6D79 maps\_anim::_id_11CF( level._id_6D83, "technical_driver_pull_out", "tag_body" );
    common_scripts\utility::flag_wait( "mortar_technical_hit" );
    wait 1;

    if ( isdefined( level._id_6D83 ) )
        level._id_6D83 delete();
}

_id_6DB1( var_0, var_1 )
{
    self.health = 5000;
    self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

    if ( isdefined( var_5 ) && isdefined( var_6 ) )
    {
        if ( var_6 == "MOD_PISTOL_BULLET" || var_6 == "MOD_RIFLE_BULLET" || var_6 == "MOD_EXPLOSIVE_BULLET" )
            playfx( common_scripts\utility::getfx( "headshot" ), var_5 );
    }

    common_scripts\utility::flag_set( "technical_gunner_dead" );
    maps\_utility::_id_24F5();
    level._id_6DA9 = maps\_vehicle_aianim::_id_25C1( self );
    level._id_6DA9 linkto( var_0, "tag_gunner" );
    level._id_6DA9._id_1032 = "generic";
    var_1._id_1032 = "turret";
    var_1 maps\_utility::_id_2629();
    var_7 = [];
    var_7[0] = level._id_6DA9;
    var_7[1] = var_1;
    var_0 maps\_anim::_id_11DD( var_7, "technical_gunner_death", "tag_50cal" );
    var_1 turretfireenable();
    common_scripts\utility::flag_set( "turret_ready_to_use" );
}

_id_6DB2( var_0 )
{
    level.player endon( "death" );
    common_scripts\utility::flag_set( "mortar_technical" );
    var_0 thread _id_6DB4();
    maps\_audio::aud_send_msg( "tech_mortar_incoming" );
    level.player enabledeathshield( 1 );
    var_1 = common_scripts\utility::getstruct( "mortar_explosion_technical", "targetname" );
    thread maps\_weapon_mortar60mm::_id_6C49( var_1.origin, 1.5, 150, 400, 300, 300 );
    wait 1.5;
    common_scripts\utility::flag_set( "mortar_technical_hit" );
    thread maps\warlord_utility::_id_01F2();
    level.player dodamage( 300, var_1.origin );
    var_2 = getentarray( "mortar_rubble", "targetname" );

    foreach ( var_4 in var_2 )
        var_4 show();

    var_6 = getentarray( "technical_blocker_graph", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 connectpaths();

    var_10 = getent( "shanty_45_blocker_trigger", "targetname" );

    if ( isdefined( var_10 ) )
        var_10 notify( "trigger" );

    level.player disableweapons();
    level._id_6BF1 useby( level.player );
    level._id_6BF1 detach( level._id_1F90["player_rig"], "tag_player" );
    level._id_6BF1 delete();
    level.player unlink();
    level._id_1B22 = 0;
    thread maps\_utility::_id_273C( 2, 65 );
    maps\_audio::aud_send_msg( "player_turret_destroyed" );
    level._id_6D79 delete();
    var_11 = maps\_utility::_id_1287( "technical_model" );
    var_11._id_1032 = "technical_model";
    var_12 = maps\_utility::_id_1287( "turret_model" );
    var_12._id_1032 = "turret_model";
    var_13 = getent( "price_technical_teleport", "targetname" );
    level._id_4877 maps\_utility::_id_279F( var_13 );
    maps\_utility::_id_26BF( "trig_price_mortar_start" );
    var_14 = common_scripts\utility::getstruct( "anim_knock_off_technical_node", "targetname" );
    var_15 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_15 hide();
    var_16 = [];
    var_16["player_rig"] = var_15;
    var_16["technical"] = var_11;
    var_16["turret"] = var_12;
    var_16["soap"] = level._id_54E0;
    var_14 maps\_anim::_id_11BF( var_16, "knock_off_technical" );
    var_17 = getent( "technical_ground", "targetname" );
    var_17 show();
    common_scripts\utility::flag_set( "move_anim_technical_clip" );
    level.player playerlinktoblend( var_15, "tag_player", 0.4, 0.2, 0.2 );
    var_15 show();
    maps\_utility::delaythread( 6, ::_id_6DB6 );
    level._id_54E0 thread maps\_shg_common::_id_16E9( "knock_off_technical_lines" );
    var_14 maps\_anim::_id_11DD( var_16, "knock_off_technical" );
    var_15 delete();
    level.player unlink();
    var_17 hide();
    level.player enabledeathshield( 0 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player maps\warlord_utility::_id_6B9D( "m14ebr_scoped_silenced_warlord", level.player._id_1005 );
    level.player enableweapons();
    maps\_utility::_id_26BF( "trig_soap_mortar_start" );
    maps\_utility::_id_26BF( "trig_price_mortar_01" );
    wait 0.05;
    level._id_54E0.a._id_0D2B = "run";
    level._id_54E0 stopanimscripted();
    level notify( "turret_finished" );
}

_id_6DB3()
{
    level endon( "warlord_mortar_run" );
    var_0 = getent( "anim_technical_blocker", "targetname" );
    var_1 = var_0.origin;
    var_0.origin = ( 0.0, 0.0, 0.0 );
    common_scripts\utility::flag_wait( "move_anim_technical_clip" );
    var_0.origin = var_1;
    var_0 disconnectpaths();
}

_id_6DB4()
{
    maps\_anim::_id_1246( level._id_54E0, "technical_driver_dive_out", "tag_body" );
    level._id_54E0 maps\_utility::_id_1237( level._id_54E0.origin );
    level._id_54E0 animscripts\weaponlist::_id_0CD0();
    level._id_54E0.a._id_114D = 0;
}

_id_6DB5()
{
    level._id_6BF1 setaispread( 8 );
    var_0 = randomfloatrange( 4, 5 );
    wait(var_0);

    while ( !common_scripts\utility::flag( "technical_gunner_dead" ) )
    {
        level._id_6BF1 setaispread( 5 );
        var_0 = randomfloatrange( 1.5, 2 );
        wait(var_0);
        level._id_6BF1 setaispread( 8 );
        var_0 = randomfloatrange( 2, 3 );
        wait(var_0);
    }
}

_id_6DB6()
{
    var_0 = getentarray( "militia_mob_guys", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6DB7 );
    maps\_utility::_id_272B( var_0, 1 );
}

_id_6DB7()
{
    self endon( "death" );
    self._id_20AF = 0.01;
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "militia_vo_done" );
    self.ignoreall = 0;
    maps\_utility::_id_262C( "trig_soap_melee_kill" );

    if ( isdefined( self ) && isalive( self ) )
        self delete();
}

_id_6DB8()
{
    maps\_utility::_id_262C( "trig_soap_melee_kill" );

    foreach ( var_1 in self._id_0A39 )
    {
        if ( isdefined( var_1 ) && isalive( var_1 ) )
            var_1 delete();
    }

    self delete();
}

_id_6DB9()
{
    maps\_utility::_id_251F();
    maps\_utility::_id_2712();
    maps\_utility::_id_109E();
}

_id_6DBA()
{
    var_0 = getentarray( "mortar_badguys", "script_noteworthy" );
    maps\_utility::_id_27C9( var_0, ::_id_6DC3 );
    level._id_4877._id_0FC6 = 1.05;
    level._id_54E0._id_0FC6 = 1.05;
    level._id_4877 maps\warlord_utility::_id_460E();
    level._id_54E0 maps\warlord_utility::_id_460E();
    maps\_utility::_id_2797( 90 );
    thread _id_6DBC( 20 );
    thread _id_6DBE();
    thread _id_6DC4();
    thread _id_6DCE();
    thread _id_6DD8();
    thread _id_6DCD();
    thread _id_6DD3();
    thread _id_6DD1();
    thread _id_6DDB();
    thread _id_6DBB();
    thread _id_6DD2();
    maps\_audio::aud_send_msg( "mortar_house_explode" );
}

_id_6DBB()
{
    maps\_utility::_id_262C( "clear_corpses" );
    clearallcorpses();
}

_id_6DBC( var_0 )
{
    level notify( "end_mortar_expire_timer" );
    level endon( "end_mortar_expire_timer" );
    level endon( "mortar_timer_done" );

    if ( common_scripts\utility::flag( "mortar_timer_done" ) )
        return;

    level._id_6DBD = gettime() + var_0 * 1000;
    _id_6DC0();

    while ( level._id_6DBD > gettime() )
        wait 0.05;

    level notify( "new_quote_string" );
    setdvar( "ui_deadquote", &"WARLORD_MORTAR_DEATH" );
    var_1 = level.player getplayerangles();
    var_2 = ( 0, var_1[1], 0 );
    var_3 = vectornormalize( anglestoforward( var_2 ) );
    var_4 = randomintrange( 24, 60 );
    var_5 = var_3 * var_4;
    var_6 = vectornormalize( anglestoright( var_1 ) );
    var_7 = randomintrange( -36, 36 );
    var_8 = var_6 * var_7;
    var_9 = ( level.player.origin[0], level.player.origin[1], level.player.origin[2] + 240 );
    var_9 = var_9 + var_5 + var_8;
    var_10 = ( level.player.origin[0], level.player.origin[1], level.player.origin[2] - 120 );
    var_10 = var_10 + var_5 + var_8;
    var_11 = bullettrace( var_9, var_10, 0, undefined );

    if ( var_11["fraction"] < 1 )
    {
        var_12 = var_11["position"];
        var_13 = var_11;
        maps\_weapon_mortar60mm::_id_6C48( var_12, 240, 512, 512, var_13 );
    }

    wait 0.05;

    if ( isalive( level.player ) )
        level.player kill();
}

_id_6DBE()
{
    var_0 = getentarray( "trig_mortar_time_extension", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_6DBF );
}

_id_6DBF()
{
    level endon( "mortar_timer_done" );

    if ( common_scripts\utility::flag( "mortar_timer_done" ) )
        return;

    self waittill( "trigger" );
    thread _id_6DBC( int( self.script_noteworthy ) );
}

_id_6DC0()
{

}

_id_6DC1()
{
    common_scripts\utility::flag_wait( "mortar_timer_done" );

    if ( isdefined( level._id_6DC2 ) )
        level._id_6DC2 destroy();
}

_id_6DC3()
{
    self.grenadeammo = 0;
}

_id_6DC4()
{
    var_0 = getentarray( "mortar_explosion_trig", "targetname" );
    var_1 = common_scripts\utility::getstruct( "mortar_explosion_player_on_roof_1", "targetname" );

    foreach ( var_3 in var_0 )
        var_3 thread _id_6DC5();

    thread _id_6DCC();
}

_id_6DC5()
{
    var_0 = self;
    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_0 waittill( "trigger" );
    thread _id_6DC6( var_1 );
    thread maps\warlord_fx::_id_550F();
}

_id_6DC6( var_0 )
{
    thread _id_6DCB( var_0 );
    wait 1;
    thread maps\warlord_fx::_id_5510();
    level._id_4877 thread _id_6DC7( var_0.origin );
    level._id_54E0 thread _id_6DC7( var_0.origin );
    maps\warlord_fx::_id_54EF( var_0.origin );
}

_id_6DC7( var_0 )
{
    if ( self.a._id_0D26 == "stand" && self.movemode == "run" )
    {
        var_1 = distance( self.origin, var_0 );

        if ( var_1 < 550 )
        {
            self notify( "play_mortar_react" );
            self endon( "play_mortar_react" );
            var_2 = _id_6DC8( var_1 );

            if ( isdefined( var_2 ) )
            {
                var_3 = getanimlength( var_2 );
                self._id_0FBC = var_2;
                self setflaggedanimknobrestart( "reactanim", var_2, 0.5, 0.5 );
                wait(var_3);
                self._id_0FBC = undefined;
                self notify( "movemode" );
            }
        }
    }
}

_id_6DC8( var_0 )
{
    if ( isdefined( level._id_6DC9 ) )
    {
        if ( gettime() - level._id_6DCA > 500 )
        {
            level._id_6DC9 = undefined;
            level._id_6DCA = undefined;
        }
    }

    var_1 = undefined;

    if ( var_0 < 200 )
    {
        var_2 = [ "run_react_stumble", "run_react_explosion2" ];
        var_3 = randomintrange( 0, var_2.size );
        var_1 = maps\_utility::_id_1281( var_2[var_3] );

        if ( isdefined( level._id_6DC9 ) && level._id_6DC9 == var_1 )
        {
            var_4 = ( var_3 + 1 ) % var_2.size;
            var_1 = maps\_utility::_id_1281( var_2[var_4] );
        }
    }

    if ( !isdefined( var_1 ) )
    {
        var_2 = [ "run_react_flinch", "run_react_explosion1" ];
        var_3 = randomintrange( 0, var_2.size );
        var_1 = maps\_utility::_id_1281( var_2[var_3] );

        if ( isdefined( level._id_6DC9 ) && level._id_6DC9 == var_1 )
        {
            var_4 = ( var_3 + 1 ) % var_2.size;
            var_1 = maps\_utility::_id_1281( var_2[var_4] );
        }
    }

    level._id_6DC9 = var_1;
    level._id_6DCA = gettime();
    return var_1;
}

_id_6DCB( var_0 )
{
    maps\_weapon_mortar60mm::_id_6C49( var_0.origin, 1, 150, 256, 100, 25 );
    thread maps\warlord_fx::_id_5511();
    var_1 = var_0.origin - level.player.origin;
    var_1 = vectornormalize( var_1 );
    var_2 = anglestoright( level.player.angles );
    var_3 = vectordot( var_1, var_2 );

    if ( var_3 > cos( 60 ) )
        level notify( "mortar_incoming_dialogue", "right_side" );
    else if ( var_3 < -1 * cos( 60 ) )
        level notify( "mortar_incoming_dialogue", "left_side" );
    else
        level notify( "mortar_incoming_dialogue", "no_side" );

    wait 1.0;
    playfx( common_scripts\utility::getfx( "garbage" ), var_0.origin );
    playfx( common_scripts\utility::getfx( "garbage_des" ), var_0.origin );
}

_id_6DCC()
{
    maps\_utility::_id_262C( "trig_soap_melee_kill" );
    var_0 = common_scripts\utility::getstruct( "mortar_explosion_soap_kill_2", "targetname" );
    wait 2;
    thread _id_6DC6( var_0 );
}

_id_6DCD()
{
    common_scripts\utility::flag_wait( "trig_soap_door_kickin" );
    var_0 = common_scripts\utility::getstruct( "mortar_door_kickin", "targetname" );
    var_0 maps\_anim::_id_1247( level._id_4877, "soap_door_kickin" );
    level._id_54E0 maps\warlord_utility::_id_460E();
    level._id_4877 maps\warlord_utility::_id_460C();
    common_scripts\utility::flag_set( "mortar_door_dialogue" );
    level._id_4877 maps\_utility::_id_2686();
}

_id_6DCE()
{
    maps\_utility::_id_262C( "trig_soap_melee_kill" );
    var_0 = common_scripts\utility::getstruct( "soap_melee_kill_org", "targetname" );
    var_1 = getent( "soap_melee_kill_enemy", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2._id_1032 = "generic";
    var_2.allowdeath = 1;
    var_2 maps\_utility::_id_0D72( 0 );
    var_3 = [];
    var_3[0] = level._id_54E0;
    var_3[1] = var_2;
    level._id_54E0 maps\_utility::_id_2713();
    var_0 maps\_anim::_id_122A( var_3, "soap_melee_kill" );

    if ( isalive( var_2 ) && !var_2 maps\_utility::_id_0D69() )
    {
        thread _id_6DCF( level._id_54E0, var_2 );
        var_2 maps\_utility::delaythread( 1.3, ::_id_6DD0 );
        var_0 maps\_anim::_id_11DE( var_3, "soap_melee_kill" );

        if ( isalive( var_2 ) )
            var_2 maps\warlord_utility::_id_4BF3();

        level._id_54E0 maps\_utility::_id_2712();
    }

    maps\_utility::_id_26BF( "trig_soap_post_melee_kill" );
    level._id_54E0 maps\_utility::_id_2686();
}

_id_6DCF( var_0, var_1 )
{
    level endon( "paired_kill_uninterruptible" );
    var_1 waittill( "death" );
    level notify( "paired_kill_interrupted" );
    var_0 notify( "single anim", "end" );
    var_0 stopanimscripted();
}

_id_6DD0()
{
    self endon( "death" );
    self.allowdeath = 0;
    level notify( "paired_kill_uninterruptible" );
}

_id_6DD1()
{
    maps\_utility::_id_262C( "trig_mortar_roof" );
    thread maps\warlord_fx::_id_5512();
    var_0 = getnode( "mortar_soap_node_1", "targetname" );
    var_1 = getnode( "mortar_price_node_1", "targetname" );
    level._id_54E0.goalradius = 8;
    level._id_54E0 maps\_utility::_id_2053( var_0 );
    level._id_4877.goalradius = 8;
    level._id_4877 maps\_utility::_id_2053( var_1 );
    maps\_utility::_id_262C( "trig_player_on_roof_1" );
    common_scripts\utility::flag_wait( "player_on_roof_1" );
    thread maps\warlord_fx::_id_5513();
}

_id_6DD2()
{
    level endon( "mortar_timer_done" );

    if ( common_scripts\utility::flag( "mortar_timer_done" ) )
        return;

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_on_roof_2" );
        level.player disableoffhandweapons();
        common_scripts\utility::flag_waitopen( "player_on_roof_2" );
        level.player enableoffhandweapons();
    }
}

_id_6DD3()
{
    maps\_utility::_id_262C( "trig_mortar_last_house" );
    var_0 = getentarray( "mortar_tube_guys", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F, 1 );
    var_1 = getent( "mortar_tube_operator", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 thread _id_6DD4();
    common_scripts\utility::flag_wait( "mortar_fight_shot_2" );
    wait 1;
    var_3 = getent( "mortar_path_blocker", "targetname" );
    var_3 delete();
    level._id_54E0 _id_6E35( "mortar_soap_node_2" );
    common_scripts\utility::flag_set( "warlord_player_mortar" );
    maps\_utility::_id_262C( "trig_mortar_furniture" );
    common_scripts\utility::flag_set( "mortar_introduce" );
}

_id_6DD4()
{
    self endon( "death" );
    thread maps\_utility::_id_0D04();
    var_0 = common_scripts\utility::getstruct( "mortar_dude_org", "targetname" );
    var_0 thread maps\_anim::_id_11C8( self, "mortar_idle", "stop_mortar_loop" );
    common_scripts\utility::flag_wait( "mortar_fight_shot_2" );
    var_0 notify( "stop_mortar_loop" );
    maps\_utility::_id_1414();
    thread maps\_utility::_id_1902();
    thread _id_6E35( self.target );
}

_id_6DD5()
{
    var_0 = getent( "trig_mortar_soap_teleport", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = common_scripts\utility::getstruct( "soap_teleport_mortar", "targetname" );
    level._id_54E0 maps\_utility::_id_279F( var_1 );
    level._id_54E0 maps\_utility::_id_2713();
    var_2 = getnode( "soap_teleport_node", "targetname" );
    level._id_54E0 maps\_utility::_id_2053( var_2 );
}

_id_6DD6()
{
    wait 1;
    var_0 = getent( "warlord_player_fallthrough_origin", "targetname" );
    var_1 = var_0.origin - ( 0.0, 0.0, 8.0 );
    var_2 = ( 0.0, 0.0, 0.0 );
    playfx( common_scripts\utility::getfx( "warlord_player_fallthrough" ), var_1, anglestoforward( var_2 ) );
}

_id_6DD7()
{
    wait 2;
    setblur( 10, 0 );
    wait 0.35;
    setblur( 0, 1.3 );
}

_id_6DD8()
{
    var_0 = getent( "trig_mortar_roof_collapse", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "mortar_timer_done" );
    var_1 = common_scripts\utility::getstruct( "org_fall_through_roof", "targetname" );
    var_2 = maps\_utility::_id_1287( "player_rig" );
    var_2 hide();
    var_3 = maps\_utility::_id_1287( "player_legs" );
    var_3 hide();
    thread _id_6DD6();
    thread _id_6DD7();
    var_4 = [];
    var_4[0] = var_2;
    var_4[1] = var_3;
    var_1 maps\_anim::_id_11BF( var_4, "roof_fall" );
    level.player allowsprint( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowmelee( 0 );
    level.player disableweapons();
    level.player playerlinktoblend( var_2, "tag_player", 0.4, 0.2, 0.2 );
    var_2 common_scripts\utility::delaycall( 0.4, ::show );
    var_3 common_scripts\utility::delaycall( 0.4, ::show );
    wait 0.4;
    var_5 = common_scripts\utility::getstruct( "teleport_soap_mortar_fall", "targetname" );
    var_6 = common_scripts\utility::getstruct( "teleport_price_mortar_fall", "targetname" );
    maps\_audio::aud_send_msg( "fall_through_roof" );
    maps\_audio::aud_send_msg( "mus_yuri_down" );
    level.player common_scripts\utility::delaycall( 0.7, ::playrumbleonentity, "damage_light" );
    var_1 maps\_anim::_id_11DD( var_4, "roof_fall" );
    level._id_54E0 maps\_utility::_id_279F( var_5 );
    level._id_4877 maps\_utility::_id_279F( var_6 );
    level._id_54E0 maps\_utility::_id_1237( level._id_54E0.origin );
    level._id_4877 maps\_utility::_id_1237( level._id_4877.origin );
    common_scripts\utility::flag_set( "mortar_roof_fall_dialogue" );
    common_scripts\utility::flag_set( "delete_destroyed_technicals" );
    maps\_audio::aud_send_msg( "mortar_run_end" );
    level.player unlink();
    var_2 delete();
    var_3 delete();
    level._id_4877._id_0FC6 = 1;
    level._id_54E0._id_0FC6 = 1;
    level._id_54E0 maps\warlord_utility::_id_460C();
    maps\_utility::_id_2797( 100 );
    maps\_utility::_id_26BF( "martar_allies_run_accross_roofs" );
    maps\_utility::_id_1425( "mortar_roof_fall" );
    thread _id_6DD9();
    thread maps\warlord_fx::_id_5514();
}

_id_6DD9()
{
    var_0 = getentarray( "mortar_run_roof_guys", "script_noteworthy" );
    var_1 = getnodearray( "mortar_run_roof_node", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6DDA, var_1 );
}

_id_6DDA( var_0 )
{
    self endon( "death" );
    self.grenadeammo = 0;
    self.goalradius = 32;
    self.ignoreme = 1;
    self._id_20AF = 0.05;
    maps\_utility::_id_262C( "trig_mortar_last_house" );

    if ( isdefined( self._id_164F ) && self._id_164F == "mortar_run_roof_guy_1" )
        maps\_utility::_id_2053( var_0[0] );
    else
        maps\_utility::_id_2053( var_0[1] );

    self waittill( "goal" );
    self.ignoreme = 0;
}

_id_6DDB()
{
    common_scripts\utility::flag_wait( "mortar_fight_shot" );
    var_0 = common_scripts\utility::getstruct( "mortar_fight_fire_2", "targetname" );
    thread _id_6DCB( var_0 );
    common_scripts\utility::flag_set( "mortar_fight_shot_2" );
    thread maps\warlord_fx::_id_5515();

    foreach ( var_2 in level.createfxent )
    {
        if ( var_2.v["type"] == "oneshotfx" )
            var_2 common_scripts\utility::pauseeffect();
    }
}

_id_6DDC( var_0 )
{
    var_1 = maps\_vehicle::_id_2881( var_0 );
    var_1 thread _id_6CEC();
    var_1 thread _id_6C72();
    var_1 thread _id_6DDD();
    var_2 = [];
    var_2[0] = 0.06;
    var_2[1] = 0.06;
    var_2[2] = 0.12;
    var_2[3] = 0.24;
    var_1.mgturret[0].accuracy = var_2[level.gameskill];
    return var_1;
}

_id_6DDD()
{
    self._id_2998 = 1;
    self waittill( "death" );
    wait 0.1;
    self disconnectpaths();
}

_id_6DDE()
{
    var_0 = getentarray( "mortar_motivation_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6DDF );
}

_id_6DDF()
{
    self endon( "death" );
    self.accuracy = 0.04;
    maps\_utility::_id_2131( 1 );
}

_id_6DE0()
{
    common_scripts\utility::flag_wait_any( "mortar_introduce", "mortar_operator_off" );
    common_scripts\utility::flag_set( "head_to_mortar_dialogue" );
    common_scripts\utility::flag_set( "obj_capture_mortar" );
}

_id_6DE1()
{
    common_scripts\utility::flag_wait( "player_at_mortar" );
    thread _id_6DE2();
    var_0 = getentarray( "mortar_small_goal_radius", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6DE9 );
    level._id_54E0.ignoreme = 1;
    level._id_4877.ignoreme = 1;
    level._id_6BF5 = _id_6DDC( "mortar_technical_1" );
    level notify( "mortar_technical_1_spawned" );
    maps\_audio::aud_send_msg( "mortar_technical_1_spawned" );
    wait 7.0;
    common_scripts\utility::flag_wait( "mortar_in_use" );
    maps\_weapon_mortar60mm::_id_6C1A();
    level._id_6BF6 = maps\_vehicle::_id_2881( "mortar_pickup_1" );
    level notify( "mortar_truck_1_spawned" );
    common_scripts\utility::flag_set( "mortar_targets_dialogue" );
    common_scripts\utility::flag_wait_any( "mortar_technical_1_dead", "mortar_technical_1_riders_dead", "mortar_pickup_1_dead", "mortar_pickup_1_riders_dead" );

    if ( common_scripts\utility::flag( "mortar_technical_1_dead" ) )
        wait 3;

    level._id_6BF7 = _id_6DDC( "mortar_technical_2" );
    level notify( "mortar_technical_2_spawned" );
    level._id_6BF7 thread _id_6DEB();
    _id_6DEA();
    common_scripts\utility::flag_set( "keep_firing_mortar" );
    level notify( "spawning_mortar_wave" );
    thread _id_6DF0();
    level._id_6BF8 = [];
    var_1 = getentarray( "mortar_wave", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6DE8 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6DE6 );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 maps\_utility::_id_166F( 1 );
        level._id_6BF8[level._id_6BF8.size] = var_4;
        wait 0.05;
    }

    common_scripts\utility::flag_wait( "mortar_wave_1_dead" );
    maps\_weapon_mortar60mm::_id_6C4F();

    if ( isdefined( level.player._id_6C42 ) && level.player._id_6C42 <= 4 )
        level.player thread maps\_utility::_id_1E39( "FOR_WHOM_THE_SHELL_TOLLS" );

    common_scripts\utility::flag_set( "regroup_dialogue" );
    level._id_4877 thread _id_6E35( "node_price_pre_assault" );
    level._id_4877 thread _id_6DE5();
    common_scripts\utility::flag_set( "warlord_assault" );
    level notify( "mortar_finished" );

    foreach ( var_7 in level.createfxent )
    {
        if ( var_7.v["type"] == "oneshotfx" )
            var_7 maps\_utility::_id_1655();
    }
}

_id_6DE2()
{
    level endon( "warlord_assault" );
    common_scripts\utility::flag_wait( "mortar_in_use" );
    thread _id_6DE3();
}

_id_6DE3()
{
    level.player enableinvulnerability();
    var_0 = [];
    var_0[0] = 10;
    var_0[1] = 10;
    var_0[2] = 8;
    var_0[3] = 6;

    if ( level.gameskill == 3 )
        thread _id_6DE4();

    wait(var_0[level.gameskill]);
    level.player disableinvulnerability();
}

_id_6DE4()
{
    level.player endon( "death" );
    var_0 = getdvarfloat( "player_damageMultiplier" );
    setsaveddvar( "player_damageMultiplier", 0.7 );
    level waittill( "mortar_finished" );
    setsaveddvar( "player_damageMultiplier", var_0 );
}

_id_6DE5()
{
    while ( !level.player islookingat( level._id_4877 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "price_moving_to_pipe" );
}

_id_6DE6()
{
    self._id_0D45 = ::_id_6DE7;
}

_id_6DE7()
{
    if ( isdefined( self.damageyaw ) && self.damageyaw >= -45 && self.damageyaw <= 45 )
    {
        if ( isdefined( self.damageweapon ) && self.damageweapon == "none" && isdefined( self.damagemod ) && self.damagemod == "MOD_EXPLOSIVE" )
        {
            if ( randomintrange( 0, 100 ) < 50 )
                self._id_0D50 = maps\_utility::_id_270F( "explosion_flying_react" );
        }
    }

    return 0;
}

_id_6DE8()
{
    self endon( "death" );
    self.grenadeammo = 0;
    self.ignoreall = 1;
    self.accuracy = 0.06;
    maps\_utility::_id_2131( 1 );
    var_0 = getent( "mortar_volume_2", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_6DE9()
{
    self endon( "death" );
    self waittill( "jumpedout" );
    self.goalradius = 128;
    self.accuracy = 0.06;
    var_0 = getent( "mortar_volume_1", "targetname" );
    var_1 = getent( "mortar_volume_2", "targetname" );

    if ( common_scripts\utility::cointoss() )
        self setgoalvolumeauto( var_0 );
    else
        self setgoalvolumeauto( var_1 );
}

_id_6DEA()
{
    level endon( "mortar_technical_2_dead" );
    level endon( "mortar_technical_2_riders_dead" );

    if ( common_scripts\utility::flag( "mortar_technical_2_dead" ) || common_scripts\utility::flag( "mortar_technical_2_riders_dead" ) )
        return;

    common_scripts\utility::flag_wait( "morter_technical_wave_2" );
}

_id_6DEB()
{
    self endon( "death" );
    self.mgturret[0] maps\warlord_utility::_id_6BA5( "TurretFireDisable" );
    common_scripts\utility::flag_wait( "mortar_technical_2_fire" );
    self.mgturret[0] maps\warlord_utility::_id_6BA7( "TurretFireDisable" );
}

_id_6DEC()
{
    common_scripts\utility::flag_wait( "player_at_mortar" );
    maps\_utility::_id_26BF( "trig_mortar_use_post_teleport" );
}

_id_6DED()
{
    level waittill( "mortar_equipped" );
    var_0 = ( 256.0, 0.0, 128.0 );
    var_1 = spawn( "script_origin", level.player.origin + var_0 );
    var_2 = missile_createattractorent( var_1, 10000, 999999 );
    common_scripts\utility::flag_wait( "assault_run_to_pipe" );
    missile_deleteattractor( var_2 );
}

_id_6DEE()
{
    level waittill( "mortar_technical_2_spawned" );
    wait 3.0;
    var_0 = getentarray( "mortar_rpg_guys_1", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6DEF );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_utility::_id_166F( 1 );
        var_3.health = 1;
        var_3.grenadeammo = 0;
        var_3._id_0EC6 = 1;
        wait 1.0;
    }
}

_id_6DEF()
{
    self endon( "death" );
    maps\_utility::_id_262C( "trig_damage_rpg_roof" );
    self kill();
}

_id_6DF0()
{
    level endon( "assault_all_clear" );
    var_0 = getent( "trig_mortar_wave_1_aware", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && isalive( var_1 ) )
            var_1.ignoreall = 0;
    }
}

_id_6DF1()
{
    common_scripts\utility::flag_wait( "assault_run_to_pipe" );
    thread _id_6DF2();
    var_0 = common_scripts\utility::getstruct( "org_rip_sewer_grate", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_54E0, "approach_rip_sewer" );
    var_0 maps\_anim::_id_1246( level._id_54E0, "approach_rip_sewer" );
    var_0 thread maps\_anim::_id_124E( level._id_54E0, "rip_sewer_idle", "stop_loop" );
    level._id_54E0 maps\_utility::_id_2688();
    wait 0.05;
    common_scripts\utility::flag_set( "ready_to_open_grate" );
}

_id_6DF2()
{
    common_scripts\utility::flag_wait( "price_moving_to_pipe" );
    var_0 = getent( "trig_soap_leaving_mortar_tower", "targetname" );

    while ( level._id_54E0 istouching( var_0 ) )
        wait 0.05;

    level._id_4877 thread _id_6E35( "node_pipe_price_1" );
}

_id_6DF3()
{
    maps\_utility::_id_262C( "trig_player_at_pipe" );

    foreach ( var_1 in getaiarray( "axis" ) )
        var_1 delete();

    common_scripts\utility::flag_wait( "ready_to_open_grate" );
    level._id_54E0 thread _id_6DF5();
    level._id_4877 thread _id_6DF5();
    var_3 = common_scripts\utility::getstruct( "org_rip_sewer_grate", "targetname" );
    var_3 notify( "stop_loop" );
    thread maps\warlord_fx::_id_5516();
    var_4 = [];
    var_4[0] = [ level._id_54E0, 0.05 ];
    var_4[1] = [ level._id_6B60, 0 ];
    var_3 thread maps\_shg_common::_id_16EB( var_4, "rip_sewer_grate" );
    thread _id_6DF4();
    level._id_54E0 waittill( "anim_ended" );
    level._id_54E0 maps\_utility::_id_2688();
    level._id_54E0 maps\warlord_utility::_id_460C();
    level._id_54E0.goalradius = 2048;
    level._id_54E0 thread _id_6E35( "node_assault_soap_1" );
}

_id_6DF4()
{
    wait 6.66667;
    var_0 = getent( "sewer_grate_clip", "targetname" );
    var_0 notsolid();
    var_0 connectpaths();
    level._id_4877 maps\warlord_utility::_id_460E();
    level._id_4877 thread _id_6E35( "node_assault_price_1" );
    level._id_4877 waittill( "goal" );
    level._id_4877 maps\warlord_utility::_id_460C();
}

_id_6DF5()
{
    var_0 = getent( "trig_ally_enter_pipe", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    self allowedstances( "crouch" );
    thread _id_6DF6();
}

_id_6DF6()
{
    for (;;)
    {
        var_0 = getent( "trig_ally_exit_pipe", "targetname" );
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    self allowedstances( "stand", "crouch", "prone" );
}

_id_6DF7()
{
    for (;;)
    {
        if ( common_scripts\utility::flag( "flag_disable_prone_stairs" ) )
            level.player allowprone( 0 );
        else
            level.player allowprone( 1 );

        wait 0.05;
    }
}

_id_6DF8()
{
    var_0 = getentarray( "assault_roof_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6DF9 );
}

_id_6DF9()
{
    self._id_1032 = "generic";
    self._id_0D45 = ::_id_64ED;
}

_id_64ED()
{
    var_0 = [];
    var_0[0] = maps\_utility::_id_1281( "death_rooftop_A" );
    self._id_0D50 = var_0[0];
    return 0;
}

_id_6DFA()
{
    common_scripts\utility::flag_wait( "assault_warehouse_guys_dead" );
    maps\_utility::_id_26BF( "trig_post_warehouse" );
}

_id_6DFB()
{
    level.player endon( "death" );
    thread _id_6DFC();
    common_scripts\utility::flag_init( "price_ready_to_assault" );
    common_scripts\utility::flag_init( "soap_ready_to_assault" );
    common_scripts\utility::flag_wait_any( "assault_all_clear", "assault_compound_failsafe" );
    thread _id_6DFD();
    thread _id_6DFE();
    common_scripts\utility::flag_wait( "soap_ready_to_assault" );
    thread _id_6DFF();
    wait 1;
    common_scripts\utility::flag_set( "house_door_dialogue" );
    maps\_audio::aud_send_msg( "mus_shoulder_charge_door" );
    var_0 = common_scripts\utility::getstruct( "org_compound_door", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_54E0, "shoulder_charge_door" );
    var_0 maps\_anim::_id_1246( level._id_54E0, "shoulder_charge_door" );
    level._id_54E0 maps\_utility::_id_2688();
    maps\_utility::_id_26BF( "trig_soap_enter_compound_house" );
    maps\_utility::_id_26BF( "trig_price_enter_compound_house" );
}

_id_6DFC()
{
    common_scripts\utility::flag_init( "assault_compound_failsafe" );
    level endon( "trig_compound_autosave" );
    common_scripts\utility::flag_wait( "player_at_compound_door" );
    wait 5;
    common_scripts\utility::flag_set( "assault_compound_failsafe" );
}

_id_6DFD()
{
    level._id_4877 _id_6E35( "price_wait_for_door" );
    level._id_4877 waittill( "goal" );
    common_scripts\utility::flag_set( "price_ready_to_assault" );
    level._id_4877 maps\_utility::_id_2520();
    level._id_4877 maps\_utility::_id_2720();
}

_id_6DFE()
{
    level._id_54E0 _id_6E35( "soap_wait_for_door" );
    level._id_54E0.goalradius = 1024;
    level._id_54E0 waittill( "goal" );
    common_scripts\utility::flag_set( "soap_ready_to_assault" );
}

_id_6DFF()
{
    var_0 = getaiarray( "axis" );
    maps\_utility::_id_2756( var_0, 1024 );
}

_id_0136()
{
    common_scripts\utility::flag_wait( "trig_compound_autosave" );
    level._id_4877._id_20AF = 0.05;
    level._id_54E0._id_20AF = 0.05;
}

_id_6E01()
{
    self endon( "death" );
    level endon( "warlord_church_breach" );
    common_scripts\utility::flag_wait( "trig_compound_autosave" );

    while ( common_scripts\utility::flag( "trig_compound_autosave" ) )
    {
        maps\_utility::_id_1425( "compound" );
        wait 25;
    }
}

_id_6E02()
{
    maps\_utility::_id_262C( "trig_mi17_flyby" );
    level._id_6E03 = maps\_vehicle::_id_2881( "mi17_flyby" );
    level._id_6E03._id_1032 = "mi17";
    level._id_6E03 setcandamage( 0 );
    level._id_6E03 thread _id_6E30();
    maps\_audio::aud_send_msg( "mi17_flyby", level._id_6E03 );
}

_id_6E04()
{
    maps\_utility::_id_262C( "trig_assault_compound_wave_1" );
    var_0 = getentarray( "assault_door_wave", "script_noteworthy" );
    var_1 = getent( "assault_door_wave", "targetname" );
    var_2 = common_scripts\utility::getstruct( "door_anim_ref_wave", "targetname" );
    maps\warlord_utility::_id_6B91( var_0, var_1, var_2 );
}

_id_6E05( var_0 )
{
    self endon( "death" );
    var_0 setcandamage( 1 );
    var_0.health += 20000;
    var_1 = var_0.health;

    for (;;)
    {
        var_0 waittill( "damage", var_2, var_3, var_4, var_5, var_6 );
        var_0.health = var_1;

        if ( isdefined( var_3 ) && var_3 == level.player && isdefined( var_6 ) && ( var_6 == "MOD_PROJECTILE" || var_6 == "MOD_PROJECTILE_SPLASH" ) )
        {
            self._id_6E06 = 1;
            self dodamage( var_2, var_5, var_3 );
        }
    }
}

_id_6E07()
{
    self endon( "death" );
    self pushplayer( 1 );
    self.ignoreall = 1;
    wait 2.5;
    self.ignoreall = 0;
    self pushplayer( 0 );
}

_id_6E08( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in self._id_0A39 )
    {
        if ( var_3._id_2252 == var_0 )
        {
            var_1 = var_3;
            break;
        }
    }

    if ( isdefined( var_1 ) )
    {
        var_1 endon( "death" );
        var_1 maps\_utility::_id_0D04();
        common_scripts\utility::waittill_any( "death", "end_make_rider_invul_" + var_0 );
        var_1 maps\_utility::_id_1902();
    }
}

_id_6E09()
{
    _id_6E08( 0 );
}

_id_6E0A()
{
    self notify( "end_make_rider_invul_0" );
}

_id_6E0B()
{
    _id_6E08( 1 );
}

_id_6E0C()
{
    common_scripts\utility::flag_wait( "compound_truck_right" );
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = maps\_vehicle::_id_2881( "compound_truck_right" );
    maps\_audio::aud_send_msg( "compound_technical_right", var_2 );
    var_2 thread _id_6C72();
    var_2._id_0A39[0] thread _id_6E16( var_1 );
    var_2._id_0A39[2] thread _id_6E16( var_1 );
}

_id_6E0D()
{
    common_scripts\utility::flag_wait( "compound_truck_left" );
    level._id_6E0E = maps\_vehicle::_id_2881( "compound_truck_left" );
    level._id_6E0E._id_2955 = 1;
    level._id_6E0E.mgturret[0] maketurretsolid();
    level._id_6E0E.mgturret[0]._id_2279 = 1.5;
    level._id_6E0E.mgturret[0]._id_227A = 2.5;
    level._id_6E0E.mgturret[0].script_delay_min = 1.5;
    level._id_6E0E.mgturret[0].script_delay_max = 2;
    level._id_6E0E.mgturret[0]._id_6E0F = 0.05;
    level._id_6E0E thread _id_6E05( level._id_6E0E.mgturret[0] );
}

_id_6E10()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "ignore_until_goal", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_4B99 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_6E11()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "fire_while_moving", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_50B4 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_6E12()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "ignore_all_until_goal", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E18 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_6E13()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "change_goal_radius_on_goal", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E19, 32 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_6E14()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "assault_first_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E19, 32 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E1A, "vol_fall_back_1", "compound_fall_back_1" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_6E15()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "assault_run_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E19, 32 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_4B99 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E1C );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E1A, "vol_fall_back_1", "compound_fall_back_1" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_0137()
{
    var_0 = getdvarint( "cg_fov" );
    var_1 = cos( var_0 );
    var_2 = getentarray( "outside_church_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E16, var_1 );
}

_id_6E16( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "compound_church_doors" );
    var_1 = getent( "vol_church_retreat_delete", "targetname" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.goalradius = 8;
    self setgoalvolumeauto( var_1 );

    while ( maps\_utility::_id_26AD( self.origin, var_0 ) )
        wait(randomfloatrange( 0.05, 0.3 ));

    self delete();
}

_id_6E17()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "breach_starting" );
    self delete();
}

_id_4B99()
{
    self endon( "death" );
    self.ignoreme = 1;
    maps\_utility::_id_2131( 1 );
    self waittill( "goal" );
    self.ignoreme = 0;
}

_id_50B4()
{
    self endon( "death" );
    self.accuracy = 0.08;
    maps\_utility::_id_2131( 1 );
}

_id_6E18()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self waittill( "goal" );
    wait(randomfloatrange( 1.0, 2.0 ));
    self.ignoreme = 0;
    self.ignoreall = 0;
}

_id_6E19( var_0 )
{
    self endon( "death" );
    var_1 = self.goalradius;
    self.goalradius = var_0;
    self waittill( "goal" );

    if ( isdefined( self ) && isalive( self ) )
        self.goalradius = var_1;
}

_id_6E1A( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_1 );
    var_0 = getent( var_0, "targetname" );

    if ( isdefined( self ) && isalive( self ) )
    {
        _id_6E19( 32 );
        self setgoalvolumeauto( var_0 );
    }
}

_id_6E1B()
{
    var_0 = getent( "vol_assault_retreat", "targetname" );

    for ( var_1 = getaiarray( "axis" ); var_1.size > 2 || !common_scripts\utility::flag( "compound_truck_left" ); var_1 = getaiarray( "axis" ) )
        wait 1;

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) )
        {
            var_3 _id_6E19( 32 );
            var_3 setgoalvolumeauto( var_0 );
        }
    }

    level notify( "compound_guys_retreat" );
}

_id_6E1C()
{
    self endon( "death" );
    self waittill( "goal" );

    for (;;)
    {
        maps\_utility::_id_2052( level.player );
        wait 5;
    }
}

_id_6E1D()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

_id_6E1E()
{
    level endon( "compound_guys_dead" );
    maps\_utility::_id_262C( "trig_assault_compound_wave_1" );
    var_0 = getent( "compound_roof_runner_1", "targetname" );

    for ( var_1 = 3; var_1 > 0; var_1-- )
    {
        var_2 = var_0 maps\_utility::_id_166F();
        var_2 thread _id_6E1D();

        if ( isdefined( var_0.count ) && var_0.count <= 0 )
            var_0.count = 1;

        wait 15;
    }
}

_id_6E1F()
{
    var_0 = getentarray( "compound_spawn_triggers", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_off();
}

_id_6E21()
{
    maps\_utility::_id_262C( "trig_church_window_guy" );
    var_0 = getglass( "church_window" );

    if ( isdefined( var_0 ) )
    {
        destroyglass( var_0, ( 0.0, 1.0, 0.0 ) );
        var_1 = getent( "church_window_guy", "targetname" );
        var_1 maps\_utility::_id_166F( 1 );
    }
}

_id_6E22()
{
    common_scripts\utility::flag_wait( "compound_church_doors" );
    common_scripts\utility::flag_init( "church_doors_open" );
    var_0 = getent( "breach_door_left", "targetname" );
    var_1 = getent( "breach_door_right", "targetname" );
    maps\_audio::aud_send_msg( "church_doors_open", var_0 );
    maps\_utility::_id_26BF( "trig_allies_enter_church" );
    level._id_54E0.goalradius = 64;
    level._id_4877.goalradius = 64;
    var_2 = getentarray( "church_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_6E24 );
    level._id_6E23 = maps\_utility::_id_272B( var_2 );
    var_3 = getentarray( "church_guys_2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_6E25 );

    foreach ( var_5 in var_3 )
    {
        var_6 = var_5 maps\_utility::_id_166F();
        level._id_6E23 = maps\_utility::_id_0BC3( level._id_6E23, var_6 );
    }

    thread _id_6E28();
    var_0 connectpaths();
    var_1 connectpaths();
    var_0 rotateyaw( 270, 0.2, 0.1, 0.1 );
    var_1 rotateyaw( -270, 0.2, 0.1, 0.1 );
    common_scripts\utility::flag_set( "church_doors_open" );
    common_scripts\utility::flag_set( "warlord_player_breach" );
    thread _id_6E26();
    thread _id_6E27();
    thread maps\warlord_fx::_id_5505();
    wait 0.5;
    var_0 disconnectpaths();
    var_1 disconnectpaths();
}

_id_6E24()
{
    thread _id_6E17();
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "church_doors_open" );
    self.ignoreall = 0;
}

_id_6E25()
{
    thread _id_6E17();
    thread _id_6E18();
    thread _id_6E19( 32 );
}

_id_6E26()
{
    common_scripts\utility::flag_init( "church_guys_retreat" );

    for (;;)
    {
        if ( level._id_6E23.size < 3 )
        {
            common_scripts\utility::flag_set( "church_guys_retreat" );
            break;
        }

        wait 0.1;
    }
}

_id_6E27()
{
    common_scripts\utility::flag_wait( "church_guys_retreat" );
    var_0 = getent( "vol_church_retreat", "targetname" );

    foreach ( var_2 in level._id_6E23 )
    {
        var_2 thread _id_6E18();
        var_2 setgoalvolumeauto( var_0 );
    }
}

_id_6E28()
{
    var_0 = getent( "hyena_master", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1.allowdeath = 1;
    var_1._id_1032 = "generic";
    var_2 = getent( "hyena_pet", "targetname" );
    var_3 = var_2 maps\_utility::_id_166F( 1 );
    var_3.allowdeath = 1;
    var_3._id_1032 = "dog";
    _id_6E29( var_1, var_3 );
    var_4 = isalive( var_1 );
    var_5 = isalive( var_3 );

    if ( var_4 != var_5 )
    {
        if ( var_4 )
            var_1 maps\_utility::_id_1414();

        if ( var_5 )
            var_3 maps\_utility::_id_1414();
    }
}

_id_6E29( var_0, var_1 )
{
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_2 = [];
    var_2[0] = var_0;
    var_2[1] = var_1;
    var_3 = common_scripts\utility::getstruct( "org_hyena_hold", "targetname" );
    var_3 maps\_anim::_id_11DD( var_2, "africa_hyena_hold" );
    var_2 = [];
    var_2[0] = [ var_0, 0 ];
    var_2[1] = [ var_1, 0 ];
    var_3 thread maps\_shg_common::_id_16EB( var_2, "africa_hyena_release" );
    var_1.a._id_0D2B = "run";
    var_3 waittill( "africa_hyena_release" );
}

_id_6E2A()
{
    level._id_54E0 thread _id_6E35( "node_breach_soap" );
    level._id_4877 thread _id_6E35( "node_breach_price" );
}

_id_6E2B()
{
    var_0 = common_scripts\utility::getstruct( "assault_soap_pos", "targetname" );
    var_1 = common_scripts\utility::getstruct( "assault_price_pos", "targetname" );
    level._id_54E0 maps\_utility::_id_279F( var_0 );
    level._id_4877 maps\_utility::_id_279F( var_1 );
}

_id_6E2C()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "church_breach_complete" );
    maps\_utility::_id_26BF( "trig_pre_church_breach" );
    level._id_4877 maps\_utility::_id_27B9();
    level._id_54E0 maps\_utility::_id_27B9();
    common_scripts\utility::flag_set( "obj_breach_warlord_room" );
    maps\_utility::_id_1425( "warlord_confrontation" );
    maps\_audio::aud_send_msg( "mus_pre_church_door_breach" );
    var_0 = getent( "trig_warlord_breach", "targetname" );
    var_0 sethintstring( &"SCRIPT_PLATFORM_BREACH_ACTIVATE" );
    var_0 usetriggerrequirelookat();

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( var_0 _id_6B75::_id_4D65() )
            continue;

        break;
    }

    common_scripts\utility::flag_set( "breach_starting" );
    var_1 = common_scripts\utility::getstruct( "org_warlord_standoff", "targetname" );
    var_2 = getent( "warlord", "targetname" );
    var_3 = var_2 maps\_utility::_id_166F( 1 );
    var_3._id_1032 = "warlord";
    var_3.ignoreall = 1;
    var_3.ignoreme = 1;
    var_3.allowdeath = 1;
    var_3.grenadeammo = 0;
    var_3 maps\_utility::_id_0D04();
    var_3 maps\_utility::_id_0D72( 0 );
    var_4 = getent( "warlord_hyena", "targetname" );
    var_5 = var_4 maps\_utility::_id_166F( 1 );
    var_5._id_1032 = "dog";
    var_5.ignoreall = 1;
    var_5.ignoreme = 1;
    var_5.allowdeath = 1;
    var_5.team = "neutral";
    var_5 maps\_utility::_id_0D04();
    var_5 maps\_utility::_id_0D72( 0 );
    var_6 = maps\_utility::_id_1287( "crate" );
    var_1 maps\_anim::_id_11CF( var_6, "warlord_ending" );
    var_7 = maps\_utility::_id_1287( "player_rig" );
    var_7 hide();
    level._id_45FA = maps\_utility::_id_1287( "player_legs" );
    level._id_45FA hide();
    var_1 maps\_anim::_id_11BF( [ var_7, level._id_45FA, var_3, var_5 ], "warlord_standoff_new" );
    var_1 thread maps\_anim::_id_124A( level._id_4877, "warlord_standoff_new" );

    if ( isdefined( level._id_6E03 ) )
    {
        level._id_6E03 delete();
        maps\_audio::aud_send_msg( "first_heli_deleted" );
    }

    var_8 = maps\_vehicle::_id_2A99( "confrontation_heli" );
    var_8._id_1032 = "mi17";
    var_8 setcandamage( 0 );
    var_1 thread maps\_anim::_id_124E( var_8, "mi17_idle" );
    var_9 = maps\_utility::_id_1287( "pallet" );
    var_9._id_1032 = "pallet";
    var_1 thread maps\_anim::_id_124E( var_9, "pallet_idle" );
    maps\_audio::aud_send_msg( "mi17_finale_flyout", var_8 );
    var_10 = [];
    var_11 = getentarray( "standoff_goons", "targetname" );

    foreach ( var_13 in var_11 )
    {
        var_14 = var_13 maps\_utility::_id_166F();
        var_10 = maps\_utility::_id_0BC3( var_10, var_14 );
        var_14._id_20AF = 0.05;
        var_14.grenadeammo = 0;
        var_14.health = 1;
        var_14._id_0EC6 = 1;
        var_14.ignoreme = 1;
        var_14 maps\_utility::_id_260D();
        var_14 maps\_utility::_id_0D72( 0 );
    }

    common_scripts\utility::array_thread( var_10, ::_id_6E34 );
    var_0 common_scripts\utility::trigger_off();
    setsaveddvar( "objectiveHide", 1 );
    common_scripts\utility::flag_set( "obj_breach_warlord_room_started" );
    maps\_audio::aud_send_msg( "mus_dog_scene" );
    level notify( "low_tech_breach_started" );
    level._id_4877 thread maps\_utility::_id_0D72( 0 );
    level._id_54E0 thread maps\_utility::_id_0D72( 0 );
    level.player disableweapons();
    maps\_shg_common::_id_1670();
    var_16 = 0.4;
    level.player playerlinktoblend( var_7, "tag_player", 0.4, 0.2, 0.2 );
    wait(var_16);
    var_7 show();
    level._id_45FA show();
    var_17 = [];
    var_17[0] = [ level._id_4877, 0 ];
    var_17[1] = [ var_3, 0 ];
    var_1 thread maps\_shg_common::_id_16EB( var_17, "warlord_standoff_new" );
    var_3 thread _id_6E2E( var_1 );
    var_17 = [];
    var_17[0] = [ level._id_45FA, 0 ];
    var_17[1] = [ var_7, 0 ];
    var_17[2] = [ var_5, 0 ];
    thread maps\warlord_fx::_id_5506();

    if ( isdefined( var_5 ) && isalive( var_5 ) )
        var_5 thread maps\warlord_fx::_id_5508();

    level.player allowads( 0 );
    var_1 maps\_shg_common::_id_16EB( var_17, "warlord_standoff_new" );
    var_18 = level._id_1436;
    var_19 = [];
    var_19["nearStart"] = 1;
    var_19["nearEnd"] = 75;
    var_19["nearBlur"] = 10;
    var_19["farStart"] = 500;
    var_19["farEnd"] = 500;
    var_19["farBlur"] = 1.8;
    thread maps\_utility::_id_27C0( var_18, var_19, 0.1 );
    var_17 = [];
    var_17[0] = var_7;
    var_17[1] = var_5;
    level._id_1674 = level.confrontation_weapon;
    maps\_shg_common::_id_1672( 1 );
    level.player playerlinktodelta( var_7, "tag_player", 1, 45, 10, 25, 20, 1 );
    var_1 thread maps\_anim::_id_11D6( var_17, "warlord_standoff_loop" );
    thread _id_6E2F();
    level.player thread _id_6E31( var_10 );
    common_scripts\utility::flag_wait( "warlord_standoff_complete" );
    maps\_audio::aud_send_msg( "warlord_end_all_clear" );
    thread maps\_utility::_id_27C0( var_19, var_18, 0.1 );
    wait 0.05;
    level.player playerlinktoblend( var_7, "tag_player", 0.4, 0.2, 0.2 );
    level.player disableweapons();
    var_8 maps\_utility::delaythread( 3.5, ::_id_6E30 );
    var_1 thread _id_6E32( var_3, var_6, var_8, var_9 );
    var_20 = maps\_utility::_id_1287( "beretta" );
    var_20 show();
    var_20 hidepart( "tag_knife" );
    var_20 hidepart( "tag_silencer" );
    thread maps\warlord_fx::_id_550A( var_20 );
    var_17 = [];
    var_17[0] = var_7;
    var_17[1] = var_5;
    var_17[2] = var_20;
    var_1 maps\_anim::_id_11DD( var_17, "warlord_standoff_end" );
    maps\_shg_common::_id_1675();
    level.player unlink();
    var_7 delete();
    level._id_45FA delete();
    var_20 delete();
    level.player enableweapons();
    maps\_shg_common::_id_1671();
    level.player allowads( 1 );
    var_5 maps\_utility::_id_1902();
    var_5 maps\warlord_utility::_id_4BF3();
    level._id_4877 maps\_utility::_id_2688();
    common_scripts\utility::flag_set( "warlord_protect" );
    maps\_utility::_id_26BF( "trig_price_post_warlord_standoff" );
    common_scripts\utility::flag_set( "cleanupcrew_dialogue" );
    common_scripts\utility::flag_wait( "confrontation_vo_finished" );
    maps\_utility::_id_195A();
}

_id_6E2E( var_0 )
{
    self endon( "death" );
    level endon( "warlord_standoff_complete" );
    self waittill( "anim_ended" );
    var_0 thread maps\_anim::_id_11CF( self, "warlord_ending" );
}

_id_6E2F()
{
    level endon( "warlord_standoff_complete" );
    wait 10;

    if ( !common_scripts\utility::flag( "warlord_standoff_complete" ) )
        level.player kill();
}

_id_6E30()
{
    self setanim( maps\_utility::_id_1281( "mi17_rotors" ), 1, 0, 1 );
    self hidepart( "main_rotor_jnt" );
    self hidepart( "tail_rotor_jnt" );
    self showpart( "main_rotor_jnt_blur" );
    self showpart( "tail_rotor_jnt_blur" );
}

_id_6E31( var_0 )
{
    level endon( "warlord_protect" );

    for (;;)
    {
        if ( self meleebuttonpressed() )
        {
            common_scripts\utility::flag_set( "warlord_standoff_complete" );
            wait 0.1;

            foreach ( var_2 in var_0 )
            {
                if ( isdefined( var_2 ) && isalive( var_2 ) )
                    var_2 kill();
            }

            break;
        }

        wait 0.05;
    }
}

_id_6E32( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[0] = level._id_4877;
    var_4[1] = var_2;
    var_4[2] = var_0;
    var_4[3] = var_3;
    level._id_4877 thread maps\_shg_common::_id_16E9( "price_ending_lines" );
    thread maps\_anim::_id_11DD( var_4, "warlord_ending" );
    thread _id_6E33( var_1 );
    thread maps\_utility::_id_25EE( "getting_away_dialogue", 17 );
    wait 9.35;
    var_0 maps\_utility::_id_1902();
    var_0._id_0EC6 = 1;
    var_0 maps\warlord_utility::_id_4BF3();
}

_id_6E33( var_0 )
{
    var_1 = [];
    var_1[0] = level._id_54E0;
    var_1[1] = maps\_utility::_id_1287( "crowbar" );
    var_1[1] show();
    var_1[2] = var_0;
    wait 3;
    thread maps\_anim::_id_11DD( var_1, "warlord_ending" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_empty" );
}

_id_6E34()
{
    self endon( "death" );
    self._id_20AF = 0.02;
    self waittill( "goal" );
    wait 2;
}

_id_21A4( var_0 )
{
    maps\_utility::_id_2724( 8 );
    maps\_utility::_id_2053( var_0 );
}

_id_6E35( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    thread _id_21A4( var_1 );
}

_id_6E36( var_0 )
{
    _id_6E35( var_0 );
    thread _id_6E37();
    thread _id_6E38();
}

_id_6E37()
{
    self endon( "goal" );
    self waittill( "node_taken", var_0 );

    if ( isdefined( var_0 ) )
        return;

    return;
}

_id_6E38()
{
    self endon( "goal" );
    self waittill( "node_not_safe", var_0 );

    if ( isdefined( var_0 ) )
        return;

    return;
}

_id_6E39( var_0 )
{
    level._id_4877 thread maps\warlord_stealth::_id_6BDF( var_0 );
    level._id_54E0 thread maps\warlord_stealth::_id_6BDF( var_0 );
}
