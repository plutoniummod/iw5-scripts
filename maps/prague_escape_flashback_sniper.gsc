// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7C83()
{
    maps\_shg_common::move_player_to_start( "flashback_sniper_player" );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_sniper_outside", 0 );

    if ( !isdefined( level.player ) )
    {
        level.player = getentarray( "player", "classname" )[0];
        level.player._id_1032 = "player_rig";
    }

    common_scripts\utility::flag_set( "start_no_time_scene" );
    maps\prague_escape_code::_id_7A5D();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    level.player allowads( 0 );
    level thread _id_7CC1();
    maps\_utility::_id_265A();
    _id_7C88();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7C84()
{
    level.player shellshock( "prague_escape_flashback", 10 );
    maps\_utility::_id_1428( "prague_escape_sniper_mx", 1 );
    level._id_7C85 = newclienthudelem( level.player );
    level._id_7C85.horzalign = "fullscreen";
    level._id_7C85.vertalign = "fullscreen";
    level._id_7C85 setshader( "overlay_flashback_blur", 640, 480 );
    level._id_7C85.archive = 1;
    level._id_7C85.sort = 10;
    level thread _id_7C9C();
    level thread _id_7CC1();
    _id_7C8D();
    _id_7CA8();
}

_id_7C86( var_0 )
{
    level.player thread maps\_utility::play_sound_on_entity( "scn_prague_makarov_drive" );
    wait 1.0;
    var_1 = common_scripts\utility::getstruct( "sniper_shot_start", "targetname" );
    level thread common_scripts\utility::play_sound_in_space( "soap_weapon_fire", var_1.origin );
    wait 0.35;
    level._id_7C87 thread maps\_utility::play_sound_on_tag( "veh_glass_break_small", "tag_origin" );
    level.player playrumbleonentity( "damage_heavy" );
    playfxontag( common_scripts\utility::getfx( "glass_exit_car_flashback" ), level._id_7C87, "tag_origin" );
}

_id_7C88()
{
    level thread _id_01FD();
    var_0 = common_scripts\utility::getstruct( "uaz_align_struct", "targetname" );
    level.player.ignoreme = 1;
    level._id_7A48 = maps\_utility::_id_1287( "player_rig_oneshot", level.player.origin );
    level._id_7A48.angles = level.player getplayerangles();
    level._id_7A48._id_1032 = "player_rig";
    level._id_7A48 dontcastshadows();
    level._id_7A48 hide();
    level._id_7C87 = maps\_utility::_id_1287( "player_uaz", var_0.origin );
    level._id_7C87 hidepart( "tag_blood" );
    level._id_7C89 = spawn( "script_origin", level._id_7C87.origin );
    var_1 = getent( "ai_makarov_oneshot", "targetname" );
    level._id_7C8A = var_1 maps\_utility::_id_166F( 1 );
    level._id_7C8A._id_1032 = "makarov";
    level._id_7C8A setcandamage( 0 );
    level._id_7C8B = maps\_utility::_id_1287( "zakhaev" );
    level._id_7C8B._id_1032 = "zakhaev";
    level._id_7C8B hide();
    level._id_7BF7 = [];
    level._id_7BF7[0] = level._id_7C8A;
    level._id_7BF7[1] = level._id_7C87;
    level._id_7BF7[2] = level._id_7A48;
    level._id_7C89 maps\_anim::_id_11BF( level._id_7BF7, "no_time" );
}

_id_01FD()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 10;
    var_1["nearEnd"] = 38;
    var_1["farStart"] = 1000;
    var_1["farEnd"] = 1043.27;
    var_1["nearBlur"] = 6.81;
    var_1["farBlur"] = 1.05942;
    wait 1;
    maps\_utility::_id_27C0( level._id_1436, var_1, 1 );
    var_2 = [];
    var_2["nearStart"] = 0;
    var_2["nearEnd"] = 26;
    var_2["farStart"] = 7025;
    var_2["farEnd"] = 12062;
    var_2["nearBlur"] = 5;
    var_2["farBlur"] = 0.5;
    wait 14.5;
    maps\_utility::_id_27C0( var_1, var_2, 1 );
    common_scripts\utility::flag_wait( "start_nuke_transition" );
    maps\_utility::_id_27C0( var_2, var_0, 1 );
}

_id_7C8C()
{
    common_scripts\utility::flag_init( "start_no_time_scene" );
    common_scripts\utility::flag_init( "sniper_escape_done" );
    common_scripts\utility::flag_init( "zakhaev_shot" );
    common_scripts\utility::flag_init( "front_uaz_gone" );
    common_scripts\utility::flag_init( "front_parked_gone" );
    common_scripts\utility::flag_init( "middle_parked_gone" );
    common_scripts\utility::flag_init( "spawn_escape_victims" );
    common_scripts\utility::flag_init( "spawn_onearm_zakhaev" );
    common_scripts\utility::flag_init( "stop_uaz_rumble" );
    common_scripts\utility::flag_init( "start_heli_path" );
    common_scripts\utility::flag_init( "heli_start_path_1" );
    common_scripts\utility::flag_init( "heli_start_path_2" );
    common_scripts\utility::flag_init( "heli_path_wait_1" );
    common_scripts\utility::flag_init( "heli_path_wait_2" );
    common_scripts\utility::flag_init( "heli_blocks_zak" );
    common_scripts\utility::flag_init( "drop_the_flag" );
    common_scripts\utility::flag_init( "play_sniper_glint" );
    common_scripts\utility::flag_init( "play_sniper_glint_2" );
    common_scripts\utility::flag_init( "makarov_no_time_dialogue03" );
    common_scripts\utility::flag_init( "makarov_no_time_dialogue04" );
    common_scripts\utility::flag_init( "makarov_no_time_dialogue05" );
    common_scripts\utility::flag_init( "makarov_bullet_strike_dialogue03" );
    common_scripts\utility::flag_init( "zakhaev_bullet_strike_dialogue04" );
    common_scripts\utility::flag_init( "zakhaev_exchange_hadadeal" );
    common_scripts\utility::flag_init( "zakhaev_exchange_argueover" );
    common_scripts\utility::flag_init( "zakhaev_exchange_knownbetter" );
    common_scripts\utility::flag_init( "start_nuke_transition" );
    common_scripts\utility::flag_init( "start_nuke_scene" );
    common_scripts\utility::flag_init( "heli_fire_mw_player" );
}

_id_7C8D()
{
    common_scripts\utility::flag_wait( "start_no_time_scene" );
    level thread maps\prague_escape_code::_id_7A60();
    maps\_autosave::_id_1C3F();
    level thread _id_7C90();
    level._id_7A48 show();
    level.player playerlinktoblend( level._id_7A48, "tag_player" );
    level.player playerlinktodelta( level._id_7A48, "tag_player", 1, 10, 10, 10, 10, 1 );
    level._id_7C89 maps\_anim::_id_11DD( level._id_7BF7, "no_time" );
    level._id_7A48 hide();
    level._id_7C89 maps\_anim::_id_11D0( level._id_7C8A, "no_time" );
    var_0 = getent( "sniper_stream_ent", "targetname" );
    var_0 delete();
    var_1 = spawn( "script_model", level.player.origin );
    var_1 setmodel( "tag_origin" );
    var_1.angles = level.player.angles;
    level.player playerlinktodelta( var_1, "tag_player", 1, 20, 50, 15, 15, 0 );
    var_2 = [];
    var_2[var_2.size] = &"PRAGUE_ESCAPE_INTRO_ONESHOT_1";
    var_2[var_2.size] = &"PRAGUE_ESCAPE_INTRO_ONESHOT_2";
    var_2[var_2.size] = &"PRAGUE_ESCAPE_INTRO_ONESHOT_3";
    maps\_introscreen::_id_1D96( var_2 );
}

_id_7C8E()
{
    wait 0.5;
    level._id_7C8A thread maps\_utility::_id_168C( "presc_mkv_yuriwakeup" );
}

_id_7C8F()
{
    self endon( "death" );
    level endon( "start_nuke_transition" );
    thread _id_5EC8( "start_nuke_transition" );
    self setneargoalnotifydist( 1000 );
    self sethoverparams( 35, 15, 10 );
    common_scripts\utility::flag_wait( "start_heli_path" );
    common_scripts\utility::flag_wait( "heli_path_wait_1" );
    wait 3;
    common_scripts\utility::flag_set( "heli_start_path_1" );
    wait 5.5;
    common_scripts\utility::flag_set( "heli_start_path_2" );
    self vehicle_setspeed( 25, 15, 10 );
    common_scripts\utility::flag_wait( "heli_fire_mw_player" );
    var_0 = self gettagorigin( "tag_flash" );
    var_1 = self gettagangles( "tag_flash" );
    var_2 = anglestoforward( var_1 );
    magicbullet( "rpg_straight", var_0, var_0 + var_2 );
    magicbullet( "rpg_straight", var_0, var_0 + var_2 );
    wait 0.25;
    magicbullet( "rpg_straight", var_0, var_0 + var_2 );
    magicbullet( "rpg_straight", var_0, var_0 + var_2 );
    wait 0.25;
    magicbullet( "rpg_straight", var_0, var_0 + var_2 );
    magicbullet( "rpg_straight", var_0, var_0 + var_2 );
    common_scripts\utility::flag_wait( "start_nuke_transition" );
    self delete();
}

_id_5EC8( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_7C90()
{
    level thread _id_7C9B();
    level thread _id_7CAC();
    wait 12;
    common_scripts\utility::flag_set( "start_heli_path" );
    var_0 = getentarray( "exchange_badguys", "targetname" );
    var_1 = maps\_utility::_id_272B( var_0 );
    common_scripts\utility::array_thread( var_1, ::_id_7C99 );
    level._id_7C91 = maps\_utility::_id_2729( "exchange_zakhaev" );
    level._id_7C91.a._id_0D11 = 1;
    level._id_7C91.ignoreall = 1;
    level._id_7C91._id_1199 = 1;
    level._id_7C91._id_117F = 1;
    level._id_7C91 maps\_utility::_id_273E();
    var_2 = getent( "exchange_org", "targetname" );
    level._id_7C92 = 0.5;
    var_3 = var_1[0];
    var_4 = var_1[1];
    var_1[2] = level._id_7C91;
    level._id_7C91._id_1032 = "zakhaev";
    var_3._id_1032 = "guard";
    var_4._id_1032 = "dealer";
    var_5 = maps\_utility::_id_1287( "briefcase" );
    var_5._id_1032 = "briefcase";
    var_5 useanimtree( level._id_1245["briefcase"] );
    var_1[3] = var_5;
    level._id_7C93 = 0.35;
    level thread _id_7C95();
    var_6 = getanimlength( level._id_7C91 maps\_utility::_id_1281( "exchange_short" ) );
    var_2 thread maps\_anim::_id_11DD( var_1, "exchange_short" );
    common_scripts\utility::array_thread( var_1, ::_id_7C94 );
    wait(var_6 * level._id_7C93);
    var_1 = common_scripts\utility::array_remove( var_1, var_5 );
    wait 0.05;
    common_scripts\utility::array_thread( var_1, ::_id_7C98 );
    var_7 = level._id_7C91 gettagorigin( "J_Shoulder_LE" );
    level._id_7C91 thread _id_7CAF();
    common_scripts\utility::flag_wait( "zakhaev_shot" );
    thread common_scripts\utility::play_sound_in_space( "zak_shot_pain1", var_7 );
    var_8 = common_scripts\utility::getstruct( "sniper_shot_start", "targetname" );
    level thread _id_7ABA( var_8.origin, var_7 );
    common_scripts\utility::flag_wait( "spawn_onearm_zakhaev" );
    wait 1.25;
    var_9 = common_scripts\utility::getstruct( "sniper_third_shot", "targetname" );
    level thread _id_7ABA( var_8.origin, var_9.origin );
}

_id_7C94()
{
    maps\_anim::_id_1280( "exchange_short", level._id_7C93 );
}

_id_7C95()
{
    wait 30;
    common_scripts\utility::flag_wait( "drop_the_flag" );
    level notify( "wind_stops_flunctuating" );
    level._id_7C96 = 0;
    level._id_7C97 = "end";
}

_id_7C98()
{
    self endon( "death" );
    self.goalradius = 32;
    var_0 = getnode( "delete_guards_node", "targetname" );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self delete();
}

_id_7ABA( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_0 );
    var_3 setmodel( "tag_origin" );
    var_4 = getent( "sniper_glint_org", "script_noteworthy" );
    var_5 = anglestoforward( var_4.angles );
    playfx( common_scripts\utility::getfx( "sniper_muzzle_flash" ), var_4.origin, var_5 );
    playfxontag( common_scripts\utility::getfx( "bullet_geo_flashback" ), var_3, "tag_origin" );
    var_3 moveto( var_1, 0.05 );

    if ( isdefined( var_2 ) )
    {
        var_3 waittill( "movedone" );
        physicsexplosionsphere( var_2.origin, 6, 3, 1 );
    }

    wait 0.5;
    thread common_scripts\utility::play_sound_in_space( "soap_weapon_fire", var_0 );
    var_3 delete();
}

_id_7C99()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "zakhaev_shot" );
    var_0 = "exchange_surprise_" + randomint( level._id_7AD1 );
    wait(randomfloatrange( 0.2, 0.4 ));
    _id_7C9A();
    self stopanimscripted();
    maps\_anim::_id_11CC( self, "gravity", var_0 );
    maps\_utility::_id_140C();
    self._id_1199 = 0;
    self._id_1032 = "enemy";
    maps\_utility::_id_26F7( "sprint" );
}

_id_7C9A()
{
    if ( !isdefined( self.target ) )
    {
        self notify( "stop_loop" );
        return;
    }

    var_0 = getent( self.target, "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 notify( "stop_loop" );
        return;
    }

    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 notify( "stop_loop" );
        return;
    }
}

_id_7C97()
{
    level endon( "start_nuke_transition" );
    var_0 = 25;
    var_1 = 100;
    level._id_7C96 = 100;
    level._id_7C97 = "middle";

    for (;;)
    {
        var_2 = randomintrange( 8, 16 );

        if ( common_scripts\utility::cointoss() )
            var_3 = level._id_7C96 + var_2;
        else
            var_3 = level._id_7C96 - var_2;

        if ( var_3 > var_0 && var_3 < var_1 )
            level._id_7C96 = var_3;

        wait(randomintrange( 1, 3 ));
    }
}

_id_7C9B()
{
    common_scripts\utility::run_thread_on_targetname( "leaning_smoker", maps\_utility::add_spawn_function, ::_id_7C9F );
    common_scripts\utility::run_thread_on_targetname( "standing_smoker", maps\_utility::add_spawn_function, ::_id_7CA0 );
    common_scripts\utility::run_thread_on_targetname( "standing_bored", maps\_utility::add_spawn_function, ::_id_7CA1 );
    common_scripts\utility::run_thread_on_targetname( "standing_cellphone", maps\_utility::add_spawn_function, ::_id_7CA2 );
    common_scripts\utility::run_thread_on_noteworthy( "smoke_and_run", maps\_utility::add_spawn_function, ::_id_7CA3 );
    common_scripts\utility::run_thread_on_targetname( "middle_uaz_driver", maps\_utility::add_spawn_function, ::_id_7C9E );
    var_0 = getentarray( "smoke_and_run", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F );
    var_1 = getentarray( "leaning_smoker", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_166F );
    var_2 = getentarray( "standing_smoker", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_166F );
    var_3 = getentarray( "standing_cellphone", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::_id_166F );
    var_4 = getentarray( "standing_bored", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::_id_166F );
    var_5 = getentarray( "escape_runners", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_7CB7 );
    var_6 = getent( "middle_uaz_driver", "targetname" );
    var_7 = var_6 maps\_utility::_id_166F( 1 );
    var_8 = maps\_vehicle::_id_2A99( "front_uaz" );
    var_8.targetname = "front_uaz";
    var_8 vehicle_turnengineoff();
    var_9 = maps\_vehicle::_id_2A99( "middle_uaz" );
    var_9 maps\_vehicle::_id_2514();
    var_9.targetname = "middle_uaz";
    var_9 vehicle_turnengineoff();
    var_10 = maps\_vehicle::_id_2A99( "zaks_ride" );
    var_10.targetname = "zaks_ride";
    var_10 vehicle_turnengineoff();
    var_11 = maps\_vehicle::_id_2A99( "front_uaz_parked" );
    var_11.targetname = "front_uaz_parked";
    var_11 vehicle_turnengineoff();
    var_12 = maps\_vehicle::_id_2A99( "middle_parked" );
    var_12.targetname = "middle_parked";
    var_12 vehicle_turnengineoff();
    var_13 = maps\_vehicle::_id_2A99( "back_parked" );
    var_13.targetname = "back_parked";
    var_13 vehicle_turnengineoff();
    wait 0.05;
    _id_7CB8();
    level thread _id_7C97();
    level thread _id_7CBD();
    level thread _id_7CBC();
    common_scripts\utility::run_thread_on_targetname( "flag_org", ::_id_7CB9 );
    var_14 = maps\_vehicle::_id_2881( "heli_exchange_deal" );
    var_14 thread _id_7C8F();
    common_scripts\utility::flag_wait( "zakhaev_shot" );
    var_15 = getent( "front_uaz_go", "targetname" );
    var_8 thread _id_7CA4();
    var_8 thread _id_7CA7( var_15 );
    var_16 = getent( "middle_uaz_go", "targetname" );
    var_9 thread _id_7CA7( var_16 );
    var_17 = getent( "zaks_ride_go", "targetname" );
    var_10 thread _id_7CA7( var_17 );
    var_18 = getent( "front_parked_go", "targetname" );
    var_11 thread _id_7CA5();
    var_11 thread _id_7CA7( var_18 );
    var_19 = getent( "middle_parked_go", "targetname" );
    var_12 thread _id_7CA6();
    var_12 thread _id_7CA7( var_19 );
    var_20 = getent( "back_parked_go", "targetname" );
    var_13 thread _id_7CA7( var_20 );
}

_id_7C9C()
{
    common_scripts\utility::flag_wait( "start_nuke_transition" );
    wait 0.5;
    level.player playsound( "scn_prague_flash_airlift" );
    level.player maps\_utility::delaythread( 2.0, maps\_utility::play_sound_on_entity, "presc_yri_neverforgot2" );
    maps\_utility::_id_1427( 1 );
    maps\prague_escape_code::_id_7A46( "sniper_escape_done", "start_nuke_scene", "prague_escape_airlift", 0.25, 3, undefined, 0.75 );
}

_id_7C9D()
{
    wait 13;
    var_0 = maps\_vehicle::_id_2A99( "heli_flyover_uaz" );
    var_0 setneargoalnotifydist( 20 );
    var_0 thread maps\_vehicle::_id_2965( var_0.target, 45, 45 );
    common_scripts\utility::flag_wait( "sniper_escape_done" );
    var_0 delete();
}

_id_7C9E()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    var_0 = getnode( self.target, "targetname" );
    self.walkdist = 1000;
    self.fixednode = 1;
    self setgoalnode( var_0 );
    self._id_1199 = 1;
    self._id_117F = 1;
    maps\_utility::_id_140B( "stealth_walk" );
    self.goalradius = 16;
    _id_7C99();
    self._id_250B = 301;
    var_1 = maps\_vehicle_aianim::_id_250C();
    var_1 maps\_vehicle::_id_2AE6( self, undefined, "all" );
}

_id_7C9F()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    wait(randomfloatrange( 0.1, 0.5 ));
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::_id_11C8( self, "smoking_lean_idle" );
    common_scripts\utility::flag_wait( "zakhaev_shot" );
    wait(randomfloatrange( 0.2, 0.4 ));
    _id_7C9A();
    self stopanimscripted();
    maps\_anim::_id_11CC( self, "gravity", "smoking_lean_react" );
    maps\_utility::_id_140C();
    self._id_1199 = 0;
    self._id_1032 = "enemy";
    maps\_utility::_id_26F7( "sprint" );

    switch ( self.script_noteworthy )
    {
        case "front_uaz_guard":
            self._id_250B = 300;
            break;
        case "middle_uaz_smoker":
            self._id_250B = 301;
            break;
        case "middle_parked_guard":
            self._id_250B = 304;
            break;
        case "zak_uaz_rider":
            self._id_250B = 302;
            break;
    }

    var_1 = maps\_vehicle_aianim::_id_250C();
    var_1 maps\_vehicle::_id_2AE6( self, undefined, "all" );
}

_id_7CA0()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::_id_11C8( self, "smoke_idle" );
    _id_7C99();

    switch ( self.script_noteworthy )
    {
        case "zak_uaz_rider":
            self._id_250B = 302;
            break;
        case "middle_parked_guard":
            self._id_250B = 304;
            break;
        case "smoke_and_run":
            break;
    }

    var_1 = maps\_vehicle_aianim::_id_250C();
    var_1 maps\_vehicle::_id_2AE6( self, undefined, "all" );
}

_id_7CA1()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::_id_11C8( self, "bored_idle" );
    _id_7C99();

    switch ( self.script_noteworthy )
    {
        case "front_uaz_parked_guard":
            self._id_250B = 305;
            break;
        case "middle_parked_guard":
            self._id_250B = 304;
            break;
        case "zak_uaz_rider":
            self._id_250B = 302;
            break;
    }

    var_1 = maps\_vehicle_aianim::_id_250C();
    var_1 maps\_vehicle::_id_2AE6( self, undefined, "all" );
}

_id_7CA2()
{
    self.ignoreall = 1;
    self.ignoreme = 1;
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::_id_11C8( self, "smoke_idle" );
    _id_7C99();

    switch ( self.script_noteworthy )
    {
        case "back_parked_guard":
            self._id_250B = 303;
            break;
        case "front_uaz_guard":
            self._id_250B = 300;
            break;
    }

    var_1 = maps\_vehicle_aianim::_id_250C();
    var_1 maps\_vehicle::_id_2AE6( self, undefined, "all" );
}

_id_7CA3()
{
    self endon( "death" );
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::_id_11C8( self, "smoke_idle" );
    _id_7C99();
    _id_7C98();
}

_id_7CA4()
{
    var_0 = getvehiclenode( "front_uaz_gone", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "front_uaz_gone" );
}

_id_7CA5()
{
    var_0 = getvehiclenode( "front_parked_gone", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "front_parked_gone" );
}

_id_7CA6()
{
    var_0 = getvehiclenode( "middle_parked_gone", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "middle_parked_gone" );
}

_id_7CA7( var_0 )
{
    self waittill( "loaded" );

    switch ( self.targetname )
    {
        case "front_uaz":
            wait 0.25;
            break;
        case "middle_uaz":
            common_scripts\utility::flag_wait( "front_uaz_gone" );
            break;
        case "zaks_ride":
            wait 0.25;
            break;
        case "middle_parked":
            wait 0.25;
            common_scripts\utility::flag_wait( "front_parked_gone" );
            break;
        case "back_parked":
            wait 0.25;
            common_scripts\utility::flag_wait( "middle_parked_gone" );
            break;
    }

    var_0 notify( "trigger" );
    self waittill( "reached_end_node" );
    self delete();
}

_id_7CA8()
{
    common_scripts\utility::flag_wait( "zakhaev_shot" );
    wait 1;
    var_0 = getent( "nuke_stream_ent", "targetname" );
    level.player playersetstreamorigin( var_0.origin );
    level thread _id_7CAD();
    level thread _id_7CAE();
    level._id_7C8A show();
    level._id_7A48 show();
    var_1 = [];
    var_1[0] = level._id_7C8A;
    var_1[1] = level._id_7C87;
    var_1[2] = level._id_7A48;
    var_1[3] = level._id_7C8B;
    level._id_7C8B maps\_utility::delaythread( 3, maps\_utility::play_sound_on_entity, "zak_pain_car" );
    level._id_7C87 maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "zak_lands_on_car" );
    level.player playerlinktoabsolute( level._id_7A48, "tag_player" );
    level.player maps\_utility::delaythread( 9.35, maps\_utility::play_sound_on_entity, "presc_yri_neverforgot" );
    level._id_7C89 maps\_anim::_id_11DD( var_1, "bullet_strikes" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_2705 );
}

_id_7CA9( var_0 )
{
    wait 1;
    common_scripts\utility::flag_set( "start_nuke_transition" );
    level.player playrumbleonentity( "grenade_rumble" );
    earthquake( 0.4, 0.5, level.player.origin, 512 );
    playfxontag( common_scripts\utility::getfx( "car_impact_1_flashback" ), level._id_7C87, "tag_origin" );
}

_id_7CAA( var_0 )
{
    level.player playrumbleonentity( "grenade_rumble" );
    earthquake( 0.4, 0.5, level.player.origin, 512 );
    playfxontag( common_scripts\utility::getfx( "car_impact_2_flashback" ), level._id_7C87, "tag_origin" );
}

_id_7CAB( var_0 )
{
    level.player playerlinktoblend( level._id_7A48, "tag_player" );
    level.player playerlinktodelta( level._id_7A48, "tag_player", 0, 15, 30, 15, 15, 1 );
}

_id_7CAC()
{
    var_0 = common_scripts\utility::getfx( "sniper_glint" );
    var_1 = getent( "sniper_glint_org", "script_noteworthy" );
    common_scripts\utility::flag_wait( "play_sniper_glint" );
    wait 2;
    playfx( var_0, var_1.origin );
    wait 0.5;
    playfx( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "play_sniper_glint_2" );
    playfx( var_0, var_1.origin );
    wait 0.5;
    playfx( var_0, var_1.origin );
}

_id_7CAD()
{
    common_scripts\utility::flag_wait( "spawn_escape_victims" );
    var_0 = getentarray( "escape_runners", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F );
    var_1 = maps\_utility::_id_2729( "guard_1_victim" );
    var_2 = maps\_utility::_id_2729( "guard_2_victim" );
    var_1._id_1032 = "guard_1";
    var_2._id_1032 = "guard_2";
    var_3 = [];
    var_3[0] = var_1;
    var_3[1] = var_2;
    common_scripts\utility::array_thread( var_3, maps\_utility::_id_24F5 );
    level._id_7C89 maps\_anim::_id_11DD( var_3, "bullet_strikes" );
    common_scripts\utility::array_thread( var_3, maps\_utility::_id_2705 );
}

_id_7CAE()
{
    common_scripts\utility::flag_wait( "spawn_onearm_zakhaev" );
    level._id_7C8B show();
    playfxontag( common_scripts\utility::getfx( "zak_arm_blood" ), level._id_7C8B, "J_Shoulder_LE" );
}

_id_7CAF()
{
    self.health = 50000;
    self endon( "death" );
    maps\_utility::_id_260D();
    var_0 = maps\_utility::_id_1287( "zakhaev" );
    var_0 hide();
    var_0 linkto( self, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Shoulder_LE" );
    common_scripts\utility::run_thread_on_targetname( "blood_pool", ::_id_7CB5 );
    var_0 unlink();
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = self.origin;
    var_2 = 135;
    var_1.angles = ( 0, var_2, 0 );
    var_3 = getstartorigin( var_1.origin, var_1.angles, level._id_0C59["zak_left_arm"]["zak_pain"] );
    var_4 = maps\_utility::_id_1287( "zak_left_arm", var_3 );
    var_4 thread _id_7CB2();
    var_1 maps\_anim::_id_11CF( var_4, "zak_pain" );
    var_1 thread maps\_anim::_id_1246( var_0, "zak_pain" );
    var_1 maps\_utility::delaythread( 0.05, maps\_anim::_id_1246, var_4, "zak_pain" );
    thread common_scripts\utility::play_sound_in_space( "scn_prague_sniped_bulletimpact", self.origin );
    var_0 thread _id_7CB1();
    var_0 thread _id_7CB4();
    var_0 thread _id_7CB0();
    common_scripts\utility::flag_set( "zakhaev_shot" );
    var_0 show();
    self delete();
}

_id_7CB0()
{
    common_scripts\utility::flag_wait( "spawn_onearm_zakhaev" );
    level notify( "stop_zak_blood" );
    self stopanimscripted();
    self delete();
}

_id_7CB1()
{
    level endon( "stop_zak_blood" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Shoulder_LE" );
        wait 0.1;
    }
}

_id_7CB2()
{
    var_0 = 0.2;
    var_1 = 0.5;
    _id_7CB3( var_1, self, var_0 );
    wait 0.5;
    _id_7CB3( var_1, self, var_0 );
    wait 0.5;
    _id_7CB3( var_1, self, var_0 );
    wait 0.5;
    _id_7CB3( var_1, self, var_0 * 0.5 );
    wait 0.5;
    _id_7CB3( var_1, self, var_0 * 0.25 );
    wait 0.5;

    if ( 1 )
        return;

    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( self, "J_Shoulder_LE", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 thread maps\_debug::_id_19A9( "tag_origin" );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        playfxontag( common_scripts\utility::getfx( "blood" ), var_2, "tag_origin" );
        wait(var_0);
    }

    wait 5;
    var_2 delete();
}

_id_7CB3( var_0, var_1, var_2 )
{
    var_0 *= 1 / var_2;

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        playfxontag( common_scripts\utility::getfx( "blood" ), var_1, "J_Shoulder_LE" );
        wait(var_2);
    }
}

_id_7CB4()
{
    level endon( "stop_zak_blood" );
    wait 1;
    var_0 = getent( "blood_pool", "targetname" );
    var_1 = var_0.origin[2];

    for (;;)
    {
        var_2 = self gettagorigin( "J_Shoulder_LE" ) + ( 0.0, 0.0, 50.0 );
        var_3 = var_2 + ( 0.0, 0.0, -250.0 );
        var_4 = bullettrace( var_2, var_3, 0, undefined );
        var_5 = ( var_4["position"][0], var_4["position"][1], var_1 );
        playfx( common_scripts\utility::getfx( "blood_pool" ), var_5, ( 0.0, 0.0, 1.0 ) );
        wait 0.35;
    }
}

_id_7CB5()
{
    level endon( "stop_zak_blood" );
    var_0 = self;
    var_1 = 5;

    for (;;)
    {
        playfx( common_scripts\utility::getfx( "blood_pool" ), var_0.origin + ( 0.0, 0.0, 1.0 ), ( 0.0, 0.0, 1.0 ) );
        var_1--;

        if ( var_1 <= 0 )
            wait 0.3;

        if ( !isdefined( var_0.target ) )
            return;

        var_0 = getent( var_0.target, "targetname" );
    }
}

_id_7CB6()
{
    self endon( "death" );
    var_0 = getnode( self.target, "targetname" );
    maps\_utility::_id_2612( 1 );
    self.walkdist = 1000;
    self.fixednode = 1;
    self setgoalnode( var_0 );
    self._id_1199 = 1;
    self._id_117F = 1;
    maps\_utility::_id_140B( "stealth_walk" );
    self.goalradius = 16;
    _id_7C99();
    self.fixednode = 0;
    thread _id_7C98();
}

_id_7CB7()
{
    self endon( "death" );
    maps\_utility::_id_2612( 1 );
    self._id_1199 = 1;
    self._id_117F = 1;
    var_0 = getnode( "delete_runners_node", "targetname" );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self delete();
}

_id_7CB8()
{
    var_0 = getentarray( "front_uaz", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 delete();
    }

    var_0 = getentarray( "middle_uaz", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 delete();
    }

    var_0 = getentarray( "zaks_ride", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 delete();
    }

    var_0 = getentarray( "front_uaz_parked", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 delete();
    }

    var_0 = getentarray( "middle_parked", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 delete();
    }

    var_0 = getentarray( "back_parked", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 delete();
    }
}

_id_7CB9()
{
    level endon( "start_nuke_transition" );
    var_0 = maps\_utility::_id_1287( "flag" );
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_1 = getent( self.script_linkto, "script_linkname" );
    self linkto( var_0 );
    var_0 linkto( var_1 );
    var_0 thread _id_7CBA();
    var_0 thread _id_7CBB( var_1 );
    var_2 = 0;
    var_3 = 0.5;

    for (;;)
    {
        var_4 = level._id_7C96 / 100;

        if ( var_4 < 0 )
            var_4 = 0;
        else if ( var_4 > 0.99 )
            var_4 = 0.99;

        if ( var_2 < var_4 )
        {
            var_2 += var_3;

            if ( var_2 > var_4 )
                var_2 = var_4;
        }
        else
        {
            var_2 -= var_3;

            if ( var_2 < var_4 )
                var_2 = var_4;
        }

        var_5 = randomfloatrange( 0.1, 1 );
        var_0 setanim( var_0 maps\_utility::_id_1281( "up" ), var_2, var_5, 5 );
        var_0 setanim( var_0 maps\_utility::_id_1281( "down" ), 1 - var_2, var_5, 5 );
        wait(var_5);
    }
}

_id_7CBA()
{
    level endon( "start_nuke_transition" );
    wait 0.1;
    self unlink();

    for (;;)
    {
        level waittill( "wind_flag_rotation", var_0, var_1 );
        self rotateyaw( var_0, var_1, var_1 * 0.25, var_1 * 0.25 );
    }
}

_id_7CBB( var_0 )
{
    waittillframeend;
    common_scripts\utility::flag_wait( "spawn_onearm_zakhaev" );
    self.angles = ( 0, var_0.angles[1] + 180, 0 );
    self linkto( var_0 );
    level._id_7C96 = 80;
    level._id_7C97 = "middle";
    common_scripts\utility::flag_wait( "start_nuke_transition" );
    self delete();
}

_id_7CBC()
{
    var_0 = 140;

    for (;;)
    {
        var_1 = randomfloatrange( 0.3, 0.9 );
        level notify( "wind_flag_rotation", randomint( var_0 ) - var_0 * 0.5, var_1 );
        wait(var_1);
    }
}

_id_7CBD()
{
    var_0 = getent( "wind_flag", "script_noteworthy" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = anglestoforward( var_0.angles );
        level._id_7CBE = var_1 * level._id_7C96;
        wait 0.05;
    }
}

_id_7CBF( var_0 )
{
    level._id_7C8A maps\_utility::_id_168C( "presc_mkv_wearelucky" );
    common_scripts\utility::flag_wait( "makarov_no_time_dialogue03" );
    level._id_7C8A maps\_utility::_id_168C( "presc_mkv_tensofmillions" );
    common_scripts\utility::flag_wait( "makarov_no_time_dialogue04" );
    level._id_7C8A maps\_utility::_id_168C( "presc_mkv_moneycan" );
    common_scripts\utility::flag_wait( "makarov_no_time_dialogue05" );
    level._id_7C8A maps\_utility::_id_168C( "presc_mkv_roadtothefuture" );
    common_scripts\utility::flag_wait( "makarov_bullet_strike_dialogue03" );
    level._id_7C8A maps\_utility::_id_168C( "presc_mkv_itsanattack" );
    common_scripts\utility::flag_wait( "zakhaev_bullet_strike_dialogue04" );
    level._id_7C8B maps\_utility::_id_168C( "presc_rl_getusout" );
}

_id_7CC0( var_0 )
{
    level._id_11BB["presc_yri_firstmetmakarov"] = "presc_yri_firstmetmakarov";
    level._id_11BB["presc_yri_neverforgot"] = "presc_yri_neverforgot";
    level._id_7C91 maps\_utility::play_sound_on_entity( "presc_zkv_whatdoyou" );
    common_scripts\utility::flag_wait( "zakhaev_exchange_hadadeal" );
    level._id_7C91 maps\_utility::_id_168C( "presc_zkv_hadadeal" );
    wait 4;
    common_scripts\utility::flag_wait( "zakhaev_exchange_argueover" );
    level._id_7C91 maps\_utility::_id_168C( "presc_zkv_argueover" );
    common_scripts\utility::flag_wait( "zakhaev_exchange_knownbetter" );
    level._id_7C91 maps\_utility::_id_168C( "presc_zkv_knownbetter" );
}

_id_7CC1()
{
    var_0 = getentarray( "fake_ak_models", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] hidepart( "TAG_Shotgun" );
        var_0[var_1] hidepart( "TAG_SILENCER" );
        var_0[var_1] hidepart( "TAG_THERMAL_SCOPE" );
        var_0[var_1] hidepart( "TAG_RETICLE_ACOG" );
        var_0[var_1] hidepart( "TAG_RETICLE_RED_DOT" );
        var_0[var_1] hideallparts();
    }
}
