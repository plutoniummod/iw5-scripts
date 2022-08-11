// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_72FA()
{
    maps\_shg_common::move_player_to_start( "start_interior" );
    maps\castle_code::_id_8094( "start_interior" );
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_72FB()
{
    maps\castle_code::_id_80A0( 3 );
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    level._id_4877._id_20AF = 1;
    level thread _id_72FC();
    level thread _id_69FF();
    level thread _id_6A03();
    level thread _id_6A06();
    common_scripts\utility::flag_wait( "start_foyer_entrance" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "player_at_stairs" );
    common_scripts\utility::flag_init( "player_on_stairs" );
    common_scripts\utility::flag_init( "cellar_sneak_broke" );
    common_scripts\utility::flag_init( "flash_grenade_spawn" );
    common_scripts\utility::flag_init( "approaching_computer_room" );
    common_scripts\utility::flag_init( "approaching_foyer" );
    common_scripts\utility::flag_init( "start_foyer_entrance" );
    common_scripts\utility::flag_init( "foyer_retreat_dead" );
}

_id_72FC()
{
    level.player thread _id_69F9();
    level._id_4877 thread _id_69FD();
    maps\_utility::_id_1425( "generator_room" );
}

_id_72FD()
{
    self endon( "death" );
    common_scripts\utility::waitframe();
    self.allowdeath = 1;
    self.goalradius = 4;
    var_0 = maps\castle_code::_id_7A41( "generator_room" );
    var_0 maps\_anim::_id_11C4( self, "guard_stumble" );
    var_0 maps\_anim::_id_11C3( self, "guard_stumble" );
    self setgoalnode( getnode( "stumble_goal", "targetname" ) );
}

_id_72FE()
{
    for (;;)
    {
        var_0 = maps\_utility::_id_262C( "generator_rumble" );

        if ( isplayer( var_0 ) )
        {
            var_0 playrumbleonentity( "minigun_rumble" );
            wait 0.5;
        }
    }
}

_id_69F9()
{
    thread _id_69FA();
    var_0 = getent( "cellar_sneak_room", "targetname" );

    while ( !common_scripts\utility::flag( "cellar_sneak_broke" ) )
    {
        if ( self istouching( var_0 ) )
            maps\_utility::_id_0A23( 1 );
        else
            maps\_utility::_id_0A23( 0 );

        wait 0.05;
    }

    var_0 delete();
    maps\_utility::_id_0A23( 0 );
}

_id_69FA()
{
    while ( !self isfiring() && !self isthrowinggrenade() )
        wait 0.05;

    common_scripts\utility::flag_set( "cellar_sneak_broke" );
}

_id_69FB()
{
    self endon( "death" );
    self.goalradius = 4;
    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self delete();
}

_id_69FC( var_0 )
{
    level endon( "player_on_stairs" );
    var_1 = getnode( "after_kitchen_goal", "targetname" );
    maps\_utility::_id_123B();
    self.goalradius = 8;
    self setgoalnode( var_1 );
    self waittill( "goal" );
    wait 0.5;
    var_0 thread maps\_anim::_id_124E( self, "stair_start" );
}

_id_69FD()
{
    var_0 = maps\castle_code::_id_7A41( "price_talk" );
    _id_69FC( var_0 );
    common_scripts\utility::flag_wait( "player_at_stairs" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( self, "stair_move" );
    var_0 thread maps\_anim::_id_124E( self, "stair_wait" );
    common_scripts\utility::flag_wait( "player_on_stairs" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1247( self, "stair_finish" );
    maps\_utility::_id_2686();
    maps\_utility::_id_263B( "interior_generator", 1 );

    foreach ( var_2 in getentarray( "generator_color_trigger", "script_noteworthy" ) )
        var_2 delete();

    maps\_utility::_id_26BF( "before_flash_grenade" );
}

_id_69FE()
{
    maps\_utility::_id_262C( "generator_enrage" );
    var_0 = maps\_utility::_id_263E( "interior_generator" );

    foreach ( var_2 in var_0 )
        var_2.health = 1;
}

_id_69FF()
{
    common_scripts\utility::flag_wait( "flash_grenade_spawn" );
    level thread _id_6A02();
    var_0 = common_scripts\utility::getstruct( "flash_grenade_origin", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = magicgrenade( "flash_grenade", var_0.origin, var_1.origin, 3.0 );
    wait 1.25;
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_flashbang" );
    level._id_4877 maps\_utility::delaythread( 1.5, ::_id_6A00, var_2 );
    var_3 = getent( "stair_enemy", "targetname" );
    var_4 = var_3 maps\_utility::_id_166F();
    var_4 maps\_utility::_id_0EEC();
    var_4 common_scripts\utility::waittill_notify_or_timeout( "damage", 3 );
    maps\_utility::_id_26BF( "after_flash_grenade" );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_keepmoving2" );
    level thread _id_6A01();
}

_id_6A00( var_0 )
{
    if ( distance2d( var_0.origin, self.origin ) < 256 )
    {
        maps\_anim::_id_1246( self, "flash_react" );
        level._id_4877 thread maps\_utility::_id_168C( "castle_pri_leftside2" );
        maps\_anim::_id_1246( self, "flash_effect" );
    }
}

_id_6A01()
{
    common_scripts\utility::flag_wait( "player_up_stairs" );
    maps\_utility::_id_1425( "flash_grenade_complete" );
    var_0 = getent( "computer_runner", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F();
    var_1.allowdeath = 1;
    var_1 maps\_utility::_id_2712();
    var_1.ignoreall = 1;
    common_scripts\utility::flag_wait( "approaching_computer_room" );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_dontslowdown" );

    if ( isdefined( var_1 ) && isalive( var_1 ) )
    {
        var_1 maps\_utility::_id_2713();
        var_1.ignoreall = 0;
        var_1.ignoreme = 0;
    }
}

_id_6A02()
{
    var_0 = common_scripts\utility::getstructarray( "flash_grenade_bolt", "targetname" );

    while ( !common_scripts\utility::flag( "approaching_computer_room" ) )
    {
        playfx( level._effect["lightning_bolt"], var_0[randomint( var_0.size )].origin );
        wait(randomfloatrange( 10.0, 15.0 ));
    }
}

_id_6A03()
{
    common_scripts\utility::flag_wait( "approaching_computer_room" );
    var_0 = getent( "computer_door_guard", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F();
    var_1.allowdeath = 1;
    var_2 = getent( "computer_far_guard", "targetname" );
    var_3 = var_2 maps\_utility::_id_166F();
    var_3.allowdeath = 1;
    level._id_4877 thread _id_6A04( var_1 );
    var_3 maps\_anim::_id_11C0( var_3, "guard_double_take" );
    var_4 = getent( "computer_doorway", "targetname" );
    var_1 maps\_utility::_id_26E5( var_4 );
    maps\_utility::_id_262C( "computer_room_visible" );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_sortemout" );

    if ( isalive( var_1 ) )
    {
        var_1 maps\_utility::_id_26E5();
        var_1 setentitytarget( var_4 );
    }

    wait 0.5;

    if ( isalive( var_1 ) )
        var_1 clearentitytarget();

    if ( isalive( var_3 ) )
        var_3 maps\_anim::_id_11C1( var_3, "guard_double_take" );

    maps\_utility::_id_263A( "interior_computer" );
    var_4 delete();
}

_id_6A04( var_0 )
{
    maps\_utility::_id_262C( "computer_room_visible" );
    maps\_utility::_id_263B( "interior_computer", 1 );

    foreach ( var_2 in getentarray( "computer_color_trigger", "script_noteworthy" ) )
        var_2 delete();

    if ( common_scripts\utility::flag( "price_can_do_table_jump" ) )
    {
        var_4 = common_scripts\utility::getstruct( "price_dukes", "targetname" );
        var_4 maps\_anim::_id_124A( self, "table_slide" );
        thread _id_6A05();
        var_4 maps\_anim::_id_1246( self, "table_slide" );
    }

    if ( !common_scripts\utility::flag( "inner_courtyard_door_kick" ) )
        maps\_utility::_id_2686();

    maps\_utility::_id_26BF( "after_computer_room" );
}

_id_6A05()
{
    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        physicsexplosionsphere( self.origin, 20, 1, 0.5 );
        wait 0.1;
    }
}

_id_6A06()
{
    maps\_utility::_id_27CA( "foyer_retreat", ::_id_6A07 );
    maps\_utility::_id_27CA( "foyer_outer_retreaters", ::_id_6A08 );
    level thread _id_6A0A();
    level thread _id_6A0B();
    level thread _id_6A10();
}

_id_6A07()
{
    self endon( "death" );
    thread maps\_utility::_id_2834( "foyer_retreat_dead" );
    self.goalradius = 64;
    self._id_7FCD = 1;
    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_2712();
    self setgoalnode( getnode( "foyer_retreat_goal", "targetname" ) );
    self waittill( "goal" );
    maps\_utility::_id_2612( 0 );
    maps\_utility::_id_2713();
    self delete();
}

_id_6A08()
{
    self endon( "death" );
    self.goalradius = 64;
    self._id_7FCD = 1;
    self.ignoreall = 1;
    maps\_utility::_id_2712();
    self waittill( "goal" );
    self delete();
}

_id_6A09()
{
    maps\_utility::_id_0D04();
    common_scripts\utility::flag_wait( "start_foyer_entrance" );
    maps\_utility::_id_1902();
}

_id_6A0A()
{
    maps\_utility::_id_262C( "foyer_warning" );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_throughhere" );
    maps\_utility::_id_25F6( "computer_room_complete", 10 );

    if ( !common_scripts\utility::flag( "approaching_foyer" ) )
    {
        wait 1.5;
        var_0 = common_scripts\utility::getstruct( "foyer_warning_bullet", "targetname" );
        var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );

        for ( var_2 = 0; var_2 < 10; var_2++ )
        {
            var_3 = var_1.origin + ( randomintrange( -32, 32 ), randomintrange( -32, 32 ), 0 );
            magicbullet( "mp5", var_0.origin, var_3 );
            wait 0.1;
        }
    }
}

_id_6A0B()
{
    common_scripts\utility::flag_wait( "foyer_doors_open" );
    _id_6A0D();
    _id_6A0E();
}

_id_6A0C( var_0 )
{
    var_1 = maps\castle_code::_id_7A41( "foyer" );
    var_1 maps\_anim::_id_1246( self, "foyer_door_kick" );
    var_2 = getnode( var_0, "targetname" );
    maps\_utility::_id_251E();
    self setgoalnode( var_2 );
}

_id_6A0D( var_0 )
{
    var_1 = getent( "foyer_left_door", "targetname" );
    var_2 = getent( "foyer_left_door_clip", "targetname" );
    var_1 linkto( var_2 );
    var_2 rotateyaw( -90, 0.5, 0.0, 0.3 );
    var_2 waittill( "rotatedone" );
    var_2 connectpaths();
    var_2 rotateyaw( 5, 0.5, 0.0, 0.2 );
}

_id_6A0E( var_0 )
{
    var_1 = getent( "foyer_right_door", "targetname" );
    var_2 = getent( "foyer_right_door_clip", "targetname" );
    var_1 linkto( var_2 );
    var_2 rotateyaw( 90, 0.7, 0.0, 0.5 );
    var_2 waittill( "rotatedone" );
    var_2 connectpaths();
    var_2 rotateyaw( -3, 0.5, 0.0, 0.2 );
}

_id_6A0F()
{
    var_0 = getent( "trigger_foyer_window", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "foyer_window_shooter", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F();
    common_scripts\utility::flag_wait( "start_foyer_entrance" );
    var_3 = getent( "foyer_window_target", "targetname" );

    if ( isalive( var_2 ) )
        var_2 setentitytarget( var_3 );

    wait 3;

    if ( isalive( var_2 ) )
        var_2 clearentitytarget();

    var_3 delete();
}

_id_6A10()
{
    common_scripts\utility::flag_wait( "approaching_foyer" );
    var_0 = maps\_utility::_id_263C( "interior_foyer" );
    var_1 = var_0 - 3;
    maps\_utility::_id_263B( "interior_foyer", 1 );

    foreach ( var_3 in getentarray( "foyer_color_trigger", "script_noteworthy" ) )
        var_3 delete();

    if ( !common_scripts\utility::flag( "inner_courtyard_door_kick" ) )
    {
        var_5 = getent( "exit_foyer", "targetname" );

        if ( isdefined( var_5 ) )
            var_5 useby( level.player );
    }

    maps\_utility::_id_25F6( "foyer", 5 );
}
