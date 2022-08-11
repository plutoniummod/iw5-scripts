// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_05E8()
{
    var_0 = getnode( "sas_leave_train", "targetname" );
    common_scripts\utility::flag_wait( "start_west_station" );
    var_0 maps\_anim::_id_124A( level._id_56DE, "westminster_stop" );

    if ( !common_scripts\utility::flag( "start_station_music" ) )
        var_0 maps\_anim::_id_1246( level._id_56DE, "westminster_stop" );
}

_id_05E9()
{
    maps\_utility::_id_262C( "exiting_terminal" );
    var_0 = getentarray( "lower_station_blocker", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 notsolid();
        var_2 connectpaths();
        var_2 delete();
    }

    var_4 = getent( "melee_chump", "targetname" );
    var_5 = common_scripts\utility::getstruct( "station_melee_node", "targetname" );
    level._id_56DE maps\_utility::_id_123B();
    level._id_56DE setgoalpos( level._id_56DE.origin );
    var_6 = var_4 maps\_utility::_id_166F( 1 );
    var_6 addaieventlistener( "bulletwhizby" );
    var_6 thread _id_05EA( var_5 );
    var_6 thread _id_05EB();
    var_6 endon( "death" );
    var_6 endon( "interrupt_melee" );
    var_5 thread maps\_anim::_id_11C0( var_6, "station_melee_scene_chump" );
    var_5 maps\_anim::_id_11C4( level._id_56DE, "station_melee_scene_sas" );
    var_6 notify( "started_melee" );
    var_5 thread maps\_anim::_id_11C1( level._id_56DE, "station_melee_scene_sas" );
    var_5 thread maps\_anim::_id_11C1( var_6, "station_melee_scene_chump" );
    var_6 waittillmatch( "single anim", "melee_interact" );
    var_6.allowdeath = 1;
    var_6.a._id_0D55 = 1;
    var_6 kill();
}

_id_05EA( var_0 )
{
    common_scripts\utility::waittill_any( "damage", "death", "see_player", "bulletwhizby" );

    if ( isalive( self ) )
    {
        self notify( "stop_first_frame" );
        self notify( "interrupt_melee" );
        self stopanimscripted();
        self.ignoreall = 0;
        self.ignoreme = 0;
        self.favoriteenemy = level.player;
    }

    var_0 = getnode( var_0.target, "targetname" );
    level._id_56DE setgoalnode( var_0 );
    level._id_56DE maps\_utility::_id_2686();
    maps\_utility::_id_26BF( "exiting_terminal" );
}

_id_05EB()
{
    self endon( "damage" );
    self endon( "death" );
    self endon( "started_melee" );
    common_scripts\utility::flag_wait( "entering_open_area" );
    self notify( "see_player" );
}

_id_05EC( var_0 )
{
    var_0 playsound( "melee_knife_hit_body" );
    playfxontag( common_scripts\utility::getfx( "melee_knife_ai" ), var_0, "TAG_KNIFE_FX" );
}

_id_05ED()
{
    var_0 = maps\_utility::_id_272C( "station_1" );
    common_scripts\utility::flag_wait( "station_reinforcements" );
    level._id_56DE maps\_utility::_id_0EEC();
    common_scripts\utility::flag_set( "start_station_music" );
    var_1 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        var_3.ignoresuppression = 1;
        var_3 maps\_utility::_id_0EEC();

        if ( isdefined( var_3.script_noteworthy ) )
        {
            var_1 = var_3;
            continue;
        }

        var_4 = var_3 common_scripts\utility::get_target_ent();
        var_3 setgoalnode( var_4 );
    }

    var_1._id_1032 = "russian_soldier";
    var_4 = var_1 common_scripts\utility::get_target_ent();
    var_1 thread maps\_utility::_id_168C( "london_ru2_gettotrucks" );
    var_1.ignoreall = 1;
    var_1 thread _id_05EF( var_4 );
    var_1 _id_05EE( var_4 );
    var_1.ignoreall = 0;
    wait 1.0;
    level._id_56DE maps\_utility::_id_109E();
    level._id_56DE maps\_utility::_id_2713();
    maps\_utility::_id_2797( 100 );
    wait 1.0;
    level._id_56DE maps\_utility::_id_2686();
    maps\_utility::_id_26BF( "sas_kickoff_west_station" );
    maps\_utility::_id_1425( "start_west_station_combat" );
    level._id_56DE maps\_utility::_id_27B8();
}

_id_05EE( var_0 )
{
    self endon( "death" );
    self endon( "damage" );
    self endon( "engage" );
    maps\_utility::_id_0EEC();
    var_0 maps\_anim::_id_124A( self, "check_body_surprise" );
    var_0 thread maps\_anim::_id_1246( self, "check_body_surprise" );
}

_id_05EF( var_0 )
{
    self endon( "death" );
    _id_51FE( "station_too_close" );
    self notify( "engage" );
    maps\_utility::_id_1414();
    self setgoalnode( var_0 );
}

_id_05F0()
{
    maps\_utility::_id_2797( 70 );
    common_scripts\utility::flag_wait( "start_west_station" );
    var_0 = getent( "crawling_badguy", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1._id_0D50 = level._id_0C59["generic"]["dying_crawl_death_v2"];
    var_1 thread _id_05F1();
    var_1 thread _id_05ED();
    var_1 endon( "death" );
    var_1 maps\_utility::_id_24F5();
    var_1.ignoreme = 1;
    var_1.ignoreall = 1;
    var_1._id_1032 = "russian_soldier";
    var_1 maps\_anim::_id_11C1( var_1, "dying_crawl" );
    var_1 maps\_anim::_id_11C0( var_1, "dying_crawl_death_v2" );
    var_1 maps\_anim::_id_1246( var_1, "london_ru1_gettotrucks" );
    var_1._id_0EC6 = 1;
    waittillframeend;
    var_1 kill();
}

_id_05F1()
{
    self waittill( "death" );
    self stopanimscripted();
    common_scripts\utility::flag_set( "station_reinforcements" );
}

_id_05F2()
{
    var_0 = getent( "tunnel_doors", "targetname" );
    var_1 = getent( "tunnel_doors_halfway", "targetname" );
    var_2 = getent( "tunnel_doors_closed", "targetname" );
    common_scripts\utility::flag_wait( "tunnel_doors_close_slow" );
    var_0 moveto( ( var_0.origin[0], var_0.origin[1], var_1.origin[2] ), 10.0 );
    common_scripts\utility::flag_wait( "tunnel_doors_close_fast" );
    var_0 moveto( ( var_0.origin[0], var_0.origin[1], var_2.origin[2] ), 2.0 );
}

_id_05F3()
{
    var_0 = maps\_vehicle::_id_2A98( "reinforcement_subway" );
    common_scripts\utility::flag_wait( "subway_go" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_vehicle::_id_1FA6();
        var_2 common_scripts\utility::delaycall( 12, ::delete );
    }
}

_id_05F4()
{
    level endon( "dumb_sprinter" );
    maps\_utility::_id_262C( "cleared_station_exit" );
    level._id_56DE maps\_utility::_id_123B();
    var_0 = common_scripts\utility::getstruct( "turnstile_anim_node", "targetname" );
    var_0 maps\_anim::_id_11C4( level._id_56DE, "london_turnstile_traverse" );
    var_0 maps\_anim::_id_11C3( level._id_56DE, "london_turnstile_traverse" );
    level._id_56DE maps\_utility::_id_2686();
    level._id_56DE maps\_utility::_id_13DC( "turnstile" );
    maps\_utility::_id_26BF( "cleared_station_exit" );
}

_id_05F5()
{
    setsaveddvar( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        cinematicingameloop( "london_posters" );
        wait 5;

        while ( iscinematicplaying() )
            wait 0.5;
    }
}

_id_05F6()
{
    maps\_utility::_id_0D04();

    if ( !isdefined( level._id_05F7 ) )
        level._id_05F7 = [];

    level._id_05F7[level._id_05F7.size] = self;

    if ( self.team == "allies" )
    {
        self allowedstances( "stand" );
        maps\_utility::_id_24F5();
        maps\_utility::_id_104A( self._id_20A3, "sidearm" );
        thread _id_05FD();
    }

    if ( isdefined( self._id_164F ) )
        level._id_05F8 = self;
}

_id_05F9( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2 = getentarray( var_1.targetname, "target" );
    var_3 = getnode( var_1.targetname, "target" );
    var_4 = maps\_utility::_id_272B( var_2, 1 );
    var_5 = "stop_takedown_enemy" + var_1._id_16A5;
    level endon( var_5 );
    thread _id_0604( var_1, var_4, var_5 );

    foreach ( var_7 in var_4 )
    {
        var_7 pushplayer( 1 );
        var_7._id_05FA = var_1;
        var_7._id_05FB = var_5;
        var_7 endon( "death" );
        var_7 maps\_utility::_id_109B();
        var_7 maps\_utility::_id_251F();
        var_7 maps\_utility::_id_0D72( 0 );
        var_7.pathenemyfightdist = 0;
        var_7.pathenemylookahead = 0;
        var_7.maxfaceenemydist = 32;
        var_7.fixednode = 1;
        var_7.a._id_0D31 = 1;
        var_7._id_1106 = 1;
        var_7._id_100A = 1;
        var_7 maps\_utility::delaythread( 0.5, maps\_utility::_id_2612, 1 );
        var_7 maps\_utility::delaythread( 0.5, maps\_utility::_id_0A23, 1 );

        if ( var_7.team == "axis" )
        {
            var_7._id_0D2D = 1;
            var_7.health = 100000;
            var_7._id_1032 = "takedown_enemy" + var_1._id_16A5;
            var_7 maps\_utility::_id_12E2( ::_id_0605 );
            var_7 _id_0601();
            continue;
        }

        var_7 maps\_utility::_id_0D04();
        var_7._id_0D28 = 1;
        var_7._id_1032 = "takedown_friendly" + var_1._id_16A5;
        var_7._id_003E = var_1._id_16A5;
        var_7._id_05FC = var_3;
    }

    var_1 maps\_anim::_id_122A( var_4, "takedown" );

    foreach ( var_7 in var_4 )
    {
        var_7 endon( "death" );
        var_7 notify( "killanimscript" );
        var_7 maps\_utility::_id_1057();
        var_7.ignoreme = 1;
        var_7.ignoreall = 1;

        if ( var_7.team == "allies" )
        {
            var_7 maps\_utility::_id_24F5();
            var_7._id_0FFE = 0;
            var_7 maps\_utility::_id_2709( var_7._id_20A3, "right" );
        }
    }

    foreach ( var_7 in var_4 )
        maps\_utility::delaythread( 3, maps\_utility::_id_282B, "take_down_finished" );

    var_1 maps\_anim::_id_11DD( var_4, "takedown" );
    var_1 thread maps\_anim::_id_11D6( var_4, "idle", "takedown_ender" );
}

_id_05FD()
{
    self endon( "death" );
    self notify( "new_watch_take_down_targets" );
    self endon( "new_watch_take_down_targets" );
    self._id_0CB8 = 1;
    maps\_utility::_id_109B();

    for (;;)
    {
        wait 0.5;

        if ( isdefined( level._id_05FE ) && level._id_05FE.size == 0 )
        {
            self pushplayer( 0 );

            if ( self.weapon != self.primaryweapon )
            {
                self._id_0FFE = 1;
                self waittill( "switched_to_lastweapon" );
            }

            var_0 = common_scripts\utility::spawn_tag_origin();
            var_0.origin = self.origin;
            var_0.angles = self.angles;
            return;
        }

        var_1 = _id_05FF();

        if ( !isdefined( var_1 ) )
            continue;

        maps\_utility::_id_26E5( var_1 );
        self setlookatentity( var_1 );
        var_1 waittill( "death" );
    }
}

_id_05FF()
{
    if ( !isdefined( level._id_05FE ) || level._id_05FE.size == 0 )
        return undefined;

    var_0 = [];

    foreach ( var_2 in level._id_05FE )
    {
        if ( var_2._id_0600 > 0 )
            var_0 = maps\_utility::_id_0BC3( var_0, var_2 );
    }

    var_4 = level._id_05FE[0];
    var_5 = maps\_utility::_id_0AEC( self.origin, level._id_05FE, var_0 );

    if ( var_5.size > 0 )
    {
        var_4 = var_5[0];
        var_4._id_0600++;
        return var_4;
    }

    var_5 = maps\_utility::_id_0AEC( self.origin, level._id_05FE );
    var_6 = 3;
    var_4 = var_5[0];

    foreach ( var_2 in var_5 )
    {
        if ( var_2._id_0600 > var_6 )
            continue;

        var_6 = var_2._id_0600;
        var_4 = var_2;
    }

    var_4._id_0600++;
    return var_4;
}

_id_0601()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0 linkto( self, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0._id_0600 = 0;
    var_0._id_0602 = self;
    var_0 thread _id_0603();

    if ( !isdefined( level._id_05FE ) )
        level._id_05FE = [];

    level._id_05FE = maps\_utility::_id_0BC3( level._id_05FE, var_0 );
}

_id_0603()
{
    self._id_0602 waittill( "death" );
    level._id_05FE = common_scripts\utility::array_remove( level._id_05FE, self );
    self delete();
}

_id_0604( var_0, var_1, var_2 )
{
    level waittill( var_2 );
    var_1 = maps\_utility::_id_2672( var_1 );
    thread common_scripts\utility::array_thread( var_1, ::_id_0606 );
}

_id_0605( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_1 != level.player )
    {
        self.health = 100000;
        return;
    }

    _id_0606();
    self kill();
}

_id_0606()
{
    self.fixednode = 1;

    if ( isdefined( self._id_05FC ) )
    {
        maps\_utility::_id_2053( self._id_05FC );
        thread _id_056C();
    }

    maps\_utility::_id_282B( "take_down_finished" );
    level notify( self._id_05FB );
    self._id_05FA notify( self._id_05FB );
    self notify( "single anim", "end" );
    self stopanimscripted();
    self notify( "killanimscript" );
    maps\_utility::_id_1A2A( ::_id_0605 );

    if ( maps\_utility::_id_26EB( "takedown_ended_on_ground" ) && isdefined( self._id_05FA._id_0607 ) )
    {
        if ( self._id_003E == 4 )
        {
            thread animscripts\notetracks::_id_23E9();
            var_0 = spawnstruct();
            var_0.origin = self.origin;
            var_0.angles = self.angles;
            var_0 maps\_anim::_id_1246( self, "crouch_to_stand" );
        }
        else
        {
            thread animscripts\notetracks::_id_23E9();
            self._id_05FA maps\_anim::_id_1246( self, "takedown_ended_on_ground" );
        }
    }

    if ( self.team == "allies" )
        thread _id_05FD();
}

_id_056C()
{
    self waittill( "goal" );
    thread _id_05FD();
}

_id_056D()
{
    var_0 = common_scripts\utility::getstructarray( "traffic_start_point", "targetname" );
    var_1 = getentarray( "traffic_model", "targetname" );

    foreach ( var_3 in var_0 )
        var_3._id_0B5A = [];

    var_5 = [];

    foreach ( var_7 in var_1 )
    {
        var_8 = spawnstruct();
        var_8.model = var_7.model;
        var_8.angles = var_7.angles;
        var_8.radius = var_7.radius;
        var_5[var_5.size] = var_8;
        var_7 delete();
    }

    var_10 = spawnstruct();
    var_10._id_15DA = 20;
    var_10.count = 0;

    for (;;)
    {
        if ( var_10.count == var_10._id_15DA )
        {
            wait 1;
            continue;
        }

        var_3 = var_0[randomint( var_0.size )];
        var_10 _id_056E( var_3, var_5 );
        wait(randomfloatrange( 3, 6 ));
    }
}

_id_056E( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = var_1[randomint( var_1.size )];
    var_4 = spawn( "script_model", var_0.origin );
    var_4 setmodel( var_3.model );
    var_4.angles = vectortoangles( var_2.origin - var_0.origin ) + ( 0, var_3.angles[1], 0 );
    var_4.radius = var_3.radius;
    var_4 thread _id_056F( var_0, var_2, self );
    self.count++;
}

_id_056F( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = undefined;

    if ( var_0._id_0B5A.size > 0 )
    {
        var_3 = var_0._id_0B5A[var_0._id_0B5A.size - 1];
        var_4 = self.radius * self.radius + var_3.radius * var_3.radius;
    }

    var_0._id_0B5A[var_0._id_0B5A.size] = self;
    var_5 = randomintrange( 348, 609 );
    var_6 = distance( self.origin, var_1.origin );
    var_7 = var_6 / var_5;
    self.speed = var_5;
    self moveto( var_1.origin, var_7 );
    var_8 = gettime() + var_7 * 1000;

    while ( gettime() < var_8 )
    {
        if ( isdefined( var_3 ) )
        {
            if ( distancesquared( self.origin, var_3.origin ) < var_4 )
            {
                var_4 = distance( self.origin, var_3.origin );
                var_4 *= var_4;
                var_5 = var_3.speed;
                self.speed = var_5;
                var_6 = distance( self.origin, var_1.origin );
                var_7 = var_6 / var_5;
                self moveto( var_1.origin, var_7 );
                var_8 = gettime() + var_7 * 1000;
            }
        }

        wait 0.05;
    }

    var_0._id_0B5A = common_scripts\utility::array_remove( var_0._id_0B5A, self );
    self delete();
    var_2.count--;
}

_id_576A( var_0 )
{
    self endon( "death" );

    for (;;)
        wait 0.05;
}

_id_0570()
{
    var_0 = common_scripts\utility::getstruct( "player_explosion_node", "targetname" );
    var_1 = maps\_utility::_id_1287( "delivery_truck" );
    var_1 thread _id_00FF();
    level._id_0571 = var_1;
    var_1 _id_0572();
    var_2 = getent( "ending_shooter_trigger", "targetname" );
    var_3 = var_2 maps\_utility::_id_2789( "allies" );
    var_4 = getstartorigin( var_0.origin, var_0.angles, var_1 maps\_utility::_id_1281( "truck_crash" ) );
    var_5 = getstartangles( var_0.origin, var_0.angles, var_1 maps\_utility::_id_1281( "truck_crash" ) );
    var_1.origin = var_4 + ( 1000.0, 0.0, 0.0 );
    var_1.angles = var_5;
    var_6 = 2;
    var_1 moveto( var_4, var_6 );
    wait(var_6 - 0.05);
    common_scripts\utility::flag_set( "truck_spawned" );
    level thread _id_0574( var_3, var_1 );
    var_7 = getanimlength( var_1 maps\_utility::_id_1281( "truck_crash" ) );
    var_6 = 5.2;
    var_8 = maps\_vehicle::_id_2A9A( "ending_chase_vehicles" );
    var_0 thread maps\_anim::_id_1246( var_1, "truck_crash" );
    var_1 thread maps\_utility::play_sound_on_entity( "scn_london_truck_crash_approach" );
    maps\_utility::delaythread( var_6 - 1, common_scripts\utility::flag_set, "truck_hit" );
    maps\_utility::delaythread( var_6 - 1, ::_id_0575, var_3 );
    level._id_56DE maps\_utility::delaythread( var_6, maps\_utility::_id_168C, "london_ldr_holdyourfire" );
    wait(var_6);
    var_1 thread maps\_utility::play_sound_on_entity( "scn_london_truck_crash_impact" );
    var_1 thread _id_0576();
    earthquake( 0.4, 0.8, var_1.origin - ( 0.0, 0.0, 32.0 ), 2048 );
    wait(var_7 - var_6);
    var_1 notify( "stop_sparks" );
    common_scripts\utility::flag_set( "truck_stopped" );
    var_1._id_252B delete();
    var_9 = getent( "end_truck_body", "targetname" );
    var_9 maps\_utility::_id_166F( 1 );
    var_10 = getent( "blockade_blocker", "targetname" );
    var_10 delete();
}

_id_00FF()
{
    var_0 = getent( "end_truck_driver", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    self._id_252B = var_1;
    var_1 endon( "death" );
    var_2 = "tag_driver";
    var_1 linkto( self, var_2, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 maps\_utility::_id_24F5();
    var_3 = level._id_24E6["script_vehicle_uk_delivery_truck_physics"][0];
    var_3._id_24F2 = "tag_passenger";
    var_1._id_24EC = var_3._id_0F59;
    wait 0.1;

    for (;;)
    {
        var_1 notify( "idle" );
        maps\_vehicle_aianim::_id_254B( var_1, var_3 );
    }
}

_id_0572()
{
    var_0 = [];
    var_0[var_0.size] = ( 200.0, -20.0, 80.0 );
    var_0[var_0.size] = ( 200.0, 20.0, 80.0 );
    var_0[var_0.size] = ( 200.0, 40.0, 20.0 );
    self._id_0573 = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = maps\london_code::_id_570B( self.origin, self.angles, var_2 );
        var_4 = spawn( "script_origin", var_3 );
        var_4 linkto( self );
        self._id_0573[self._id_0573.size] = var_4;
    }
}

_id_0574( var_0, var_1 )
{
    wait 0.5;
    var_0 = sortbydistance( var_0, level.player.origin );
    var_0 = maps\_utility::_id_2616( var_0 );

    foreach ( var_3 in var_0 )
    {
        var_3.ignoreall = 0;
        var_4 = var_1._id_0573[randomint( var_1._id_0573.size )];
        var_3 setentitytarget( var_4 );
        wait(randomfloat( 0.2 ));
    }
}

_id_0575( var_0 )
{
    common_scripts\utility::flag_wait( "truck_stopped" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::delaythread( randomfloatrange( 0.1, 0.5 ), ::_id_02B3 );
}

_id_02B3()
{
    self clearenemy();
    self clearentitytarget();
}

_id_0576()
{
    self endon( "stop_sparks" );

    for (;;)
    {
        if ( common_scripts\utility::cointoss() )
            playfxontag( common_scripts\utility::getfx( "sparks_car_scrape_point" ), self, "tag_fx1" );

        if ( common_scripts\utility::cointoss() )
            playfxontag( common_scripts\utility::getfx( "sparks_car_scrape_point" ), self, "tag_fx2" );

        if ( common_scripts\utility::cointoss() )
            playfxontag( common_scripts\utility::getfx( "sparks_car_scrape_point" ), self, "tag_fx3" );

        playfxontag( common_scripts\utility::getfx( "sparks_car_scrape_line" ), self, "tag_fx4" );
        playfxontag( common_scripts\utility::getfx( "sparks_car_scrape_line" ), self, "tag_fx5" );
        wait 0.05;
    }
}

_id_0577()
{
    common_scripts\utility::flag_wait( "truck_stopped" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_allclear" );
    level._id_0578 maps\_utility::_id_168C( "london_b21_clear" );
    var_0 = getnode( "walcroft_final_spot", "targetname" );
    var_0 maps\_anim::_id_124C( level._id_56DE, "alley_comm_check" );
    thread _id_0579( var_0 );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_lorries" );
    level thread _id_824F();
    level._id_56DE thread maps\_utility::_id_168C( "london_ldr_wherearetrucks" );

    if ( _id_057A() )
    {
        level waittill( "forever" );
        return;
    }

    wait 3.6;
    common_scripts\utility::flag_set( "do_innocent" );
}

_id_824F()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "scn_london_police_car_final_approach" );

    for (;;)
    {
        var_0.origin = level.player.origin;
        wait 0.05;
    }
}

_id_0579( var_0 )
{
    var_0 maps\_anim::_id_1246( level._id_56DE, "alley_comm_check" );
    var_0 thread maps\_anim::_id_124E( level._id_56DE, "alley_comm_idle" );
}

_id_057A()
{
    if ( getdvarint( "iw_kleenex" ) )
        return 0;

    if ( !getdvarint( "ui_skip_graphic_material" ) )
        return 0;

    wait 2;
    common_scripts\utility::exploder( 21 );
    common_scripts\utility::exploder( "4_bomb" );
    maps\_utility::delaythread( 0.2, common_scripts\utility::exploder, "ending_building" );
    level._id_0571 setmodel( "vehicle_uk_delivery_truck_destroyed" );
    thread common_scripts\utility::play_sound_in_space( "walla_london_west_street_scream_l", ( -760.0, -376.0, 108.0 ) );
    thread common_scripts\utility::play_sound_in_space( "walla_london_west_street_scream_r", ( 48.0, -328.0, 108.0 ) );
    level.player disableweapons();
    level.player setstance( "stand" );
    level.player maps\_utility::vision_set_fog_changes( "london_westminster_explosion", 0.2 );
    setplayerignoreradiusdamage( 1 );
    var_0 = getent( "ending_shooter_trigger", "targetname" );
    var_1 = var_0 maps\_utility::_id_2789( "allies" );
    var_2["anim"] = maps\_utility::_id_270F( "death_explosion1" );
    var_2["time"] = getanimlength( var_2["anim"] ) * randomfloatrange( 0.75, 0.8 );
    var_3["anim"] = maps\_utility::_id_270F( "death_explosion2" );
    var_3["time"] = getanimlength( var_3["anim"] ) * randomfloatrange( 0.75, 0.8 );

    foreach ( var_5 in var_1 )
    {
        if ( randomint( 100 ) > 60 )
            var_6 = var_2;
        else
            var_6 = var_3;

        var_5._id_0D50 = var_6["anim"];
        var_5._id_0EC7 = var_6["time"];
        var_5._id_0ECB = 1;
    }

    var_8 = common_scripts\utility::getstruct( "truck_explosion", "targetname" );
    radiusdamage( var_8.origin, var_8.radius, 1000, 100 );
    earthquake( 0.8, 1.0, var_8.origin, 1500 );
    level.player maps\_utility::delaythread( 5, maps\_utility::vision_set_fog_changes, "london_westminster_post_explosion", 20 );
    thread _id_057B();
    setslowmotion( 1, 0.2, 0.2 );
    wait 0.5;
    maps\_utility::_id_195A();
    return 1;
}

_id_057B()
{
    wait 0.2;
    var_0 = _id_51F1();
    var_1 = common_scripts\utility::getstruct( "truck_explosion_point", "targetname" );
    var_0.angles = vectortoangles( level.player.origin - var_1.origin + ( 100.0, 0.0, 0.0 ) );
    var_0.angles = ( 0, var_0.angles[1], 0 );
    var_0.origin = level.player.origin;
    var_0 hide();
    level._id_51F2 = var_0;
    level._id_51F2._id_057C = var_0.origin;
    level._id_51F2._id_057D = var_0.angles;
    var_2 = 0.2;
    level.player playerlinktoblend( var_0, "tag_player", var_2 );
    var_0 common_scripts\utility::delaycall( var_2, ::show );
    level thread _id_057F( var_0 );
    level.player enableslowaim();
    level.player allowsprint( 0 );
    maps\_utility::_id_2797( 30 );
    level.player shellshock( "london_explosion", 5 );
    var_3 = spawnstruct();
    var_3.angles = level._id_51F2._id_057D;
    var_3.origin = level._id_51F2._id_057C;
    _id_057E( var_3 );
    var_3 maps\_anim::_id_1246( var_0, "player_explosion" );
    var_0 hide();
}

_id_057E( var_0 )
{
    var_1 = angleclamp( var_0.angles[1] );
    var_2 = common_scripts\utility::getstruct( "explosion_angle_clamp_min", "targetname" );
    var_3 = common_scripts\utility::getstruct( "explosion_angle_clamp_max", "targetname" );
    var_4 = vectortoangles( var_2.origin - var_0.origin );
    var_5 = angleclamp( var_4[1] );
    var_4 = vectortoangles( var_3.origin - var_0.origin );
    var_6 = angleclamp( var_4[1] );
    var_1 = clamp( var_1, var_5, var_6 );
    var_0.angles = ( var_0.angles[0], var_1, var_0.angles[2] );
}

_id_057F( var_0 )
{
    wait 2;
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player thread maps\london_code::_id_570D( 3, 10, 10, 10, 10 );
}

_id_0580( var_0 )
{
    level endon( "stop_big_ben_chimes" );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        _id_0581();
        wait 4.5;
    }
}

_id_0581()
{
    if ( !isdefined( level._id_0582 ) )
        level._id_0582 = getent( "big_ben_sound_source", "targetname" );

    level._id_0582 stopsounds();
    level._id_0582 playsound( "emt_london_bigben_chime" );
}

_id_0583()
{
    var_0 = getentarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].classname ) )
        {
            if ( getsubstr( var_0[var_1].classname, 0, 7 ) == "weapon_" )
                var_0[var_1] delete();
        }
    }
}
#using_animtree("generic_human");

_id_0584( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_0.origin );
    var_3.angles = var_0.angles;
    var_3 setmodel( var_0.model );
    var_4 = var_0 getattachsize();

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        var_3 attach( var_0 getattachmodelname( var_5 ), var_0 getattachtagname( var_5 ) );

    var_3 useanimtree( #animtree );

    if ( isdefined( var_0.team ) )
        var_3.team = var_0.team;

    if ( isdefined( var_0._id_164F ) )
    {
        if ( var_0._id_164F == "can_die" )
        {
            var_3._id_0100 = 1;
            var_3 makefakeai();
            var_3 setcandamage( 1 );
            var_3 thread _id_0585( var_1, var_2 );
        }
    }

    var_3.weapon = var_0.weapon;
    var_3.a = spawnstruct();
    var_0 delete();
    return var_3;
}

_id_0585( var_0, var_1 )
{
    self endon( "natural_death" );
    self waittill( "damage" );
    self startragdoll();
    self setcontents( 0 );
}

_id_0586( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstructarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
        thread _id_0525( var_4, var_1 );

    var_6 = getentarray( var_0, "targetname" );

    foreach ( var_8 in var_6 )
        var_8 thread maps\_utility::_id_166F();
}

_id_0587()
{
    self endon( "death" );
    self.ignoreme = 0;
    self.ignoreall = 0;
    self.fixednode = 0;
    self allowedstances( "crouch", "prone" );
    self.fixednode = 1;
    self waittill( "move" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self allowedstances( "stand", "crouch", "prone" );
    var_0 = getnode( self.target, "targetname" );
    self.goalradius = 64;
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
    self.ignoreme = 0;
    self.ignoreall = 0;

    while ( maps\_utility::_id_0B20( self ) )
        wait 0.3;

    self kill();
}

_id_0588()
{
    var_0 = 0.4;

    if ( isdefined( self.script_delay ) )
        var_0 = self.script_delay;

    self waittill( "trigger" );
    var_1 = getentarray( "wait_move_fight", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_3 notify( "move" );

        if ( var_0 > 0 )
            wait(randomfloatrange( 0, var_0 ));
    }

    var_1 = getentarray( "remove_fixednode", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 notify( "move" );
}

_id_0589()
{
    self endon( "death" );
    wait(randomfloatrange( 10, 15 ));
    self.fixednode = 0;
}

_id_714A()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = getaiarray( "axis" );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) )
            var_2++;
    }

    if ( var_2 > 3 )
        return;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) && distance2d( var_4.origin, level.player.origin ) > 128 && !maps\_utility::_id_0B20( var_4 ) )
        {
            var_4 notify( "killanimscript" );
            var_4 delete();
        }
    }
}

_id_058A()
{
    level endon( "escalator_grenade_thrown" );
    self waittill( "trigger" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    magicgrenade( "fraggrenade", var_0.origin, var_1.origin, 4.8 );
    common_scripts\utility::flag_set( "escalator_grenade_thrown" );
}

_id_058B()
{
    common_scripts\utility::flag_init( self._id_1692 );
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );

    while ( !_id_058C( var_0 ) )
        wait 0.1;

    common_scripts\utility::flag_set( self._id_1692 );
}

_id_058C( var_0 )
{
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 istouching( var_0 ) )
            return 0;
    }

    return 1;
}

_id_058D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_0 ) )
        return;

    var_6 = _id_0584( var_0, var_3, var_1 );

    if ( !isdefined( var_3 ) )
        var_3 = var_6;

    var_6._id_0EC6 = var_2;
    var_6._id_11E5 = 1;
    var_3 thread maps\_anim::_id_11C1( var_6, var_1 );

    if ( isdefined( var_4 ) )
        var_6 setanimtime( maps\_utility::_id_270F( var_1 ), var_4 );

    if ( isdefined( var_5 ) )
    {
        var_6.animation = var_1;
        level._id_058F[level._id_058F.size] = var_6;
    }

    if ( isdefined( var_6._id_0100 ) )
    {
        var_3 waittill( var_1 );

        if ( var_6.health == 0 )
        {
            var_6 notify( "natural_death" );
            var_6 setcontents( 0 );
        }
    }

    common_scripts\utility::flag_wait( "reached_station_exit" );
    var_6 delete();
}

_id_0590( var_0, var_1 )
{
    if ( !isdefined( level._id_0591 ) )
        level._id_0591 = 1.0;

    var_2 = level._id_0591;
    var_3 = int( var_1 / 0.05 );
    var_4 = ( var_0 - var_2 ) / var_3;
    var_5 = var_2;
    var_6 = 0;

    while ( var_6 < var_3 )
    {
        settimescale( var_5 );
        level._id_0591 = var_5;
        var_5 += var_4;
        var_6++;
        wait 0.05;
    }

    settimescale( var_0 );
    level._id_0591 = var_0;
}

_id_0592()
{
    _id_0526();
    self._id_1032 = "generic";

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    else
        var_0 = self;

    var_1 = self.animation;
    waittillframeend;

    if ( isdefined( var_0.script_noteworthy ) && var_0.script_noteworthy == "loop" )
    {
        var_0 thread maps\_anim::_id_11C8( self, var_1 );
        level waittill( "level_cleanup" );
        var_0 notify( "stop_loop" );

        if ( isalive( self ) )
            self delete();
    }
    else
        thread _id_058D( self, var_1, 0, var_0 );
}

_id_51FE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !var_1.size )
        return;

    var_2 = undefined;

    if ( var_1.size > 1 )
    {
        common_scripts\utility::array_thread( var_1, ::_id_5200, var_0 );
        level waittill( var_0, var_2 );
    }
    else
        var_1[0] waittill( "trigger", var_2 );

    return var_2;
}

_id_5200( var_0 )
{
    self endon( var_0 );
    self waittill( "trigger", var_1 );
    level notify( var_0, var_1 );
}

_id_51F1()
{
    if ( !isdefined( level._id_51F2 ) )
        level._id_51F2 = maps\_utility::_id_1287( "player_rig" );

    return level._id_51F2;
}

_id_51F3( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "tag_player";

    var_1 = _id_51F1();
    var_1 show();
    level.player playerlinktodelta( var_1, var_0, 1, 15, 15, 0, 0, 1 );
}

_id_51F4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.7;

    var_1 = _id_51F1();
    var_1 show();
    level.player playerlinktoblend( var_1, "tag_player", var_0 );
}

_id_0593( var_0, var_1 )
{
    level endon( "level_cleanup" );
    var_2 = getent( var_0, "targetname" );
    var_3 = var_2.origin;

    for (;;)
    {
        var_4 = 0.05 + randomint( 4 ) / 10;
        var_2 moveto( var_3 - ( randomint( var_1 ), randomint( var_1 ), randomint( var_1 ) ), var_4 );
        wait(var_4);
    }
}

_id_0594()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );
    var_2 = [];
    var_3 = [];
    var_4 = [];
    var_5 = getnodearray( var_0.target, "targetname" );
    var_6 = 1;
    var_7 = undefined;

    foreach ( var_9 in var_1 )
    {
        switch ( var_9.classname )
        {
            case "script_model":
                var_10 = var_9;
                var_9._id_1032 = "vending_machine";
                var_9 maps\_anim::_id_1244();
                var_2 = maps\_utility::_id_0BC3( var_2, var_9 );
                var_0 thread maps\_anim::_id_11CF( var_9, "vending_scene" );
                var_7 = var_9;
                continue;
            case "actor_enemy_docks_SMG":
                var_11 = var_9 maps\_utility::_id_166F( 1 );
                maps\_utility::_id_13AF();
                var_11._id_0595 = 1;
                var_11._id_1032 = "vending_dude_" + var_6;
                var_6++;
                var_2 = maps\_utility::_id_0BC3( var_2, var_11 );
                var_4 = maps\_utility::_id_0BC3( var_4, var_11 );
                var_0 thread maps\_anim::_id_11CF( var_11, "vending_scene" );
                var_11 thread _id_0597();
                continue;
            case "script_brushmodel":
                var_9.origin -= ( 0.0, 0.0, 512.0 );
                var_3 = maps\_utility::_id_0BC3( var_3, var_9 );
                continue;
        }
    }

    self waittill( "trigger" );

    if ( !isdefined( level._id_0596 ) )
        level._id_0596 = 1;

    var_13 = 0;

    foreach ( var_11 in var_4 )
    {
        if ( !isdefined( var_11 ) || !isalive( var_11 ) )
        {
            var_2 = common_scripts\utility::array_remove( var_2, var_11 );
            var_4 = common_scripts\utility::array_remove( var_4, var_11 );
        }
    }

    if ( var_4.size > 0 )
    {
        var_7 thread maps\_utility::play_sound_on_entity( "scn_london_vending_crash" + level._id_0596 );
        var_0 maps\_anim::_id_11DD( var_2, "vending_scene" );

        foreach ( var_17 in var_3 )
            var_17.origin += ( 0.0, 0.0, 512.0 );

        foreach ( var_11 in var_4 )
        {
            if ( isalive( var_11 ) )
            {
                var_20 = sortbydistance( var_5, var_11.origin );
                var_11.goalradius = 8;
                var_11 setgoalnode( var_20[0] );
            }
        }
    }

    level._id_0596++;
}

_id_0597()
{
    common_scripts\utility::waittill_either( "death", "damage" );

    if ( isalive( self ) )
        self stopanimscripted();
}

_id_0598()
{
    return common_scripts\utility::flag( "player_has_flashed" );
}

_id_0599()
{
    notifyoncommand( "player_flash", "-smoke" );
    level.player waittill( "player_flash" );
    common_scripts\utility::flag_set( "player_has_flashed" );
}

_id_059A()
{
    if ( common_scripts\utility::cointoss() )
        self._id_0D50 = %death_rooftop_c;
    else
        self._id_0D50 = %death_rooftop_d;
}

_id_059B()
{
    thread maps\_utility::_id_0D04();
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "cop_runner" )
        thread _id_05FD();
    else if ( isdefined( self.script_noteworthy ) )
    {
        var_0 = common_scripts\utility::getstruct( "sas_wave_entrance", "targetname" );
        self._id_1032 = "sas";
        var_0 maps\_anim::_id_124A( self, "sas_wave" );
        thread maps\_anim::_id_1246( self, "london_sas2_ladstaketruck" );
        var_0 maps\_anim::_id_1246( self, "sas_wave" );
        level notify( "sas_move" );
    }
    else
    {
        self allowedstances( "crouch" );
        level waittill( "sas_move" );
        self allowedstances( "stand" );
    }

    self setgoalvolumeauto( getent( self.target, "targetname" ) );
    wait 30.0;

    while ( maps\_utility::_id_0B20( self ) )
        wait 1.0;

    maps\_utility::_id_1902();
    self delete();
}

_id_059C( var_0 )
{
    var_1 = getentarray( "london_west_drone_pool", "targetname" );
    var_0 _id_059D();

    foreach ( var_3 in var_1 )
    {
        if ( var_3.script_modelname != var_0.script_modelname )
            continue;

        var_3.count = 1;
        var_3.origin = var_0.origin;
        var_3.angles = var_0.angles;
        return var_3;
    }
}

_id_059D()
{
    var_0 = undefined;

    if ( self.script_modelname == "civilian" )
        var_0 = [ "body_london_female_a", "body_london_male_a" ];
    else if ( self.script_modelname == "civilian_drone" )
        var_0 = [ "body_london_female_a_drone", "body_london_male_a_drone" ];

    if ( isdefined( var_0 ) )
    {
        var_0 = maps\_utility::_id_0B53( var_0 );
        self.script_modelname = var_0[0];
    }
}

_id_050B()
{
    self.ignoreall = 1;
    maps\_utility::_id_251F();
    maps\_utility::_id_271F();
    maps\_utility::_id_24F5();
    self.name = "";
    self._id_2524 = 1;

    if ( isdefined( self._id_164F ) )
    {
        if ( self._id_164F == "front_exit" )
            self._id_2589 = maps\_utility::_id_26EC( "front_exit_anim" );
    }

    if ( isdefined( self._id_2980 ) )
    {
        self pushplayer( 1 );
        self.nododgemove = 1;
        self.dontavoidplayer = 1;
    }

    _id_050E();
}

_id_050C()
{
    if ( isdefined( self.script_sound ) )
    {
        self vehicle_turnengineoff();
        self playsound( self.script_sound );
    }

    if ( isdefined( self._id_16A5 ) )
    {
        if ( self._id_16A5 == 4 || self._id_16A5 == 5 || self._id_16A5 == 1 )
            self._id_2955 = 1;
    }

    if ( !isdefined( level._id_050D ) )
        level._id_050D = [];

    level._id_050D[level._id_050D.size] = self;
}

_id_050E()
{
    self.ignoreall = 1;
    self.name = "";
    self._id_2584 = 1;
    maps\_utility::_id_24F5();
    maps\_utility::_id_140B( "jog" );
    _id_051D();
    thread _id_050F();
}

_id_050F()
{
    if ( !isdefined( self._id_2005 ) )
        return;

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent();
    else
        var_0 = self;

    if ( isdefined( var_0._id_205B ) )
        var_1 = var_0._id_205B;
    else
        var_1 = var_0.animation;

    if ( isdefined( self._id_0EF1 ) )
    {
        self waittill( "jumpedout" );
        wait 0.1;
    }

    var_0 maps\_anim::_id_11C4( self, var_1 );
    var_0 thread maps\_anim::_id_11C8( self, var_1 );
}

_id_0510()
{
    self.dontavoidplayer = 1;
    self.ignoreall = 1;
    self.grenadeawareness = 0;
    self.badplaceawareness = 0;
    _id_051D();
}

_id_0511()
{
    maps\_utility::_id_2194();
    _id_051D();
    self._id_1032 = "generic";
    level._id_0578 = self;
    maps\_utility::_id_0D04();
    self waittill( "jumpedout" );
    thread maps\_utility::_id_168C( "setup_blockade1" );
    self waittill( "goal" );
    wait 1;
    var_0 = common_scripts\utility::getstruct( "sas_blockade_talk_spot", "targetname" );
    var_1 = [ level._id_56DE, self ];
    level._id_56DE maps\_utility::_id_1654( "turnstile" );
    var_0 maps\_anim::_id_122A( var_1, "setup_blockade" );
    maps\_utility::delaythread( 3, maps\_utility::_id_168C, "setup_blockade2" );
    var_2 = getanimlength( level._id_56DE maps\_utility::_id_1281( "setup_blockade" ) );
    var_2 *= 0.6;
    maps\_utility::delaythread( var_2, common_scripts\utility::flag_set, "setup_blockade" );
    level thread _id_0101( self );
    var_0 maps\_anim::_id_11DD( var_1, "setup_blockade" );
    var_3 = getnodearray( "sas_talker_blockade_spots", "targetname" );

    foreach ( var_6, var_5 in var_1 )
    {
        var_5 pushplayer( 1 );
        var_5.dontavoidplayer = 1;
        var_5.goalradius = 32;
        var_5 setgoalnode( var_3[var_6] );
    }

    if ( !common_scripts\utility::flag( "truck_spawned" ) )
        level._id_56DE thread maps\_utility::_id_168C( "london_ldr_atblockade" );
}

_id_0101( var_0 )
{
    common_scripts\utility::flag_wait( "truck_spawned" );

    if ( isdefined( var_0 ) )
        var_0 thread maps\_utility::_id_168C( "london_b21_weaponsfree" );

    level._id_56DE maps\_utility::delaythread( 2, maps\_utility::_id_168C, "london_ldr_aimfordriver" );
}

_id_0512()
{
    _id_051D();
    self waittill( "unload" );
    wait(randomfloatrange( 1, 1.5 ));
    var_0 = getnode( self.target, "targetname" );
    maps\_utility::_id_278D( var_0 );
}

_id_0513()
{
    self.ignoreall = 1;
    self.nododgemove = 1;
    self.dontavoidplayer = 1;
    maps\_utility::_id_271F();
    maps\_utility::_id_251F();

    if ( isdefined( self._id_1FFF ) )
        self._id_0FC6 = self._id_1FFF;

    maps\_utility::_id_140B( self.animation );
    thread _id_0514();
}

_id_0514()
{
    level endon( "stop_injured_movement" );
    self.goalradius = 4;
    maps\_utility::_id_24F5();
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );

    for (;;)
    {
        self setgoalpos( var_0.origin );
        self waittill( "goal" );

        if ( isdefined( var_0.animation ) )
        {
            thread _id_0515( var_0.animation, var_0 );
            return;
        }

        if ( !isdefined( var_0.target ) )
            break;

        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    }
}

_id_0515( var_0, var_1 )
{
    var_2 = maps\_utility::_id_270F( var_0 );
    var_3 = getanimlength( var_2 );
    var_1 thread maps\_anim::_id_11C1( self, var_0 );
    wait(var_3 * 0.9);
    self.allowdeath = 1;
    self.a._id_0D55 = 1;
    self kill();
}

_id_0516()
{
    self endon( "death" );
    var_0 = self.animation;

    if ( isdefined( self.target ) )
    {
        var_1 = common_scripts\utility::getstructarray( self.target, "targetname" );
        var_1 = maps\_utility::_id_0B53( var_1 );
        var_2 = var_1[0];
    }
    else
    {
        var_2 = spawnstruct();
        var_2.angles = self.angles;
        var_2.origin = self.origin;
    }

    if ( !isdefined( var_2.angles ) )
        var_2.angles = ( 0.0, 0.0, 0.0 );

    self.targetname = "drone";

    if ( isdefined( self._id_205B ) )
        var_0 = self._id_205B;
    else
        var_0 = self.animation;

    if ( !issubstr( self.model, "civ" ) )
        _id_0526();

    if ( isdefined( self._id_164F ) )
    {
        if ( self._id_164F == "cop" )
        {
            if ( !isdefined( level._id_0102 ) )
                level._id_0102 = [];

            level._id_0102[level._id_0102.size] = self;
        }
        else if ( self._id_164F == "civ" )
        {
            if ( !isdefined( level._id_0103 ) )
                level._id_0103 = [];

            level._id_0103[level._id_0103.size] = self;
        }
    }

    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "walker" )
        {
            var_2 = spawnstruct();
            var_2.angles = self.angles;
            var_2.origin = self.origin;
            _id_0517();

            if ( isdefined( level._id_0C59["drone"][var_0] ) )
                _id_0518( var_2, var_0 );

            self notify( "move" );
            self._id_203F = 80;
            self._id_2004 = 1;
            self._id_2043 = "hurried_walk";
            self._id_2045 = ::_id_051B;
            self waittill( "goal" );
            self delete();
        }
    }
    else
    {
        _id_0517();
        thread _id_0519( var_2, var_0 );
    }
}

_id_0517()
{
    if ( isdefined( self._id_7F1F ) )
        self.script_noteworthy = self._id_7F1F;
}

_id_0518( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( self._id_1288 ) )
        var_2 = 1;
    else if ( isdefined( self.script_delay ) )
        var_2 = 1;
    else if ( isdefined( self.script_delay_min ) && isdefined( self.script_delay_max ) )
        var_2 = 1;

    if ( var_2 )
    {
        thread _id_0519( var_0, var_1 );

        if ( isdefined( self._id_1288 ) )
            common_scripts\utility::flag_wait( self._id_1288 );

        maps\_utility::script_delay();
        self notify( "stop_drone_ending_idle" );
    }
}

_id_0519( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_drone_ending_idle" );
    var_2 = "drone_anim";
    self._id_1032 = "drone";
    var_3 = self._id_1032;

    if ( !isdefined( var_1 ) )
        var_1 = "standing";

    var_4 = level._id_0C59[var_3][var_1];
    wait 0.05;
    self.origin = maps\_utility::_id_2281( self.origin, 32 );
    var_5 = undefined;
    var_6 = undefined;

    for (;;)
    {
        var_7 = randomfloatrange( 0.9, 1.1 );

        if ( isarray( var_4 ) )
        {
            var_8 = maps\_anim::_id_11FD( var_3, var_1 );
            var_9 = level._id_0C59[var_3][var_1][var_8];

            if ( isdefined( level._id_0C59[var_3][var_1 + " model"] ) )
            {
                if ( isdefined( level._id_0C59[var_3][var_1 + " model"][var_8] ) )
                {
                    var_10 = level._id_0C59[var_3][var_1 + " model"][var_8];
                    var_5 = maps\_utility::_id_274A( var_10 );
                    var_6 = "tag_inhand";

                    if ( getdvar( "debug_tag" ) != "" )
                        var_6 = getdvar( "debug_tag" );

                    self attach( var_5, var_6 );
                }
            }
        }
        else
            var_9 = level._id_0C59[var_3][var_1];

        var_11 = getanimlength( var_9 );
        var_12 = spawn( "script_origin", self.origin );
        self linkto( var_12 );
        var_12 moveto( var_0.origin, 0.4, 0.2, 0.2 );
        wait 0.4;
        self unlink();
        var_12 delete();
        self setflaggedanimknoballrestart( var_2, var_9, %body, 1, 0.5, var_7 );
        var_0 thread maps\_anim::_id_0C61( self, var_2, var_1, self._id_1032 );
        var_0 thread maps\_anim::_id_0C62( self, var_2, var_1 );
        var_0 thread maps\_anim::_id_11E3( self, var_1, var_11, 0.25 );
        wait(var_11);

        if ( isdefined( var_5 ) )
        {
            self detach( var_5, var_6 );
            var_5 = undefined;
        }
    }
}

_id_0104( var_0 )
{
    var_1 = [];

    if ( var_0 == "civ" )
    {
        var_2 = 5;
        var_3 = 10;
        var_1[var_1.size] = "london_bf1_becareful";
        var_1[var_1.size] = "london_bf1_bosspissed";
        var_1[var_1.size] = "london_bf1_camera";
        var_1[var_1.size] = "london_bf1_cantsee";
        var_1[var_1.size] = "london_bf1_goingon";
        var_1[var_1.size] = "london_bf1_gonnabelate";
        var_1[var_1.size] = "london_bf1_greatonline";
        var_1[var_1.size] = "london_bf1_inbed";
        var_1[var_1.size] = "london_bf1_meeting";
        var_1[var_1.size] = "london_bf1_seethat";
        var_1[var_1.size] = "london_bf1_soldiers";
        var_1[var_1.size] = "london_bf1_tellsteve";
        var_1[var_1.size] = "london_bf1_weird";
        var_1[var_1.size] = "london_bm10_proposals";
        var_1[var_1.size] = "london_bm11_seethat";
        var_1[var_1.size] = "london_bm12_camera";
        var_1[var_1.size] = "london_bm1_battery";
        var_1[var_1.size] = "london_bm1_goingon";
        var_1[var_1.size] = "london_bm1_online";
        var_1[var_1.size] = "london_bm1_short";
        var_1[var_1.size] = "london_bm1_startshooting";
        var_1[var_1.size] = "london_bm2_lateforwork";
        var_1[var_1.size] = "london_bm3_sassoldiers";
        var_1[var_1.size] = "london_bm8_myboss";
        var_1[var_1.size] = "london_bm9_weird";
    }
    else
    {
        var_2 = 5;
        var_3 = 15;
        var_1[var_1.size] = "london_bp1_movealong";
        var_1[var_1.size] = "london_bp1_anotherway";
        var_1[var_1.size] = "london_bp2_nopictures";
        var_1[var_1.size] = "london_bp2_standback";
    }

    level endon( "truck_spawned" );
    var_4 = 0;

    for (;;)
    {
        wait(randomfloatrange( var_2, var_3 ));

        if ( var_0 == "civ" )
        {
            if ( !isdefined( level._id_0103 ) )
                continue;

            var_5 = level._id_0103;
        }
        else
        {
            if ( !isdefined( level._id_0102 ) )
                continue;

            var_5 = level._id_0102;
        }

        if ( var_5.size == 0 )
            continue;

        var_5 = common_scripts\utility::array_removeundefined( var_5 );
        var_5 = sortbydistance( var_5, level.player.origin );
        var_6 = 3;
        var_6 = int( min( var_5.size, var_6 ) );
        var_7 = var_5[randomint( var_6 )];
        thread common_scripts\utility::play_sound_in_space( var_1[var_4], var_7.origin + ( 0.0, 0.0, 60.0 ) );
        var_4++;

        if ( var_4 > var_1.size - 1 )
        {
            var_4 = 0;
            var_1 = maps\_utility::_id_0B53( var_1 );
        }
    }
}

_id_051A( var_0 )
{
    self notify( "stop_drone_drawtag" );
    self endon( "stop_drone_drawtag" );

    for (;;)
    {
        maps\_debug::_id_19A2( var_0 );
        wait 0.05;
    }
}

_id_051B()
{
    var_0 = undefined;

    if ( !isdefined( self._id_051C ) )
        self._id_051C = -1000;

    if ( gettime() > self._id_051C )
    {
        var_0 = spawnstruct();
        var_1 = level._id_0C59["drone"][self._id_2043];

        if ( !isdefined( var_1 ) )
            var_1 = level._id_0C59["generic"][self._id_2043];

        if ( isarray( var_1 ) )
        {
            var_1 = maps\_utility::_id_0B53( var_1 );
            var_0._id_2044 = var_1[0];
        }
        else
            var_0._id_2044 = var_1;

        var_2 = maps\_drone::_id_203E( var_0._id_2044 );
        var_0._id_2040 = var_2._id_2040;
        var_0._id_2041 = var_2._id_2041;
        self._id_051C = gettime() + var_2._id_2042 / self._id_0FC6 * 1000;
    }

    return var_0;
}

_id_051D()
{
    if ( !isdefined( level._id_051E ) )
        level._id_051E = [];

    level._id_051E[level._id_051E.size] = self;
}

_id_051F( var_0, var_1 )
{
    var_2 = getent( var_0, "target" );
    var_2._id_0520 = var_1;
    var_2 maps\_utility::_id_2830( ::_id_0523 );
}

_id_0521( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_2._id_0520 = var_1;
    var_2 maps\_utility::_id_2830( ::_id_0523 );
}

_id_0522( var_0 )
{
    self._id_0520 = var_0;
    maps\_utility::_id_2830( ::_id_0523 );
}

_id_0523( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( self.target, "targetname" );

    foreach ( var_3 in var_1 )
        thread _id_0525( var_3, self._id_0520 );
}

_id_0524( var_0 )
{
    thread _id_0525( self, var_0 );
}

_id_0525( var_0, var_1 )
{
    if ( isdefined( var_0._id_271A ) )
        wait(var_0._id_271A);

    var_2 = _id_059C( var_0 );
    var_2._id_2005 = undefined;

    if ( isdefined( var_0._id_2005 ) )
        var_2._id_2005 = var_0._id_2005;

    var_2.animation = undefined;

    if ( isdefined( var_0.animation ) )
        var_2.animation = var_0.animation;

    var_2._id_205B = undefined;

    if ( isdefined( var_0._id_205B ) )
        var_2._id_205B = var_0._id_205B;

    var_2.target = undefined;

    if ( isdefined( var_0.target ) )
        var_2.target = var_0.target;

    if ( isdefined( var_0._id_1692 ) )
        common_scripts\utility::flag_wait( var_0._id_1692 );

    var_3 = maps\_utility::_id_212D( var_2 );
    var_3.struct = var_0;

    if ( var_3.model == "body_london_cop" )
    {
        var_3.name = "";
        var_3 setlookattext( var_3.name, &"" );
    }

    if ( isdefined( var_0.script_noteworthy ) )
        var_3.script_noteworthy = var_0.script_noteworthy;

    if ( isdefined( var_0._id_164F ) )
        var_3._id_164F = var_0._id_164F;

    if ( isdefined( var_0._id_1288 ) )
        var_3._id_1288 = var_0._id_1288;

    if ( isdefined( var_0._id_7F1F ) )
        var_3._id_7F1F = var_0._id_7F1F;

    if ( isdefined( var_0._id_214A ) )
        var_3._id_214A = var_0._id_214A;

    if ( isdefined( var_0.script_delay ) )
        var_3.script_delay = var_0.script_delay;

    if ( isdefined( var_0.script_delay_min ) )
        var_3.script_delay_min = var_0.script_delay_min;

    if ( isdefined( var_0.script_delay_max ) )
        var_3.script_delay_max = var_0.script_delay_max;

    var_3 thread [[ var_1 ]]();
}

_id_0526()
{
    if ( self.weapon == "none" )
        return;

    maps\_utility::_id_24F5();
}

_id_0527()
{
    common_scripts\utility::flag_wait( "tube_announcer_start" );
    var_0 = [];
    var_0[var_0.size] = "london_anc_movetowardsfront";
    var_0[var_0.size] = "london_anc_movebaggage";
    var_0[var_0.size] = "london_anc_alldoors";
    var_0[var_0.size] = "london_anc_standclear";
    var_0 = maps\_utility::_id_0B53( var_0 );
    var_0 = maps\_utility::_id_2673( var_0, "london_anc_mindthegap", 0 );
    level thread _id_0528( "trainstop_speaker_path", var_0 );
    var_0 = [];
    var_0[var_0.size] = "london_anc_securityalert";
    var_0[var_0.size] = "london_anc_nosmoking";
    var_0[var_0.size] = "london_anc_alternatetransport";
    var_0[var_0.size] = "london_anc_cockfusters";
    var_0[var_0.size] = "london_anc_viawestminster";
    var_0[var_0.size] = "london_anc_flashphotography";
    var_0 = maps\_utility::_id_0B53( var_0 );
    level thread _id_0528( "tube_speaker_path", var_0 );
}

_id_0528( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_3 = 700;
    var_3 *= var_3;
    var_4 = [];
    var_5 = spawnstruct();
    var_5.delay = 0;
    var_5._id_0529 = 0;

    for ( var_6 = 0; var_6 < 2; var_6++ )
    {
        var_4[var_6] = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_4[var_6]._id_49F2 = var_6 + 1;
    }

    var_7 = 0;

    for (;;)
    {
        var_8 = _id_052B( var_2 );

        foreach ( var_6, var_10 in var_4 )
            var_10.origin = var_8[var_6].origin;

        if ( gettime() > var_5.delay && !var_5._id_0529 )
        {
            if ( distancesquared( level.player.origin, var_8[0].origin ) > var_3 )
            {
                wait 0.1;
                continue;
            }

            var_11 = var_7 % var_1.size;
            var_7++;

            if ( var_11 == 0 )
                var_1 = maps\_utility::_id_0B53( var_1 );

            var_5 thread _id_052A( var_4, var_1[var_11] );
        }

        wait 0.1;
    }
}

_id_052A( var_0, var_1 )
{
    self._id_0529 = 1;

    foreach ( var_3 in var_0 )
        var_3 playsound( var_1, "sounddone" );

    var_0[0] waittill( "sounddone" );
    self._id_0529 = 0;
    self.delay = gettime() + randomfloatrange( 5, 8 ) * 1000;
}

_id_052B( var_0 )
{
    var_1 = distancesquared( level.player.origin, var_0.origin );
    var_2 = var_0;

    while ( isdefined( var_0.target ) )
    {
        var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        var_3 = distancesquared( level.player.origin, var_0.origin );

        if ( var_3 < var_1 )
        {
            var_1 = var_3;
            var_2 = var_0;
        }
    }

    var_4 = undefined;
    var_4 = common_scripts\utility::getstruct( var_2.targetname, "target" );
    var_5 = undefined;

    if ( isdefined( var_2.target ) )
        var_5 = common_scripts\utility::getstruct( var_2.target, "targetname" );

    var_1 = 64000000;
    var_6 = [ var_2 ];
    var_7 = undefined;
    var_8 = [];

    if ( isdefined( var_4 ) )
        var_8[var_8.size] = var_4;

    if ( isdefined( var_5 ) )
        var_8[var_8.size] = var_5;

    if ( var_8.size > 0 )
    {
        var_1 = distancesquared( level.player.origin, var_8[0].origin );
        var_7 = var_8[0];
    }

    foreach ( var_10 in var_8 )
    {
        var_3 = distancesquared( level.player.origin, var_10.origin );

        if ( var_3 < var_1 )
        {
            var_1 = var_3;
            var_7 = var_10;
        }
    }

    if ( isdefined( var_7 ) )
        var_6[var_6.size] = var_7;

    return var_6;
}

_id_0105()
{
    var_0 = getentarray( "lit_poster", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_0106 );
}

_id_0106()
{
    var_0 = self getcentroid();
    var_1 = 250;
    self setcandamage( 1 );

    while ( var_1 > 0 )
    {
        self waittill( "damage", var_2 );
        var_1 -= var_2;
    }

    level thread common_scripts\utility::play_sound_in_space( "lit_poster_shot", var_0 );
    playfx( common_scripts\utility::getfx( "lit_poster" ), var_0 );
    self delete();
}

_id_052C( var_0 )
{
    var_0 endon( "death" );
    var_0 maps\_utility::script_delay();
    wait 0.5;

    while ( var_0.veh_speed > 0 )
        wait 0.5;
}
