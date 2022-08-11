// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7B5B()
{
    maps\_shg_common::move_player_to_start( "start_dumpster" );

    if ( !isdefined( level.player ) )
        level.player = getentarray( "player", "classname" )[0];

    maps\prague_escape_code::_id_7A3B( "price", "dumpster" );
    maps\prague_escape_code::_id_7A3B( "soap", "dumpster" );
    common_scripts\utility::flag_set( "queue_sniper_music" );
    common_scripts\utility::flag_set( "queue_player_carry_music" );
    common_scripts\utility::flag_set( "queue_price_carry_music" );
    level thread maps\prague_escape::_id_7B5C();
    maps\prague_escape_sniper::_id_7AE5();
    level._id_7B1A = maps\_vehicle::_id_2A99( "cough_alley_chopper" );
    wait 0.1;
    level._id_7B1A._id_7A69 = undefined;
    var_0 = common_scripts\utility::getstruct( "statue_wait_node", "script_noteworthy" );
    level._id_7B1A vehicle_teleport( var_0.origin, var_0.angles );
    level._id_7B1A._id_291A = var_0;
    level._id_7B1A thread maps\_vehicle::_id_26A1( var_0 );
}

_id_7B5D()
{
    maps\_utility::_id_1425( "dumpster" );
    level thread _id_7B6E();
    _id_7B5E();
    _id_7B5F();
    _id_7B60();
    _id_7B68();
}

_id_7B5E()
{
    level.player enableweapons();
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level._id_54E0 maps\_utility::_id_104A( "p99", "primary" );
    level._id_4877 notify( "stop_going_to_node" );
}

_id_7B5F()
{
    var_0 = getentarray( "dead_guy_01", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 attach( "head_prague_civ_hero_male_a", "", 1 );
        var_2.headmodel = "head_prague_civ_hero_male_a";
        var_2 useanimtree( level._id_1245["dead_guy"] );
        var_2._id_1032 = "dead_guy";
        var_2 maps\_anim::_id_11D0( var_2, "resist_death01" );
    }

    var_4 = getentarray( "dead_guy_02", "targetname" );

    foreach ( var_6 in var_4 )
    {
        var_6 attach( "head_prague_civ_hero_male_b", "", 1 );
        var_6.headmodel = "head_prague_civ_hero_male_b";
        var_6 useanimtree( level._id_1245["dead_guy"] );
        var_6._id_1032 = "dead_guy";
        var_6 maps\_anim::_id_11D0( var_6, "resist_death02" );
    }

    var_8 = getentarray( "dead_guy_03", "targetname" );

    foreach ( var_10 in var_8 )
    {
        var_10 attach( "head_prague_civ_hero_male_c", "", 1 );
        var_10.headmodel = "head_prague_civ_hero_male_c";
        var_10 useanimtree( level._id_1245["dead_guy"] );
        var_10._id_1032 = "dead_guy";
        var_10 maps\_anim::_id_11D0( var_10, "resist_death03" );
    }
}

_id_7B60()
{
    level thread _id_7B88();
    level thread _id_7B7C();
    level thread _id_7B7B();
    level thread _id_7B78();
    var_0 = [];
    var_0[0] = level._id_7B61;
    var_0[1] = level._id_7B62;
    var_0[2] = level._id_7B63;
    var_0[3] = level._id_7B64;
    var_0[4] = level._id_7B65;
    var_0[5] = level._id_7B66;
    var_1 = [];
    var_1[0] = level._id_4877;
    var_1[1] = level._id_54E0;
    var_1[2] = level._id_7B61;
    var_1[3] = level._id_7B62;
    var_1[4] = level._id_7B63;
    var_1[5] = level._id_7B64;
    var_1[6] = level._id_7B65;
    var_1[7] = level._id_7B66;
    var_2 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    var_3 = common_scripts\utility::getstruct( "anim_align_dumpster", "targetname" );
    var_3 thread maps\_anim::_id_11D6( var_0, "idle_room" );
    level._id_4877 thread _id_7B6C();
    common_scripts\utility::flag_set( "queue_price_carry_music" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_4_1_priceliftsoap_price" );
    var_3 maps\_anim::_id_11DD( var_2, "soap_lift_dumpster" );
    level._id_54E0 castshadows();
    level thread _id_7B7E();
    common_scripts\utility::flag_set( "vo_this_way" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_4_2_kickdoor_price" );
    var_3 maps\_anim::_id_11DD( var_2, "kickdoor_dumpster" );
    var_3 notify( "stop_loop" );
    level thread _id_7B67();
    common_scripts\utility::flag_set( "vo_cmon_son" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_4_3_reachroom_price" );
    var_3 maps\_anim::_id_11DD( var_1, "reachroom" );
    var_3 thread maps\_anim::_id_11D6( var_2, "idle_roomclear" );
    common_scripts\utility::flag_wait( "player_enter_store" );
    var_3 notify( "stop_loop" );
    level._id_4877 maps\_utility::_id_2713();
}

_id_7B67()
{
    wait 1.2;
    common_scripts\utility::exploder( 425 );
}

_id_7B68()
{
    level thread _id_7B69();
    var_0 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    var_1 = common_scripts\utility::getstruct( "anim_align_dumpster", "targetname" );
    common_scripts\utility::flag_wait( "store_go_hot" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_4_4_reachdoor_price" );
    var_1 maps\_anim::_id_11DD( var_0, "reachdoor" );
    var_1 thread maps\_anim::_id_11D6( var_0, "clearroom" );
    common_scripts\utility::flag_set( "reached_door" );
    level thread _id_7B84();
    common_scripts\utility::flag_wait( "room_clear" );
    maps\_utility::_id_265A( "allies" );
    var_1 notify( "stop_loop" );
    var_1 thread maps\_anim::_id_11D6( var_0, "idle_clearroom" );
    level thread _id_7B6A();
}

_id_7B69()
{
    wait 2.5;
    common_scripts\utility::flag_set( "store_go_hot" );
}

_id_7B6A()
{
    level._id_4877 maps\_utility::_id_274F( 0.8 );
    common_scripts\utility::flag_set( "door_breached" );
    level thread _id_7B86();
    common_scripts\utility::flag_set( "vo_nice_one" );
    var_0 = getent( "door_breach_guy", "targetname" );
    level._id_7B6B = var_0 maps\_utility::_id_166F( 1 );
    var_1 = common_scripts\utility::getstruct( "anim_align_dumpster", "targetname" );
    var_1 notify( "stop_loop" );
    var_2 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    level._id_4877 maps\_utility::delaythread( 0.1, maps\_utility::play_sound_on_entity, "ch_pragueb_4_4_doorbreach_price" );
    var_1 thread maps\_anim::_id_1246( level._id_7B6B, "doorbreach" );
    var_1 maps\_anim::_id_11DD( var_2, "doorbreach" );
    common_scripts\utility::flag_set( "breach_done" );
    wait 0.5;
    maps\_utility::_id_1425( "door_breach" );
}

_id_7B6C()
{
    maps\_utility::_id_168C( "presc_pri_cmonsoap" );
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_needto" );
    common_scripts\utility::flag_wait( "vo_this_way" );
    wait 1;
    maps\_utility::_id_168C( "presc_pri_chopperscircling" );
    common_scripts\utility::flag_wait( "vo_cmon_son" );
    wait 2;
    maps\_utility::_id_168C( "presc_pri_cmonson" );
    wait 1.8;

    if ( !common_scripts\utility::flag( "store_go_hot" ) )
        maps\_utility::_id_168C( "presc_pri_takepoint" );

    common_scripts\utility::flag_wait( "store_go_hot" );
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    wait 2;
    maps\_utility::_id_168C( "presc_pri_clearthestore" );
    common_scripts\utility::flag_wait( "vo_nice_one" );
    wait 3;

    if ( !common_scripts\utility::flag( "killedby_player" ) )
    {
        maps\_utility::_id_168C( "presc_pri_niceone" );
        level._id_54E0 maps\_utility::_id_168C( "presc_mct_teachyou" );
    }
}

_id_7B6D()
{
    self endon( "death" );
    thread _id_7B7A();
    thread _id_7B83();
    thread _id_7B82();
    thread _id_7B81();
    self.a._id_0D31 = 1;
    self._id_1032 = "generic";
    self.allowdeath = 1;
    self.goalradius = 32;
    maps\_utility::_id_26E3( "on" );
    common_scripts\utility::flag_wait( "store_go_hot" );

    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "guard_right" )
        {
            var_0 = "cqb_stop";
            maps\_anim::_id_11CC( self, "gravity", var_0 );
        }
    }

    maps\_utility::_id_26E3( "off" );
    common_scripts\utility::flag_wait( "china_shop_charge" );
    thread _id_7B77();
}

_id_7B6E()
{
    common_scripts\utility::flag_wait( "store_go_hot" );
    wait 1.5;
    var_0 = common_scripts\utility::getstruct( "ak_source", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "store_window_break", "targetname" );
    var_2 = 3;

    foreach ( var_4 in var_1 )
    {
        for ( var_5 = 0; var_5 < var_2; var_5++ )
        {
            magicbullet( "pecheneg", var_0.origin, var_4.origin );
            wait(randomfloatrange( 0.05, 0.15 ));
        }
    }
}

_id_7B6F()
{
    self endon( "death" );
    thread _id_7B81();
    self.a._id_0D31 = 1;
    self.goalradius = 32;
    self._id_1032 = "generic";
    self.allowdeath = 1;
    maps\_utility::_id_26E3( "on" );
    common_scripts\utility::flag_wait( "store_go_hot" );
    maps\_utility::_id_26E3( "off" );
    var_0 = "exchange_surprise_0";
    maps\_anim::_id_11CC( self, "gravity", var_0 );
    common_scripts\utility::flag_wait( "china_shop_charge" );
    thread _id_7B77();
}

_id_7B70()
{
    self endon( "death" );
    thread _id_7B81();
    self.a._id_0D31 = 1;
    self.goalradius = 32;

    if ( common_scripts\utility::flag( "china_right_path" ) )
    {
        var_0 = getnode( "cover_rear", "targetname" );
        self setgoalnode( var_0 );
    }
    else
    {
        var_1 = getnode( "cover_front", "targetname" );
        self setgoalnode( var_1 );
    }

    common_scripts\utility::flag_wait( "china_shop_charge" );
    thread _id_7B77();
}

_id_7B71()
{
    self endon( "death" );
    thread _id_7B81();
    self.a._id_0D31 = 1;
    self.goalradius = 32;
    self waittill( "goal" );
    maps\_utility::_id_2718();
    wait 3;
    maps\_utility::_id_2719();
    var_0 = getent( "vol_china_rear", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "china_shop_charge" );
    thread _id_7B77();
}

_id_7B72()
{
    self endon( "death" );
    thread _id_7B7F();
    self.a._id_0D31 = 1;
    common_scripts\utility::flag_wait( "china_right_path" );
    thread _id_7B77();
}

_id_7B73()
{
    self endon( "death" );
    thread _id_7B74();
    self.health = 1;
    self.allowdeath = 1;
    self.a._id_0D31 = 1;
    self.ignoreall = 1;
    self._id_1032 = "door_breacher";
}

_id_7B74()
{
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        common_scripts\utility::flag_set( "killedby_player" );
}

_id_7B75( var_0 )
{
    if ( getaicount( "axis" ) )
        var_0 shoot();
}

_id_7B76( var_0 )
{
    wait 0.05;

    if ( isalive( level._id_7B6B ) )
    {
        var_1 = level._id_54E0 gettagorigin( "tag_flash" );
        var_2 = level._id_7B6B gettagorigin( "J_Head" );
        magicbullet( "p99", var_1, var_2 );
        wait 0.1;
        level._id_7B6B maps\_utility::_id_2749();
    }
}

_id_7B77()
{
    self endon( "death" );
    var_0 = getent( "vol_china_shop", "targetname" );
    self cleargoalvolume();
    self setgoalvolumeauto( var_0 );
}

_id_7B78()
{
    var_0 = getentarray( "trigger_physics_chinashop", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_7B79();
}

_id_7B79()
{
    level endon( "room_clear" );
    self waittill( "trigger" );
    radiusdamage( self.origin, 25, 200, 180 );
}

_id_7B7A()
{
    self endon( "death" );
    level endon( "store_go_hot" );

    for (;;)
    {
        if ( self cansee( level.player ) )
        {
            wait 0.3;
            common_scripts\utility::flag_set( "store_go_hot" );
            break;
        }

        wait 0.05;
    }
}

_id_7B7B()
{
    level.player.ignoreme = 1;
    level._id_4877.ignoreme = 1;
    level._id_54E0.ignoreme = 1;
    common_scripts\utility::flag_wait( "store_go_hot" );
    level.player.ignoreme = 0;
    level._id_4877.ignoreme = 0;
    level._id_54E0.ignoreme = 0;
}

_id_7B7C()
{
    var_0 = getent( "trigger_enter_room", "targetname" );
    var_0 waittill( "trigger" );
    level thread _id_7B7D();
    common_scripts\utility::flag_set( "player_enter_store" );
}

_id_7B7D()
{
    var_0 = maps\_utility::_id_272A( "store_guards" );
    wait 0.1;
    level thread _id_7B85();

    while ( var_0.size > 0 )
    {
        var_0 = maps\_utility::_id_2672( var_0 );
        wait 0.5;
    }

    common_scripts\utility::flag_set( "room_clear" );
}

_id_7B7E()
{
    var_0 = getent( "door_dumpster", "targetname" );
    var_1 = getent( "clip_door_dumpster", "targetname" );
    wait 0.7;
    common_scripts\utility::exploder( 420 );
    var_0 rotateyaw( 120, 0.2 );
    var_1 connectpaths();
    var_1 delete();
}

_id_7B7F()
{
    self endon( "death" );

    while ( distance2d( self.origin, level._id_4877.origin ) > 200 )
        wait 0.1;

    _id_7B80();
}

_id_7B80()
{
    self endon( "death" );
    var_0 = level._id_4877 gettagorigin( "tag_flash" );
    var_1 = self gettagorigin( "J_Head" );
    magicbullet( "deserteagle", var_0, var_1 );
}

_id_7B81()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "reached_door" );

    while ( distance2d( self.origin, level._id_4877.origin ) > 320 )
        wait 0.1;

    _id_7B80();
}

_id_7B82()
{
    self endon( "death" );
    level endon( "store_go_hot" );
    self addaieventlistener( "gunshot" );

    for (;;)
    {
        self waittill( "ai_event", var_0 );

        if ( var_0 == "gunshot" )
        {
            common_scripts\utility::flag_set( "store_go_hot" );
            break;
        }
    }
}

_id_7B83()
{
    self endon( "death" );
    level endon( "store_go_hot" );
    common_scripts\utility::waittill_any( "bulletwhizby", "bullethit", "damage", "flashbang", "grenade danger", "explode" );
    common_scripts\utility::flag_set( "store_go_hot" );
}

_id_7B84()
{
    maps\_utility::_id_263A( "group_store_guard" );
    common_scripts\utility::flag_set( "room_clear" );
}

_id_7B85()
{
    maps\_utility::_id_263B( "group_store_guard", 1 );
    common_scripts\utility::flag_set( "china_shop_charge" );
}

_id_7B86()
{
    var_0 = getent( "door_cafe", "targetname" );
    var_1 = getent( "clip_door_store", "targetname" );
    var_0 rotateyaw( -120, 0.1 );
    common_scripts\utility::exploder( 608 );
    var_1 connectpaths();
    var_1 delete();
    var_2 = getent( "clip_china_door", "targetname" );
    var_2 common_scripts\utility::trigger_on();
}

_id_7B87()
{
    common_scripts\utility::flag_init( "player_enter_store" );
    common_scripts\utility::flag_init( "store_go_hot" );
    common_scripts\utility::flag_init( "reached_door" );
    common_scripts\utility::flag_init( "china_shop_charge" );
    common_scripts\utility::flag_init( "room_clear" );
    common_scripts\utility::flag_init( "door_breached" );
    common_scripts\utility::flag_init( "killedby_player" );
    common_scripts\utility::flag_init( "breach_done" );
    common_scripts\utility::flag_init( "vo_this_way" );
    common_scripts\utility::flag_init( "vo_cmon_son" );
    common_scripts\utility::flag_init( "vo_nice_one" );
    common_scripts\utility::flag_init( "queue_price_carry_music" );
}

_id_7B88()
{
    level._id_7B89 = maps\prague_escape_code::_id_7A44( level._id_54E0, &"PRAGUE_ESCAPE_PROTECT_SOAP", 1, 1, "active", &"PRAGUE_ESCAPE_PROTECT" );
}

_id_7B8A()
{
    var_0 = getentarray( "store_guards", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7B6D );
    var_1 = getent( "door_breach_guy", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_7B73 );
}

_id_7B8B()
{
    level._id_7B8C = getent( "soap_lean_box_1", "targetname" );
    level._id_7B8D = getent( "soap_lean_box_2", "targetname" );
    level._id_7B8E = getent( "soap_lean_box_3", "targetname" );
    level._id_7B8F = getent( "soap_lean_box_4", "targetname" );
    level._id_7B90 = getent( "soap_lean_box_5", "targetname" );
    level._id_7B91 = getent( "soap_lean_box_6", "targetname" );
    level._id_7B61 = spawn( "script_model", level._id_7B8C.origin );
    level._id_7B61.angles = level._id_7B8C.angles;
    level._id_7B61 setmodel( "tag_origin_animate" );
    level._id_7B61._id_1032 = "box1";
    level._id_7B61 useanimtree( level._id_1245["box1"] );
    level._id_7B8C.origin = level._id_7B61 gettagorigin( "origin_animate_jnt" );
    level._id_7B8C.angles = level._id_7B61 gettagangles( "origin_animate_jnt" );
    level._id_7B8C linkto( level._id_7B61, "origin_animate_jnt" );
    level._id_7B62 = spawn( "script_model", level._id_7B8D.origin );
    level._id_7B62.angles = level._id_7B8D.angles;
    level._id_7B62 setmodel( "tag_origin_animate" );
    level._id_7B62._id_1032 = "box2";
    level._id_7B62 useanimtree( level._id_1245["box2"] );
    level._id_7B8D.origin = level._id_7B62 gettagorigin( "origin_animate_jnt" );
    level._id_7B8D.angles = level._id_7B62 gettagangles( "origin_animate_jnt" );
    level._id_7B8D linkto( level._id_7B62, "origin_animate_jnt" );
    level._id_7B63 = spawn( "script_model", level._id_7B8E.origin );
    level._id_7B63.angles = level._id_7B8E.angles;
    level._id_7B63 setmodel( "tag_origin_animate" );
    level._id_7B63._id_1032 = "box3";
    level._id_7B63 useanimtree( level._id_1245["box3"] );
    level._id_7B8E.origin = level._id_7B63 gettagorigin( "origin_animate_jnt" );
    level._id_7B8E.angles = level._id_7B63 gettagangles( "origin_animate_jnt" );
    level._id_7B8E linkto( level._id_7B63, "origin_animate_jnt" );
    level._id_7B64 = spawn( "script_model", level._id_7B8F.origin );
    level._id_7B64.angles = level._id_7B8F.angles;
    level._id_7B64 setmodel( "tag_origin_animate" );
    level._id_7B64._id_1032 = "box4";
    level._id_7B64 useanimtree( level._id_1245["box4"] );
    level._id_7B8F.origin = level._id_7B64 gettagorigin( "origin_animate_jnt" );
    level._id_7B8F.angles = level._id_7B64 gettagangles( "origin_animate_jnt" );
    level._id_7B8F linkto( level._id_7B64, "origin_animate_jnt" );
    level._id_7B65 = spawn( "script_model", level._id_7B90.origin );
    level._id_7B65.angles = level._id_7B90.angles;
    level._id_7B65 setmodel( "tag_origin_animate" );
    level._id_7B65._id_1032 = "box5";
    level._id_7B65 useanimtree( level._id_1245["box5"] );
    level._id_7B90.origin = level._id_7B65 gettagorigin( "origin_animate_jnt" );
    level._id_7B90.angles = level._id_7B65 gettagangles( "origin_animate_jnt" );
    level._id_7B90 linkto( level._id_7B65, "origin_animate_jnt" );
    level._id_7B66 = spawn( "script_model", level._id_7B91.origin );
    level._id_7B66.angles = level._id_7B91.angles;
    level._id_7B66 setmodel( "tag_origin_animate" );
    level._id_7B66._id_1032 = "box6";
    level._id_7B66 useanimtree( level._id_1245["box6"] );
    level._id_7B91.origin = level._id_7B66 gettagorigin( "origin_animate_jnt" );
    level._id_7B91.angles = level._id_7B66 gettagangles( "origin_animate_jnt" );
    level._id_7B91 linkto( level._id_7B66, "origin_animate_jnt" );
    var_0 = getentarray( "clip_court", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 connectpaths();
        var_2 common_scripts\utility::trigger_off();
    }

    var_4 = getent( "clip_china_door", "targetname" );
    var_4 common_scripts\utility::trigger_off();
    var_5 = getent( "hedge_c_dest01", "targetname" );
    var_6 = getent( "clip_c_dest01", "targetname" );
    var_5 hide();
    var_6 common_scripts\utility::trigger_off();
    var_7 = getent( "hedge_c_dest02", "targetname" );
    var_8 = getent( "clip_c_dest02", "targetname" );
    var_7 hide();
    var_8 common_scripts\utility::trigger_off();
    level thread _id_7B92();
}

_id_7B92()
{
    var_0 = getent( "trigger_hedge01", "targetname" );
    var_1 = getent( "trigger_hedge02", "targetname" );
    var_0 thread _id_7B93( 1 );
    var_1 thread _id_7B93( 2 );
}

_id_7B93( var_0 )
{
    level endon( "bank_done" );
    self waittill( "trigger" );
    var_1 = getent( "hedge_c_clean0" + var_0, "targetname" );
    var_2 = getent( "hedge_c_dest0" + var_0, "targetname" );
    var_3 = getent( "clip_c_clean0" + var_0, "targetname" );
    var_4 = getent( "clip_c_dest0" + var_0, "targetname" );
    playfxontag( level._effect["hedgea_dest"], var_2 maps\prague_escape_code::_id_7A67(), "tag_origin" );
    wait 0.1;
    var_1 delete();
    var_2 show();
    var_3 delete();
    var_4 common_scripts\utility::trigger_on();
}
