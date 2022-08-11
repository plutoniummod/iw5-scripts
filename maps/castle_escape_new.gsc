// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8163()
{
    maps\castle_code::_id_8100( "startvista", 1 );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
    maps\castle_parachute_sim::_id_7059();
    maps\castle_parachute_sim::_id_807D();
    thread maps\_shg_common::move_player_to_start( "start_escape" );
    thread maps\castle_code::_id_8094( "start_escape" );
    maps\castle_courtyard_battle::_id_8164();
    maps\castle_courtyard_battle::_id_8165();
    level._id_4877 maps\_utility::_id_1057();
    level._id_4877 maps\_utility::_id_2714();
    level._id_4877 maps\_utility::_id_26F3( 1 );
    level._id_4877 maps\_utility::_id_2709( "mp5", "right" );
    level._id_4877.grenadeammo = 3;
    level._id_4877._id_20AF = 10;
    level._id_4877._id_0F3C = 1;
    thread _id_81A0( 0 );
    level._id_4877 maps\_utility::_id_280D();
    level._id_4877 maps\_utility::_id_0EEC();
    level._id_4877 maps\_utility::_id_2612( 1 );
    level thread _id_818A();
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_set( "player_entering_truck" );
    level._id_815A maps\_utility::_id_2683( level._id_4877 );
    level._id_4877 thread _id_8166();
    wait 1.0;
    common_scripts\utility::flag_set( "price_in_truck" );
}

_id_8166()
{
    level._id_4877 notify( "newanim" );
    level._id_4877 endon( "newanim" );
    level._id_4877 endon( "death" );
    var_0 = level._id_815A;
    var_1 = maps\_vehicle_aianim::_id_2534( var_0, 0 );
    var_0 thread maps\_anim::_id_124E( level._id_4877, "truck_idle", "stop_loop", var_1._id_24F2 );
    level waittill( "truck_moving" );
    level._id_4877 notify( "stop_loop" );
    thread maps\castle_truck_movement::_id_815B();
}

_id_8167()
{
    thread _id_8163();
    common_scripts\utility::waitframe();
    thread _id_8195();
    common_scripts\utility::flag_set( "price_in_truck" );
    common_scripts\utility::flag_set( "truck_starts_driving" );
    common_scripts\utility::waitframe();
    var_0 = getvehiclenode( "approaching_cliff_node", "script_noteworthy" );
    level._id_815A attachpath( var_0 );
    level._id_815A notify( "new_path" );
    level._id_815A thread maps\_vehicle::_id_26A1( var_0 );
    maps\_audio::aud_send_msg( "truck_doors_crash" );
}

_id_8168()
{
    level.player thread _id_816A();
    level thread _id_1EC0();
    level thread _id_8171();
    maps\castle_code::_id_80A0( 7 );
    thread _id_819A();
    level._id_4877 thread _id_8179();
    level._id_4877 thread _id_817B();
    level thread _id_8181();
    level thread _id_817D();
    level thread _id_81AF();
    level thread _id_81B2();
    level thread _id_819F();
    maps\_utility::_id_265A( "axis" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "player_entering_truck" );
    common_scripts\utility::flag_init( "rpg_on_escape" );
    common_scripts\utility::flag_init( "spawned_escape_helicopter" );
    common_scripts\utility::flag_init( "reveal_escape_helicopter" );
    common_scripts\utility::flag_init( "escape_helicopter_move" );
    common_scripts\utility::flag_init( "player_on_slope" );
    common_scripts\utility::flag_init( "cliff_deploy_chute" );
    common_scripts\utility::flag_init( "helicopter_shoot_player" );
    common_scripts\utility::flag_init( "stop_dirt_overlay" );
    common_scripts\utility::flag_init( "player_in_landing_zone" );
    common_scripts\utility::flag_init( "truck_went_off_cliff" );
    common_scripts\utility::flag_init( "escape_hydro_fx" );
    common_scripts\utility::flag_init( "escape_show_chute" );
    common_scripts\utility::flag_init( "player_landed_on_bank" );
    common_scripts\utility::flag_init( "truck_hits_fence" );
    common_scripts\utility::flag_init( "player_chute_opens" );
    common_scripts\utility::flag_init( "truck_starts_driving" );
    common_scripts\utility::flag_init( "escape_chute_ready" );
    common_scripts\utility::flag_init( "deploy_failed" );
}

_id_1EC0()
{
    var_0 = getent( "hill_slide", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 thread _id_8169( var_0 );
    }
}

_id_8169( var_0 )
{
    if ( isdefined( self.vehicle ) )
        return;

    if ( maps\_utility::_id_1EC2() )
        return;

    if ( isdefined( self._id_1EC3 ) )
        return;

    self endon( "death" );
    maps\_utility::_id_1EC5( undefined, 2.0, 0.045 );

    for (;;)
    {
        if ( !self istouching( var_0 ) )
            break;

        self playrumbleonentity( "damage_light" );
        earthquake( 0.1, 0.05, self.origin, 100 );
        common_scripts\utility::waitframe();
    }

    maps\_utility::_id_1EC7();
}

_id_816A()
{
    common_scripts\utility::flag_wait( "reveal_escape_helicopter" );
    common_scripts\utility::flag_wait( "player_on_slope" );
    thread _id_816D();
}

_id_816B()
{
    self endon( "death" );
    self takeallweapons();
    self giveweapon( "freerunner" );
    self switchtoweapon( "freerunner" );

    while ( !common_scripts\utility::flag( "cliff_deploy_chute" ) )
    {
        if ( self.origin[1] > level._id_4877.origin[1] )
        {
            var_0 = distancesquared( level._id_4877.origin, self.origin );

            if ( var_0 < 10000 )
                setsaveddvar( "player_sprintSpeedScale", 2.0 );
            else if ( var_0 < 360000 )
            {
                var_1 = maps\castle_code::_id_50B1( var_0, 10000, 360000, 2.0, 2.0 );
                setsaveddvar( "player_sprintSpeedScale", var_1 );
            }
            else
                setsaveddvar( "player_sprintSpeedScale", 2.0 );
        }

        wait 0.05;
    }
}

_id_816C()
{
    self endon( "death" );

    while ( !common_scripts\utility::flag( "cliff_deploy_chute" ) )
    {
        var_0 = distancesquared( level._id_4877.origin, self.origin );

        if ( var_0 > 360000 )
            common_scripts\utility::flag_set( "helicopter_shoot_player" );
        else
            common_scripts\utility::flag_clear( "helicopter_shoot_player" );

        wait 0.05;
    }

    common_scripts\utility::flag_clear( "helicopter_shoot_player" );
}

_id_816D()
{
    self endon( "death" );
    var_0[0] = "right";
    var_0[1] = "left";
    var_0[2] = "bottom";
    var_1 = 0;

    while ( !common_scripts\utility::flag( "stop_dirt_overlay" ) )
    {
        level.player thread maps\_gameskill::_id_2322( var_0[var_1] );
        var_1++;

        if ( var_1 == var_0.size )
            var_1 = 0;

        wait 1.5;
    }
}

_id_816E()
{
    common_scripts\utility::flag_wait( "escape_hydro_fx" );

    while ( common_scripts\utility::flag( "escape_hydro_fx" ) )
    {
        playfxontag( common_scripts\utility::getfx( "player_hydroplane" ), self._id_7A48, "TAG_ORIGIN" );
        self playrumbleonentity( "damage_light" );
        wait 0.1;
    }
}

_id_816F( var_0 )
{
    level.player playrumbleonentity( "damage_light" );
    earthquake( 0.1, 0.2, level.player.origin, 100 );
}

_id_8170( var_0 )
{
    level.player playrumbleonentity( "damage_heavy" );
    earthquake( 0.3, 0.2, level.player.origin, 100 );
}

_id_8171()
{
    maps\castle_parachute_sim::_id_7059();
    maps\castle_parachute_sim::_id_807D();
    common_scripts\utility::flag_wait( "truck_goes_off_road" );

    if ( isalive( level.player ) )
    {
        level.player lerpviewangleclamp( 0.5, 0.0, 0.0, 0, 0, 0, 0 );
        level.player disableweapons();
    }

    var_0 = getvehiclenode( "vehicle_jump_node", "script_noteworthy" );
    var_0 waittill( "trigger" );
    thread _id_81AC();
    common_scripts\utility::flag_wait( "truck_hits_fence" );
    thread maps\castle_truck_movement::_id_8160();
    wait 0.2;
    _id_81A3();
    common_scripts\utility::flag_set( "player_landed_on_bank" );
}

_id_8172()
{
    self endon( "chute_deployed" );
    wait 1.5;
    common_scripts\utility::flag_set( "escape_chute_ready" );
    thread _id_8174();
    level thread maps\_utility::_id_27BB( &"CASTLE_DEPLOY_CHUTE", 3 );
    wait 2;
    common_scripts\utility::flag_set( "deploy_failed" );
    self._id_7A48 stopanimscripted();
    self._id_7A48 hide();

    if ( isdefined( self._id_7A48._id_8173 ) )
        self._id_7A48._id_8173 hide();

    level thread maps\_utility::_id_27BD();
    self unlink();
    setdvar( "ui_deadquote", &"CASTLE_FAILED_TO_DEPLOY" );
    maps\_utility::_id_1826();
}

_id_8174()
{
    level endon( "deploy_failed" );

    while ( !maps\castle_code::_id_8175() )
        common_scripts\utility::waitframe();

    childthread _id_8176();
    thread _id_81AA();
    level.player maps\_utility::delaythread( 0.75, ::_id_81A1, 65, 0.65 );
    maps\_audio::aud_send_msg( "chute_deployed" );
    self notify( "chute_deployed" );
    level thread maps\_utility::_id_27BD();
}

_id_8176()
{
    level endon( "deploy_failed" );
    level.player._id_7A48 waittillmatch( "single anim", "deploy_chute" );
    common_scripts\utility::flag_set( "player_chute_opens" );
    level.player lerpviewangleclamp( 0.5, 0, 0, 25, 25, 25, 25 );
}

_id_8177()
{
    self._id_8173 = maps\_utility::_id_1287( "secondary_chute" );
    self._id_8173 hide();
    playfxontag( common_scripts\utility::getfx( "wind_rush_chute" ), self, "tag_camera" );
    var_0 = maps\castle_code::_id_7A41( "anim_align_end_land" );
    var_0 thread maps\_anim::_id_1246( self._id_8173, "release" );
    wait 2;
    self._id_8173 show();
    var_0 waittill( "release" );
    self._id_8173 delete();
}

_id_8178()
{
    if ( self.origin[1] < level._id_4877.origin[1] )
    {
        if ( !common_scripts\utility::flag( "escape_show_chute" ) )
            self hide();

        common_scripts\utility::flag_wait( "escape_show_chute" );
        self show();
    }
    else
    {
        self hide();
        wait 5;
        self show();
    }

    common_scripts\utility::flag_waitopen( "escape_show_chute" );
    self hide();
}

_id_8179()
{
    var_0[0] = "castle_pri_getin";
    var_0[1] = "castle_pri_onme2";
    var_0[2] = "castle_pri_overehere";
    maps\castle_code::_id_80E2( var_0, "player_entering_truck", 10, 0, 1 );
    maps\_utility::_id_1425( "escape_start" );
    level waittill( "truck_went_off_cliff" );
    var_1 = maps\castle_code::_id_7A41( "anim_align_end_land" );
    common_scripts\utility::flag_wait( "player_landed_on_bank" );
}

_id_817A()
{
    common_scripts\utility::flag_wait_or_timeout( "escape_helicopter_move", 5.0 );

    if ( !common_scripts\utility::flag( "escape_helicopter_move" ) )
    {
        setdvar( "ui_deadquote", &"CASTLE_FAILED_TO_FOLLOW" );
        level thread maps\_utility::_id_1826();
    }
}

_id_79BF( var_0 )
{
    level._id_1958 = 2.0;
    maps\_utility::_id_195A();
}

_id_817B()
{
    level waittill( "rpg_on_escape" );
    wait 2.0;
    maps\_utility::_id_168C( "castle_pri_holdon2" );
    wait 0.75;
    thread maps\_utility::_id_168C( "castle_pri_BTRs" );
    var_0 = getvehiclenode( "price_chute_line", "script_noteworthy" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_168C( "castle_pri_reserve" );
    wait 1.7;
    maps\_utility::_id_168C( "castle_pri_chuteready" );
}

_id_817C( var_0 )
{
    var_0 maps\_utility::_id_168C( "castle_pri_oneforthebooks" );
}

_id_817D()
{
    common_scripts\utility::flag_wait( "escape_btrs_spawned" );
    common_scripts\utility::waitframe();
    var_0 = maps\_utility::_id_2643( "escape_btr", "targetname" );
    common_scripts\utility::flag_wait( "btr_shoots_truck" );
    level thread _id_8197( var_0[0] );

    foreach ( var_2 in var_0 )
    {
        var_2 thread _id_817E();
        var_2 maps\_vehicle::_id_2A12();
    }
}

_id_817E()
{
    maps\_vehicle::_id_2A3D();
    level waittill( "btrs_shoot" );
    level endon( "truck_went_off_cliff" );
    self setturrettargetent( level.player );

    for (;;)
    {
        maps\castle_courtyard_battle::_id_8180( 15, 0.5, level._id_815A._id_817F );
        wait 0.5;
    }
}

_id_8181()
{
    maps\_treadfx::_id_28F1( "mi28", undefined );
    common_scripts\utility::flag_wait( "spawned_escape_helicopter" );
    common_scripts\utility::waitframe();
    var_0 = maps\_utility::_id_2642( "escape_helicopter", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    common_scripts\utility::flag_wait( "reveal_escape_helicopter" );
    var_1 = common_scripts\utility::getstruct( "escape_intro_pos", "targetname" );
    var_0 setgoalyaw( var_1.angles[1] );
    var_0 settargetyaw( var_1.angles[1] );
    var_0 setvehgoalpos( var_1.origin );
    var_0 waittill( "goal" );
    var_1 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_0 setgoalyaw( var_1.angles[1] );
    var_0 settargetyaw( var_1.angles[1] );
    var_0 setvehgoalpos( var_1.origin, 1 );
    var_0 thread _id_8183();
    level thread _id_8182();
    common_scripts\utility::flag_wait( "escape_helicopter_move" );
    maps\_vehicle::_id_1FA6( var_0 );
}
#using_animtree("script_model");

_id_8182()
{
    var_0 = getent( "fxanim_castle_tree_large_sway_mod", "targetname" );
    var_0._id_1032 = "tree_large";
    var_0 useanimtree( #animtree );
    var_0 thread maps\_anim::_id_124E( var_0, "sway" );
    var_1 = getent( "fxanim_castle_tree_small_sway_mod", "targetname" );
    var_1._id_1032 = "tree_small";
    var_1 useanimtree( #animtree );
    var_1 thread maps\_anim::_id_124E( var_1, "sway" );
    var_2 = getentarray( "chopper_tree", "script_noteworthy" );

    foreach ( var_4 in var_2 )
    {
        var_4 notify( "trigger" );
        wait(randomfloatrange( 0.5, 1.0 ));
    }

    common_scripts\utility::flag_wait( "escape_helicopter_move" );
    var_1 thread maps\_anim::_id_1246( var_1, "stop" );
    var_0 thread maps\_anim::_id_1246( var_0, "stop" );
}

_id_8183()
{
    while ( !common_scripts\utility::flag( "cliff_deploy_chute" ) )
    {
        if ( common_scripts\utility::flag( "helicopter_shoot_player" ) )
            _id_8185( level.player );
        else
            _id_8184( level.player );

        wait 0.5;
    }
}

_id_8184( var_0 )
{
    var_1 = anglestoforward( level.player.angles );
    var_2 = var_1 * 100;
    var_3 = var_2 + common_scripts\utility::randomvector( 50 );
    var_4 = randomintrange( 4, 6 );
    var_5 = 0.2;

    for ( var_6 = 0; var_6 < var_4; var_6++ )
    {
        var_7 = common_scripts\utility::randomvector( 15 ) + var_3 + ( 0.0, 0.0, 128.0 );
        self setturrettargetent( var_0, var_7 );
        self fireweapon();
        wait(var_5);
    }
}

_id_8185( var_0 )
{
    var_1 = randomintrange( 3, 5 );
    var_2 = 0.2;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self setturrettargetent( var_0, common_scripts\utility::randomvector( 20 ) + ( 0.0, 0.0, 32.0 ) );
        self fireweapon();
        wait(var_2);
    }
}

_id_8186()
{
    var_0 = 0;
    var_1 = getent( self.target, "targetname" );
    var_2 = undefined;
    var_3 = undefined;

    if ( var_1.model == "foliage_tree_pine_snow_tall_b_broken_btm" )
    {
        var_0 = 1;
        var_1._id_8187 = var_1.model;
        var_1 setmodel( "ctl_foliage_tree_pine_tall_b" );
    }
    else
    {
        var_1._id_8187 = var_1.model;
        var_1 setmodel( "ctl_foliage_tree_pine_tall_c" );
    }

    var_4 = getentarray( var_1.target, "targetname" );

    foreach ( var_6 in var_4 )
    {
        if ( var_6.classname == "script_model" )
            var_2 = var_6;

        if ( var_6.classname == "script_brushmodel" )
            var_3 = var_6;
    }

    var_2._id_8188 = var_2.angles;
    var_2.angles = var_1.angles;
    var_2 hide();
    var_8 = 0;

    if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "hits_the_ground" )
        var_8 = 1;

    if ( isdefined( var_3 ) )
        var_3 notsolid();

    self waittill( "trigger" );
    var_9 = var_2.origin - self.origin;
    var_10 = anglestoforward( var_9 );
    var_11 = anglestoup( var_9 );
    playfx( common_scripts\utility::getfx( "bullet_strafe" ), self.origin, var_10, var_11 );
    var_1 setmodel( var_1._id_8187 );
    var_12 = anglestoforward( var_2.angles );
    var_13 = anglestoup( var_2.angles );
    playfx( common_scripts\utility::getfx( "tree_trunk_snap" ), var_2.origin, var_13, -1 * var_12 );
    playfx( common_scripts\utility::getfx( "tree_fall_impact_wet" ), var_2.origin, var_13, var_12 );
    var_2 show();
    var_14 = 0.25;

    if ( var_0 )
        var_14 -= 0.25;

    var_15 = 2;
    var_16 = var_15;
    var_2 rotateto( var_2._id_8188, var_15, var_16, 0 );
    wait(var_15 - var_14);

    if ( var_8 )
    {
        var_12 = anglestoforward( var_2.angles );
        var_13 = anglestoup( var_2.angles );
        playfx( common_scripts\utility::getfx( "tree_shake_wet" ), var_2.origin, var_13, var_12 );
    }

    wait(var_14);

    if ( var_8 )
    {
        var_3 solid();
        var_3 thread _id_8189();
    }

    if ( var_8 && !var_0 )
    {
        if ( level.player maps\_utility::_id_260B( var_2.origin ) )
            earthquake( 0.3, 0.3, var_2.origin, 2000 );
    }

    if ( !var_8 )
    {
        var_12 = anglestoforward( var_2.angles );
        var_13 = anglestoup( var_2.angles );
        playfx( common_scripts\utility::getfx( "tree_shake_wet" ), var_2.origin, var_13, var_12 );
    }

    var_17 = 0.2;
    var_2 movez( 4, var_17, 0, var_17 );
    wait(var_17);
    var_2 movez( -3, var_17, 0, var_17 );
    wait(var_17);
    var_2 movez( 2, var_17, 0, var_17 );
    wait(var_17);
    var_2 movez( -1, var_17, 0, var_17 );
    wait(var_17);
}

_id_8189()
{
    for (;;)
    {
        if ( level.player istouching( self ) )
        {
            level.player setblurforplayer( 25, 0 );
            earthquake( 0.3, 0.5, level.player.origin, 100 );
            level.player playrumbleonentity( "damage_heavy" );
            common_scripts\utility::waitframe();
            level.player setblurforplayer( 0, 0.5 );
            wait 0.5;
            return;
        }

        common_scripts\utility::waitframe();
    }
}

_id_818A()
{
    thread _id_818E();
    var_0 = getent( "escape_truck", "targetname" );
    var_1 = var_0 maps\_utility::_id_1FA3();
    var_1 maps\_vehicle::_id_2A12();
    var_1._id_2955 = 1;
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_1 gettagorigin( "TAG_PLAYER1_ROTATE" );
    var_2.origin = ( var_2.origin[0], var_2.origin[1], var_2.origin[2] - 20 );
    var_2.angles = var_1 gettagangles( "TAG_PLAYER1_ROTATE" );
    var_2 linkto( var_1, "TAG_PLAYER1_ROTATE" );
    var_1._id_818B = var_2;
    level._id_818C = "tag_origin";
    level._id_815A = var_1;
    var_1 thread maps\castle_truck_movement::_id_8156();
    common_scripts\utility::flag_wait( "get_to_escape_truck" );
    var_3 = spawn( "script_model", var_1.origin );
    var_3 setmodel( "vehicle_uaz_open_player_ride_door_backl_obj" );
    var_3.angles = var_1.angles;
    var_3 linkto( var_1, "body_animate_jnt" );
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_1 gettagorigin( "TAG_HOOD_FX" ) + ( 0.0, 0.0, 30.0 );
    var_4 linkto( var_1 );
    var_1._id_817F = var_4;
    var_5 = getent( "escape_truck_use_target", "targetname" );
    var_5 setcursorhint( "HINT_ACTIVATE" );
    var_5 sethintstring( &"CASTLE_CLIMB_IN" );
    var_5 makeusable();
    var_5 thread _id_818D( "player_entering_truck" );
    common_scripts\utility::flag_wait( "player_entering_truck" );
    var_5 delete();
    var_3 delete();
}

_id_818D( var_0 )
{
    self waittill( "trigger" );
    common_scripts\utility::flag_set( var_0 );
}

_id_818E()
{
    if ( level._id_1F19 == "cliff" )
        return;

    common_scripts\utility::flag_wait( "player_entering_truck" );
    thread _id_818F();
    thread _id_8192();
    level.player disableweapons();
    level.player allowcrouch( 0 );
    level.player thread _id_8191();
    maps\castle_truck_movement::_id_8159();
    maps\_utility::_id_261A( 8000 );
    level.player playerlinktoblend( level._id_815A._id_818B, level._id_818C, 0.2, 0.1, 0.1 );
    wait 0.2;
    level.player enableweapons();
    _id_8195();
}

_id_818F()
{
    var_0 = "player_on_truck";
    var_1 = getentarray( var_0, "targetname" );

    if ( var_1.size > 0 )
        maps\_utility::_id_272C( var_0, 1, 1 );

    maps\_utility::_id_2703( "courtyard_kill_200", "targetname" );
    level notify( "notify_player_entered_car" );
}

_id_8190()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_1 != self )
            self.health += int( var_0 * 0.5 );
    }
}

_id_8191()
{
    for (;;)
    {
        if ( self isthrowinggrenade() )
        {
            self enabledeathshield( 0 );

            if ( common_scripts\utility::flag( "through_escape_doors" ) )
                self disableinvulnerability();
        }
        else
        {
            self enabledeathshield( 1 );

            if ( common_scripts\utility::flag( "through_escape_doors" ) )
                self enableinvulnerability();
        }

        wait 0.05;
    }
}

_id_8192()
{
    common_scripts\utility::flag_wait( "rpg_on_escape" );
    var_0 = common_scripts\utility::getstruct( "truck_rpg1_start", "targetname" );
    var_1 = common_scripts\utility::getstruct( "truck_rpg1_target", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin );
    var_3 = missile_createattractorent( var_2, 200000, 2000 );
    var_4 = magicbullet( "rpg_straight", var_0.origin, var_1.origin );
    wait 7;
    missile_deleteattractor( var_3 );
}

_id_8193( var_0 )
{
    level waittill( "truck_moving" );
    level._id_8194 = common_scripts\utility::spawn_tag_origin();
    level._id_8194 linkto( var_0, "tag_hood_fx", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level waittill( "truck_gets_shot" );
    playfxontag( common_scripts\utility::getfx( "castle_truck_damage_moving" ), level._id_8194, "tag_origin" );
    level waittill( "truck_swap", var_1 );
    level._id_8194 linkto( var_1, "tag_hood_fx", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

_id_8195()
{
    var_0 = level._id_815A;
    thread _id_8193( var_0 );
    level.player allowcrouch( 0 );
    _id_8198( 1, 0.8 );
    level notify( "start_manage_player_position" );
    level.player maps\_utility::delaythread( 1.0, ::_id_819E );
    common_scripts\utility::flag_wait( "price_in_truck" );
    maps\_audio::aud_send_msg( "start_driving" );
    thread maps\_utility::_id_25EE( "truck_starts_driving", 1.0 );
    common_scripts\utility::flag_wait( "truck_starts_driving" );
    _id_81AD( level._id_815A, 1 );
    var_1 = getvehiclenode( "escape_path_start", "targetname" );
    var_0 startpath( var_1 );
    var_0 thread maps\_vehicle::_id_26A1( var_1 );
    level notify( "truck_moving" );
    level._id_4877 thread maps\_utility::delaythread( 0.5, maps\_utility::_id_168C, "castle_pri_detonating" );
    maps\_utility::delaythread( 1.5, maps\castle_courtyard_battle::_id_8196, level._id_4877 );
    maps\_audio::aud_send_msg( "truck_ride_start" );
    thread _id_819D();
    thread _id_8199();
    var_2 = getvehiclenode( "vehicle_jump_node", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_0 stoploopsound();
    common_scripts\utility::flag_set( "truck_went_off_cliff" );
}

_id_8197( var_0 )
{
    var_1 = var_0.origin;
    var_2 = level._id_815A gettagorigin( "tag_hood_fx" );
    playfx( common_scripts\utility::getfx( "bmp_flash_wv" ), var_1, vectornormalize( var_2 - var_1 ), ( 0.0, 0.0, 1.0 ) );
    magicbullet( "btr80_turret2", var_1, var_2 );
    wait 0.5;
    level notify( "btrs_shoot" );
    wait 0.3;
    level notify( "truck_gets_shot" );
    maps\castle_truck_movement::_id_8162( level._id_815A );
}

_id_8198( var_0, var_1, var_2 )
{
    var_3 = level._id_818C;
    var_4 = level._id_815A._id_818B;

    if ( var_0 )
        level.player playerlinktodelta( var_4, var_3, var_1 );
    else if ( isdefined( var_2 ) && var_2 )
        level.player playerlinktoabsolute( var_4, var_3 );
    else
        level.player playerlinkto( var_4, var_3, var_1 );
}

_id_8199()
{
    var_0 = getvehiclenode( "escape_on_hill", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "rpg_on_escape" );
    wait 0.1;
    _id_8198( 1, 0.5 );
    var_0 = getvehiclenode( "reached_bottom_of_hill", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level notify( "reached_bottom_of_hill" );
    _id_8198( 1, 0.8 );
}

_id_819A()
{
    var_0 = getvehiclenode( "escape_on_hill", "script_noteworthy" );
    var_0 waittill( "trigger" );
    thread _id_819B( "stop_hill_rumble" );
    var_0 = getvehiclenode( "reached_bottom_of_hill", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level notify( "stop_hill_rumble" );
    thread _id_819C( "stop_road_rumble" );
    common_scripts\utility::flag_wait( "truck_went_off_cliff" );
    level notify( "stop_road_rumble" );
}

_id_819B( var_0 )
{
    level endon( var_0 );

    for (;;)
    {
        level.player playrumbleonentity( "damage_heavy" );
        earthquake( 0.25, 0.2, level.player.origin, 400 );
        wait 0.15;
    }
}

_id_819C( var_0 )
{
    level endon( var_0 );

    for (;;)
    {
        earthquake( 0.3, 0.4, level.player.origin, 600 );
        level.player playrumbleonentity( "damage_light" );
        wait(randomfloatrange( 0.5, 1.5 ));
    }
}

_id_819D()
{
    common_scripts\utility::flag_wait( "through_escape_doors" );
    level notify( "hit_escape_doors" );
    thread maps\castle_truck_movement::_id_8160();
    thread maps\castle_truck_movement::_id_8161( level._id_815A );
    thread _id_81A0( 1 );
    maps\_compass::setupminimap( "compass_map_castle_road", "road_minimap_corner" );
    maps\_audio::aud_send_msg( "truck_doors_crash" );
}

_id_819E()
{
    level.player._id_20F2._id_22F5 = 2;
    level.player._id_20F2._id_22F6 = 2;
    level.player._id_20F2._id_22F4 = 2;
    level.player._id_20F2._id_22F9 = 250;
    level.player._id_20F2.playerhealth_regularregendelay = 500;
    level.player._id_20F2._id_22F6 = 2;
    level.player._id_20F2._id_22FB = 0.33;
    level.player._id_20F2._id_22F8 = 0.01;
}

_id_819F()
{
    level waittill( "hit_escape_doors" );
    wait 0.75;
    thread maps\castle_truck_movement::_id_815D();
    wait 1.35;
    thread maps\castle_truck_movement::_id_815E();
    wait 2.15;
    thread maps\castle_truck_movement::_id_815E();
    var_0 = getvehiclenode( "price_chute_line", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 1.0;
    thread maps\castle_truck_movement::_id_815D();
}

_id_81A0( var_0 )
{
    var_1 = getent( "escape_gate_left", "targetname" );
    var_2 = getent( "escape_gate_right", "targetname" );

    if ( var_0 )
    {
        var_1 rotateyaw( 90, 0.2, 0, 0.1 );
        var_2 rotateyaw( -90, 0.15, 0, 0.1 );
        level.player playrumbleonentity( "damage_heavy" );
        earthquake( 1.0, 0.8, level.player.origin, 500 );
        common_scripts\utility::exploder( 2000 );
        maps\_utility::_id_261A( 9100 );
        common_scripts\utility::exploder( 650 );
    }
    else
    {
        var_1 rotateyaw( -90, 1.0, 0, 0.05 );
        var_2 rotateyaw( 90, 1.0, 0, 0.05 );
    }
}

_id_81A1( var_0, var_1 )
{

}

_id_81A2( var_0, var_1, var_2 )
{
    setslowmotion( var_0, var_1, var_2 );
}

_id_81A3( var_0 )
{
    level.player thread _id_8172();
    level endon( "deploy_failed" );
    var_1 = common_scripts\utility::getstruct( "new_end_origin", "targetname" );
    var_1.angles = ( 0.0, 0.0, 0.0 );
    var_1 thread maps\castle_code::_id_7A47( "cliffjump_new", undefined, 0, 0.0, 0, 1, 0, 0, 0, 0 );
    level.player._id_7A48 maps\_utility::delaythread( 0.05, ::_id_81A9 );
    level._id_81A4 = maps\_utility::_id_1287( "player_rig", level.player._id_7A48.origin );
    level._id_81A4 linkto( level.player._id_7A48, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_81A4 hide();
    level.player._id_7A48 maps\_anim::_id_11CF( level._id_81A4, "escape_player_deploy_chute", "tag_player" );
    thread _id_81A6();
    level.player waittill( "player_anim_started" );
    level.player playerlinktodelta( level._id_81A4, "tag_player", 1.0, 0, 0, 0, 0, 1 );
    level.player maps\_utility::delaythread( 0.5, ::_id_81A1, 75, 0.5 );
    var_2 = 0.5;
    level.player maps\_utility::delaythread( 0.25, ::_id_81A2, 1.0, 0.25, 0.5 );
    level.player maps\_utility::delaythread( 0.85, ::_id_81A2, 0.25, 1.0, 0.5 );
    var_3 = level._id_815A;
    _id_81AD( var_3, 0 );
    level._id_4877 unlink();
    var_4 = maps\_utility::_id_1287( "escape_truck", level._id_815A.origin );
    level notify( "truck_swap", var_4 );
    maps\_utility::delaythread( 0.1, ::_id_81AD, var_4, 1, 1, 0 );
    var_4 hidepart( "tag_glass_front" );
    var_4 hidepart( "tag_glass_front_d" );
    var_4 hidepart( "J_windshield_frame" );
    var_4.angles = level._id_815A.angles;
    var_4.origin = level._id_815A.origin;
    var_3._id_0A39 = common_scripts\utility::array_remove( var_3._id_0A39, level._id_4877 );
    var_3._id_24E8[0] = 0;
    var_3 delete();
    var_5 = [];
    var_5[0] = level._id_4877;
    var_5[1] = var_4;
    var_6 = maps\_utility::_id_1287( "escape_chute_price", level._id_4877.origin );
    var_6 hide();
    var_7 = maps\_utility::_id_1287( "escape_chute_price_2", level._id_4877.origin );
    var_7 hide();
    var_5[2] = var_6;
    var_5[3] = var_7;
    var_6 thread _id_81A7( var_6, var_7 );
    var_1 thread maps\_anim::_id_11DD( var_5, "cliffjump_new" );
    thread _id_81AB();
    var_8 = getanimlength( level.player._id_7A48 maps\_utility::_id_1281( "cliffjump_new" ) );
    level.player._id_7A48 maps\_utility::_id_11E4( "single anim", "fade_out", var_8 - 0.75 );
    _id_79BF( level._id_4877 );
}

_id_81A5()
{
    maps\_audio::aud_send_msg( "escape_truck_explodes" );

    if ( common_scripts\utility::flag( "deploy_failed" ) )
    {

    }

    common_scripts\utility::exploder( 4000 );
}

_id_81A6()
{
    level endon( "deploy_failed" );
    var_0 = maps\_utility::_id_1287( "escape_chute_player", level.player._id_7A48.origin );
    var_0 linkto( level.player._id_7A48, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 hide();
    level.player._id_7A48 maps\_anim::_id_11CF( var_0, "cliffjump_glide", "tag_player" );
    level.player._id_7A48 waittillmatch( "single anim", "start_glide_anim" );
    var_0 maps\_utility::delaythread( 0.05, ::_id_81A8 );
    var_1 = [];
    var_1[0] = var_0;
    var_1[1] = level._id_81A4;
    level.player._id_7A48 thread maps\_anim::_id_11DD( var_1, "cliffjump_glide", "tag_player" );
    wait 0.5;

    if ( isalive( level.player ) )
        level.player lerpviewangleclamp( 0.5, 0.1, 0.1, 25, 25, 25, 25 );
}

_id_81A7( var_0, var_1 )
{
    level._id_4877 waittillmatch( "single anim", "unhide_chute" );
    var_0 show();
    level._id_4877 waittillmatch( "single anim", "switch_parachutes" );
    var_0 delete();
    var_1 show();
}

_id_81A8()
{
    self show();
}

_id_81A9()
{
    self hide();
}

_id_81AA()
{
    var_0 = level._id_81A4;
    var_1 = maps\_utility::_id_1287( "player_rig_ripcord", level.player._id_7A48.origin );
    var_1 linkto( level.player._id_7A48, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 hide();
    var_1 maps\_utility::delaythread( 0.05, ::_id_81A8 );
    var_0 maps\_utility::delaythread( 0.1, ::_id_81A8 );
    level.player._id_7A48 thread maps\_anim::_id_1246( var_0, "escape_player_deploy_chute", "tag_player" );
    level.player._id_7A48 thread maps\_anim::_id_1246( var_1, "escape_player_deploy_chute", "tag_player" );
}

_id_81AB()
{
    level.player._id_7A48 waittillmatch( "single anim", "vo_line_nikolai" );
    maps\_utility::_id_11F4( "castle_nik_onmyway" );
}

_id_81AC()
{
    wait 0.5;
    level.player playrumbleonentity( "damage_heavy" );
    earthquake( 1.0, 0.4, level.player.origin, 500 );
    maps\_audio::aud_send_msg( "truck_off_cliff" );
}

_id_81AD( var_0, var_1, var_2, var_3 )
{
    var_4 = level._effect["car_headlight_beam_50_percent"];
    var_5 = level._effect["uaz_taillight"];

    if ( var_1 )
    {
        if ( isdefined( var_2 ) && var_2 )
        {
            playfxontag( var_4, var_0, "TAG_LIGHT_RIGHT_FRONT" );
            playfxontag( var_4, var_0, "TAG_LIGHT_LEFT_FRONT" );
            playfxontag( var_5, var_0, "TAG_LIGHT_LEFT_TAIL" );
            playfxontag( var_5, var_0, "TAG_LIGHT_RIGHT_TAIL" );
        }

        var_6 = common_scripts\utility::spawn_tag_origin();
        var_7 = var_0 gettagorigin( "tag_light_left_front" );
        var_8 = var_0 gettagorigin( "tag_light_right_front" );
        var_6.origin = ( var_7 + var_8 ) * 0.5;
        var_6.angles = var_0 gettagangles( "tag_light_right_front" );
        var_6 linkto( var_0, "tag_light_left_front", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

        if ( !isdefined( var_3 ) )
            var_3 = 1;

        if ( var_3 )
            playfxontag( common_scripts\utility::getfx( "spotlight_dlight" ), var_6, "tag_origin" );

        var_0._id_81AE = var_6;
    }
    else
    {
        stopfxontag( common_scripts\utility::getfx( "spotlight_dlight" ), var_0._id_81AE, "tag_origin" );
        stopfxontag( var_4, var_0, "TAG_LIGHT_RIGHT_FRONT" );
        stopfxontag( var_4, var_0, "TAG_LIGHT_LEFT_FRONT" );
        stopfxontag( var_5, var_0, "TAG_LIGHT_LEFT_TAIL" );
        stopfxontag( var_5, var_0, "TAG_LIGHT_RIGHT_TAIL" );
        var_0._id_81AE delete();
    }
}

_id_81AF()
{
    var_0 = common_scripts\utility::getstructarray( "escape_physics_explosion", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_81B1();

    level._id_81B0 = 200;
}

_id_81B1()
{
    while ( isdefined( level._id_815A ) && length( level._id_815A.origin - self.origin ) > 115 )
        wait 0.05;

    if ( isdefined( self.script_exploder ) )
    {
        common_scripts\utility::exploder( level._id_81B0 );
        level._id_81B0 += 1;
    }

    radiusdamage( self.origin, 100, 1, 1 );
    physicsexplosionsphere( self.origin, 100, 100, 50 );
    maps\_audio::aud_send_msg( "fence_debris" );
}

_id_81B2()
{
    var_0 = getvehiclenode( "escape_fence_crash", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 0.02;
    physicsexplosionsphere( var_0.origin, 500, 500, 50 );
    common_scripts\utility::exploder( 2200 );
    common_scripts\utility::exploder( 2201 );
    common_scripts\utility::exploder( 8100 );
    wait 3.85;
    _id_81A5();
}
