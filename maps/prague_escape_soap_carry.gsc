// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7AF8()
{
    maps\prague_escape_code::_id_7A3B( "soap", "soap_carry" );
    maps\prague_escape_code::_id_7A3B( "price", "soap_carry" );
    maps\_shg_common::move_player_to_start( "start_soap_carry" );
    maps\_compass::setupminimap( "compass_map_prague_escape_sniper", "sniper_minimap_corner" );
    level._id_4877 maps\_utility::_id_2709( "m4m203_reflex", "back" );
    level._id_4877 maps\_utility::_id_104A( "m4m203_reflex", "primary" );
    maps\prague_escape_sniper::_id_7AE4();
    maps\prague_escape_sniper::_id_7AE5();
    wait 1;
}

_id_7AF9()
{
    maps\_autosave::_id_1C3F();
    _id_7AFA();
    thread _id_7AFE();
    thread _id_01F9();
    _id_7B0E();
    _id_7B17();
    _id_7B1F();
    _id_7B20();
    common_scripts\utility::flag_wait( "event_soap_carry_done" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "soap_picked_up" );
    common_scripts\utility::flag_init( "soap_carry_death" );
    common_scripts\utility::flag_init( "pause_soap_carry" );
    common_scripts\utility::flag_init( "clear_path_loop_started" );
    common_scripts\utility::flag_init( "soap_set_down" );
    common_scripts\utility::flag_init( "event_soap_carry_done" );
    common_scripts\utility::flag_init( "player_inside_apt_building" );
    common_scripts\utility::flag_init( "clear_path_dialogue_2" );
    common_scripts\utility::flag_init( "soap_carry_pickup_dialogue_2" );
    common_scripts\utility::flag_init( "soap_carry_cough_throw_smoke" );
    common_scripts\utility::flag_init( "soap_carry_cough_stop_dialogue_2" );
    common_scripts\utility::flag_init( "soap_carry_cough_stop_dialogue_3" );
    common_scripts\utility::flag_init( "soap_carry_cough_stop_dialogue_4" );
    common_scripts\utility::flag_init( "queue_player_carry_music" );
}

_id_01F9()
{
    common_scripts\utility::flag_wait( "dumpster_go" );
    var_0 = common_scripts\utility::getstruct( "paper_fx", "targetname" );
    wait 4.6;
    playfx( common_scripts\utility::getfx( "paper_fx" ), var_0.origin );
}

_id_7AFA()
{
    maps\_utility::_id_265B( "axis" );
    var_0 = getent( "fxanim_exit_wall", "targetname" );
    var_1 = common_scripts\utility::getstruct( "exit_wall_struct", "targetname" );
    setsaveddvar( "cg_drawCrosshair", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "ui_hideMap", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "actionSlotsHide", "0" );
    var_0 moveto( var_1.origin, 0.05 );
    level._id_4877 maps\_utility::_id_0A23( 0 );
    level._id_4877.grenadeammo = 0;
    level._id_4877._id_0F3C = 1;
    level._id_4877.badplaceawareness = 0;
    level._id_4877.dontavoidplayer = 1;
    level._id_4877 maps\_utility::_id_2711();
    level._id_4877 maps\_utility::_id_280D();
    level._id_4877 maps\_utility::_id_1057();
    level._id_4877 maps\_utility::_id_0EEC();
    level._id_4877 maps\_utility::_id_2714();
    level._id_4877 maps\_utility::_id_26F3( 1 );
    level._id_54E0 maps\_utility::_id_0A23( 1 );
    common_scripts\utility::trigger_off( "soap_carry_after_smoke_trig", "targetname" );
    var_2 = getentarray( "soap_carry_plaza_enemy", "script_noteworthy" );
    maps\_utility::_id_27C9( var_2, ::_id_7AFB );
    var_2 = getentarray( "soap_carry_starting_guys", "script_noteworthy" );
    maps\_utility::_id_27C9( var_2, ::_id_7AFC );
    var_3 = getentarray( "soap_carry_damage_trig", "targetname" );
    var_4 = getent( "soap_carry_after_smoke_trig", "targetname" );
    var_3 = maps\_utility::_id_0BC3( var_3, var_4 );
    common_scripts\utility::array_thread( var_3, ::_id_7B27 );
    var_5 = getentarray( "soap_carry_grenade_death_trig", "targetname" );
    common_scripts\utility::array_thread( var_5, ::_id_7B29 );
    var_6 = getentarray( "soap_carry_death_trig", "targetname" );
    common_scripts\utility::array_thread( var_6, ::_id_7B28 );
    var_7 = getent( "soap_carry_suv_flip", "targetname" );
    var_7.maxhealth *= 10;
    var_7.health = var_7.maxhealth;
    maps\_utility::_id_26BF( "soap_carry_begin_price" );
    var_8 = getentarray( "apt_wall_destroyed", "targetname" );

    foreach ( var_10 in var_8 )
        var_10 hide();

    var_0 = getent( "fxanim_rpg_wall", "targetname" );
    var_0 hide();
    var_12 = getentarray( "esc_wall_clean_01", "targetname" );

    foreach ( var_14 in var_12 )
        var_14 hide();

    var_16 = getentarray( "soap_carry_glass_break_trig", "targetname" );
    common_scripts\utility::array_thread( var_16, ::_id_7AFD );
    var_17 = getent( "apt_wall_collapse_clip", "targetname" );
    var_17 connectpaths();
    var_17 common_scripts\utility::trigger_off();
    var_18 = getentarray( "apt_wall_collapse", "targetname" );

    foreach ( var_20 in var_18 )
        var_20 hide();
}

_id_7AFB()
{
    self.grenadeammo = 0;
    self waittill( "goal" );
    maps\prague_escape_code::_id_441E();
}

_id_7AFC()
{
    self.grenadeammo = 0;
    common_scripts\utility::flag_wait( "soap_picked_up" );
    maps\prague_escape_code::_id_441E();
}

_id_7AFD()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::getstructarray( self.script_noteworthy, "targetname" );

    foreach ( var_2 in var_0 )
    {
        radiusdamage( var_2.origin, 32, 100, 100 );
        wait(randomfloatrange( 0.5, 1 ));
    }
}

_id_7AFE()
{
    level thread _id_00C7();
    var_0 = spawn( "script_origin", level._id_54E0.origin );
    var_0.angles = level._id_54E0.angles;
    var_0 thread maps\_anim::_id_124E( level._id_54E0, "soap_carry_prone_soap" );
    level.player enableinvulnerability();

    if ( !isdefined( level.player._id_7A48 ) )
    {
        var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
        var_1.angles = level.player getplayerangles();
        level.player._id_7A48 = var_1;
    }
    else
        var_1 = level.player._id_7A48;

    level._id_54E0 dontcastshadows();
    var_0 maps\_anim::_id_11CF( var_1, "soap_carry_pickup" );
    var_1 hide();
    var_2 = 0.25;
    level.player freezecontrols( 1 );
    level.player playerlinktoblend( var_1, "tag_player", var_2, var_2 * 0.25, var_2 * 0.25 );
    wait(var_2);
    level.player playerlinktodelta( var_1, "tag_player", 1, 0, 0, 20, 0, 1 );
    var_1 show();
    var_3 = getent( "soap_carry_pickup_soap", "targetname" );
    var_3 sethintstring( &"PRAGUE_ESCAPE_HINT_PICKUP_SOAP" );
    level thread _id_7AFF();
    level thread _id_7B01();
    level.player disableinvulnerability();
    level thread _id_7B33();
    common_scripts\utility::flag_set( "queue_player_carry_music" );
    var_3 waittill( "trigger" );
    var_3 delete();
    var_4 = getent( "scaffold_price_blocker", "targetname" );
    var_4 delete();
    var_0 notify( "stop_loop" );
    common_scripts\utility::flag_set( "soap_picked_up" );
    level.player thread _id_7B00();
    var_5 = maps\_utility::_id_2766( level._id_54E0, var_1 );
    var_0 maps\_anim::_id_11DD( var_5, "soap_carry_pickup" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player allowads( 0 );
    level thread _id_7B05();
    level thread _id_7B0D();
    level thread _id_7B03();
}

_id_00C7()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2.grenadeammo = 0;
}

_id_7AFF()
{
    level endon( "soap_set_down" );
    level.player thread maps\_utility::_id_2834( "soap_carry_death" );
    common_scripts\utility::flag_wait( "soap_carry_death" );
    common_scripts\utility::flag_set( "pause_soap_carry" );
    level._id_54E0 hide();
    level.player unlink();
}

_id_7B00()
{
    wait 2.5;
    self playrumbleonentity( "damage_heavy" );
    playfxontag( level._effect["dust_fall_soap_chest"], level._id_54E0, "J_Spine4" );
    wait 2;
    self playrumbleonentity( "damage_heavy" );
    playfxontag( level._effect["dust_fall_soap_chest"], level._id_54E0, "J_Spine4" );
}

_id_7B01()
{
    level endon( "soap_picked_up" );
    var_0 = 5;
    var_1 = 0.5;
    var_2 = 2;
    var_3 = var_2;
    wait(var_0);
    thread _id_7B02( 3 );

    for (;;)
    {
        _id_7B04();
        wait(var_3);
        var_3 -= var_1;

        if ( var_3 < var_1 )
            var_3 = var_1;
    }
}

_id_7B02( var_0 )
{
    wait(var_0);
    setdvar( "ui_deadquote", &"PRAGUE_ESCAPE_PROTECT_FAIL" );
    level thread maps\_utility::_id_1826();
}

_id_7B03()
{
    level endon( "smoke_grenade_toss" );

    for (;;)
    {
        wait 7;

        if ( level.player.health == level.player.maxhealth )
            _id_7B04();
    }
}

_id_7B04()
{
    var_0 = getent( "soap_carry_fire_backup", "targetname" );
    magicbullet( "ak47", var_0.origin, level.player.origin + ( 0.0, 0.0, 32.0 ) );
}

_id_7B05()
{
    level._id_7B06 = 0;
    var_0 = 155;
    var_1 = ( 0.0, 0.0, 16.0 );
    var_2 = ( 0.0, 5.0, 0.0 );
    var_3 = ( 0.0, 0.0, 1.0 );
    var_4 = -50;
    var_5 = 0;

    if ( !isdefined( level.player._id_7A48 ) )
    {
        var_6 = maps\_utility::_id_1287( "player_rig", level.player.origin );
        var_6.angles = level.player getplayerangles();
        level.player._id_7A48 = var_6;
        level.player playerlinktodelta( var_6, "tag_player", 0.5, 0, 0, 20, 0 );
    }
    else
        var_6 = level.player._id_7A48;

    level._id_7B07 = spawn( "script_model", var_6.origin );
    level._id_7B07 setmodel( "tag_origin" );
    level._id_7B07.angles = var_6.angles;
    level._id_54E0 linkto( var_6, "tag_origin" );
    var_6 linkto( level._id_7B07, "tag_origin" );
    var_7 = level.player getnormalizedmovement();
    var_8 = length( var_7 );

    if ( var_8 == 0 )
    {
        level._id_7B07 thread maps\_anim::_id_124E( var_6, "soap_carry_idle" );
        var_6 thread maps\_anim::_id_124E( level._id_54E0, "soap_carry_idle" );
    }

    level._id_7B08 = var_6;
    level thread _id_7B0B();
    level._id_7B09 = maps\prague_escape_code::_id_7A44( level._id_4877, &"PRAGUE_ESCAPE_FOLLOW_PRICE" );
    var_9 = maps\_utility::_id_2766( var_6, level._id_54E0 );
    level.player enablemousesteer( 1 );

    while ( !level._id_7B06 )
    {
        if ( common_scripts\utility::flag( "pause_soap_carry" ) )
        {
            wait 0.05;
            continue;
        }

        var_7 = level.player getnormalizedmovement();
        var_8 = length( var_7 );
        var_10 = var_6.angles;
        var_11 = anglestoforward( var_10 );
        var_12 = anglestoright( var_10 );
        var_13 = var_0 * var_7[0];
        var_14 = var_0 * var_7[1];
        var_15 = var_11 * var_13 + var_12 * var_14;

        if ( var_8 > 0 )
        {
            if ( !var_5 )
            {
                level._id_7B07 notify( "stop_loop" );
                var_6 notify( "stop_loop" );
                level._id_7B07 thread maps\_anim::_id_124E( var_6, "soap_carry_run" );
                var_6 thread maps\_anim::_id_124E( level._id_54E0, "soap_carry_run" );
            }

            common_scripts\utility::array_thread( var_9, ::_id_7B0A, "soap_carry_run", var_8 );
            var_5 = 1;
            var_16 = var_15;
            var_17 = var_15 * 0.2;
            var_18 = level._id_7B07.origin + var_17;
            var_19 = level._id_54E0.origin + var_17;
            var_20 = level._id_7B07.origin + var_1;
            var_21 = var_18 + var_1;
            var_22 = playerphysicstrace( var_20, var_21 );
            var_23 = undefined;

            if ( var_22 != var_21 )
            {
                var_24 = bullettrace( var_20, var_21, 0, var_6 );

                if ( var_24["position"] == var_21 )
                {
                    var_25 = var_22 - var_20;
                    var_26 = maps\_shg_common::_id_1684( vectornormalize( var_25 ), var_3 );
                    var_27 = var_26 * -1;
                    var_28 = bullettrace( var_22, var_22 + var_26 * var_13, 0, var_6 );
                    var_29 = bullettrace( var_22, var_22 + var_27 * var_13, 0, var_6 );
                    var_24 = var_28;

                    if ( var_28["fraction"] > var_29["fraction"] )
                        var_24 = var_29;
                }

                var_30 = var_24["normal"];
                var_31 = 1 - var_24["fraction"];
                var_16 += var_30 * var_0;
                var_32 = maps\_shg_common::_id_1684( vectornormalize( var_30 ), var_3 );
                var_33 = vectornormalize( var_22 - level.player.origin );
                var_34 = vectordot( var_32, var_33 );

                if ( var_34 < 0 )
                    var_32 *= -1;

                var_16 += var_32 * ( var_31 * abs( var_34 ) );
            }

            var_35 = level._id_7B07.origin + vectornormalize( var_12 ) * -1 * 8;
            var_23 = playerphysicstrace( level._id_7B07.origin + var_1, level._id_7B07.origin + var_16 * 0.05 + var_1 );
            var_36 = var_35 + vectornormalize( var_16 ) * 16 + var_1;
            var_37 = playerphysicstrace( var_35 + var_1, var_36 );

            if ( var_36 != var_37 )
                var_23 = level._id_7B07.origin;

            var_38 = getgroundposition( var_23 + var_1, 2 );
            var_23 = ( var_23[0], var_23[1], var_38[2] );
            var_39 = distancesquared( var_23, level._id_4877.origin );

            if ( var_39 > 256 )
                level._id_7B07.origin = var_23;
        }
        else
        {
            if ( var_5 )
            {
                level._id_7B07 notify( "stop_loop" );
                var_6 notify( "stop_loop" );
                level._id_7B07 thread maps\_anim::_id_124E( var_6, "soap_carry_idle" );
                var_6 thread maps\_anim::_id_124E( level._id_54E0, "soap_carry_idle" );
            }

            var_5 = 0;
        }

        var_40 = level.player getnormalizedcameramovement();

        if ( !level.console )
            var_40 = ( var_40[0], var_40[1] * -1, var_40[2] );

        if ( var_40[1] >= 0.2 )
        {
            var_41 = var_2 * var_40[1];
            var_35 = level._id_7B07.origin + vectornormalize( var_12 ) * -1 * 16;
            var_42 = var_35 - level._id_7B07.origin;
            var_43 = var_41 + maps\_shg_common::_id_1684( var_42, var_3 );
            var_44 = var_35 + var_43;
            var_45 = playerphysicstrace( var_35 + var_1, var_44 + var_1 );
            var_46 = var_44 + var_1 - var_45;

            if ( length( var_46 ) < 0.01 )
            {
                var_47 = level._id_7B07.angles - var_2 * abs( var_40[1] );
                level._id_7B07 rotateto( var_47, 0.05 );
            }
        }
        else if ( var_40[1] <= -0.2 )
        {
            var_41 = var_2 * var_40[1];
            var_35 = level._id_7B07.origin + vectornormalize( var_12 ) * -1 * 16;
            var_42 = var_35 - level._id_7B07.origin;
            var_43 = var_41 + maps\_shg_common::_id_1684( var_42, var_3 );
            var_44 = var_35 + var_43;
            var_45 = playerphysicstrace( var_35 + var_1, var_44 + var_1 );
            var_46 = var_44 + var_1 - var_45;

            if ( length( var_46 ) < 0.01 )
            {
                var_47 = level._id_7B07.angles + var_2 * abs( var_40[1] );
                level._id_7B07 rotateto( var_47, 0.05 );
            }
        }

        wait 0.05;
    }

    level.player enablemousesteer( 0 );
    level._id_7B07 notify( "stop_loop" );
    level._id_7B08 notify( "stop_loop" );
    level._id_7B08 delete();
    level._id_7B07 delete();
}

_id_7B0A( var_0, var_1 )
{
    self setflaggedanim( "looping anim", level._id_0C59[self._id_1032][var_0][0], 1, 0, var_1 );
}

_id_7B0B()
{
    level endon( "soap_cough_done" );
    level.player thread _id_7B0C();
    var_0 = 1000;
    var_1 = 0;
    var_2 = var_0 * var_0;

    for (;;)
    {
        var_3 = distancesquared( level.player.origin, level._id_4877.origin );

        if ( var_3 > var_2 )
        {
            if ( var_1 < 1.0 )
                var_1 += 0.1;

            var_4 = getaiarray( "axis" );
            common_scripts\utility::array_thread( var_4, maps\_utility::_id_2736, var_1 );
            _id_7B2A();
        }
        else if ( var_1 > 0 )
        {
            var_1 -= 0.2;

            if ( var_1 < 0 )
                var_1 = 0;

            var_4 = maps\_utility::_id_263E( "soap_carry_enemy" );
            common_scripts\utility::array_thread( var_4, maps\_utility::_id_2736, var_1 );
        }

        wait 1;
    }
}

_id_7B0C()
{
    level endon( "soap_cough_done" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_4 ) && var_4 == "MOD_EXPLOSIVE" )
            self.health += var_0;
    }
}

_id_7B0D()
{
    maps\_utility::_id_262C( "inside_apt_building" );
    common_scripts\utility::flag_set( "player_inside_apt_building" );
}

_id_7B0E()
{
    common_scripts\utility::flag_wait( "soap_picked_up" );
    level thread _id_7B0F();
    level._id_4877 thread _id_7B10();
    _id_7B14();
    level._id_4877 maps\_utility::_id_13A4( "b" );
    maps\_utility::_id_26BF( "price_move_after_scaffold" );
    level._id_4877 allowedstances( "stand" );
    _id_7B15();
}

_id_7B0F()
{
    var_0 = getent( "soap_carry_rpg_car_target", "script_noteworthy" );
    var_0 maps\_utility::_id_2733();
    wait 1;
    var_1 = common_scripts\utility::getstruct( "soap_carry_fake_grenade", "targetname" );
    magicgrenade( "fraggrenade", var_1.origin + ( 0.0, 0.0, 8.0 ), var_1.origin, 0.1 );
    playfx( level._effect["grenade_exp_concrete"], var_1.origin );
    maps\_utility::_id_262C( "rpg_player_whizby" );
    var_2 = common_scripts\utility::getstruct( "soap_carry_rpg_first_start", "targetname" );
    var_3 = common_scripts\utility::getstruct( "soap_carry_rpg_first_end", "targetname" );
    magicbullet( "rpg_straight", var_2.origin, var_3.origin );
    wait 0.75;
}

_id_7B10()
{
    var_0 = getentarray( "soap_carry_spawn_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_7B11 );
}

_id_7B11()
{
    self waittill( "trigger" );
    wait 1;
    level._id_4877 maps\_utility::_id_2713();
    var_0 = getentarray( self.target, "targetname" )[0];

    if ( isdefined( var_0 ) && isdefined( var_0._id_2149 ) )
        var_1 = var_0._id_2149;
    else
        return;

    var_2 = maps\_utility::_id_263E( var_1 );
    var_3 = spawn( "script_model", level.player.origin );
    var_3 setmodel( "tag_origin" );

    foreach ( var_5 in var_2 )
    {
        if ( isalive( var_5 ) )
        {
            var_3.origin = var_5.origin + ( 0.0, 0.0, 36.0 );
            var_3 linkto( var_5 );
            level._id_4877 setentitytarget( var_3 );
            level._id_4877 shoot( 0.7 );
            var_5 thread _id_7B12( 2 );
            var_5 waittill( "death" );
            var_3 unlink();
        }
    }

    level._id_4877 clearentitytarget();
    var_3 delete();
    level._id_4877 maps\_utility::_id_2712();
}

_id_7B12( var_0 )
{
    wait(var_0);
    maps\prague_escape_code::_id_441E();
}

_id_7B13()
{
    level endon( "smoke_grenade_toss" );

    for (;;)
    {
        var_0 = randomfloatrange( 0.1, 0.3 );
        wait(var_0);

        if ( isdefined( self.target ) && self canshoot( self.target.origin ) )
            self shoot( 0.7 );
    }
}

_id_7B14()
{
    var_0 = common_scripts\utility::getstruct( "align_price_throw_smoke", "targetname" );
    var_1 = getnode( "anim_align_cover_then_m203", "targetname" );
    var_1 maps\_anim::_id_124A( level._id_4877, "grenade_fire_a" );
    var_1 maps\_anim::_id_1246( level._id_4877, "grenade_fire_a" );
    var_0 thread maps\_anim::_id_124B( level._id_4877, "soap_carry_cough_stop" );
    level._id_4877 setgoalpos( var_0.origin );
}

_id_7B15()
{
    var_0 = common_scripts\utility::getstruct( "align_price_throw_smoke", "targetname" );
    maps\_utility::_id_262C( "soap_carry_rpg_fired" );
    var_1 = common_scripts\utility::getstruct( "soap_carry_rpg_start", "targetname" );
    var_2 = common_scripts\utility::getstruct( "soap_carry_rpg_end", "targetname" );
    wait 0.5;
    magicbullet( "rpg_straight", var_1.origin, var_2.origin );
    wait 0.5;
    var_3 = getent( "fxanim_rpg_wall", "targetname" );
    var_3 show();
    var_3 useanimtree( level._id_1245["script_model"] );
    var_3._id_1032 = "rpg_wall";
    var_3 thread maps\_anim::_id_1246( var_3, "rpg_wall_explode" );
    common_scripts\utility::exploder( 250 );
    level.player playrumbleonentity( "damage_heavy" );
    var_4 = getentarray( "esc_wall_destroy_01", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    var_8 = getentarray( "esc_wall_clean_01", "targetname" );

    foreach ( var_6 in var_8 )
        var_6 show();

    level._id_4877 maps\_anim::_id_1246( level._id_4877, "grenade_fire_b" );
    var_0 thread maps\_anim::_id_124B( level._id_4877, "soap_carry_cough_stop" );
}

_id_7B16()
{
    var_0 = getent( "soap_carry_suv_flip", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( var_0.model );
    var_0 hide();
    var_0 delete();
    playfx( level._effect["suv_explosion"], var_1.origin );
    level.player playrumbleonentity( "grenade_rumble" );
    level.player playsound( "scn_prague_suv_flip_exp" );
    var_1._id_1032 = "soap_carry_suv";
    var_1 useanimtree( level._id_1245["convoy_vehicle"] );
    var_1 thread maps\_anim::_id_1246( var_1, "suv_flip" );
}

_id_7B17()
{
    var_0 = common_scripts\utility::getstruct( "align_price_throw_smoke", "targetname" );
    maps\_utility::_id_262C( "trig_price_throw_smoke" );
    level thread _id_7B19();
    level notify( "smoke_grenade_toss" );
    level thread _id_7B1E();
    level.player freezecontrols( 1 );
    level.player enableinvulnerability();
    level.player maps\_utility::_id_2783( 0 );
    wait 0.05;
    common_scripts\utility::flag_set( "pause_soap_carry" );
    level.player unlink();
    level._id_7B08 hide();
    level._id_7B18 = maps\_utility::_id_1287( "player_rig", level._id_7B08.origin );
    level._id_7B18.angles = level._id_7B08.angles;
    level._id_7B18.angles = level._id_7B07.angles;
    level._id_7B18 linkto( level._id_7B07 );
    level._id_7B18 dontcastshadows();
    level.player playerlinktodelta( level._id_7B18, "tag_player", 1, 10, 10, 10, 10 );
    level._id_7B18 thread _id_7B1C();
    var_1 = maps\_utility::_id_2766( level._id_54E0, level._id_7B18 );
    level thread _id_7B1D();
    level._id_7B07 maps\_anim::_id_11DD( var_1, "soap_carry_cough_stop" );
    level._id_7B07.origin = level._id_7B18.origin;
    level.player unlink();
    level._id_7B18 delete();
    level._id_7B08 show();
    common_scripts\utility::flag_clear( "pause_soap_carry" );
    level notify( "soap_cough_done" );
    level.player playerlinktodelta( level._id_7B08, "tag_player", 0.5, 0, 0, 20, 0 );
    level._id_7B08 notify( "stop_loop" );
    level._id_7B08 thread maps\_anim::_id_124E( level._id_54E0, "soap_carry_idle" );
    level.player freezecontrols( 0 );
    level.player common_scripts\utility::delaycall( 5, ::disableinvulnerability );
    level._id_54E0 maps\_utility::_id_0A23( 0 );
    var_2 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_2736, 1 );
    level.player enabledeathshield( 0 );
    level.player.health = 100;
}

_id_7B19()
{
    wait 2;
    level._id_7B1A = maps\_vehicle::_id_2881( "cough_alley_chopper" );
    wait 0.1;
    level._id_7B1A.health += 5000;
    level._id_7B1A._id_7A69 = undefined;
    level._id_7B1A thread _id_7B1B();
    level._id_7B1A maps\_utility::delaythread( 4, maps\prague_escape_code::_id_01F3 );
    level._id_7B1A maps\_utility::_id_1424( "stop_attacking", 9 );
}

_id_7B1B()
{
    self endon( "death" );
    self endon( "stop_attacking" );

    for (;;)
    {
        maps\prague_escape_code::_id_7A68();
        wait 1;
    }
}

_id_7B1C()
{
    var_0 = 0.4;
    var_1 = common_scripts\utility::getstruct( "align_price_lookat", "targetname" );
    var_2 = getent( "smoke_throw_change_align", "targetname" );

    if ( level.player istouching( var_2 ) )
        var_1 = common_scripts\utility::getstruct( "align_price_lookat_2", "targetname" );

    var_3 = vectornormalize( var_1.origin - level.player.origin );
    var_4 = vectornormalize( anglestoforward( self.angles ) );
    var_5 = vectordot( var_3, var_4 );
    self rotateto( vectortoangles( var_3 ), var_0 );
    level._id_7B07 rotateto( vectortoangles( var_3 ), var_0, var_0 * 0.25 );
}

_id_7B1D()
{
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_fallpains" );
    level.player playrumbleonentity( "damage_heavy" );
    wait 2;
    level.player playrumbleonentity( "damage_light" );
    playfxontag( level._effect["blood_cough_heavy"], level._id_54E0, "tag_eye" );
    level._id_4877 maps\_utility::delaythread( 2, maps\_utility::_id_168C, "presc_pri_getoffroad" );
}

_id_7B1E()
{
    common_scripts\utility::flag_wait( "soap_carry_cough_throw_smoke" );
    var_0 = spawn( "script_model", level._id_4877 gettagorigin( "tag_weapon_left" ) );
    var_0.angles = level._id_4877 gettagangles( "tag_weapon_left" );
    var_0 setmodel( "weapon_us_smoke_grenade" );
    var_0 linkto( level._id_4877, "tag_weapon_left" );
    var_1 = spawn( "script_model", level._id_4877 gettagorigin( "TAG_INHAND" ) );
    var_1.angles = level._id_4877 gettagangles( "TAG_INHAND" );
    var_1 setmodel( "weapon_us_smoke_grenade" );
    var_1 linkto( level._id_4877, "TAG_INHAND" );
    var_2 = spawn( "script_model", level._id_4877 gettagorigin( "TAG_INHAND" ) );
    var_2 setmodel( "tag_origin" );
    var_2.angles = level._id_4877 gettagangles( "TAG_INHAND" );
    var_2 linkto( level._id_4877, "TAG_INHAND" );
    var_3 = spawn( "script_model", level._id_4877 gettagorigin( "tag_weapon_left" ) );
    var_3 setmodel( "tag_origin" );
    var_3.angles = level._id_4877 gettagangles( "tag_weapon_left" );
    var_3 linkto( level._id_4877, "tag_weapon_left" );
    playfxontag( level._effect["smoke_grenade_streamer"], var_3, "tag_origin" );
    playfxontag( level._effect["smoke_grenade_streamer"], var_2, "tag_origin" );
    var_4 = common_scripts\utility::getstructarray( "soap_carry_smoke_grenade", "targetname" );
    level thread common_scripts\utility::play_sound_in_space( "smokegrenade_explode_default", var_4[1].origin );

    foreach ( var_6 in var_4 )
    {
        var_7 = var_6.origin;
        playfx( level._effect["smoke_grenade_prague"], var_6.origin );
    }

    wait 1;
    var_0 delete();
    var_1 delete();
    var_2 unlink();
    var_3 unlink();
    wait 14;
    common_scripts\utility::trigger_on( "soap_carry_after_smoke_trig", "targetname" );
}

_id_7B1F()
{
    thread _id_7B22();
    thread _id_7B23();
    maps\_utility::_id_262C( "trig_price_blows_hole_in_wall" );
    common_scripts\utility::flag_wait( "clear_path_loop_started" );
    var_0 = common_scripts\utility::getstruct( "anim_align_wall_breach", "targetname" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( level._id_4877, "clear_path_out" );
    level._id_4877 maps\_utility::_id_13A4( "b" );
    level._id_4877 maps\_utility::_id_109B( 1 );
}

_id_7B20()
{
    maps\_compass::setupminimap( "compass_map_prague_escape_escort", "escort_minimap_corner" );
    maps\_utility::_id_262C( "trig_set_down_soap" );
    level thread _id_7B2D();
    common_scripts\utility::flag_set( "FLAG_soap_blood_fx" );
    thread _id_7B24();
    thread _id_7B25();
    thread _id_7B26( "right" );
    thread _id_7B26( "left" );
    maps\_autosave::_id_1C3F();
    var_0 = getent( "obj_set_down_soap", "targetname" );
    objective_position( level._id_7A43, var_0.origin );
    objective_setpointertextoverride( level._id_7A43, &"PRAGUE_ESCAPE_SET_DOWN" );
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_putmedown" );
    musicstop( 7 );
    var_1 = getent( "dumpster_set_down_soap", "targetname" );
    var_2 = 0;

    while ( !var_2 )
    {
        if ( level.player istouching( var_1 ) )
        {
            var_3 = level.player getplayerangles();
            var_4 = vectornormalize( anglestoforward( var_3 ) );
            var_5 = vectornormalize( var_0.origin - level.player.origin );

            if ( vectordot( var_4, var_5 ) > 0.25 )
                var_2 = 1;
        }

        wait 0.05;
    }

    var_1 delete();
    level._id_7B06 = 1;
    common_scripts\utility::flag_set( "soap_set_down" );
    common_scripts\utility::flag_set( "FLAG_soap_walk_blood_drip_hip" );
    maps\_utility::delaythread( 1.0, ::_id_7B21 );
    level.player unlink();
    level thread maps\_utility::_id_25EE( "dumpster_go", 2 );
    level._id_54E0 animscripts\shared::_id_0C9B( level._id_54E0.primaryweapon, "none" );
    var_6 = common_scripts\utility::getstruct( "anim_align_dumpster", "targetname" );
    var_7 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_7.angles = level.player getplayerangles();
    var_6 maps\_anim::_id_11CF( var_7, "toss_gun" );
    var_7 hide();
    var_8 = 0.4;
    level._id_54E0 hide();
    var_6 maps\_anim::_id_11CF( level._id_54E0, "toss_gun" );
    level.player freezecontrols( 1 );
    level.player playerlinktoblend( var_7, "tag_player", var_8, var_8 * 0.5 );
    wait(var_8);
    level._id_54E0 show();
    var_7 show();
    level.player playerlinktodelta( var_7, "tag_player", 1, 10, 10, 10, 10, 1 );
    level._id_54E0 thread maps\_utility::_id_168C( "presc_mct_givemearifle" );
    var_9 = maps\_utility::_id_2766( level._id_54E0, var_7, level._id_4877 );
    level thread maps\prague_escape_code::_id_7A56( level.player );
    var_6 maps\_anim::_id_11DD( var_9, "toss_gun" );
    common_scripts\utility::exploder( 310 );
    level.player unlink();
    var_7 delete();
    level.player setorigin( level.player.origin + ( 0.0, 0.0, 8.0 ) );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowsprint( 1 );
    level.player giveweapon( "m4m203_reflex" );
    level.player switchtoweapon( "m4m203_reflex" );
    level.player allowads( 1 );
    setsaveddvar( "cg_drawCrosshair", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "ui_hideMap", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "actionSlotsHide", "0" );
    wait 0.05;
    level.player maps\_utility::_id_2783( 1 );
    common_scripts\utility::flag_set( "event_soap_carry_done" );
}

_id_7B21()
{
    var_0 = common_scripts\utility::getstructarray( "blood_pool", "targetname" );
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "dumpster" ] )[0];
    maps\_utility::_id_283A( var_1 );
    playfx( common_scripts\utility::getfx( "FX_soap_sit_blood_pool_small" ), var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
}

_id_7B22()
{
    var_0 = getentarray( "blood_drip_decal", "targetname" );
    common_scripts\utility::array_call( var_0, ::notsolid );
    common_scripts\utility::array_call( var_0, ::hide );
    common_scripts\utility::array_call( var_0, ::dontcastshadows );
    var_1 = cos( 65 );
    common_scripts\utility::flag_wait( "event_soap_carry_done" );
    wait 5.0;
    var_2 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "dumpster_to_statue" ] );
    var_2 = maps\_utility::_id_27EC( var_2 );

    foreach ( var_5, var_4 in var_2 )
    {
        if ( var_5 > 7 )
            break;

        var_4 thread _id_00C8( var_1 );
        wait 2.25;
    }

    common_scripts\utility::flag_wait( "player_enter_store" );
    wait 1.0;

    foreach ( var_5, var_4 in var_2 )
    {
        if ( var_5 < 8 )
            continue;

        if ( var_5 > 17 )
            break;

        var_4 thread _id_00C8( var_1 );
        wait 0.5;
    }

    common_scripts\utility::flag_wait( "breach_done" );

    foreach ( var_5, var_4 in var_2 )
    {
        if ( var_5 < 18 )
            continue;

        var_4 thread _id_00C8( var_1 );
        wait 1.0;
    }

    common_scripts\utility::flag_wait( "left_statue" );
    wait 1.0;
    var_2 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "statue_to_mailbox" ] );
    var_2 = maps\_utility::_id_27EC( var_2 );

    foreach ( var_5, var_4 in var_2 )
    {
        if ( var_5 > 13 )
            break;

        var_4 thread _id_00C8( var_1 );
        wait 1.2;
    }

    common_scripts\utility::flag_wait_any( "spawn_tacticals", "goto_tunnel" );
    wait 2.0;

    foreach ( var_5, var_4 in var_2 )
    {
        if ( var_5 < 14 )
            continue;

        var_4 thread _id_00C8( var_1 );
        wait 1.0;
    }

    common_scripts\utility::flag_wait( "goto_bank" );
    wait 10.0;
    var_2 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mailbox_to_bank" ] );
    var_2 = maps\_utility::_id_27EC( var_2 );

    foreach ( var_5, var_4 in var_2 )
    {
        var_4 thread _id_00C8( var_1 );
        wait 1.5;
    }

    common_scripts\utility::flag_wait( "bank_done" );
    wait 6.0;
    var_2 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "bank_to_defend" ] );
    var_2 = maps\_utility::_id_27EC( var_2 );

    foreach ( var_5, var_4 in var_2 )
    {
        var_4 thread _id_00C8( var_1 );
        wait 0.9;
    }

    common_scripts\utility::flag_wait( "soap_pickedup" );
    wait 5.0;
    var_2 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "defend_to_death" ] );
    var_2 = maps\_utility::_id_27EC( var_2 );

    foreach ( var_5, var_4 in var_2 )
    {
        var_4 thread _id_00C8( var_1 );
        wait 1.0;
    }

    common_scripts\utility::flag_wait( "player_opened_door" );
    common_scripts\utility::array_call( var_0, ::delete );
}

_id_00C8( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = cos( 65 );

    var_1 = 1;

    while ( var_1 >= var_0 )
    {
        var_2 = vectornormalize( self.origin - level.player.origin );
        var_3 = anglestoforward( level.player getplayerangles() );
        var_1 = vectordot( var_3, var_2 );
        wait 0.1;
    }

    self show();
}

_id_7B23()
{
    var_0 = getentarray( "blood_pool_decal", "targetname" );
    common_scripts\utility::array_call( var_0, ::notsolid );
    common_scripts\utility::array_call( var_0, ::hide );
    common_scripts\utility::flag_wait( "soap_set_down" );
    wait 20.0;
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "dumpster" ] )[0];
    var_1 show();
    common_scripts\utility::flag_wait( "FLAG_store_soap_sitting_at_statue" );
    wait 20.0;
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "statue" ] )[0];
    var_1 show();
    common_scripts\utility::flag_wait( "FLAG_street_soap_sitting_by_mailbox" );
    wait 20.0;
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "street" ] )[0];
    var_1 show();
    common_scripts\utility::flag_wait( "FLAG_defend_court_soap_reached_back_area" );
    wait 20.0;
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "defend" ] )[0];
    var_1 show();
}

_id_7B24()
{
    var_0 = spawn( "script_model", level._id_54E0 gettagorigin( "j_elbow_bulge_le" ) );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    var_1 = 0 * anglestoright( level._id_54E0 gettagangles( "j_elbow_bulge_le" ) );
    var_2 = 0 * anglestoup( level._id_54E0 gettagangles( "j_elbow_bulge_le" ) );
    var_0.origin += ( var_1 + var_2 );
    var_0 setmodel( "tag_origin" );
    var_0 linkto( level._id_54E0, "j_elbow_bulge_le" );
    var_3 = common_scripts\utility::getfx( "FX_soap_walk_blood_drip" );

    while ( common_scripts\utility::flag( "FLAG_soap_blood_fx" ) )
    {
        common_scripts\utility::flag_wait( "FLAG_soap_walk_blood_drip_elbow" );
        playfxontag( var_3, var_0, "tag_origin" );

        if ( !common_scripts\utility::flag( "FLAG_soap_blood_fx" ) )
            break;

        common_scripts\utility::flag_waitopen( "FLAG_soap_walk_blood_drip_elbow" );
        stopfxontag( var_3, var_0, "tag_origin" );
        wait 0.05;
    }

    stopfxontag( var_3, var_0, "tag_origin" );
    var_0 delete();
}

_id_7B25()
{
    var_0 = spawn( "script_model", level._id_54E0 gettagorigin( "j_hip_ri" ) );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    var_1 = 4 * anglestoup( level._id_54E0 gettagangles( "j_hip_ri" ) );
    var_0.origin += var_1;
    var_0 setmodel( "tag_origin" );
    var_0 linkto( level._id_54E0, "j_hip_ri" );
    var_2 = common_scripts\utility::getfx( "FX_soap_walk_blood_drip" );

    while ( common_scripts\utility::flag( "FLAG_soap_blood_fx" ) )
    {
        common_scripts\utility::flag_wait( "FLAG_soap_walk_blood_drip_hip" );
        playfxontag( var_2, var_0, "tag_origin" );

        if ( !common_scripts\utility::flag( "FLAG_soap_blood_fx" ) )
            break;

        common_scripts\utility::flag_waitopen( "FLAG_soap_walk_blood_drip_hip" );
        stopfxontag( var_2, var_0, "tag_origin" );
        wait 0.05;
    }

    stopfxontag( var_2, var_0, "tag_origin" );
    var_0 delete();
}

_id_7B26( var_0 )
{
    var_1 = common_scripts\utility::ter_op( tolower( var_0 ) == "right", "ri", "le" );
    var_2 = spawn( "script_model", level._id_54E0 gettagorigin( "j_ball_" + var_1 ) );
    var_2.angles = ( 0, level._id_54E0.angles[1], 0 );
    var_2.origin += ( 0.0, 0.0, 4.0 );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( level._id_54E0, "j_ball_" + var_1 );
    var_3 = common_scripts\utility::getfx( "FX_soap_walk_blood_smear" );

    while ( common_scripts\utility::flag( "FLAG_soap_blood_fx" ) )
    {
        common_scripts\utility::flag_wait( "FLAG_soap_walk_blood_smear" );
        playfxontag( var_3, var_2, "tag_origin" );

        if ( !common_scripts\utility::flag( "FLAG_soap_blood_fx" ) )
            break;

        common_scripts\utility::flag_waitopen( "FLAG_soap_walk_blood_smear" );
        stopfxontag( var_3, var_2, "tag_origin" );
        wait 0.05;
    }

    stopfxontag( var_3, var_2, "tag_origin" );
    var_2 delete();
}

_id_7B27()
{
    level endon( "event_soap_carry_done" );

    for (;;)
    {
        self waittill( "trigger" );
        _id_7B2A();
        wait 1;
    }
}

_id_7B28()
{
    self waittill( "trigger" );

    for (;;)
    {
        _id_7B04();
        var_0 = randomfloatrange( 0.1, 0.4 );
        wait(var_0);
    }
}

_id_7B29()
{
    self waittill( "trigger" );
    magicgrenade( "fraggrenade", level.player._id_7A48.origin - ( 0.0, 32.0, 32.0 ), level.player._id_7A48.origin, 0.25 );
}

_id_7B2A()
{
    var_0 = maps\_utility::_id_263E( "soap_carry_enemy" );
    var_0 = maps\_utility::_id_2672( var_0 );

    if ( var_0.size > 1 )
    {
        var_1 = var_0[randomintrange( 1, var_0.size ) - 1];

        if ( isalive( var_1 ) )
            magicbullet( var_1.weapon, var_1 gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 32.0 ) );
    }
    else
    {
        var_1 = getent( "soap_carry_fire_backup", "targetname" );
        magicbullet( "ak47", var_1.origin, level.player.origin + ( 0.0, 0.0, 32.0 ) );
    }
}

_id_7B2B()
{
    level endon( "smoke_grenade_toss" );

    for (;;)
    {
        wait 0.05;

        if ( self getcurrentweaponclipammo() == 0 )
        {
            _id_7B2C();
            continue;
        }

        if ( self usebuttonpressed() )
            _id_7B2C();
    }
}

_id_7B2C()
{
    level endon( "smoke_grenade_toss" );
    maps\_utility::_id_2783( 0 );
    self setweaponammoclip( "p99", 12 );
    wait 1;
    maps\_utility::_id_2783( 1 );
}

_id_7B2D()
{
    var_0 = getent( "apt_wall_collapse_clip", "targetname" );
    var_0 disconnectpaths();
    var_0 common_scripts\utility::trigger_on();
    var_1 = getentarray( "apt_wall_collapse", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();

    var_5 = getentarray( "soap_carry_smoke_enemy", "script_noteworthy" );
    maps\_utility::_id_135B( var_5 );
    var_6 = getentarray( "soap_carry_distance_guys", "script_noteworthy" );
    maps\_utility::_id_135B( var_6 );
    common_scripts\utility::flag_wait( "event_soap_carry_done" );
    level._id_4877 allowedstances( "stand", "crouch", "prone" );
    level._id_4877._id_0F3C = 0;
    level._id_4877.badplaceawareness = 1;
    level._id_4877.dontavoidplayer = 0;
    level._id_4877 maps\_utility::_id_2710();
    level._id_4877 maps\_utility::_id_2178( 3 );
    level._id_4877 maps\_utility::_id_1071();
    level._id_4877 maps\_utility::_id_27B8();
    level._id_4877 maps\_utility::_id_2715();
    level._id_4877 maps\_utility::_id_26F3( 0 );
    level._id_4877 maps\_utility::_id_26E3( "off" );
    level._id_54E0 maps\_utility::_id_0A23( 0 );
    var_7 = getaiarray( "axis" );

    foreach ( var_9 in var_7 )
        var_9 maps\_utility::_id_2749();
}

_id_7B2E( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "fire_m203_a", "targetname" );
    _id_7B38( var_1.origin );
    var_2 = getent( "soap_carry_m203_car", "script_noteworthy" );

    if ( isdefined( var_2 ) )
        var_2 maps\_utility::_id_2733();

    level._id_4877 maps\_utility::_id_2712();
}

_id_7B2F( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "fire_m203_b", "targetname" );
    _id_7B38( var_1.origin );
    wait 0.5;
    level thread _id_7B16();
    level._id_4877 maps\_utility::_id_2713();
}

_id_7B30( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "fire_m203_at_wall", "targetname" );
    _id_7B38( var_1.origin );
    wait 0.2;
    common_scripts\utility::exploder( 280 );
    level.player playsound( "scn_prague_blowout_wall_exp" );
    level thread _id_7B39();
    var_2 = getent( "fxanim_exit_wall", "targetname" );
    var_2 useanimtree( level._id_1245["script_model"] );
    var_2._id_1032 = "exit_wall";
    var_2 maps\_anim::_id_1246( var_2, "exit_wall_explode" );
    level._id_4877 maps\_utility::_id_2713();
    level._id_4877 maps\_utility::_id_26E3( "on" );
}

_id_7B31( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_keepmoving" );
}

_id_7B32( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_wehavetogetoff" );
    common_scripts\utility::flag_wait( "clear_path_dialogue_2" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_thisway" );
}

_id_7B33()
{
    wait 1;
    level._id_54E0 thread maps\_utility::_id_168C( "presc_mct_makarovsaid" );
}

_id_7B34( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "align_price_throw_smoke", "targetname" );
    var_2 = getent( "smoke_throw_change_align", "targetname" );

    if ( level.player istouching( var_2 ) )
        var_1 = common_scripts\utility::getstruct( "align_price_throw_smoke_2", "targetname" );

    var_1 maps\_anim::_id_1246( level._id_4877, "soap_carry_cough_stop" );
    var_3 = common_scripts\utility::getstruct( "anim_align_wall_breach", "targetname" );
    var_3 maps\_anim::_id_124A( level._id_4877, "clear_path_in" );
    var_3 maps\_anim::_id_1246( level._id_4877, "clear_path_in" );
    var_3 thread maps\_anim::_id_124E( level._id_4877, "clear_path_loop" );
    common_scripts\utility::flag_set( "clear_path_loop_started" );
}

_id_7B35( var_0 )
{
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_coughing" );
}

_id_7B36( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_pickhimup" );
    common_scripts\utility::flag_wait( "soap_carry_cough_stop_dialogue_3" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_reinforcementsright" );
    common_scripts\utility::flag_wait( "soap_carry_cough_stop_dialogue_4" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_cmonnow" );
}

_id_7B37( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_dontyoudare" );
}

_id_7B38( var_0, var_1 )
{
    var_2 = level._id_4877 gettagorigin( "tag_flash" );
    playfxontag( level._effect["muzzleflash_heavy"], level._id_4877, "tag_flash" );
    var_3 = magicbullet( "m203_m4", var_2, var_0 );
    playfxontag( level._effect["geotrail_m203"], var_3, "tag_origin" );
    var_4 = 9216;
    var_5 = distancesquared( level._id_4877.origin, level.player.origin );

    if ( var_5 < var_4 )
        level.player playrumbleonentity( "damage_heavy" );

    if ( isdefined( var_1 ) )
        radiusdamage( var_0, 100, 200, 200 );
}

_id_7B39()
{
    wait 0.1;
    var_0 = getentarray( "apt_wall_destroyed", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 show();

    var_4 = getent( "fxanim_exit_wall", "targetname" );
    var_4 show();
    var_5 = getentarray( "apt_wall_clean", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 delete();
}
