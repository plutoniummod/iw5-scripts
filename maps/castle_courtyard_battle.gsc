// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_81B3()
{
    maps\_shg_common::move_player_to_start( "start_bridge_explode" );
    maps\castle_code::_id_8094( "start_bridge_explode" );
    level._id_4877 maps\_utility::_id_2709( "mp5", "right" );
    level._id_4877.grenadeammo = 3;
    level._id_4877._id_20AF = 10;
    level._id_4877._id_0F3C = 1;
    level._id_4877 maps\_utility::_id_280D();
    level._id_4877 maps\_utility::_id_0EEC();
    level._id_4877 maps\_utility::_id_2612( 1 );
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_81B4()
{
    maps\_shg_common::move_player_to_start( "start_courtyard_battle" );
    maps\castle_code::_id_8094( "start_courtyard_battle" );
    maps\castle_code::_id_80A0( 2 );
    common_scripts\utility::exploder( 507 );
    common_scripts\utility::exploder( 508 );
    common_scripts\utility::exploder( 509 );
    level._id_81B5 = getent( "inner_courtyard_mantle", "targetname" );
    level._id_4877 maps\_utility::_id_2709( "mp5", "right" );
    level._id_4877.grenadeammo = 3;
    level._id_4877._id_20AF = 1;
    level._id_4877 maps\_utility::_id_1071();
    level._id_4877 maps\_utility::_id_27B8();
    level._id_4877 maps\_utility::_id_2715();
    level._id_4877 maps\_utility::_id_26F3( 0 );
    level._id_4877._id_0F3C = 0;
    level._id_4877 maps\_utility::_id_2178( 3 );
    level.player giveweapon( "ump45_acog" );
    level.player switchtoweaponimmediate( "ump45_acog" );
    common_scripts\utility::flag_set( "bridge_price_kill_done" );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
    maps\castle_code::_id_8100( "startvista", 1 );
}

_id_81B6()
{
    _id_81E1();
    maps\castle_code::_id_80A0( 2 );
    level notify( "security_office_closed" );
    maps\_utility::_id_261A( 501 );
    maps\_utility::_id_261A( 502 );
    maps\_utility::_id_261A( 503 );
    maps\_utility::_id_261A( 504 );
    maps\_utility::_id_261A( 505 );
    maps\_utility::_id_261A( 506 );
    maps\_utility::_id_261A( 530 );
    common_scripts\utility::exploder( 5000 );
    common_scripts\utility::exploder( 507 );
    common_scripts\utility::exploder( 508 );
    common_scripts\utility::exploder( 509 );
    level._id_81B7 = getent( "outer_courtyard_playerclip", "targetname" );
    level._id_81B7 solid();
    level.player thread _id_81BB();
    level.player thread _id_81BD();
    level._id_4877 thread _id_81C1();
    level._id_4877 thread _id_81C4();
    level thread _id_81D1();
    level thread _id_81CE();
    common_scripts\utility::flag_wait( "bridge_detonated" );
}

_id_81B8()
{
    _id_8164();
    maps\_utility::_id_1A5A( "axis", maps\_utility::_id_2736, 0.3 );
    level._id_4877._id_20AF = 1;
    level._id_4877 maps\_utility::_id_1071();
    level._id_4877 maps\_utility::_id_27B8();
    level._id_4877 maps\_utility::_id_2715();
    level._id_4877 maps\_utility::_id_26F3( 0 );
    level._id_4877._id_0F3C = 0;
    level thread maps\castle_escape_new::_id_818A();
    level.player thread _id_81BF();
    level._id_4877 thread _id_81C8();
    level thread _id_81B9();
    level thread _id_8165();
    level thread _id_81DA();
    level thread _id_0150();
    common_scripts\utility::flag_wait( "get_to_escape_truck" );
}

_id_0150()
{
    common_scripts\utility::flag_wait( "turn_off_lights_under_bridge" );
    var_0 = getentarray( "bridgeunder_lights", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setlightintensity( 0.1 );
}

_id_81B9()
{
    var_0 = getent( "road_spotlight", "targetname" );

    if ( isdefined( var_0._id_80ED ) )
        return;

    playfxontag( common_scripts\utility::getfx( "spotlight_modern_rain_lt_cheap" ), var_0, "tag_light" );
    var_0 setmode( "manual" );
    var_0 setmodel( "ctl_spotlight_modern_3x_on" );
    var_0 maketurretinoperable();
    var_1 = getent( "outer_courtyard_spotlight_target", "targetname" );
    var_0 settargetentity( var_1 );
    var_0 thread _id_81BA();
}

_id_81BA()
{
    maps\_utility::_id_262C( self.target );
    playfxontag( common_scripts\utility::getfx( "spotlight_destroy" ), self, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "spotlight_modern_rain_lt_cheap" ), self, "tag_light" );
    self setmodel( "ctl_spotlight_modern_3x_destroyed" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "give_bridge_detonator" );
    common_scripts\utility::flag_init( "start_bridge_entrance" );
    common_scripts\utility::flag_init( "jumped_to_bridge" );
    common_scripts\utility::flag_init( "bridge_player_fired" );
    common_scripts\utility::flag_init( "bridge_detonated" );
    common_scripts\utility::flag_init( "bridge_price_kill" );
    common_scripts\utility::flag_init( "bridge_price_kill_done" );
    common_scripts\utility::flag_init( "ccb_player_entered_cy" );
    common_scripts\utility::flag_init( "ccb_begin_driveout" );
    common_scripts\utility::flag_init( "15second_delay" );
    common_scripts\utility::flag_init( "ccb_btr_inposition" );
    common_scripts\utility::flag_init( "courtyard_btr_alive" );
    common_scripts\utility::flag_init( "courtyard_btr_destroyed" );
    common_scripts\utility::flag_init( "get_to_escape_truck" );
    common_scripts\utility::flag_init( "price_in_truck" );
}

_id_81BB()
{
    common_scripts\utility::flag_wait( "jumped_to_bridge" );
    maps\_audio::aud_send_msg( "player_jumped_to_bridge" );
    common_scripts\utility::flag_set( "re_start_water_splash_fx" );
    self._id_4625 = self getcurrentweapon();
    maps\_stealth_utility::_id_4342();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_0 = maps\castle_code::_id_7A41( "castle_bridge" );
    var_0 thread maps\castle_code::_id_7A47( "bridge_jump", undefined, 1, 0.5 );
    wait 0.5;
    self playrumbleonentity( "damage_heavy" );
    earthquake( 1.0, 0.5, level.player.origin, 2000 );

    if ( !common_scripts\utility::flag( "bridge_detonated" ) )
    {

    }

    var_0 waittill( "bridge_jump" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );

    if ( self hasweapon( self._id_4625 ) )
        self switchtoweapon( self._id_4625 );
    else
        self switchtoweapon( self getweaponslistprimaries()[0] );

    if ( !common_scripts\utility::flag( "bridge_detonated" ) )
    {
        level._id_4877 thread maps\_utility::_id_168C( "castle_pri_detonate" );
        common_scripts\utility::flag_wait( "bridge_detonated" );
        level._id_4877 thread maps\_utility::_id_168C( "castle_pri_sloppybastard" );
    }
}

_id_81BC( var_0 )
{
    level.player enableweapons();
}

_id_81BD()
{
    common_scripts\utility::flag_wait( "give_bridge_detonator" );
    maps\_c4::_id_4626();
    thread _id_7B69();
    self waittill( "detonate" );

    if ( isdefined( level._id_81BE ) )
        level._id_81BE delete();

    common_scripts\utility::flag_set( "bridge_detonated" );
    level notify( "bridge_destroy" );
    earthquake( 0.4, 0.8, level.player.origin, 2000 );
    self playrumbleonentity( "damage_heavy" );
    thread maps\_c4::_id_4624();
    level._id_81B7 notsolid();
}

_id_7B69()
{
    level endon( "bridge_detonated" );
    wait 8;
    common_scripts\utility::flag_set( "bridge_player_fired" );
}

_id_8126()
{
    level endon( "bridge_detonated" );

    while ( !self isfiring() && !self isthrowinggrenade() )
        wait 0.05;

    common_scripts\utility::flag_set( "bridge_player_fired" );
    level._id_4877 maps\_utility::_id_2612( 0 );
}

_id_81BF()
{
    var_0 = 0;
    self._id_81C0 = 1;
    var_1 = getent( "courtyard_zone_1", "targetname" );
    var_2 = getent( "courtyard_zone_2", "targetname" );
    var_3 = getent( "courtyard_zone_3", "targetname" );
    var_4 = newhudelem();
    var_4.foreground = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.horzalign = "left";
    var_4.vertalign = "top";
    var_4.x = -20;
    var_4.y = -20;
    var_4.fontscale = 1.5;
    var_4.color = ( 0.8, 1.0, 0.8 );
    var_4.glowcolor = ( 0.3, 0.6, 0.3 );
    var_4.glowalpha = 1;
    var_4.hidewheninmenu = 1;

    while ( !common_scripts\utility::flag( "courtyard_btr_destroyed" ) )
    {
        if ( self istouching( var_1 ) )
            self._id_81C0 = 1;
        else if ( self istouching( var_2 ) )
            self._id_81C0 = 2;
        else if ( self istouching( var_3 ) )
            self._id_81C0 = 3;

        wait 0.1;

        if ( var_0 )
            var_4 settext( "Zone " + self._id_81C0 );
    }

    var_4 destroy();
}

_id_81C1()
{
    level endon( "jumped_to_bridge" );
    var_0 = maps\castle_code::_id_7A41( "bridge_overlook" );
    self._id_81C2 = var_0;
    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_1425( "end_inner_courtyard" );
    level.player maps\_utility::delaythread( 2.0, ::_id_8126 );
    var_0 maps\_anim::_id_124A( self, "overlook_intro" );
    thread maps\_utility::_id_168C( "castle_pri_justintime" );
    var_0 maps\_anim::_id_1246( self, "overlook_intro" );
    var_0 thread maps\_anim::_id_124E( self, "overlook_idle" );
    common_scripts\utility::flag_wait( "give_bridge_detonator" );

    if ( !common_scripts\utility::flag( "bridge_detonated" ) )
    {
        thread maps\_utility::_id_168C( "castle_pri_doit" );
        var_0 notify( "stop_loop" );
        var_0 maps\_anim::_id_1246( self, "overlook_talk" );
        var_0 thread maps\_anim::_id_124E( self, "overlook_idle" );

        if ( !common_scripts\utility::flag( "bridge_detonated" ) )
            thread _id_81C3( var_0 );

        common_scripts\utility::flag_wait_any( "bridge_detonated", "jumped_to_bridge" );
    }

    var_0 notify( "stop_loop" );
    maps\_utility::_id_1414();
    var_1 = getent( "after_explosion_pathclip", "targetname" );
    var_1 disconnectpaths();

    if ( !common_scripts\utility::flag( "bridge_player_fired" ) )
        thread maps\_utility::_id_168C( "castle_pri_move4" );

    maps\_utility::_id_2686();
    maps\_utility::_id_13A4( "g" );
    maps\_utility::_id_26BF( "price_move_bridge_jump" );
    self.goalradius = 32;
    var_0 maps\_anim::_id_1247( self, "overlook_exit" );
    self waittill( "goal" );
    thread maps\_utility::_id_168C( "castle_pri_jumpgo" );
}

_id_81C3( var_0 )
{
    level endon( "bridge_detonated" );
    level endon( "jumped_to_bridge" );

    for (;;)
    {
        wait 6;
        var_0 notify( "stop_loop" );
        thread maps\_utility::_id_168C( "castle_pri_detonate" );
        var_0 maps\_anim::_id_1246( self, "overlook_nag" );
        var_0 thread maps\_anim::_id_124E( self, "overlook_idle" );
    }
}

_id_81C4()
{
    common_scripts\utility::flag_wait( "jumped_to_bridge" );
    maps\_utility::_id_2612( 0 );
    self._id_81C2 notify( "stop_loop" );
    maps\_utility::_id_1414();
    level.player.maxvisibledist = 8196;
    level._id_4877.maxvisibledist = 8196;
    wait 2.5;
    var_0 = common_scripts\utility::getstruct( "price_bridge_jump", "targetname" );
    self forceteleport( var_0.origin, var_0.angles );

    if ( common_scripts\utility::flag( "bridge_detonated" ) )
    {
        var_1 = maps\castle_code::_id_7A41( "castle_bridge" );
        var_1 maps\_anim::_id_124A( self, "bridge_idle" );
        var_1 thread maps\_anim::_id_124E( self, "bridge_idle" );
        common_scripts\utility::flag_wait_all( "bridge_price_kill", "bridge_detonated" );
        var_1 notify( "stop_loop" );
        common_scripts\utility::flag_set( "bridge_price_kill_done" );
    }
    else
    {
        self setgoalnode( self findbestcovernode() );
        common_scripts\utility::flag_wait( "bridge_detonated" );
        wait 8.0;
        common_scripts\utility::flag_set( "bridge_price_kill_done" );
        var_2 = getent( "price_kill", "script_noteworthy" );

        if ( isdefined( var_2 ) && isalive( var_2 ) )
            var_2 kill();
    }

    maps\_utility::_id_1425( "approaching_outer_courtyard" );
}

_id_81C5()
{
    level endon( "bridge_price_kill_done" );

    for (;;)
    {
        if ( level.player.origin[1] < level._id_4877.origin[1] )
        {
            if ( !maps\_utility::_id_0B20( level._id_4877 ) )
            {
                level notify( "skip_price_bridge" );
                level._id_4877 maps\_utility::_id_1414();
                return;
            }
        }

        common_scripts\utility::waitframe();
    }
}

_id_81C6()
{
    self endon( "death" );
    maps\castle_code::_id_77E8();
    maps\_utility::_id_128B( "bridge_deadloop" );
    thread _id_81C7();
    self._id_81C2 notify( "stop_loop" );
    animscripts\shared::_id_23C8();
    self._id_81C2 maps\_anim::_id_1246( self, "bridge_death" );
    self kill();
}

_id_81C7()
{
    self endon( "stop_watch" );
    self waittill( "death" );
    level notify( "skip_price_bridge" );
}

_id_7972( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_2.attackeraccuracy = 0;
        var_2.fixednode = 1;
        var_2.accuracy = 1;
        var_2 maps\_utility::_id_26F3( 1 );
        var_2.grenadeawareness = 0;
        var_2._id_0EEE = 1;
        var_2.takedamage = 0;
        var_2.suppressionwait = 0;
        var_2.ignoreexplosionevents = 1;
        var_2.ignoresuppression = 1;
        var_2 pushplayer( 1 );
        var_2 maps\_utility::_id_1057();
        var_2 maps\_utility::_id_0EEC();
        var_2.a._id_0D31 = 1;
        var_2._id_1106 = 1;
        var_2._id_100A = 1;
        var_2._id_796C = var_2.pathenemyfightdist;
        var_2._id_796D = var_2.pathenemylookahead;
        var_2._id_796E = var_2.maxfaceenemydist;
        var_2.pathenemyfightdist = 0;
        var_2.pathenemylookahead = 0;
        var_2.maxfaceenemydist = 32;
        var_2._id_0F2D = 1;
    }

    thread maps\_vehicle::_id_2515( var_0 );
}

_id_81C8()
{
    common_scripts\utility::flag_wait( "bridge_price_kill_done" );
    maps\_utility::_id_1414();
    maps\_utility::_id_1057();
    maps\_utility::_id_2714();
    maps\_utility::_id_26F3( 1 );
    maps\_utility::_id_109E();
    level._id_4877 maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "ccb_player_entered_cy" );
    thread _id_81CB();
    maps\_utility::_id_262C( "spawn_courtyard_btr" );
    wait 22;
    thread _id_81DE( "price_kill" );
    maps\_utility::_id_2712();
    thread _id_81C9();
    var_0[0] = level._id_4877;
    level._id_4877.ignoreall = 1;
    level._id_815A _id_7972( var_0 );
    level._id_4877 thread _id_81CA();

    while ( length( level._id_815A gettagorigin( "tag_driver" ) - level._id_4877.origin ) > 300 )
        wait 0.05;

    common_scripts\utility::flag_set( "get_to_escape_truck" );
    level._id_4877 waittill( "enteredvehicle" );
    level._id_4877.ignoreme = 1;
    level._id_4877 thread maps\castle_escape_new::_id_8166();
    maps\_audio::aud_send_msg( "price_in_truck" );
    wait 1.0;
    common_scripts\utility::flag_set( "price_in_truck" );
    level._id_5331 = level.player;
    maps\_utility::_id_2713();
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "courtyard_btr_destroyed" );
    maps\_utility::_id_265A( "allies" );
    var_1 = getentarray( "courtyard_battle_color", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 delete();

    maps\_utility::_id_26BF( "outer_courtyard_done_price" );
    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_2712();
}

_id_81C9()
{
    level endon( "death" );
    level endon( "notify_player_entered_car" );
    wait 35;
    var_0 = common_scripts\utility::getstruct( "cy_magicgren_org", "targetname" );
    magicgrenademanual( "fraggrenade", var_0.origin, ( 0.0, 0.0, 0.0 ), 0 );
    wait 1;
    level.player freezecontrols( 1 );
    musicstop( 1 );
    var_1 = &"CASTLE_YOUR_ACTIONS_GOT_PRICE";
    setdvar( "ui_deadquote", var_1 );
    maps\_utility::_id_1826();
}

_id_81CA()
{
    self waittill( "boarding_vehicle" );
    maps\_audio::aud_send_msg( "price_enter_vehicle_start" );
}

_id_81CB()
{
    common_scripts\utility::flag_wait( "courtyard_btr_alive" );
    maps\_utility::delaythread( 6, maps\_utility::_id_168C, "castle_pri_btrblocking" );
    wait 0.5;
    common_scripts\utility::flag_wait( "get_to_escape_truck" );
    wait 3;
    maps\_utility::_id_168C( "castle_pri_onme2" );
}

_id_81CC()
{
    var_0 = level._id_81CD;

    while ( !common_scripts\utility::flag( "courtyard_btr_destroyed" ) )
    {
        var_1 = distancesquared( var_0.origin, self.origin );
        var_2 = self getclosestenemysqdist();

        if ( var_1 < var_2 )
            self setentitytarget( var_0 );
        else
            self clearentitytarget();

        wait 5;
    }

    self clearentitytarget();
}

_id_81CE()
{
    var_0 = getent( "bridge_spotlight", "targetname" );
    var_1 = common_scripts\utility::getstruct( "bridge_spotlight_start", "targetname" );
    var_2 = common_scripts\utility::getstruct( "bridge_spotlight_bridge", "targetname" );
    var_3 = common_scripts\utility::getstruct( "bridge_spotlight_window", "targetname" );
    var_4 = common_scripts\utility::getstruct( "bridge_spotlight_overlook", "targetname" );
    playfxontag( common_scripts\utility::getfx( "spotlight_modern_rain_br" ), var_0, "tag_light" );
    var_0 setmodel( "ctl_spotlight_modern_3x_on" );
    var_0 thread _id_81CF();
    var_5 = spawn( "script_origin", var_1.origin );
    var_0 thread _id_81D0( var_5 );
    common_scripts\utility::flag_wait( "give_bridge_detonator" );
    var_5 moveto( var_2.origin, 0.1, 0, 0 );
    wait 6;
    var_5 moveto( var_3.origin, 0.1, 0, 0 );
    wait 6;
    var_5 moveto( var_4.origin, 0.1, 0, 0 );
    common_scripts\utility::flag_wait( "jumped_to_bridge" );
    var_5 moveto( var_2.origin, 0.1, 0, 0 );
}

_id_81CF()
{
    maps\_utility::_id_262C( self.target );
    self notify( "death" );
    playfxontag( common_scripts\utility::getfx( "spotlight_destroy" ), self, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "spotlight_modern_rain_br" ), self, "tag_light" );
    self setmodel( "ctl_spotlight_modern_3x_destroyed" );
}

_id_81D0( var_0 )
{
    self endon( "death" );
    self notify( "castle_spotlight_track_ent" );
    self endon( "castle_spotlight_track_ent" );
    self setmode( "manual" );
    var_1 = spawn( "script_origin", var_0.origin );
    self settargetentity( var_1 );
    var_2 = 220;

    for (;;)
    {
        var_3 = distance( var_0.origin, var_1.origin );
        var_4 = common_scripts\utility::randomvector( 1 );
        var_5 = randomfloatrange( -16, 16 );
        var_4 += ( 0, 0, var_5 );
        var_6 = var_3 / var_2;
        var_7 = randomfloatrange( 0.7, 1.3 );

        if ( var_6 < var_7 )
            var_6 = var_7;

        var_8 = var_0.origin + var_4;

        if ( isdefined( level._id_80F4 ) )
            var_8 = level._id_80F4;

        if ( distancesquared( var_1.origin, var_8 ) > 10000 )
            var_1 moveto( var_8, var_6, var_6 * 0.4, var_6 * 0.4 );

        wait(var_6);
        self notify( "spotlight_on_target" );
    }
}

_id_81D1()
{
    var_0 = getent( "bridge_btr_escort", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_81D8 );
    maps\_utility::_id_262C( "start_bridge_entrance" );
    wait 0.05;
    var_1 = maps\_utility::_id_2642( "bridge_btr", "targetname" );
    var_1._id_1032 = "btr";
    var_1._id_81C2 = maps\castle_code::_id_7A41( "castle_bridge" );
    var_1._id_81C2 maps\_anim::_id_11CF( var_1, "bridge_entrance" );
    var_1 thread _id_81D3();
    var_1 thread _id_81D4();
    var_2 = [];

    for ( var_3 = 0; var_3 < 10; var_3++ )
    {
        var_4 = var_0 maps\_utility::_id_166F( 1 );
        var_4._id_1032 = "guard" + var_3;
        var_4._id_81C2 = maps\castle_code::_id_7A41( "castle_bridge" );
        var_4.goalradius = 32;

        if ( var_3 == 0 || var_3 > 5 )
            var_4.stance = "crouch";
        else
            var_4.stance = "stand";

        var_4 thread _id_81D6();
        wait 0.05;
    }

    common_scripts\utility::flag_wait( "start_bridge_entrance" );
    var_1._id_81C2 thread maps\_anim::_id_1246( var_1, "bridge_entrance" );
    common_scripts\utility::flag_wait( "bridge_detonated" );
    var_5 = 200;
    var_6 = common_scripts\utility::getstruct( "bridge_explosion", "targetname" );
    var_7 = getcorpsearray();

    foreach ( var_9 in var_7 )
    {
        if ( distance( var_9.origin, var_6.origin ) < var_5 )
            var_9 delete();
    }

    maps\_audio::aud_send_msg( "bridge_detonate", var_1 );
    var_1 maps\_vehicle::_id_2A3D();
    var_1._id_81C2 thread maps\_anim::_id_1246( var_1, "bridge_death" );
    var_1 thread _id_81D2();
    var_11 = getent( "destroyed_bridge_kill_trigger", "targetname" );
    var_11 common_scripts\utility::trigger_on();
    common_scripts\utility::flag_wait( "bridge_btr_kill" );
    var_1 connectpaths();
    var_1 maps\_vehicle::_id_2B16( self.model );
    var_1 maps\_vehicle::_id_29E7( self.model, 0 );
    playfxontag( common_scripts\utility::getfx( "btr_death" ), var_1, "tag_origin" );
    var_1 setmodel( "vehicle_btr80_d" );
    earthquake( 0.2, 0.5, level.player.origin, 2000 );
    level.player playrumbleonentity( "damage_light" );
}

_id_81D2()
{
    for (;;)
    {
        self.health = 30000;
        common_scripts\utility::waitframe();
    }
}

_id_81D3()
{
    level endon( "bridge_detonated" );
    self.health = 30000;

    while ( self.health > 20000 )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_0 >= 500 )
            break;
    }

    level.player notify( "detonate" );
}

_id_81D4()
{
    level endon( "bridge_detonated" );
    common_scripts\utility::flag_wait_any( "bridge_player_fired", "jumped_to_bridge" );
    self setturrettargetent( level.player );
    thread _id_81D5();

    while ( isalive( self ) )
    {
        wait(randomfloatrange( 5.0, 7.0 ));
        self fireweapon();
    }
}

_id_81D5()
{
    wait 1;
    common_scripts\utility::flag_set( "price_blew_bridge" );
    level._id_4877 maps\_utility::_id_168C( "castle_pri_illdoit" );
    level.player notify( "detonate" );
    wait 2;
    level._id_4877 maps\_utility::_id_168C( "castle_pri_sloppybastard" );
}

_id_81D6()
{
    self endon( "death" );
    self._id_81C2 maps\_anim::_id_11CF( self, "bridge_entrance" );
    common_scripts\utility::flag_wait( "start_bridge_entrance" );
    self.a._id_0D26 = self.stance;
    self allowedstances( self.stance );
    thread _id_81D7( self._id_81C2 );
    common_scripts\utility::flag_wait( "bridge_detonated" );
    self._id_81C2 notify( "stop_loop" );
    self._id_81C2 maps\_anim::_id_1246( self, "bridge_explode" );
    maps\castle_code::_id_77E8();

    switch ( self._id_1032 )
    {
        case "guard0":
            self.script_noteworthy = "price_kill";
            self._id_81C2 thread maps\_anim::_id_124E( self, "bridge_dying" );
            maps\_utility::_id_24F5();
            maps\_utility::_id_26F6( 1 );
            self.a._id_0D55 = 1;
            break;
        case "guard3":
        case "guard1":
        case "guard2":
        case "guard7":
        case "guard8":
            self._id_81C2 maps\_anim::_id_1246( self, "bridge_deadloop" );
            maps\_utility::_id_24F5();
            self.a._id_0D55 = 1;
            maps\_utility::_id_26F6( 1 );
            self._id_0EC6 = undefined;
            self.forceragdollimmediate = 1;
            self kill();
            break;
        default:
            self delete();
            break;
    }
}

_id_81D7( var_0 )
{
    self endon( "death" );
    level endon( "bridge_detonated" );
    var_0 maps\_anim::_id_1246( self, "bridge_entrance" );
    var_0 thread maps\_anim::_id_124E( self, "bridge_idle" );
    common_scripts\utility::flag_wait_any( "bridge_player_fired", "jumped_to_bridge" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( self, "bridge_alert" );
    maps\_utility::_id_2612( 0 );
}

_id_81D8()
{
    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_0A23( 1 );
    maps\_utility::_id_26F6( 1 );
    self._id_0EC6 = 1;

    if ( randomint( 100 ) > 50 )
        maps\castle_code::_id_77E6( 1 );
}

_id_81D9()
{
    var_0 = getentarray( "stinger_emplacement", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setmodel( "ctl_missile_emplacement_obj" );

    var_4 = getentarray( "courtyard_rpg", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 setmodel( "ctl_weapon_rpg7_obj" );

    common_scripts\utility::flag_wait( "courtyard_btr_destroyed" );

    foreach ( var_2 in var_0 )
        var_2 setmodel( "ctl_missile_emplacement" );

    var_4 = getentarray( "courtyard_rpg", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 setmodel( "weapon_rpg7" );
}

_id_81DA()
{
    maps\_utility::_id_262C( "spawn_courtyard_btr" );
    wait 0.05;
    var_0 = maps\_utility::_id_2642( "courtyard_btr", "targetname" );
    var_0 thermaldrawenable();
    var_0 maps\_vehicle::_id_2A3D();
    maps\_utility::delaythread( 2.0, maps\castle_escape_new::_id_81A0, 0 );
    level._id_81CD = var_0;
    common_scripts\utility::flag_set( "courtyard_btr_alive" );
    common_scripts\utility::flag_wait( "ccb_btr_inposition" );
    var_0 maps\_vehicle::_id_2A3E();
    var_0 thread _id_81DB();
    var_0 thread _id_81DD();
}

_id_8180( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_4 = self gettagorigin( "tag_turret2" );
        var_5 = var_2.origin[0] + randomintrange( -64, 64 ) * var_1;
        var_6 = var_2.origin[1] + randomintrange( -64, 64 ) * var_1;
        var_7 = var_2.origin[2] + randomintrange( -32, 0 ) * var_1;
        var_8 = ( var_5, var_6, var_7 );
        var_9 = vectortoangles( var_8 - var_4 );
        var_10 = anglestoforward( var_9 );
        var_11 = var_10 * 12;
        var_12 = var_4 + var_11;
        playfx( common_scripts\utility::getfx( "bmp_flash_wv" ), var_4, var_10, ( 0.0, 0.0, 1.0 ) );
        magicbullet( "btr80_turret_castle", var_4, var_12 );
        self playsound( "btr80_fire" );
        wait(randomfloatrange( 0.1, 0.2 ));
    }
}

_id_81DB()
{
    maps\_vehicle::_id_2A3D();
    self endon( "death" );
    level endon( "notify_player_entered_car" );
    level._id_5331 = level._id_4877;
    self setturrettargetent( level._id_5331 );

    while ( isalive( self ) )
    {
        var_0 = randomintrange( 12, 16 );
        _id_8180( var_0, 2.0, level._id_5331 );
        wait(randomfloatrange( 2.5, 3.5 ));
    }
}

_id_81DC()
{
    self endon( "death" );
    level endon( "notify_player_entered_car" );

    while ( isalive( self ) )
    {
        wait(randomfloatrange( 8.0, 10.0 ));
        self fireweapon();
        self setturrettargetent( level._id_5331 );
    }
}

_id_81DD()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_0 >= 500 )
        {
            self notify( "death" );
            common_scripts\utility::flag_set( "courtyard_btr_destroyed" );
            return;
        }
    }
}

_id_8196( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "outer_courtyard_c4_1", "targetname" );
    var_2 = common_scripts\utility::getstruct( "outer_courtyard_c4_2", "targetname" );
    maps\_audio::aud_send_msg( "detonate_c4" );
    var_3 = getentarray( "castle_escape_noexplode", "script_noteworthy" );

    foreach ( var_5 in var_3 )
    {
        var_5 maps\_vehicle::_id_2A12();
        var_5 notify( "stop_taking_damage" );
    }

    radiusdamage( var_2.origin, 256, 1000, 500 );
    physicsexplosionsphere( var_2.origin, 512, 256, 2 );
    earthquake( 0.3, 0.3, level.player.origin, 2000 );
    common_scripts\utility::exploder( 1403 );
    maps\_utility::_id_261A( 530 );
    level._id_4877 thread maps\_utility::_id_2614( 1.5 );
    level.player thread maps\_utility::_id_2614( 1.5 );
    var_7 = getentarray( "c4_2_die", "script_noteworthy" );

    foreach ( var_9 in var_7 )
    {
        if ( isai( var_9 ) && isalive( var_9 ) )
            var_9 kill();
    }

    wait 0.5;
    radiusdamage( var_1.origin, 512, 5000, 1000 );
    physicsexplosionsphere( var_1.origin, 512, 256, 2 );
    earthquake( 0.4, 0.8, level.player.origin, 2000 );
    common_scripts\utility::exploder( 1402 );
    var_7 = getentarray( "c4_1_die", "script_noteworthy" );

    foreach ( var_9 in var_7 )
    {
        if ( isai( var_9 ) && isalive( var_9 ) )
            var_9 kill();
    }

    if ( isdefined( level._id_81CD ) )
    {
        level._id_81CD maps\_vehicle::_id_2A13();
        level._id_81CD dodamage( 10001, level._id_81CD.origin );
    }

    var_13 = getentarray( "destructible_vehicle", "targetname" );
    var_14 = maps\_utility::_id_0AEC( var_1.origin, var_13, undefined );
    var_15 = 2;
    var_16 = 1;
}

_id_81DE( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( isai( var_3 ) )
            var_3 kill( level._id_4877.origin, level._id_4877 );

        wait(randomfloatrange( 0.5, 2.0 ));
    }
}

_id_8165()
{
    common_scripts\utility::flag_wait( "give_bridge_detonator" );
    var_0 = getent( "outer_gate_l", "targetname" );
    var_1 = getent( "outer_gate_l_clip", "targetname" );
    var_0 linkto( var_1 );
    var_2 = getent( "outer_gate_r", "targetname" );
    var_3 = getent( "outer_gate_r_clip", "targetname" );
    var_2 linkto( var_3 );
    var_1 rotateyaw( -95, 0.05 );
    var_3 rotateyaw( 100, 0.05 );
    var_1 connectpaths();
    var_3 connectpaths();
}

_id_81DF()
{
    var_0 = getentarray( "outer_courtyard_battle", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_off();

    var_4 = getentarray( "bridge_bad", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    var_8 = getentarray( "stealth_hide", "targetname" );

    foreach ( var_10 in var_8 )
        var_10 common_scripts\utility::trigger_off();
}

_id_8164()
{
    var_0 = getentarray( "outer_courtyard_battle", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_on();

    var_4 = getent( "courtyard_stealth_nosight", "targetname" );
    var_4 delete();
    var_5 = getentarray( "stealth_hide", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 common_scripts\utility::trigger_on();
}

_id_81E0()
{
    var_0 = getentarray( "bridge_jeep", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_off();

    var_4 = getent( "fxanim_castle_bridge_mod", "targetname" );
    var_4 hide();
    var_5 = getent( "fxanim_castle_bridge_scaff_mod", "targetname" );
    var_5 hide();
    var_6 = getent( "destroyed_bridge_kill_trigger", "targetname" );
    var_6 common_scripts\utility::trigger_off();
}

_id_81E1()
{
    var_0 = getentarray( "bridge_jeep", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_on();

    var_4 = getent( "fxanim_castle_bridge_scaff_mod", "targetname" );
    var_4 show();
    var_5 = getentarray( "scaff_hide_fxanim", "targetname" );

    foreach ( var_2 in var_5 )
        var_2 hide();
}

_id_64F0( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = var_2 maps\_utility::_id_2789( "axis" );
    var_4 = var_3.size;

    while ( var_4 > var_1 )
    {
        wait 1;
        var_3 = var_2 maps\_utility::_id_2789( "axis" );
        var_4 = var_3.size;

        if ( var_4 - var_1 < 3 )
        {
            foreach ( var_6 in var_3 )
            {
                if ( var_6 maps\_utility::_id_0D69() || var_6.delayeddeath )
                    var_4--;
            }
        }
    }
}
