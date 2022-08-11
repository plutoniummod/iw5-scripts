// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4EFB()
{
    maps\_shg_common::move_player_to_start( "start_inner_courtyard" );
    maps\castle_code::_id_8094( "start_inner_courtyard" );
    common_scripts\utility::flag_set( "objective_clear_prison" );
    common_scripts\utility::flag_set( "player_entered_prison" );
    common_scripts\utility::flag_set( "meatshield_done" );
    common_scripts\utility::flag_set( "objective_clear_prison_cleared" );
    common_scripts\utility::flag_set( "objective_comm_room" );
    common_scripts\utility::flag_set( "objective_plant_bomb_bridge" );
    common_scripts\utility::flag_set( "bomb_has_been_planted" );
    common_scripts\utility::flag_set( "objective_time_wall_charge" );
    common_scripts\utility::flag_set( "wet_wall_destroyed" );
    common_scripts\utility::flag_set( "peephole_start" );
    common_scripts\utility::flag_set( "kitchen_start" );
    level._id_4877 maps\_utility::_id_2709( "mp5", "right" );
    level._id_4877.grenadeammo = 0;
    level._id_4877._id_20AF = 10;
    level._id_4877 maps\_utility::_id_280D();
    level._id_4877 maps\_utility::_id_1057();
    level._id_4877 maps\_utility::_id_0EEC();
    level._id_4877 maps\_utility::_id_2714();
    level._id_4877 maps\_utility::_id_26F3( 1 );
    level thread _id_7F9E( "price_left_color" );
    level thread _id_7F9E( "trig_inner_courtyard_midpoint" );
    thread _id_4EFD();
    level.player giveweapon( "ump45_acog" );
    level.player switchtoweaponimmediate( "ump45_acog" );
    var_0 = getent( "foyer_left_door", "targetname" );
    var_1 = getent( "foyer_right_door", "targetname" );
    var_2 = getent( "foyer_left_door_clip", "targetname" );
    var_3 = getent( "foyer_right_door_clip", "targetname" );
    var_0 linkto( var_2 );
    var_1 linkto( var_3 );
    var_2 rotateyaw( -90, 0.05 );
    var_3 rotateyaw( 90, 0.05 );
    wait 0.05;
    var_2 connectpaths();
    var_3 connectpaths();
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_4EFC()
{
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    maps\castle_code::_id_80A0( 2 );
    common_scripts\utility::exploder( 5000 );
    level thread _id_466E();
    level thread _id_466A();
    level thread _id_466B();
    level thread _id_466C();
    level._id_4877 thread _id_4666();
    level._id_4877 thread _id_4668();
    level._id_4877 thread _id_4676();
    level._id_4877 thread _id_4675();
    level thread _id_4677();
    common_scripts\utility::flag_wait( "inner_courtyard_done" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "inner_courtyard_initial_wave" );
    common_scripts\utility::flag_init( "inner_courtyard_left_exit" );
    common_scripts\utility::flag_init( "inner_courtyard_right_exit" );
    common_scripts\utility::flag_init( "inner_courtyard_right_side_exit" );
    common_scripts\utility::flag_init( "inner_courtyard_done" );
    common_scripts\utility::flag_init( "inner_courtyard_teleport_price" );
    common_scripts\utility::flag_init( "inner_courtyard_door_kick" );
    common_scripts\utility::flag_init( "inner_courtyard_door_open" );
    common_scripts\utility::flag_init( "inner_courtyard_rooftop_sniper" );
    common_scripts\utility::flag_init( "inner_courtyard_rpg_fallback" );
    common_scripts\utility::flag_init( "inner_courtyard_midpoint_fallback" );
    common_scripts\utility::flag_init( "inner_courtyard_done_price" );
    common_scripts\utility::flag_init( "inner_courtyard_teleport_price_lower" );
    common_scripts\utility::flag_init( "inner_courtyard_teleport_price_upper" );
}

_id_4EFD()
{
    common_scripts\utility::flag_wait( "inner_courtyard_midpoint_fallback" );
    thread _id_59D3( "inner_courtyard_upper_right", "inner_courtyard_upper_right_room", 0, 0 );
    thread _id_59D3( "inner_courtyard_back_south", "inner_courtyard_back_middle", 0, 0 );
    thread _id_59D3( "inner_courtyard_back_north", "inner_courtyard_back_north_fallback", 2, 4 );
}

_id_4EFE()
{
    var_0 = getentarray( "inner_courtyard_spotlight", "targetname" );

    foreach ( var_2 in var_0 )
    {
        playfxontag( common_scripts\utility::getfx( "spotlight_modern_rain_lt_cheap" ), var_2, "tag_light" );
        var_2 setmode( "manual" );
        var_2 setmodel( "ctl_spotlight_modern_3x_on" );
        var_2 maketurretinoperable();
        var_3 = getent( var_2.target, "targetname" );
        var_2 settargetentity( var_3 );
        var_2 thread _id_4665();
    }
}

_id_4665()
{
    maps\_utility::_id_262C( self.script_noteworthy );
    playfxontag( common_scripts\utility::getfx( "spotlight_destroy" ), self, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "spotlight_modern_rain_lt_cheap" ), self, "tag_light" );
    self setmodel( "ctl_spotlight_modern_3x_destroyed" );
}

_id_4666()
{
    thread maps\_utility::_id_168C( "castle_pri_onme2" );
    self.grenadeammo = 3;
    self._id_20AF = 4;
    self pushplayer( 1 );
    maps\_utility::_id_1071();
    maps\_utility::_id_2715();
    var_0 = getent( "inner_courtyard_snipers", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 maps\_utility::_id_2703();

    var_0 = getent( "inner_courtyard_snipers", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 maps\_utility::_id_2703();

    maps\_utility::_id_1425( "middle_courtyard" );
}

_id_4667()
{
    level endon( "inner_courtyard_done" );
    wait 5;

    for (;;)
    {
        thread maps\_utility::_id_168C( "castle_pri_onme2" );
        wait 6;
        thread maps\_utility::_id_168C( "castle_pri_overehere" );
        wait 6;
        thread maps\_utility::_id_168C( "castle_pri_throughere" );
        wait 5;
    }
}

_id_4668()
{
    level endon( "inner_courtyard_done" );
    level endon( "inner_courtyard_teleport_price" );
    common_scripts\utility::flag_wait( "inner_courtyard_door_kick" );
    maps\_utility::_id_123B();
    self setgoalnode( getnode( "after_door_kick", "targetname" ) );
    self.ignoresuppression = 1;
    maps\_utility::_id_168C( "castle_pri_staywithmeyuri" );
    common_scripts\utility::flag_wait( "inner_courtyard_done_price" );
    thread _id_4667();
    self.ignoresuppression = 0;
}

_id_4669()
{
    self endon( "death" );
    maps\_utility::_id_0A23( 1 );
    maps\_utility::_id_2612( 1 );
    self.goalradius = 32;
    self setgoalnode( getnode( "inner_courtyard_retreat", "targetname" ) );
    self waittill( "goal" );
    maps\_utility::_id_0A23( 0 );
    maps\_utility::_id_2612( 0 );
    common_scripts\utility::flag_wait( "inner_courtyard_done" );
    self kill();
}

_id_466A()
{
    thread _id_466D();
    maps\_utility::_id_263B( "ic_firstwave", 2 );
    var_0 = getent( "price_left_color", "targetname" );

    if ( isdefined( var_0 ) )
    {
        maps\_utility::_id_26BF( "price_left_color" );
        var_0 common_scripts\utility::trigger_off();
    }
}

_id_466B()
{
    maps\_utility::_id_263B( "midway_group", 5 );
    var_0 = getent( "price_color_midway", "targetname" );

    if ( isdefined( var_0 ) )
    {
        maps\_utility::_id_26BF( "price_color_midway" );
        var_0 common_scripts\utility::trigger_off();
    }
}

_id_466C()
{
    maps\_utility::_id_263B( "endcourtyard_group", 3 );
    var_0 = getent( "trig_inner_courtyard_midpoint", "targetname" );

    if ( isdefined( var_0 ) )
    {
        maps\_utility::_id_26BF( "trig_inner_courtyard_midpoint" );
        var_0 common_scripts\utility::trigger_off();
    }
}

_id_466D()
{
    common_scripts\utility::flag_wait( "inner_courtyard_rpg_fallback" );
    thread _id_59D3( "inner_courtyard_upper_start", "inner_courtyard_upper_right_room", 0, 0 );
}

_id_466E()
{
    common_scripts\utility::flag_wait( "inner_courtyard_initial_wave" );
    level thread _id_4670();
}

_id_466F()
{
    self endon( "death" );
    self.goalradius = 32;
    self waittill( "goal" );
    self delete();
}

_id_4670()
{
    var_0 = common_scripts\utility::getstruct( "pillar_rpg", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = magicbullet( "rpg_straight", var_0.origin, var_1.origin );
    var_2 waittill( "death" );
    maps\_audio::aud_send_msg( "rpg_hits_spire" );
    var_3 = getent( "spire_clip", "targetname" );
    var_3 delete();
    earthquake( 0.2, 0.5, var_1.origin, 2000 );
    level.player playrumbleonentity( "damage_light" );
    common_scripts\utility::exploder( 1301 );
    getent( "pillar_rpg", "targetname" ) maps\_utility::_id_166F( 1 );
    level notify( "destroy_spire" );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_rpgs" );
    level waittill( "spire_hit_ground" );
    common_scripts\utility::exploder( 1302 );
    earthquake( 0.3, 0.3, var_1.origin, 2000 );
    level.player playrumbleonentity( "damage_light" );
}

_id_4671()
{
    self endon( "death" );
    maps\_utility::_id_2612( 1 );
    common_scripts\utility::flag_wait( "inner_courtyard_initial_wave" );
    maps\_utility::_id_2612( 0 );
}

_id_4672()
{
    level endon( "inner_courtyard_done" );
    common_scripts\utility::flag_wait( "inner_courtyard_left_exit" );
    var_0 = getent( "inner_courtyard_custom_entrance", "targetname" );
    var_1 = maps\castle_code::_id_7A41( "inner_courtyard" );
    var_2 = var_0 maps\_utility::_id_166F( 1 );
    var_1 maps\_anim::_id_11C3( var_2, "inner_courtyard_entry_03" );
}

_id_4673()
{
    level endon( "inner_courtyard_done" );
    common_scripts\utility::flag_wait( "inner_courtyard_right_exit" );
    var_0 = getent( "inner_courtyard_custom_entrance", "targetname" );
    var_1 = maps\castle_code::_id_7A41( "inner_courtyard" );
    var_2 = var_0 maps\_utility::_id_166F( 1 );
    var_1 maps\_anim::_id_11C3( var_2, "inner_courtyard_entry_01" );
    var_2 = var_0 maps\_utility::_id_166F( 1 );
    var_1 maps\_anim::_id_11C3( var_2, "inner_courtyard_entry_02" );
}

_id_4674()
{
    level endon( "inner_courtyard_done" );
    common_scripts\utility::flag_wait( "inner_courtyard_right_side_exit" );
    var_0 = getent( "inner_courtyard_custom_entrance", "targetname" );
    var_1 = maps\castle_code::_id_7A41( "inner_courtyard" );
    var_2 = var_0 maps\_utility::_id_166F( 1 );
    var_1 maps\_anim::_id_11C3( var_2, "inner_courtyard_entry_05" );
    wait 2;
    var_2 = var_0 maps\_utility::_id_166F( 1 );
    var_1 maps\_anim::_id_11C3( var_2, "inner_courtyard_entry_04" );
}

_id_4675()
{
    level endon( "innercourtyard_price_teleported" );
    common_scripts\utility::flag_wait( "inner_courtyard_teleport_price_upper" );

    if ( !common_scripts\utility::flag( "inner_courtyard_done" ) )
    {
        maps\_utility::_id_1414();
        common_scripts\utility::waitframe();
        maps\_utility::_id_123B();
        maps\_utility::_id_27A1( getnode( "inner_courtyard_teleport_price", "targetname" ) );
    }

    level notify( "innercourtyard_price_teleported" );
}

_id_4676()
{
    level endon( "innercourtyard_price_teleported" );
    common_scripts\utility::flag_wait( "inner_courtyard_teleport_price_lower" );

    if ( !common_scripts\utility::flag( "inner_courtyard_done_price" ) )
    {
        maps\_utility::_id_1414();
        common_scripts\utility::waitframe();
        maps\_utility::_id_123B();
        maps\_utility::_id_27A1( getnode( "inner_courtyard_teleport_price_lower", "targetname" ) );
    }

    level notify( "innercourtyard_price_teleported" );
}

_id_4677()
{
    maps\_utility::_id_262C( "kill_inner_courtyard" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "inner_courtyard_ai" )
            var_2 delete();
    }
}

_id_4678()
{
    var_0 = getent( "price_right_color", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level._id_4877 maps\_utility::_id_13A4( "b" );
    }
}

_id_4679()
{
    var_0 = getent( "price_left_color", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level._id_4877 maps\_utility::_id_13A4( "g" );
    }
}

_id_7F9E( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 waittill( "trigger" );

    if ( isdefined( var_1._id_2057 ) )
        common_scripts\utility::flag_set( var_1._id_2057 );
}

_id_59D3( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_0, "targetname" );
    var_5 = var_4 maps\_utility::_id_2789( "axis" );
    var_6 = getent( var_1, "targetname" );
    var_7 = getnode( var_6.target, "targetname" );

    foreach ( var_9 in var_5 )
    {
        if ( isdefined( var_9 ) && isalive( var_9 ) )
        {
            var_9.fixednode = 0;
            var_9.pathrandompercent = randomintrange( 75, 100 );
            var_9 setgoalnode( var_7 );
            var_9 setgoalvolume( var_6 );
        }
    }
}
