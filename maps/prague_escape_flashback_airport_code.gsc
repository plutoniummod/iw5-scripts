// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7CF0()
{
    notifyoncommand( "LISTEN_attack_button_pressed", "+attack" );
    notifyoncommand( "LISTEN_attack_button_pressed", "+attack_akimbo_accessible" );

    for (;;)
    {
        common_scripts\utility::flag_clear( "FLAG_attack_button_pressed" );
        level.player waittill( "LISTEN_attack_button_pressed" );
        common_scripts\utility::flag_set( "FLAG_attack_button_pressed" );
        wait 0.1;
    }
}

_id_7CF1()
{
    notifyoncommand( "LISTEN_ads_button_pressed", "+toggleads_throw" );
    notifyoncommand( "LISTEN_ads_button_pressed", "+speed_throw" );
    notifyoncommand( "LISTEN_ads_button_pressed", "+speed" );
    notifyoncommand( "LISTEN_ads_button_pressed", "+ads_akimbo_accessible" );

    for (;;)
    {
        common_scripts\utility::flag_clear( "FLAG_ads_button_pressed" );
        level.player waittill( "LISTEN_ads_button_pressed" );
        common_scripts\utility::flag_set( "FLAG_ads_button_pressed" );
        wait 0.1;
    }
}

_id_7CF2()
{
    for (;;)
    {
        if ( level.player playerads() > 0 )
            common_scripts\utility::flag_set( "FLAG_adsing" );
        else
            common_scripts\utility::flag_clear( "FLAG_adsing" );

        wait 0.01;
    }
}

_id_7CF3()
{
    return common_scripts\utility::flag( "FLAG_attack_button_pressed" );
}

_id_7CF4()
{
    return common_scripts\utility::flag( "FLAG_ads_button_pressed" );
}

_id_7CF5( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_6, var_5 in var_1 )
        var_3[var_6] = gettime();

    var_0._id_7CF6 = var_3;
    var_0._id_7CF7 = var_2;

    for (;;)
    {
        foreach ( var_6, var_5 in var_1 )
        {
            if ( !level.player [[ var_5 ]]() )
                var_0._id_7CF6[var_6] = gettime();
        }

        wait 0.05;
    }
}

_id_7CF8()
{
    earthquake( 0.12, 0.45, level.player.origin, 5000 );
}

_id_7CF9( var_0, var_1, var_2 )
{
    var_3 = gettime();
    var_4 = var_3 + 300;
    var_5 = var_3 + 4150;
    var_6 = var_3 + 20000;
    var_7 = 0;
    var_8 = 0;
    var_9 = 0;

    if ( var_2 == 0 )
    {
        var_4 = var_3 + 1400;
        var_5 = var_3 + 6150;
        var_6 = var_3 + 20000;
    }

    if ( var_2 > 2 )
    {
        var_4 = var_3 + 1400;
        var_5 = var_3 + 4150;
        var_6 = var_3 + 20000;
    }

    for (;;)
    {
        var_10 = level.player [[ var_0[var_2] ]]();
        var_11 = _id_7CFA( var_1, var_2 );

        if ( var_4 < gettime() && !var_7 )
        {
            var_7 = 1;
            maps\_utility::_id_1F61( var_1._id_7CF7[var_2] );
        }

        if ( var_5 < gettime() && !var_8 )
        {
            var_8 = 1;
            thread _id_7CFB();
        }

        if ( var_6 < gettime() )
        {
            var_9 = 1;
            level notify( "crawl_breath_recover" );
            break;
        }

        if ( var_10 && !var_11 )
        {
            level.player maps\_utility::vision_set_fog_changes( "prague_escape_airport_crawl_recover", 0.5 );
            level.player maps\_utility::delaythread( 1.0, maps\_utility::vision_set_fog_changes, "prague_escape_airport_crawl_to_elevator", 1.5 );
            level notify( "clear_hurt_pulses" );
            return var_9;
        }

        wait 0.05;
    }

    return var_9;
}

_id_7CFA( var_0, var_1 )
{
    var_2 = gettime() - var_0._id_7CF6[var_1];
    return var_2 > 750;
}

_id_7CFB()
{
    _id_09FA( 2 );
    setblur( 4, 4 );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_airport_crawl_hurt", 4 );
    thread _id_7CFC();
    level waittill( "clear_hurt_pulses" );
    thread _id_7CFD();
    setblur( 0, 0.5 );
    _id_17CC( 0.23 );
}

_id_7CFC()
{
    level endon( "crawl_breath_recover" );
    level.player maps\_utility::play_sound_on_entity( "breathing_hurt_start" );

    for (;;)
    {
        wait(randomfloatrange( 0.76, 1.7 ));
        level.player maps\_utility::play_sound_on_entity( "breathing_hurt" );
    }
}

_id_7CFD()
{
    level notify( "crawl_breath_recover" );
    level.player thread maps\_utility::play_sound_on_entity( "breathing_better" );
}

_id_09FA( var_0, var_1 )
{
    var_2 = _id_473C();

    if ( var_0 )
        var_2 fadeovertime( var_0 );

    var_2.alpha = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, 1 );
}

_id_17CC( var_0 )
{
    if ( level._id_16C9 )
        return;

    level notify( "now_fade_in" );
    var_1 = _id_473C();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 0;
}

_id_473C()
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D.sort = -1;
    level._id_473D.foreground = 1;
    return level._id_473D;
}

_id_7CFE( var_0, var_1 )
{
    if ( isdefined( level._id_7CFF ) )
        return;

    if ( !isdefined( level._id_7D00 ) )
    {
        waittillframeend;
        waittillframeend;
    }

    if ( var_1 )
        level._id_7D00 moveto( ( var_0, 0, 0 ), var_1 );
    else
        level._id_7D00.origin = ( var_0, 0, 0 );
}

_id_4BCB()
{
    self notify( "stop_heart" );
    self endon( "stop_heart" );

    for (;;)
    {
        if ( maps\_utility::_id_1008( "FLAG_player_heartbeat_sound" ) )
        {
            thread maps\_utility::play_sound_on_entity( "breathing_heartbeat" );
            wait 0.05;
            self playrumbleonentity( "damage_light" );
        }

        wait(self._id_5984);
        wait(0 + randomfloat( 0.1 ));

        if ( randomint( 50 ) > self._id_141D * 190 )
            wait(randomfloat( 1 ));
    }
}

_id_7D01()
{
    maps\_utility::_id_1402( "FLAG_player_heartbeat_sound" );
    self._id_5984 = 0.8;
    self._id_141D = 1;
}

_id_51E2()
{
    self._id_5258 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    self playersetgroundreferenceent( self._id_5258 );
    maps\_utility::play_sound_on_entity( "sprint_gasp" );
    thread _id_598F();
    maps\_utility::play_sound_on_entity( "breathing_hurt_start" );
    thread maps\_utility::play_sound_on_entity( "breathing_better" );
    thread _id_51E6();
    thread _id_7D02();
    thread _id_7D03();
}

_id_7D02()
{
    self waittill( "LISTEN_end_player_limp" );
    var_0 = 0.8;
    self._id_5258 rotateto( ( 0.0, 0.0, 0.0 ), var_0, var_0 * 0.5, var_0 * 0.5 );
    wait(var_0);
    self._id_5258 delete();
    self playersetgroundreferenceent( undefined );
    setslowmotion( 0.95, 1, 0.5 );
    self stopshellshock();
}

_id_51E6()
{
    level notify( "LISTEN_end_random_blur" );
    level endon( "dying" );
    level endon( "LISTEN_end_random_blur" );

    for (;;)
    {
        wait 0.05;

        if ( randomint( 100 ) > 10 )
            continue;

        var_0 = randomint( 3 ) + 2;
        var_1 = randomfloatrange( 0.3, 0.7 );
        var_2 = randomfloatrange( 0.3, 1 );
        setblur( var_0 * 1.2, var_1 );
        wait(var_1);
        setblur( 0, var_2 );
        wait 5;
    }
}

_id_51E5( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[2];
    var_3 = anglestoright( level.player.angles );
    var_4 = anglestoforward( level.player.angles );
    var_5 = ( var_3[0], 0, var_3[1] * -1 );
    var_6 = ( var_4[0], 0, var_4[1] * -1 );
    var_7 = var_5 * var_1;
    var_7 += var_6 * var_2;
    return var_7 + ( 0, var_0[1], 0 );
}

_id_598F()
{
    self endon( "LISTEN_end_player_limp" );
    self._id_598D = 4.1;
    thread _id_5991();
    var_0 = level common_scripts\utility::spawn_tag_origin();
    var_1 = level common_scripts\utility::spawn_tag_origin();
    thread _id_598C( var_0 );
    thread _id_5992( var_1 );
    var_2 = 0;
    var_3 = 0.1;
    var_4 = self getplayerangles()[1];
    var_5 = var_0.origin[0];

    for (;;)
    {
        var_6 = self getplayerangles()[1];
        var_7 = var_6 - var_4;
        var_8 = var_0.origin[0] + var_7;
        var_4 = var_6;
        var_9 = _id_5F9E::_id_5F0F( distance( ( 0.0, 0.0, 0.0 ), self getvelocity() ), 15 );
        var_2 += var_9 * 0.06;
        var_10 = sin( var_2 ) * 4 * self._id_598D;
        self._id_5258 rotateto( ( var_10 * 0.15, var_8 * -1, var_10 * 0.85 ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait 0.05;
    }
}

_id_7D03()
{
    self endon( "LISTEN_end_player_limp" );

    for (;;)
    {
        self shellshock( "prague_escape_airport", 60 );
        wait 60;
    }
}

_id_5991()
{
    self endon( "LISTEN_end_player_limp" );
    var_0 = 1;
    var_1 = 0.15;
    var_2 = 4;
    wait 3;

    for (;;)
    {
        setslowmotion( var_0, 0.89, var_2 );
        wait(var_2);
        setslowmotion( var_0, 1.06, var_2 );
        wait(var_2);
    }
}

_id_598C( var_0 )
{
    self endon( "LISTEN_end_player_limp" );
    var_1 = 1;
    var_2 = 7;

    for (;;)
    {
        var_3 = var_2 * self._id_598D;
        var_4 = randomfloatrange( var_3 * 0.5, var_3 );
        var_1--;

        if ( var_1 <= 0 )
        {
            var_1 = randomint( 3 );
            var_4 *= -1;
        }

        var_5 = var_4 - var_0.origin[0];
        var_5 = abs( var_5 );
        var_6 = var_5 * 0.05;

        if ( var_6 < 0.05 )
            var_6 = 0.05;

        var_7 = gettime();
        var_0 moveto( ( var_4, 0, 0 ), var_6, var_6 * 0.5, var_6 * 0.5 );
        wait(var_6);
        maps\_utility::_id_1254( var_7, 0.6 );

        for (;;)
        {
            var_8 = _id_5F9E::_id_5F0F( distance( ( 0.0, 0.0, 0.0 ), self getvelocity() ), 0 );

            if ( var_8 >= 80 * self._id_7D04 )
                break;

            wait 0.05;
        }
    }
}

_id_5992( var_0 )
{
    self endon( "LISTEN_end_player_limp" );
    var_1 = 0;
    var_2 = 140;
    var_3 = common_scripts\utility::getstruct( "limp_yaw_ent", "targetname" );
    var_4 = common_scripts\utility::getstruct( var_3.target, "targetname" );
    var_5 = vectortoangles( var_4.origin - var_3.origin );
    var_6 = anglestoforward( var_5 );
    var_7 = 0;

    for (;;)
    {
        var_8 = _id_5F9E::_id_5F0F( distance( ( 0.0, 0.0, 0.0 ), self getvelocity() ), 15 );
        var_9 = var_8 > 80 * self._id_7D04;
        var_10 = self getplayerangles();
        var_11 = anglestoforward( var_10 );
        var_12 = vectordot( var_11, var_6 ) >= 0.8;

        if ( var_9 && var_12 )
            var_1 += 2;
        else
            var_1 -= 1;

        var_1 = clamp( var_1, 0, var_2 );

        if ( var_1 < var_2 )
        {
            wait 0.05;
            continue;
        }

        var_1 = 0;

        if ( !var_7 )
        {
            var_7 = 1;
            thread _id_7D07();
            var_13 = 2;
            var_14 = level common_scripts\utility::spawn_tag_origin();
            var_14.origin = ( self._id_598D, 0, 0 );
            var_14 moveto( ( 1.0, 0.0, 0.0 ), var_13, var_13 * 0.5, var_13 * 0.5 );

            for (;;)
            {
                self._id_598D = var_14.origin[0];

                if ( self._id_598D == 1 )
                    break;

                wait 0.05;
            }

            var_14 delete();
            return;
        }

        var_2 = randomintrange( 70, 125 );
        var_13 = 0.45;
        var_15 = randomfloatrange( -16, -11 );
        var_0 moveto( ( var_15, 0, 0 ), var_13, 0, var_13 );
        wait(var_13);
        var_13 *= 0.8;
        var_16 = randomfloatrange( -2, 2 );
        var_0 moveto( ( var_16, 0, 0 ), var_13, var_13 * 0.5, var_13 * 0.5 );
        wait(var_13);
    }
}

_id_7D05()
{
    self endon( "LISTEN_end_player_limp" );
    var_0 = 4.1;
    var_1 = 15;
    var_2 = 8.0;
    var_3 = 0.35;
    var_4 = 0.3;
    var_5 = 0.0;
    var_6 = 5.0;
    var_7 = 3.0;
    var_8 = 0.5;
    var_9 = 0.5;
    var_10 = 1.0;
    var_11 = gettime();
    var_12 = 0;
    var_13 = 0;

    for (;;)
    {
        if ( self hasweapon( "p99" ) )
        {
            if ( common_scripts\utility::flag( "FLAG_adsing" ) )
            {
                var_12 = 0;
                self._id_598D = _id_5F9E::_id_5F0F( self._id_598D, var_2 );
                self._id_7D06 = _id_5F9E::_id_5F0F( self._id_7D06, var_7 );
            }

            if ( common_scripts\utility::flag( "FLAG_attack_button_pressed" ) )
            {
                var_12 = 0;
                var_13 = 1;
                var_11 = gettime();
            }

            if ( !common_scripts\utility::flag( "FLAG_adsing" ) && !common_scripts\utility::flag( "FLAG_attack_button_pressed" ) && self._id_598D > var_0 )
                var_12 = 1;

            if ( var_12 && !common_scripts\utility::flag( "FLAG_adsing" ) && !common_scripts\utility::flag( "FLAG_attack_button_pressed" ) )
            {
                self._id_598D -= var_4;
                self._id_598D = _id_5F9E::_id_5F0F( self._id_598D, var_0 );
                self._id_7D06 -= var_9;
                self._id_7D06 = _id_5F9E::_id_5F0F( self._id_7D06, var_5 );
            }

            if ( gettime() - var_11 >= var_10 * 1000 )
                var_13 = 0;

            if ( var_13 )
            {
                self._id_598D += var_3;
                self._id_598D = _id_5F9E::_id_5F10( self._id_598D, var_1 );
                self._id_7D06 += var_8;
                self._id_7D06 = _id_5F9E::_id_5F10( self._id_7D06, var_6 );
            }
        }

        wait 0.05;
    }
}

_id_7D07()
{
    self notify( "LISTEN_end_player_limp_internal" );
    self endon( "LISTEN_end_player_limp_internal" );
    self endon( "LISTEN_end_player_limp" );

    for (;;)
    {
        var_0 = _id_5F9E::_id_5F0F( distance( ( 0.0, 0.0, 0.0 ), self getvelocity() ), 15 );

        if ( var_0 < 80 )
        {
            wait 0.05;
            continue;
        }

        var_1 = 2.3;
        thread maps\_utility::play_sound_on_entity( "breathing_hurt" );
        level notify( "not_random_blur" );
        common_scripts\utility::noself_delaycall( 0.5, ::setblur, 4, 0.25 );
        common_scripts\utility::noself_delaycall( 1.2, ::setblur, 0, 1 );
        maps\_utility::delaythread( var_1, ::_id_51E6 );
        maps\_utility::delaythread( 1, ::_id_09FA, var_1 * 4 );
        maps\_utility::delaythread( var_1, ::_id_17CC, var_1 );
        self playrumbleonentity( "damage_light" );
        maps\_utility::_id_279B( 0.25, 0.3 );
        maps\_utility::delaythread( var_1 * 0.5, maps\_utility::_id_279B, 0.45, var_1 );
        wait(var_1);
        break;
    }
}
