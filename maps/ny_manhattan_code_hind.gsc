// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_46BB()
{
    return self.health - self._id_163B;
}

_id_46BC( var_0 )
{
    self.health = self._id_163B + var_0;
    self._id_29A1 = self.health;

    if ( self.maxhealth < self.health )
        self.maxhealth = self.health;
}

_id_45EA( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 _id_46BB() <= 0 )
        return 0;

    return 1;
}

_id_46BD( var_0 )
{
    self._id_46BE = 0;

    while ( self._id_46BE == 0 )
    {
        _id_46BC( var_0 );
        wait 0.05;
    }
}

_id_46BF()
{
    var_0 = getent( "player_at_hind", "targetname" );
    var_0 sethintstring( &"NY_MANHATTAN_HINT_ENTER_HIND" );
    maps\_utility::_id_262C( "player_at_hind" );
    level.player common_scripts\utility::delaycall( 2.2, ::playrumbleonentity, "falling_land" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showstance", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    level.player freezecontrols( 1 );
    level.player common_scripts\utility::delaycall( 2, ::freezecontrols, 0 );
    level._id_3C2C hide();
    thread maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_set( "entering_hind" );
    maps\_audio::aud_send_msg( "predator_disabled" );
    thread _id_4704();
    common_scripts\utility::array_thread( level._id_4689, maps\ss_util::_id_441C, "bullet", 2, 4 );
    common_scripts\utility::array_thread( level._id_468A, maps\ss_util::_id_441C, "bullet", 2, 4 );
    level.player takeallweapons();
    thread maps\ny_manhattan_code_intro::_id_45F5( "rooftop_baddies", "script_noteworthy" );
    var_0 common_scripts\utility::trigger_off();
    wait 1;
    maps\_utility::_id_11F4( "manhattan_hp1_exfilcomplete" );
    maps\_utility::_id_11F4( "manhattan_snd_vertical" );
    maps\_utility::_id_11F4( "manhattan_snd_getonit" );
}

_id_46C0( var_0 )
{
    var_1 = level._id_46C1[var_0._id_1032];
    level._id_4483 maps\_anim::_id_11CF( var_0, "ny_manhattan_blackhawk_idle_nl", var_1 );
    var_0 linkto( level._id_4483, var_1 );

    if ( var_0 == level._id_45C0 )
        level._id_4483 thread maps\_anim::_id_124E( var_0, "blackhawk_land_idle", "end_loop", var_1 );
    else
        level._id_4483 thread maps\_anim::_id_124E( var_0, "ny_manhattan_blackhawk_idle", "end_loop", var_1 );
}

_id_46C2( var_0 )
{
    if ( isdefined( level._id_46C3 ) && level._id_46C3 )
        return;

    if ( !isdefined( level._id_45A3 ) )
    {
        level._id_45A3 = [];
        var_1 = getentarray( "squad_1", "targetname" );
        var_2 = 0;

        foreach ( var_4 in var_1 )
        {
            var_5 = var_4 maps\_utility::_id_166F( 1 );

            if ( var_5.script_noteworthy == "leader" )
            {
                level._id_45C0 = var_5;
                level._id_45C0._id_1032 = "lonestar";
            }
            else if ( var_5.script_noteworthy == "truck" )
            {
                level._id_45C4 = var_5;
                level._id_45C4._id_1032 = "truck";
            }
            else
            {
                level._id_45A6 = var_5;
                level._id_45A6._id_1032 = "reno";
            }

            var_5 maps\_utility::_id_0D04();
            level._id_45A3[level._id_45A3.size] = var_5;
            var_2++;
        }
    }

    level._id_46C3 = 1;

    foreach ( var_8 in level._id_45A3 )
    {
        if ( var_8 != level._id_45C0 || !isdefined( var_0 ) || var_0 )
            thread _id_46C0( var_8 );
    }
}

_id_46C4( var_0 )
{
    common_scripts\utility::flag_init( "incoming_missiles" );
    common_scripts\utility::flag_init( "stop" );
    common_scripts\utility::flag_init( "go" );
    common_scripts\utility::flag_init( "trigger_little_chase" );
    common_scripts\utility::flag_init( "start_blown_cover" );
    common_scripts\utility::flag_init( "start_hind_dialogue_intro" );
    common_scripts\utility::flag_init( "end_hind_dialogue_intro" );
    common_scripts\utility::flag_init( "aud_vo_cover_blown" );
    common_scripts\utility::flag_init( "aud_vo_hind_start" );
    common_scripts\utility::flag_init( "cover_blown" );
    common_scripts\utility::flag_init( "start_finale" );
    common_scripts\utility::flag_init( "aud_vo_chase" );
    common_scripts\utility::flag_init( "aud_vo_lost_him" );
    level._id_46C5 = getentarray( "helicopter_crash_location", "targetname" );
    level._id_4483 _id_46BC( 22135 );
    level._id_4483.name = "player_hind";

    foreach ( var_2 in level._id_4483._id_0A39 )
        var_2 delete();

    level._id_4483._id_0A39 = [];

    if ( !isgodmode( level.player ) )
        level._id_4483.godmode = 0;

    level._id_46C6 = undefined;
    level._id_46C7 = 0;
    level._id_46C8 = 15000;
    level._id_46C9 = 90;
    level._id_46CA = [ "reno_line26", "manhattan_rno_goodwork", "manhattan_snd_goodkill" ];
    level._id_46CB = 0;

    if ( !isdefined( var_0 ) )
    {
        thread _id_4702();
        thread _id_46D7();
        thread _id_4712();
        thread _id_470C();
        thread _id_470D();
        thread _id_4705();
        thread _id_46FD();
        thread _id_46FE();
        thread _id_46FF();
        thread _id_46E9();
        thread _id_46F1();
        thread _id_46DF();
        thread _id_46E8();
    }
    else
        common_scripts\utility::flag_set( "player_encountered" );

    thread _id_46CE();
    thread _id_46DB();
    thread _id_46DE();
    thread _id_4710();
    thread _id_4729();
    thread _id_4739();
    var_4 = getent( "hind_crash_construction", "targetname" );
    var_4 thread _id_0075();
}

_id_46CC()
{

}

_id_46CD()
{
    wait 2;

    for (;;)
    {
        wait 0.05;
        var_0 = level._id_4483 _id_46BB();
    }
}

_id_46CE()
{
    common_scripts\utility::flag_wait( "player_encountered" );
    var_0 = undefined;
    level._id_46CF = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 = level.player geteye();
    var_0 = missile_createattractorent( level.player, 1500, 99999 );
    var_2 = undefined;
    level._id_46D0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2 = missile_createattractorent( level._id_46D0, 10000, 999999 );
    level._id_46CF moveto( ( 0.0, 0.0, 0.0 ), 0.05, 0, 0 );
}

_id_46D1( var_0, var_1 )
{
    self endon( "death" );
    level endon( "finale_playing" );
    self._id_46D2 = 0;
    wait(var_0);
    var_2 = 0.5;
    var_3 = missile_createattractorent( level.player, 10000, 999999 );

    while ( self._id_46D2 == 0 )
    {
        thread _id_46D9( 1 );
        var_2 += var_2;
        wait(randomfloatrange( 1.0, 3.0 ));
    }
}

_id_46D3( var_0, var_1 )
{
    var_2 = var_0 / 0.05;
    var_3 = 0;

    while ( var_2 > var_3 )
    {
        var_4 = level.player geteye();
        var_1 moveto( var_4, 0.05, 0, 0 );
        var_3++;
        wait 0.05;
    }
}

_id_46D4( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );
    self._id_46BE = 0;

    while ( var_1 && !self._id_46BE )
    {
        foreach ( var_4 in var_2 )
        {
            if ( _id_45EA( self ) )
            {
                var_5 = randomfloatrange( 0.5, 1.5 );
                thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 1, var_4 );
                level._id_46D0 moveto( var_4.origin, 0.05, 0, 0 );
                wait(var_5);
            }
        }

        level._id_46D0 moveto( ( 0.0, 0.0, 0.0 ), 0.05, 0, 0 );
        wait(randomfloatrange( 1.0, 3.0 ));
    }

    if ( !var_1 )
    {
        foreach ( var_4 in var_2 )
        {
            var_5 = randomfloatrange( 0.5, 1.0 );
            thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 1, var_4 );
            wait(var_5);
        }
    }
}

_id_46D5( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( var_1 ) )
        wait(var_1);

    maps\_audio::aud_send_msg( "start_blown_cover" );
    thread _id_46D9( 3, 1 );
}

_id_45E9( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.707;

    if ( !isdefined( var_2 ) )
        var_2 = 0.94;

    if ( !common_scripts\utility::flag( "stop_shooting" ) && maps\_utility::within_fov( level.player geteye(), level.player getplayerangles(), self.origin, var_1 ) )
    {
        if ( maps\_utility::within_fov( self.origin, self.angles, var_0.origin, var_2 ) )
            return 1;
    }

    return 0;
}

_id_46D6( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );
    self endon( "stop_ai" );

    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_wait( var_1 );

    if ( isdefined( var_0 ) )
        wait(var_0);

    thread maps\ny_hind_ai::_id_4538();
    thread maps\ny_hind_ai::_id_4534();

    if ( isdefined( var_3 ) && var_3 )
        return;

    var_4 = undefined;
    var_5 = undefined;

    for (;;)
    {
        wait 0.1;

        if ( _id_45E9( level._id_4483 ) )
        {
            var_6 = 2;

            if ( randomfloat( 100 ) > 75 )
            {
                var_6 = 3;

                if ( randomfloat( 100 ) > 75 )
                    var_6 = 4;
            }

            if ( isdefined( var_2 ) && var_2 == 1 )
            {
                if ( isdefined( var_4 ) )
                    missile_deleteattractor( var_4 );

                var_7 = randomintrange( 240, 1200 );
                var_4 = missile_createrepulsorent( level._id_4483, 10000, var_7 );
            }
            else if ( isdefined( var_2 ) && var_2 == 0 )
            {
                if ( isdefined( var_5 ) )
                    missile_deleteattractor( var_5 );

                var_8 = randomfloatrange( -8, 8 );
                var_9 = randomfloatrange( 0, 8 );
                var_10 = ( var_8, var_9, 0 );
            }

            thread _id_46D9( var_6 );
            wait(randomfloatrange( 2, 5 ));
        }
    }
}

_id_46D7()
{
    for (;;)
    {
        wait 0.05;
        common_scripts\utility::flag_wait( "incoming_missiles" );
        wait 0.05;
        common_scripts\utility::flag_clear( "incoming_missiles" );
        wait 1;
        wait 5;
    }
}

_id_46D8()
{
    self._id_46BE = 0;

    for (;;)
    {
        wait 0.05;

        while ( _id_45EA( self ) && self._id_46BE == 0 )
        {
            var_0 = randomint( 2 );
            var_1 = randomfloatrange( 1, 3 );
            thread _id_46D9( var_0 );
            wait(var_1);
        }
    }
}

_id_46D9( var_0, var_1 )
{
    level endon( "finale_playing" );
    var_2 = level.player geteye();
    level._id_46CF.origin = var_2;
    level._id_46D0.origin = ( 0.0, 0.0, 0.0 );

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_4 = randomfloatrange( 0.1, 0.25 );
        thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 1, level.player );
        wait(var_4);
    }
}

_id_46DA( var_0, var_1 )
{
    level endon( "finale_playing" );
    var_2 = level.player geteye();
    var_3[0] = ( var_2[0], var_2[1], var_2[2] + 200 );
    var_3[1] = ( var_2[0] + 300, var_2[1], var_2[2] - 100 );
    var_3[2] = ( var_2[0] - 300, var_2[1] + 64, var_2[2] - 100 );
    var_3[3] = ( var_2[0] - 300, var_2[1] + 64, var_2[2] + 100 );
    var_3[4] = ( var_2[0] + 300, var_2[1], var_2[2] + 100 );
    level.player enableinvulnerability();
    var_4 = missile_createattractororigin( var_3[0], 10000, 99999 );
    level._id_46D0.origin = ( 0.0, 0.0, 0.0 );

    for ( var_5 = 0; var_5 < var_0; var_5++ )
    {
        var_6 = randomint( 5 );
        var_7 = randomfloatrange( 0.25, 0.65 );
        thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 1, level.player );
        missile_deleteattractor( var_4 );
        var_4 = missile_createattractororigin( var_3[var_6], 10000, 99999 );
        wait(var_7);
    }

    missile_deleteattractor( var_4 );
    wait 1.5;
    level.player disableinvulnerability();
}

_id_46DB()
{
    level._id_4483 endon( "death" );

    for (;;)
    {
        wait 0.05;

        if ( level._id_46C7 == 1 && isdefined( level._id_0A4C ) && level._id_0A4C _id_46BB() > 0 )
        {
            while ( level._id_46C7 == 1 && isdefined( level._id_0A4C ) && level._id_0A4C _id_46BB() > 0 )
            {
                if ( level._id_0A4C _id_46BB() > 0 && _id_45EA( level._id_4483 ) )
                {
                    var_0 = vectortoyaw( level._id_0A4C.origin - level._id_4483.origin );
                    level._id_4483 maps\ny_hind::_id_4502( var_0 + level._id_46C9 );
                    wait 0.05;
                }
            }

            level._id_4483 maps\ny_hind::_id_4504();
        }
    }
}

_id_46DC( var_0 )
{
    level._id_4483 endon( "death" );
    self endon( "death" );
    var_1 = 0;
    var_0 *= 60;
    self._id_46DD = 0;

    while ( _id_45EA( self ) && ( var_1 < var_0 || var_0 < 0 ) && self._id_46DD == 0 )
    {
        var_2 = vectortoyaw( level._id_4483.origin - self.origin );
        maps\ny_hind::_id_4502( var_2 );

        if ( var_0 >= 0 )
            var_1++;

        wait 0.05;
    }

    maps\ny_hind::_id_4504();
}

_id_46DE()
{
    for (;;)
    {
        wait 0.05;

        if ( !_id_45EA( level._id_0A4C ) && level._id_46C7 == 1 )
            level._id_46C7 = 0;
    }
}

_id_46DF()
{
    common_scripts\utility::flag_init( "encounter1_center_view" );
    common_scripts\utility::flag_init( "encounter2_center_view" );
    common_scripts\utility::flag_init( "encounter3_center_view" );
    common_scripts\utility::flag_init( "encounter4_favor_back" );
    common_scripts\utility::flag_init( "encounter4b_allow_forward" );
    common_scripts\utility::flag_init( "encounter5_center_view" );
    common_scripts\utility::flag_init( "encounter6_slim_front" );
    wait 1;
    maps\ny_blackhawk::_id_458B( 65, 75, 25, 45, 1.5 );
    thread _id_46E0();
    thread _id_46E1();
    thread _id_46E2();
    thread _id_46E3();
    thread _id_46E4();
    thread _id_46E5();
    thread _id_46E6();
}

_id_46E0()
{
    level endon( "encounter1_center_view" );
    common_scripts\utility::flag_wait( "spawn_hind02b" );
    maps\ny_blackhawk::_id_458B( 75, 75, 25, 35, 1.5 );
}

_id_46E1()
{
    level endon( "encounter2_center_view" );
    common_scripts\utility::flag_wait( "encounter1_center_view" );
    maps\ny_blackhawk::_id_458B( 75, 75, 35, 35, 1 );
}

_id_46E2()
{
    level endon( "encounter3_center_view" );
    common_scripts\utility::flag_wait( "encounter2_center_view" );
    wait 1.5;
    maps\ny_blackhawk::_id_458B( 15, 15, 15, 15, 1 );
    wait 2;
    maps\ny_blackhawk::_id_458B( 45, 45, 25, 25, 1 );
}

_id_46E3()
{
    level endon( "encounter4_favor_back" );
    common_scripts\utility::flag_wait( "encounter3_center_view" );
    maps\ny_blackhawk::_id_458B( 85, 0, 15, 15, 0.1 );
    wait 2.5;
    maps\ny_blackhawk::_id_458B( 85, 55, 15, 35, 1 );
}

_id_46E4()
{
    level endon( "encounter5_center_view" );
    common_scripts\utility::flag_wait( "encounter4_favor_back" );
    maps\ny_blackhawk::_id_458B( 85, 75, 40, 35, 0.1 );
}

_id_46E5()
{
    level endon( "encounter6_slim_front" );
    common_scripts\utility::flag_wait( "encounter5_center_view" );
    maps\ny_blackhawk::_id_458B( 30, 0, 30, 30, 1.5 );
    wait 1;
    maps\ny_blackhawk::_id_458B( 75, 75, 35, 35, 0.5 );
}

_id_46E6()
{
    common_scripts\utility::flag_wait( "encounter6_slim_front" );
    maps\ny_blackhawk::_id_458B( 75, 75, 35, 35, 0.5 );
}

_id_46E7( var_0, var_1 )
{
    if ( var_0 == 0 )
        maps\ny_blackhawk::_id_458B( 75, 75, 35, 35, var_1 );

    if ( var_0 == 1 )
        maps\ny_blackhawk::_id_458B( -50, 85, 35, 5, var_1 );

    if ( var_0 == 2 )
        maps\ny_blackhawk::_id_458B( 75, -20, 35, 35, var_1 );

    if ( var_0 == 3 )
        maps\ny_blackhawk::_id_458B( 35, 35, 35, 35, var_1 );
}

_id_46E8()
{
    while ( !common_scripts\utility::flag( "bring_the_pain01" ) )
        wait 1;

    wait 0.5;
}

_id_46E9()
{
    common_scripts\utility::flag_wait( "bring_the_pain01" );

    if ( !isdefined( level._id_46EA ) )
    {
        if ( _id_45EA( level._id_46EB ) )
            level._id_46EB thread _id_470A( 1.5, 4 );

        if ( _id_45EA( level._id_46C6 ) )
            level._id_46C6 thread _id_470A( 1.5, 4 );
    }
    else
    {
        common_scripts\utility::flag_wait( "break_for_it" );
        var_0 = common_scripts\utility::getstruct( "chase_helis_fly_off", "targetname" );
        level._id_46EB thread _id_46EC( var_0 );
        wait 1.75;
        level._id_46C6 thread _id_46EC( var_0 );
    }
}

_id_46EC( var_0 )
{
    self endon( "death" );

    if ( isdefined( self ) && isalive( self ) )
    {
        maps\ny_hind::_id_4501();
        self._id_46DD = 1;
        thread maps\_vehicle::_id_26A1( var_0 );
    }
}

_id_46ED()
{
    var_0 = level._id_46EB _id_46BB();
    var_1 = level._id_46C6 _id_46BB();
    var_2 = var_0 / 3;

    for (;;)
    {
        wait 0.05;
        var_3 = level._id_46EB _id_46BB();
    }
}

_id_46EE()
{
    var_0 = ( -1100.0, -500.0, 240.0 );
    var_1 = ( -500.0, -1450.0, 240.0 );
    level._id_46C6 setyawspeed( 240, 60 );
    level._id_46C6 thread maps\ny_hind::_id_44FD( 100, 160, 100 );
    level._id_46C6 maps\ny_hind::_id_4514( var_0, 0, 1 );
    level._id_46C6 thread _id_46BC( 3900 );
    wait 1.25;
    level._id_46C6 notify( "stop_shooting" );

    if ( _id_45EA( level._id_46C6 ) )
        level._id_46C6 setmaxpitchroll( 20, 50 );
}

_id_46EF()
{

}

_id_46F0( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_1 = self.origin - level._id_4483.origin;
        var_2 = var_1[2] < 0;
        var_1 = ( var_1[0], var_1[1], 0 );
        var_3 = undefined;
        var_4 = 999999;
        var_5 = undefined;
        var_6 = var_4;

        foreach ( var_8 in level._id_46C5 )
        {
            var_9 = var_8.origin - self.origin;
            var_10 = vectordot( var_1, var_9 );
            var_11 = distance( var_8.origin, self.origin );
            var_12 = self.origin[2] < var_8.origin[2];

            if ( var_2 && !var_12 )
                var_11 *= 2.0;

            if ( !var_2 && var_12 )
                var_11 *= 2.0;

            if ( var_11 < var_4 )
            {
                var_4 = var_11;
                var_3 = var_8;
            }

            if ( var_10 > 0 && var_11 < var_6 )
            {
                var_6 = var_11;
                var_5 = var_8;
            }
        }

        if ( isdefined( var_5 ) )
            self._id_29DC = var_5;
        else
            self._id_29DC = var_3;

        if ( isdefined( var_0 ) )
        {
            var_14 = self vehicle_getvelocity();
            var_15 = var_0 vehicle_getvelocity();
            var_16 = self.origin - var_0.origin;

            if ( vectordot( var_14, var_16 ) > 0 )
            {
                if ( var_16[2] < 0 )
                    self._id_29DD = 600;
                else
                    self._id_29DD = 600;

                self._id_29DE = 1;
            }
            else
            {
                self._id_29DD = undefined;
                self._id_29DE = undefined;
            }
        }

        wait 0.05;
    }
}

_id_46F1()
{
    common_scripts\utility::flag_wait( "spawn_hind06b" );
    wait 1;
    common_scripts\utility::flag_wait( "hind06b_to_follow" );
    wait 1;
    var_0 = level._id_46EB;
    var_1 = level._id_46C6;

    if ( _id_45EA( var_0 ) )
    {
        var_0._id_46BE = 1;
        var_0 thread _id_46BC( level._id_46C8 );
    }

    if ( _id_45EA( var_1 ) )
    {
        var_1._id_46BE = 1;
        var_1 thread _id_46BC( level._id_46C8 );
    }

    level._id_46F2 = ( -2100.0, -120.0, 100.0 );
    level._id_46F3 = ( -1100.0, -420.0, 240.0 );
    level._id_46F4 = ( -1100.0, -420.0, 740.0 );
    var_2 = ( -1500.0, -720.0, 1000.0 );
    var_3 = ( -1500.0, -1010.0, 700.0 );
    var_4 = ( 1500.0, 100.0, 400.0 );
    var_5 = ( -900.0, 720.0, 1000.0 );
    var_6 = 0;
    var_7 = 0;
    var_8 = level._id_46C8;
    var_9 = var_8 / 3;
    level._id_46F5 = 0;
    level._id_46F6 = var_0;
    level._id_46F7 = var_1;
    thread _id_46F8( 0 );

    if ( _id_45EA( level._id_46F7 ) )
        level._id_46F7 thread _id_46D8();

    var_10 = 0;

    while ( var_10 == 0 && ( _id_45EA( var_0 ) || _id_45EA( var_1 ) ) )
    {
        while ( _id_45EA( var_0 ) )
            wait 0.05;

        if ( _id_45EA( var_1 ) )
        {
            wait 3;

            if ( var_6 == 0 )
            {
                var_6 = 1;
                level._id_46F6 = var_1;

                while ( _id_45EA( var_1 ) && !isdefined( var_1._id_4515 ) )
                    wait 0.05;

                if ( _id_45EA( var_1 ) )
                {
                    var_1 maps\ny_hind::_id_4514( level._id_46F3, 0, 2 );
                    var_8 = var_1 _id_46BB();
                }
            }

            if ( _id_45EA( var_1 ) && var_1 _id_46BB() <= 8000 )
                var_1 thread _id_46BC( 8000 );
        }

        while ( _id_45EA( var_1 ) && var_1 _id_46BB() > 8000 )
            wait 0.05;

        if ( _id_45EA( var_1 ) )
        {
            var_10 = 1;
            wait 0.05;
        }
    }
}

_id_46F8( var_0 )
{
    level._id_46F6 endon( "death" );
    var_1 = level._id_46F6 _id_46BB();
    var_2 = var_1 / 10;
    var_3 = level._id_46F3[0];
    var_4 = level._id_46F3[1];
    var_5 = level._id_46F3[2];

    while ( _id_45EA( level._id_46F6 ) )
    {
        wait 0.05;

        while ( level._id_46F5 == 1 )
            wait 0.05;

        if ( _id_45EA( level._id_46F6 ) )
        {
            var_6 = level._id_46F6 _id_46BB();

            if ( var_6 < var_1 - var_2 )
            {
                var_1 = level._id_46F6 _id_46BB();
                var_7 = 100 + randomint( 300 );
                var_8 = randomint( 3 );

                if ( var_8 == 1 )
                    level._id_46F6 thread maps\ny_hind::_id_4514( ( var_3, var_4 + var_7, var_5 ), var_0, 0.75 );

                if ( var_8 == 2 )
                    level._id_46F6 thread maps\ny_hind::_id_4514( ( var_3, var_4, var_5 + var_7 ), var_0, 0.75 );

                if ( var_8 == 3 )
                    level._id_46F6 thread maps\ny_hind::_id_4514( ( var_3 - var_7, var_4, var_5 ), var_0, 0.75 );

                wait 1.25;
                level._id_46F6 thread maps\ny_hind::_id_4514( ( var_3, var_4, var_5 ), var_0, 1 );
            }
        }
    }
}

_id_46F9( var_0, var_1, var_2, var_3 )
{
    if ( var_1 )
    {
        var_4 = maps\_vehicle::_id_2881( var_0 );
        var_4._id_44F7 = "normal";
        var_4._id_4507 = var_0;
    }
    else
        var_4 = maps\_vehicle::_id_2A99( var_0 );

    var_4.name = var_0;
    var_4 _id_46BC( var_2 );
    var_4 enableaimassist();
    var_4 maps\_vehicle::_id_29F7( "mig_rumble", 0.1, 0.2, 900, 0.05, 0.05 );
    var_4 thread _id_4737();
    var_4 thread _id_03C9::_id_46FA();
    var_4 thread maps\ny_manhattan_code_intro::_id_45BD();
    var_4 thread _id_0073();

    if ( !isdefined( var_3 ) )
        var_4 thread _id_4701();

    return var_4;
}

_id_0073()
{
    self endon( "crash_done" );
    level endon( "surprise_follower" );
    self waittill( "deathspin" );
    self._id_0074 = 1;
}

_id_0075()
{
    level endon( "surprise_follower" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0 ) && isdefined( var_0._id_0074 ) && var_0._id_0074 )
            var_0 notify( "goal" );
    }
}

_id_46FB( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_0 maps\_utility::_id_168C( var_1 );

    if ( isdefined( var_2 ) )
        maps\_utility::_id_11F4( var_1 );
}

_id_46FC()
{
    common_scripts\utility::flag_wait( "aud_vo_hind_start" );
    common_scripts\utility::flag_set( "start_hind_dialogue_intro" );
    wait 2;
    common_scripts\utility::flag_set( "end_hind_dialogue_intro" );
    maps\_audio::aud_send_msg( "begin_hind_conversation" );
    maps\_utility::_id_11F4( "manhattan_hqr_newdirective" );
    maps\_utility::_id_11F4( "manhattan_snd_rpgrpg" );
    maps\_utility::_id_11F4( "manhattan_hqr_assaultvessel" );
    maps\_utility::_id_11F4( "manhattan_snd_rogerlast" );
    common_scripts\utility::flag_set( "end_new_orders_dialogue" );
    maps\_utility::_id_11F4( "manhattan_hqr_enemybirds" );
    maps\_audio::aud_send_msg( "end_hind_conversation" );
}

_id_46FD()
{
    common_scripts\utility::flag_wait( "player_encountered" );
    maps\_audio::aud_send_msg( "begin_hind_conversation" );

    if ( !common_scripts\utility::flag( "stop_sneaky_dialog" ) )
        maps\_utility::_id_11F4( "manhattan_trk_enemybird" );

    if ( !common_scripts\utility::flag( "stop_sneaky_dialog" ) )
        common_scripts\utility::flag_set( "encounter1_center_view" );

    wait 1;
    common_scripts\utility::flag_set( "cover_blown" );
    wait 1.5;
    maps\_audio::aud_send_msg( "end_hind_conversation" );
    common_scripts\utility::flag_wait( "stop_sneaky_dialog" );
    wait 1;
    maps\_audio::aud_send_msg( "begin_hind_conversation" );
    maps\_utility::_id_11F4( "manhattan_trk_stayonhim" );
    maps\_utility::_id_11F4( "manhattan_snd_russianbird" );
    maps\_audio::aud_send_msg( "end_hind_conversation" );
}

_id_46FE()
{
    common_scripts\utility::flag_wait( "aud_vo_chase" );
    wait 2;
    maps\_utility::_id_11F4( "manhattan_trk_hindsinbound" );
    common_scripts\utility::flag_wait( "hind06b_to_follow" );
    maps\_audio::aud_send_msg( "begin_hind_conversation" );
    maps\_utility::_id_11F4( "manhattan_trk_takingheavyfire" );
    maps\_utility::_id_11F4( "manhattan_hp1_evasiveaction" );
    common_scripts\utility::flag_wait( "spawn_next_hind" );
    thread maps\_utility::_id_11F4( "manhattan_snd_scansectors" );
    maps\_audio::aud_send_msg( "end_hind_conversation" );
}

_id_46FF()
{
    common_scripts\utility::flag_wait( "pre_surprise_follower" );
    wait 0.5;
    maps\_audio::aud_send_msg( "begin_hind_conversation" );
    common_scripts\utility::flag_set( "encounter5_center_view" );
    maps\_utility::_id_11F4( "manhattan_rno_lostem" );
    wait 0.75;
    maps\_utility::_id_11F4( "manhattan_snd_hindhindhind" );
    common_scripts\utility::flag_set( "encounter6_slim_front" );
    level._id_46C9 = 25;
    maps\_utility::_id_11F4( "manhattan_hp1_holdon" );
    wait 1.5;
    maps\_utility::_id_11F4( "manhattan_rno_behindbuilding" );
    maps\_utility::_id_11F4( "manhattan_snd_beadonhim" );
    maps\_utility::_id_11F4( "manhattan_snd_firefirefire" );
    maps\_audio::aud_send_msg( "end_hind_conversation" );
}

_id_4700()
{
    maps\_anim::_id_1267( "enemyhind", "trk_lookout", "trk_lookout", "ny_manhattan_hind_finale" );
    maps\_anim::_id_1267( "hind", "snd_werehit", "snd_werehit", "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1267( "hind", "rno_hangon", "rno_hangon", "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1267( "hind", "trk_goingdown", "trk_goingdown", "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1267( "hind", "snd_perssureinpedals", "snd_perssureinpedals", "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1267( "hind", "rno_holdon", "rno_holdon", "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1267( "hind", "snd_enroute", "snd_enroute", "ny_manhattan_hind_finale2" );
    common_scripts\utility::flag_wait( "trk_lookout" );
    thread maps\_utility::_id_11F4( "manhattan_trk_lookout" );
    common_scripts\utility::flag_wait( "snd_werehit" );
    thread maps\_utility::_id_11F4( "manhattan_snd_werehit" );
    common_scripts\utility::flag_wait( "rno_hangon" );
    thread maps\_utility::_id_11F4( "manhattan_rno_hangon" );
    common_scripts\utility::flag_wait( "trk_goingdown" );
    maps\_utility::_id_11F4( "manhattan_trk_goingdown" );
    common_scripts\utility::flag_wait( "snd_perssureinpedals" );
    maps\_utility::_id_11F4( "manhattan_hp1_pressure" );
    thread maps\_utility::_id_11F4( "manhattan_hp1_comeon" );
    common_scripts\utility::flag_wait( "rno_holdon" );
    thread maps\_utility::_id_11F4( "manhattan_rno_holdon" );
    common_scripts\utility::flag_wait( "snd_enroute" );
    maps\_utility::_id_11F4( "manhattan_hp1_fuel70percent" );
    maps\_audio::aud_send_msg( "mus_vo_sandman_enroute" );
    maps\_utility::_id_11F4( "manhattan_snd_enroute" );
    maps\_utility::_id_11F4( "manhattan_hqr_skiesclear" );
}

_id_4701()
{
    while ( _id_45EA( self ) )
        wait 0.05;

    var_0 = level._id_46CA[level._id_46CB];
    level._id_46CB = ( level._id_46CB + 1 ) % level._id_46CA.size;

    if ( var_0 == "reno_line26" )
        level._id_45A6 maps\_utility::_id_168C( "reno_line26" );
    else
        maps\_utility::_id_11F4( var_0 );

    wait 5;
    self notify( "near_goal" );
}

_id_4702()
{
    wait 1;
    thread _id_46FC();
    common_scripts\utility::flag_set( "aud_vo_hind_start" );
    wait 2;
    level._id_4483.godmode = 0;
    level._id_4703 = common_scripts\utility::getstruct( "blackhawk_startpath", "targetname" );
    level._id_4483 thread maps\_vehicle::_id_26A1( level._id_4703 );
    level._id_4483 vehicle_setspeed( 15, 5, 5 );
    level._id_4483 vehicle_setspeed( 40, 10, 5 );
}

_id_4704()
{
    common_scripts\utility::flag_init( "end_new_orders_dialogue" );
    level._id_4483.godmode = 1;
    var_0 = getentarray( "bh_roof_01", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_utility::_id_166F( 1 );
        var_3.goalradius = 512;
    }

    common_scripts\utility::flag_wait( "end_new_orders_dialogue" );
    level._id_4483.godmode = 0;
}

_id_4705()
{
    common_scripts\utility::flag_init( "stop_sneaky_dialog" );
    common_scripts\utility::flag_wait( "spawn_hind02" );
    level._id_4706 = _id_46F9( "hind_battle_hind02b", 1, level._id_46C8, 1 );
    level._id_4706.godmode = 1;
    maps\_audio::aud_send_msg( "spawn_hind02b", level._id_4706 );
    wait 4;
    level._id_4707 = _id_46F9( "hind_battle_hind02", 1, 15000, 1 );
    level._id_4707 setmaxpitchroll( 20, 60 );
    maps\_audio::aud_send_msg( "spawn_hind02", level._id_4707 );
    wait 0.5;
    var_0 = level._id_4706 _id_46BB();
    var_1 = var_0;
    thread _id_4709();
    common_scripts\utility::flag_wait( "player_encountered" );
    level._id_0A4C = level._id_4706;
    level._id_4706 thread _id_46DC( -1 );
    common_scripts\utility::flag_wait_or_timeout( "enemy_shooter01", 2.5 );
    level._id_46C7 = 1;
    var_2 = common_scripts\utility::getstruct( "hover_and_fire", "targetname" );
    level._id_4706 thread maps\ny_hind::_id_4506( var_2, 2, 240 );
    level._id_4706 maps\ny_hind::_id_44FD( 5, 20, 20 );
    level._id_4483 maps\ny_hind::_id_44FD( 10, 20, 20 );
    common_scripts\utility::flag_set( "aud_vo_cover_blown" );
    thread _id_4708();
    common_scripts\utility::flag_set( "cover_blown" );
    common_scripts\utility::flag_set( "stop_sneaky_dialog" );
    wait 0.05;
    level._id_4706 setyawspeed( 240, 60 );
    var_3 = common_scripts\utility::getstruct( "hind_02b_outi", "targetname" );
    level._id_4706 thread maps\_vehicle::_id_26A1( var_3 );
    level._id_4706 maps\ny_hind::_id_44FD( 60, 100, 90 );
    level._id_4706 setmaxpitchroll( 30, 60 );
    level._id_4706 notify( "stop_shooting" );
    common_scripts\utility::flag_set( "trigger_little_chase" );
    level._id_4706._id_46BE = 1;
    level._id_4706._id_46DD = 1;
}

_id_4708()
{
    if ( isdefined( level._id_4706 ) )
    {
        maps\_audio::aud_send_msg( "cover_blown" );
        level._id_4706 thread _id_46D6( undefined, undefined, undefined, 1 );
        level._id_4706 thread _id_470A( 4, 100 );
        level._id_4706 thread _id_46DA( 5 );
        wait 1;
        level._id_4706 notify( "stop_ai" );
    }
}

_id_4709()
{
    common_scripts\utility::flag_wait( "hind_stealthy_kill" );
    var_0 = common_scripts\utility::getstruct( "stealthy_kill_path", "targetname" );
    level._id_4483 thread maps\ny_hind::_id_4506( var_0, 4, 240 );
    common_scripts\utility::flag_wait( "trigger_little_chase" );
    wait 1;
    maps\_autosave::_id_1C3F();
    var_0 = common_scripts\utility::getstruct( "little_chase", "targetname" );
    level._id_4483 thread maps\ny_hind::_id_4506( var_0, 0.5, 240 );
    level._id_4483 maps\ny_hind::_id_44FD( 60, 60, 60 );
    wait 3;
    common_scripts\utility::flag_set( "spawn_hind03b" );
}

_id_470A( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_shooting" );

    while ( !isdefined( self._id_4535 ) || !isdefined( self._id_4535["around_radius"] ) )
        wait 0.05;

    self._id_4535["sweepspeed"] = 10;
    self._id_4535["sweepcount"] = 0;
    self._id_4535["delay"] = 0.0;
    self._id_4535["delayrange"] = 0.1;
    self._id_4535["mintimebtnfires"] = 0.05;
    self._id_4535["maxtimebtnfires"] = 0.3;

    if ( !isdefined( var_1 ) )
        var_1 = 10;

    var_2 = self._id_4535["around_radius"];

    if ( var_0 > 0 )
    {
        var_3 = var_2 - var_1;
        var_3 = 0.05 * var_3 / var_0;

        while ( var_0 > 0 )
        {
            var_2 -= var_3;

            if ( var_2 <= var_1 )
                var_2 = var_1;

            self._id_4535["around_radius"] = var_2;
            var_0 -= 0.05;
            wait 0.05;
        }
    }
    else
        self._id_4535["around_radius"] = var_1;
}

_id_470B( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    _id_470A( var_1 );
}

_id_470C()
{
    common_scripts\utility::flag_wait( "spawn_hind03b" );
    level.player enableinvulnerability();
    common_scripts\utility::flag_set( "start_blown_cover" );
    level._id_46C6 = _id_46F9( "hind_battle_hind03b", 1, 3 * level._id_46C8 );
    maps\_audio::aud_send_msg( "spawn_hind03b", level._id_46C6 );
    level._id_46C6 thread _id_46D6( 0.05, "enemy_fire_01", 0 );
    level._id_46C6 thread _id_46F0();
    level._id_46C6 setmaxpitchroll( 10, 60 );
    common_scripts\utility::flag_set( "encounter2_center_view" );
    common_scripts\utility::flag_wait( "fire_point_01" );
    level._id_4483 maps\ny_hind::_id_44FD( 0, 20, 20 );
    common_scripts\utility::flag_wait( "start_blown_cover" );
    level._id_4483 setmaxpitchroll( 10, 5 );
    level._id_46C6 thread _id_46D5( "enemy_fire_01" );
    common_scripts\utility::flag_wait( "enemy_fire_01" );
    wait 2.28;
    level._id_4483 maps\ny_hind::_id_44FD( 60, 90, 5 );
    level._id_0A4C = level._id_46C6;
    level._id_46C7 = 1;
    level._id_4483 setmaxpitchroll( 50, 30 );
    level._id_46C9 = 145;
    common_scripts\utility::flag_set( "encounter3_center_view" );
    common_scripts\utility::flag_wait( "hind03b_follow_player" );
    level.player disableinvulnerability();
    var_0 = ( -2100.0, -900.0, 240.0 );
    wait 2;
    level._id_46C6 thread maps\ny_hind::_id_4519( level._id_4483, var_0, 0, 2 );
    common_scripts\utility::flag_wait( "reset_yaw" );
    level._id_4483 setmaxpitchroll( 10, 5 );
    level._id_46C7 = 0;
    level._id_4483 maps\ny_hind::_id_4501();

    while ( _id_45EA( level._id_46C6 ) )
    {
        wait 0.05;

        if ( !_id_45EA( level._id_46EB ) )
        {
            var_1 = 0.707;

            if ( common_scripts\utility::flag( "spawn_next_hind" ) || !maps\_utility::within_fov( level.player geteye(), level.player getplayerangles(), level._id_46C6.origin, var_1 ) )
            {
                if ( _id_45EA( level._id_46C6 ) )
                    common_scripts\utility::flag_set( "aud_vo_lost_him" );
            }
        }
    }
}

_id_470D()
{
    common_scripts\utility::flag_wait( "spawn_hind06b" );
    common_scripts\utility::flag_set( "aud_vo_chase" );
    wait 0.45;
    level._id_46EB = _id_46F9( "hind_battle_hind06b", 1, 3 * level._id_46C8 );
    maps\_audio::aud_send_msg( "spawn_hind06b", level._id_46EB );
    level._id_46EB thread _id_46D6();
    level._id_46EB thread _id_46F0( level._id_46C6 );
    level._id_46EB setmaxpitchroll( 20, 90 );
    maps\_audio::aud_send_msg( "begin_hind_conversation" );
    maps\_utility::_id_11F4( "manhattan_hp1_rightsidehigh" );
    maps\_audio::aud_send_msg( "end_hind_conversation" );
    common_scripts\utility::flag_wait( "hind06b_to_follow" );
    wait 1;
    level._id_46EB setmaxpitchroll( 10, 40 );
    level._id_46EB thread _id_46DC( -1 );
    var_0 = ( -1100.0, -520.0, 200.0 );
    level._id_46EB thread maps\ny_hind::_id_4519( level._id_4483, var_0, 0, 2 );
    common_scripts\utility::flag_set( "encounter4_favor_back" );
}

_id_470E()
{
    common_scripts\utility::flag_wait( "spawn_next_hind" );
    wait 2;
    level._id_470F = _id_46F9( "hind_battle_hind05x", 1, level._id_46C8 );
    level._id_470F setmaxpitchroll( 15, 90 );
    level._id_470F _id_46D4( "missile_target_02", 1 );
}

_id_4710()
{
    common_scripts\utility::flag_wait( "surprise_follower" );
    maps\_audio::aud_send_msg( "surprise_follower" );
    level._id_4711 = _id_46F9( "hind_battle_hind03c", 1, 38000, 1 );
    level._id_4711 maps\ny_hind::_id_44FD( 40, 90, 90 );
    level._id_4711 thread _id_46D6();
    level._id_4711.godmode = 1;
    level._id_0A4C = level._id_4711;
    level._id_46C7 = 1;
    level._id_4711 thread _id_46DC( -1 );
}

_id_4712()
{
    common_scripts\utility::flag_wait( "surprise_follower" );
    level._id_4483 thread _id_4713();
    common_scripts\utility::flag_wait( "enemy_pause_01" );
    level._id_4483 thread _id_4714();
    level._id_4711 thread _id_4715();
    common_scripts\utility::flag_wait( "const_enemy_pursue" );
    wait 3;

    if ( _id_45EA( level._id_4711 ) )
    {
        level.player enableinvulnerability();
        level._id_4483 thread _id_4716();
        level._id_4711 thread _id_4717();
    }

    common_scripts\utility::flag_wait( "player_arrived" );
    common_scripts\utility::flag_wait( "enemy_arrived" );
    common_scripts\utility::flag_set( "start_finale" );
}

_id_4713()
{
    maps\ny_hind::_id_44FD( 30, 60, 30 );
    _id_46BC( 7000 );
}

_id_4714()
{
    var_0 = common_scripts\utility::getstruct( "const_bottom_loop_node", "targetname" );
    self setmaxpitchroll( 60, 30 );
    maps\ny_hind::_id_44FD( 30, 60, 60 );
    thread maps\_vehicle::_id_26A1( var_0 );
    common_scripts\utility::flag_wait( "const_enemy_pursue" );
    self setmaxpitchroll( 10, 5 );
}

_id_4715()
{
    var_0 = common_scripts\utility::getstruct( "const_bottom_loop_node_enemy", "targetname" );
    self endon( "death" );
    wait 3.25;
    self._id_46DD = 1;
    thread maps\_vehicle::_id_26A1( var_0 );
}

_id_4716()
{
    self.godmode = 1;
    var_0 = common_scripts\utility::getstruct( "player_return", "targetname" );
    wait 0.65;
    maps\ny_hind::_id_44FD( 45, 90, 90 );
    thread maps\ny_hind::_id_4513( var_0, 2, 24, undefined, 1 );
}

_id_4717()
{
    thread _id_470A( 12 );
    thread _id_46D1( 12 );
    self._id_46D2 = 1;
    self.godmode = 1;
}

_id_4718( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_1 );
    maps\ny_hind::_id_44FD( var_0, 20, 5 );
}

_id_4719( var_0, var_1 )
{
    while ( !common_scripts\utility::flag( var_1 ) )
    {
        wait 0.05;
        maps\ny_hind::_id_44FD( var_0, 20, 5 );
    }
}

_id_471A( var_0 )
{
    wait(var_0);
    return 1;
}

_id_471B( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "entering_hind" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !var_0 )
    {
        var_2 = "tag_player1";
        level.player allowprone( 0 );
        level.player allowcrouch( 0 );
        level._id_4483 maps\_anim::_id_11CF( level._id_4599, "ny_harbor_hind_entry", var_2 );
        level._id_4483 maps\_anim::_id_11CF( level._id_45FA, "ny_harbor_hind_entry", var_2 );
        level._id_4483._id_456D._id_1032 = "turret";
        level._id_4483._id_456D maps\_anim::_id_1244();
        level._id_4483._id_456D unlink();
        level._id_4483 thread maps\_anim::_id_11CF( level._id_4483._id_456D, "ny_harbor_hind_entry", var_2 );
        level._id_4483._id_456D linkto( level._id_4483, var_2 );
        level._id_4599 linkto( level._id_4483, var_2 );
        level._id_45FA linkto( level._id_4483, var_2 );
        level.player playerlinktoblend( level._id_4599, "tag_player", 0.2 );
        wait 0.2;
        thread maps\_utility::vision_set_fog_changes( "ny_manhattan_hind", 5 );
        thread maps\ny_blackhawk::_id_4598();
        level._id_4599 show();
        thread maps\_utility::_id_273C( 2, 55 );
        level._id_4483 thread maps\_anim::_id_1246( level._id_45FA, "ny_harbor_hind_entry", var_2 );
        level._id_4483 thread maps\_anim::_id_1246( level._id_4483._id_456D, "ny_harbor_hind_entry", var_2 );
        level._id_4483 maps\_anim::_id_1246( level._id_4599, "ny_harbor_hind_entry", var_2 );
        level._id_45FA hide();
        level._id_4483._id_456D linkto( level._id_4483, "tag_turret_npc" );
        level._id_4599 unlink();
        level._id_45FA unlink();
    }
    else
    {
        thread maps\_utility::vision_set_fog_changes( "ny_manhattan_hind", 5 );
        level._id_4592 = 1;
    }

    common_scripts\utility::flag_set( "obj_capturehind_complete" );
    maps\ny_blackhawk::_id_4570( 0 );
    level.player _id_4740();
    level._id_4599 hide();
    _id_46C2( var_0 );

    if ( !common_scripts\utility::flag( "hind_start_point" ) )
        wait 0.1;
    else
        wait 0.1;

    self notify( "player_entered_hind" );
    thread _id_46C4( var_1 );
}

_id_471C()
{
    wait 18;
    common_scripts\utility::flag_set( "rooftop_guys_dead" );
}

_id_471D( var_0 )
{
    self waittill( "goal" );

    for (;;)
    {
        var_1 = abs( var_0.angles[1] - self.angles[1] );

        if ( var_1 < 5 )
            break;

        wait 0.05;
    }

    level._id_471E += 1;
}

_id_471F( var_0, var_1 )
{

}

_id_4720( var_0, var_1 )
{

}

_id_4721( var_0, var_1 )
{
    var_0 endon( "death" );
}

_id_4722( var_0 )
{
    if ( !isdefined( level._id_4723 ) )
        level._id_4723 = 30;

    var_1 = var_0 getentitynumber() + "";
    maps\_shg_common::_id_1685( var_1, 20, level._id_4723, ( 1.0, 1.0, 1.0 ), "" );
    level._id_4723 += 18;
    var_0 endon( "death" );
}

_id_4724( var_0 )
{
    level endon( "finale_playing" );
    level._id_4711 thread _id_470A( var_0 );
    level._id_4711._id_46D2 = 1;
    wait(var_0);

    if ( !isgodmode( level.player ) )
        level._id_4483.godmode = 0;

    level.player disableinvulnerability();
    level._id_4711 thread _id_46D1( 0.05, 1 );
    level._id_4483 _id_46BC( 1100 );
    wait 1;
}

_id_4725()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_4726( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self endon( "stop_move" );

    while ( var_1 > 0 )
    {
        wait 0.05;
        var_1 -= 0.05;

        if ( var_1 > 0 )
        {
            self moveto( var_0.origin, var_1, 0, 0 );
            self rotateto( var_0.angles, var_1, 0, 0 );
        }
    }

    if ( var_2 )
    {
        for (;;)
        {
            self.origin = var_0.origin;
            self.angles = var_0.angles;
            wait 0.05;
        }
    }
    else
    {
        self.origin = var_0.origin;
        self.angles = var_0.angles;
    }
}

_id_4727()
{
    wait 0.5;
    level.player painvisionon();
    wait 1.6;
    level.player painvisionoff();
}

_id_4728( var_0, var_1 )
{
    var_0 waittillmatch( "single anim", "vfx_enemy_building_hit" );
    wait 0.5;
    var_1 delete();
    var_0 hide();
}

_id_4729()
{
    level._id_4483 endon( "death" );
    common_scripts\utility::flag_wait( "start_finale" );
    var_0 = getent( "hind_finale_scripted_node", "targetname" );
    var_1 = getent( "hind_finale_player_hind_start", "targetname" );
    var_2 = getent( "hind_finale_enemy_hind_start", "targetname" );
    var_3 = level._id_4483;
    var_4 = level._id_4711;
    var_4 maps\_vehicle::_id_2B17( "spot" );
    level._id_46C7 = 1;
    level._id_46C9 = 90;
    level._id_0A4C = var_4;
    var_4 thread _id_46DC( -1 );
    wait 0.05;
    var_5 = common_scripts\utility::getstruct( "get_to_player_anim_pos", "targetname" );
    var_6 = common_scripts\utility::getstruct( "get_to_enemy_anim_pos", "targetname" );

    if ( !isdefined( level._id_472A ) )
        var_4 thread _id_46D9( 3 );

    wait 1.2;
    var_3 maps\ny_hind::_id_44FD( 30, 60, 60 );
    var_3 thread maps\ny_hind::_id_4513( var_5, 2, 24, undefined, 1 );
    var_3 setmaxpitchroll( 0, 0 );
    wait 1;
    var_4 maps\ny_hind::_id_44FD( 30, 60, 60 );
    var_4 thread maps\ny_hind::_id_4513( var_6, 2, 24, undefined, 1 );
    common_scripts\utility::flag_wait( "player_arrived02" );
    common_scripts\utility::flag_wait( "enemy_arrived02" );
    var_7 = common_scripts\utility::getstruct( "player_hind_during_finale_start", "targetname" );
    var_3 thread maps\ny_hind::_id_4506( var_7, 2, 240 );
    level thread _id_4724( 5.0 );
    var_4 _id_4725();
    wait 0.05;
    var_4 notify( "newpath" );
    level notify( "finale_playing" );
    var_8 = spawn( "script_model", var_4.origin );
    maps\_audio::aud_send_msg( "finale_playing", var_8 );
    var_8 setmodel( "vehicle_mi24p_hind_woodland" );
    var_8.angles = var_4.angles;
    var_4 _id_4734( var_8 );
    var_4 hide();
    var_4 maps\_vehicle::_id_2B18( "all" );
    var_4 maps\ny_hind_ai::_id_4537();
    var_4 notify( "stop_ai" );
    var_8._id_1032 = "enemyhind";
    var_8 maps\_anim::_id_1244();
    playfxontag( common_scripts\utility::getfx( "ny_hind_lastHit" ), var_8, "tag_origin" );
    maps\_audio::aud_send_msg( "ny_hind_lastHit", var_4 );
    var_8 thread _id_03C9::_id_472B();
    var_3 maps\_anim::_id_11CF( var_8, "ny_manhattan_hind_finale" );
    var_9 = transformmove( var_4.origin, var_4.angles, var_8.origin, var_8.angles, var_3.origin, var_3.angles );
    var_10 = common_scripts\utility::spawn_tag_origin();
    var_10.origin = var_9["origin"];
    var_10.angles = var_9["angles"];
    var_10 maps\_anim::_id_11CF( var_8, "ny_manhattan_hind_finale" );
    var_8 linkto( var_10 );
    var_11 = common_scripts\utility::getstruct( "player_hind_during_finale_start", "targetname" );
    var_3 thread maps\ny_hind::_id_4506( var_11, 2, 24 );
    var_10 thread _id_4726( var_3, 1, 1 );
    thread _id_4700();
    var_10 maps\_anim::_id_1246( var_8, "ny_manhattan_hind_finale" );
    var_12 = spawn( "script_model", var_3.origin );
    var_12 setmodel( "vehicle_ny_blackhawk" );
    var_12.angles = var_3.angles;
    var_3 hide();
    var_3 maps\_vehicle::_id_2B18( "all" );
    var_12._id_1032 = "hind";
    var_12 maps\_anim::_id_1244();
    var_12 hidepart( "wheel_root_r", "vehicle_ny_blackhawk" );
    var_12 hidepart( "wheel_front_r_base_jnt", "vehicle_ny_blackhawk" );
    var_12 hidepart( "wheel_front_r_jnt", "vehicle_ny_blackhawk" );
    var_12 hidepart( "wheel_root_l", "vehicle_ny_blackhawk" );
    var_12 hidepart( "wheel_front_l_base_jnt", "vehicle_ny_blackhawk" );
    var_12 hidepart( "wheel_front_l_jnt", "vehicle_ny_blackhawk" );
    var_12 thread _id_472E();
    var_8 unlink();
    thread _id_4728( var_8, var_4 );
    var_13[0] = var_12;
    var_13[1] = var_8;
    var_0 maps\_anim::_id_11BF( var_13, "ny_manhattan_hind_finale2" );
    var_12 dontinterpolate();
    var_8 dontinterpolate();
    wait 0.05;
    var_14 = spawn( "script_model", var_12 gettagorigin( "tag_turret_npc" ) );
    var_14 setmodel( "weapon_blackhawk_minigun" );
    var_14._id_1032 = "hindturret";
    var_14 maps\_anim::_id_1244();
    var_14.angles = var_12 gettagangles( "tag_turret_npc" );
    var_14.origin = var_12 gettagorigin( "tag_turret_npc" );
    var_12 maps\_anim::_id_11CF( var_14, "ny_manhattan_hind_finale2", "tag_turret_npc" );
    var_14 linkto( var_12, "tag_turret_npc" );
    var_14 dontinterpolate();
    var_15 = 1;
    var_16 = [];
    var_3 notify( "end_loop" );

    foreach ( var_18 in level._id_45A3 )
    {
        var_18 unlink();
        var_12 maps\_anim::_id_11CF( var_18, "ny_manhattan_hind_finale2", "tag_player1" );
        var_18 dontinterpolate();
        var_18 linkto( var_12, "tag_player1" );
        var_18.name = undefined;
        var_16[var_15] = var_18;
        var_15 += 1;

        if ( var_15 > 3 )
            break;
    }

    var_16[var_15] = level._id_4599;
    level._id_4599 unlink();
    var_12 maps\_anim::_id_11CF( level._id_4599, "ny_manhattan_hind_finale2", "tag_player1" );
    level._id_4599 dontinterpolate();
    level._id_4599 linkto( var_12, "tag_player1" );
    level._id_4599 show();

    if ( isdefined( level._id_456C ) )
    {
        level._id_456F.player enableturretdismount();
        level.player unlink();
        level._id_456F._id_0A50 delete();
    }
    else
        level.player unlink();

    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player disableweapons();
    level.player playerlinktoblend( level._id_4599, "tag_player", 0 );
    level._id_45C4 maps\_utility::_id_24F5();
    thread _id_472D();
    thread _id_4727();
    thread _id_4730( level._id_4599, var_0 );
    common_scripts\utility::flag_set( "hind_finale_start" );
    thread _id_4731( level._id_4599 );
    var_12 thread _id_03C9::_id_472C();
    var_12 thread maps\_anim::_id_11DD( var_16, "ny_manhattan_hind_finale2", "tag_player1" );
    var_12 thread maps\_anim::_id_1246( var_14, "ny_manhattan_hind_finale2", "tag_turret_npc" );
    thread _id_01D4();
    var_0 maps\_anim::_id_11DD( var_13, "ny_manhattan_hind_finale2" );
    level notify( "hind_finale_finished" );
}

_id_01D4()
{
    level._id_1441 thread maps\_utility::_id_27AF( 1, 0.1 );
    wait 1;
    level._id_1441 thread maps\_utility::_id_27AF( 0, 1 );
    wait 5;
    level._id_1441 thread maps\_utility::_id_27AF( 0.6, 0.1 );
    wait 0.5;
    level._id_1441 thread maps\_utility::_id_27AF( 0, 1 );
    wait 3;
    level._id_1441 thread maps\_utility::_id_27AF( 0.2, 1 );
    wait 4;
    level._id_1441 thread maps\_utility::_id_27AF( 0, 1 );
    wait 6;
    level._id_1441 thread maps\_utility::_id_27AF( 0.2, 1 );
    wait 6.5;
    level._id_1441 thread maps\_utility::_id_27AF( 1, 0.1 );
    wait 0.5;
    level._id_1441 thread maps\_utility::_id_27AF( 0, 0.5 );
}

_id_472D()
{
    wait 27;
    level.player playerlinktodelta( level._id_4599, "tag_player", 1, 0, 0, 0, 0, 1 );
    wait 0.05;
    level.player lerpviewangleclamp( 2, 1, 0.25, 20, 15, 20, 10 );
}

_id_472E()
{
    self endon( "death" );
    var_0 = level._id_0C59["ny_harbor_hind"]["rotors"];
    var_1 = getanimlength( var_0 );

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        self setanim( var_0 );
        wait(var_1);
    }
}

_id_472F( var_0 )
{
    wait 0.1;
    var_0 fadeovertime( 1.0 );
    var_0.alpha = 0;
}

_id_4730( var_0, var_1 )
{
    var_0 waittillmatch( "single anim", "trigger exploding chunks" );
    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2._id_1032 = "chunks";
    var_2 maps\_utility::_id_262A();
    var_2 maps\_anim::_id_1244();
    var_1 maps\_anim::_id_1246( var_2, "ny_manhattan_hind_finale3" );
}

_id_4731( var_0 )
{
    var_1 = 5.0;
    var_2 = 4.0;
    var_3 = var_1;
    var_4 = var_2 + var_3;
    var_0 waittillmatch( "single anim", "fade_out" );
    var_5 = maps\_hud_util::_id_09A7( "black", 0, level.player );
    var_5 fadeovertime( var_1 );
    var_5.alpha = 1;
    maps\_audio::aud_send_msg( "ny_manhattan_fade_to_black", [ var_2, var_3 ] );
    wait(var_4);
    maps\_utility::_id_195A();
}

_id_4732( var_0, var_1, var_2, var_3 )
{
    self endon( "stop_looping_death_fx" );
    var_4 = _id_4735( var_2, var_1 );

    if ( var_4 == -1 )
        return;

    var_5 = var_1[var_4];
    var_6 = var_0[var_4];
    var_7 = 0.05;
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_8.origin = self gettagorigin( var_5 );
    var_8.angles = self gettagangles( var_5 );
    var_8 linkto( self, var_5 );
    self._id_4733[var_5]["origin"] = var_8;
    self._id_4733[var_5]["fx"] = var_6;
    playfxontag( var_6, var_8, "tag_origin" );
}

_id_4734( var_0 )
{
    if ( isdefined( self._id_4733 ) )
    {
        foreach ( var_3, var_2 in self._id_4733 )
            var_2["origin"] linkto( var_0, var_3 );

        var_0._id_4733 = self._id_4733;
        self._id_4733 = undefined;
    }
}

_id_4735( var_0, var_1 )
{
    var_2 = 1000000;
    var_3 = -1;
    var_4 = 0;
    var_5 = -1;

    foreach ( var_7 in var_1 )
    {
        if ( isdefined( self._id_4733 ) && isdefined( self._id_4733[var_7] ) )
            continue;

        var_8 = self gettagorigin( var_7 );
        var_9 = distance( var_8, var_0 );

        if ( var_9 < var_2 )
        {
            var_2 = var_9;
            var_3 = var_7;
            var_5 = var_4;
        }

        var_4++;
    }

    return var_5;
}

_id_4736()
{
    self waittill( "death" );
    var_0 = self._id_4733;

    while ( isdefined( self ) )
        wait 0.1;

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3, var_2 in var_0 )
        {
            stopfxontag( var_2["fx"], var_2["origin"], "tag_origin" );
            var_2["origin"] delete();
        }
    }
}

_id_4737()
{
    self endon( "death" );
    var_0 = [ "smoke/smoke_trail_black_heli_emitter", "fire/heli_engine_fire", "smoke/smoke_trail_black_heli_emitter", "fire/heli_engine_fire", "fire/heli_engine_fire", "smoke/smoke_trail_black_heli_emitter", "smoke/smoke_trail_black_heli_emitter", "fire/heli_engine_fire", "fire/heli_engine_fire", "smoke/smoke_trail_black_heli_emitter", "smoke/smoke_trail_black_heli_emitter" ];
    var_1 = [ "tag_origin", "main_rotor_jnt", "tag_deathfx", "tag_engine_left", "tag_engine_right", "tag_light_belly", "tag_light_cockpit01", "tag_light_L_wing", "tag_light_R_wing", "tag_light_tail", "tag_turret" ];
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_2[var_2.size] = loadfx( var_0[var_3] );

    var_4 = 5000;
    var_5 = 0;
    var_6 = var_4;
    thread _id_4736();

    for (;;)
    {
        self waittill( "damage", var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_6 -= var_7;

        if ( var_6 <= 0 && var_5 < 4 )
        {
            if ( var_5 > 2 )
            {
                var_0[1] = "fire/fire_smoke_trail_l_emitter";
                var_0[3] = "fire/fire_smoke_trail_l_emitter";
                var_0[7] = "fire/fire_smoke_trail_l_emitter";
                var_0[8] = "fire/fire_smoke_trail_l_emitter";
                var_0[9] = "fire/fire_smoke_trail_l_emitter";
            }

            thread _id_4732( var_2, var_1, var_10, var_9 );
            var_6 = var_4;
            var_5++;
        }
    }
}

_id_4738()
{
    level.player waittill( "death" );
    level.player playerlinktoblend( level._id_4483, "tag_player", 0.05 );
}

_id_4739()
{
    thread _id_4738();
    level._id_4483 waittill( "death" );

    if ( isalive( level.player ) )
    {
        setdvar( "ui_deadquote", &"NY_MANHATTAN_BLACKHAWK_KILLED" );
        maps\_utility::_id_1826();
    }
}

_id_473A()
{
    var_0 = _id_473C();
    thread _id_473E( 8.0, 0.2 );
    var_0 maps\_utility::delaythread( 0.2, ::_id_473B, 1, 0.2 );
    var_0 maps\_utility::delaythread( 0.7, ::_id_473B, 0, 1 );
    maps\_utility::delaythread( 0.7, ::_id_473E, 0, 1 );
}

_id_473B( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

_id_473C()
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D.sort = -1;
    level._id_473D.foreground = 0;
    return level._id_473D;
}

_id_473E( var_0, var_1 )
{
    setblur( var_0, var_1 );
}

_id_473F( var_0 )
{
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.3, 0.5, var_0, 400 );
}

_id_4740()
{
    var_0 = ::_id_473F;
    level.player._id_232B = [];
    level.player._id_232B["MOD_GRENADE"] = var_0;
    level.player._id_232B["MOD_GRENADE_SPLASH"] = var_0;
    level.player._id_232B["MOD_PROJECTILE"] = var_0;
    level.player._id_232B["MOD_PROJECTILE_SPLASH"] = var_0;
    level.player._id_232B["MOD_EXPLOSIVE"] = var_0;
}

_id_4741()
{
    level.player._id_232B = undefined;
}
