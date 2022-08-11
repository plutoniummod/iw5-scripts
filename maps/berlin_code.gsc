// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

spawn_berlin_friendlies( var_0 )
{
    level.heroes = [];
    setup_friendly_spawner( "lone_star", ::setup_lone_star );
    setup_friendly_spawner( "essex", ::setup_essex );
    setup_friendly_spawner( "truck", ::setup_truck );
    maps\_shg_common::_id_166E( var_0, "lone_star" );
    maps\_shg_common::_id_166E( var_0, "essex" );
    maps\_shg_common::_id_166E( var_0, "truck" );
}

setup_friendly_spawner( var_0, var_1 )
{
    var_2 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 maps\_utility::add_spawn_function( var_1 );
}

setup_lone_star()
{
    level._id_4E8F = self;
    self._id_1032 = "lone_star";
    _id_6FCA();
    level.heroes[0] = level._id_4E8F;
}

setup_essex()
{
    level._id_71A0 = self;
    self._id_1032 = "essex";
    _id_6FCA();
    level.heroes[1] = level._id_71A0;
}

setup_truck()
{
    level._id_45C4 = self;
    self._id_1032 = "truck";
    _id_6FCA();
    level.heroes[2] = level._id_45C4;
}

_id_6FCA()
{
    thread maps\_utility::_id_0D04();
    thread _id_734C();
    self._id_4B64 = 1;
    self._id_0CBA = 1;
    self.grenadeweapon = "ninebang_grenade";
}

_id_71A1()
{
    var_0 = getentarray( "little_bird_friendlies", "script_noteworthy" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isspawner( var_3 ) )
            var_1 = common_scripts\utility::add_to_array( var_1, var_3 );
    }

    var_1 = common_scripts\utility::add_to_array( var_1, level._id_4E8F );
    var_1 = common_scripts\utility::add_to_array( var_1, level._id_71A0 );
    var_1 = common_scripts\utility::add_to_array( var_1, level._id_45C4 );
    return var_1;
}

_id_71A2()
{
    maps\_utility::vision_set_fog_changes( "berlin_collapse", 0 );
    level.player freezecontrols( 1 );
    thread maps\_introscreen::_id_1D97( 3, 4 );
    wait 4;
    level.player freezecontrols( 0 );
}

_id_71A3()
{
    level notify( "stop_building_collapse_ambush" );
    var_0 = anglestoforward( level.player.angles );
    var_1 = var_0 * 300;
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = level.player.origin + var_1;
    var_3 = bullettrace( var_2.origin + ( 0.0, 0.0, 100.0 ), var_2.origin - ( 0.0, 0.0, 1000.0 ), 0 );
    var_4 = 1;
    thread _id_72B9( var_3["position"], "generic_explosion", var_4, "artillery_ambush_final_incoming", "artillery_ambush_final_explosion" );
    wait(var_4);
    level.player shellshock( "berlin_intro", 3 );
    playrumbleonposition( "heavy_3s", level.player.origin );
}

_id_71A4()
{
    maps\_utility::_id_2772( 0.3 );
    maps\_utility::_id_2774( 0 );
    maps\_utility::_id_2775();
    wait 1;
    maps\_utility::_id_0A16( 0 );
    maps\_utility::_id_0A17();
}

_id_71A5()
{
    common_scripts\utility::flag_wait( "aftermath_se_complete" );
    level.player disableoffhandweapons();
}

_id_71A6()
{
    level endon( "mission failed" );
    common_scripts\utility::flag_wait( "start_intro_fade_2_white" );
    _id_71A7();
}

_id_71A7()
{
    var_0 = 1;
    var_1 = 3;
    var_2 = 0;
    thread _id_46B8( "black", var_1, 0, var_0 );
    var_3 = [];
    var_3[0] = &"BERLIN_INTROSCREEN_20MINS";
    thread _id_71A8();
    wait(var_0);
    thread _id_734F( var_3, var_2 );
    common_scripts\utility::flag_set( "intro_outro_full_white" );
    level.player freezecontrols( 1 );
    wait(var_1 - 0.1);
    common_scripts\utility::flag_set( "intro_sequence_complete" );
    level.player setmovespeedscale( 1 );
    level.player freezecontrols( 0 );
    maps\_utility::vision_set_fog_changes( "berlin_heli", 0 );
}

_id_71A8()
{
    level endon( "intro_sequence_complete" );
    var_0 = 1;

    while ( var_0 > 0.1 )
    {
        var_0 -= 0.1;
        level.player setmovespeedscale( var_0 );
        wait 0.5;
    }
}

_id_71A9()
{
    common_scripts\utility::flag_wait( "intro_sequence_complete" );
    common_scripts\utility::flag_clear( "sandman_start_aftermath" );
    common_scripts\utility::flag_clear( "ambush_after_building_collapse_start" );
    common_scripts\utility::flag_clear( "player_near_ceiling_collapse" );
    common_scripts\utility::flag_clear( "player_at_ceiling_collapse" );
    common_scripts\utility::flag_clear( "lone_star_at_ceiling_collapse" );
    common_scripts\utility::flag_clear( "ceiling_collapse_complete" );
    common_scripts\utility::flag_clear( "intro_lone_star_facial_anim_complete" );
}

_id_71AA()
{
    level.player freezecontrols( 1 );
    thread maps\_introscreen::_id_1D97( 3, 4 );
    common_scripts\utility::flag_set( "intro_start_on_path" );
    maps\_audio::aud_send_msg( "fade_in_heli_ride" );
    thread _id_71AB();
    wait 5;
    level.player freezecontrols( 0 );
    wait 4;
    common_scripts\utility::flag_set( "start_sandman_vo" );
}

_id_71AB()
{
    wait 0.5;
    var_0 = [];
    var_0[var_0.size] = &"BERLIN_INTROSCREEN_LINE1";
    var_0[var_0.size] = &"BERLIN_INTROSCREEN_LINE2";
    var_0[var_0.size] = &"BERLIN_INTROSCREEN_LINE3";
    var_0[var_0.size] = &"BERLIN_INTROSCREEN_LINE4";
    var_0[var_0.size] = &"BERLIN_INTROSCREEN_LINE5";
    level._id_1DA0 = -1;
    maps\_introscreen::_id_1D96( var_0 );
}

_id_71AC()
{
    var_0 = getentarray( "intro_vehicle_column", "script_noteworthy" );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3 maps\_vehicle::_id_1F9E();

        if ( isdefined( var_4._id_164F ) )
        {
            if ( var_4._id_164F == "intro_tank_aim_left" )
                var_1 = var_4;

            var_4 setturrettargetent( getent( var_4._id_164F, "targetname" ) );
        }
    }

    var_6 = getentarray( "flyover_street_battle", "targetname" );
    var_7 = maps\_utility::_id_272B( var_6, 1 );
    thread maps\_utility::_id_2756( var_7, 512 );
    wait 1;
    var_8 = getent( "intro_bad_tank", "targetname" );
    var_8 maps\_vehicle::_id_1F9E();
    var_1 _id_71AD( "intro_tank_left", var_8 );
}

_id_006B()
{
    level endon( "stop_heartbeat_rumble" );

    for (;;)
    {
        level.player playrumbleonentity( "heavy_3s" );
        wait 0.1;
        stopallrumbles();
        wait 0.05;
        level.player playrumbleonentity( "light_1s" );
        wait 0.1;
        stopallrumbles();
        wait 1.2;
    }
}

_id_006C()
{
    level notify( "stop_heartbeat_rumble" );
    stopallrumbles();
}

_id_71AD( var_0, var_1 )
{
    self endon( "death" );
    var_1 endon( "death" );

    if ( !common_scripts\utility::flag_exist( var_0 ) )
        common_scripts\utility::flag_init( var_0 );

    common_scripts\utility::flag_wait( var_0 );
    self setturrettargetent( var_1 );
    wait 0.3;
    self fireweapon();
    wait 0.05;
    self fireweapon();
    var_1 kill( self.origin, self, self );
}

_id_71AE()
{
    var_0 = getent( "attack_apache", "script_noteworthy" );
    var_1 = maps\_vehicle::_id_211F( var_0 );
    var_1 setmaxpitchroll( 10, 60 );
    return var_1;
}

_id_71AF()
{
    var_0 = getent( "playerbird", "targetname" );
    var_1 = maps\_vehicle::_id_211F( var_0 );
    maps\_audio::aud_send_msg( "spawn_playerbird", var_1 );
    return var_1;
}

_id_71B0()
{
    var_0 = getent( "deadbird", "targetname" );
    var_1 = maps\_vehicle::_id_211F( var_0 );
    maps\_audio::aud_send_msg( "spawn_deadbird", var_1 );
    var_2 = getent( "dead_little_bird_crash_location", "script_noteworthy" );
    var_1._id_29DC = var_2;
    var_1._id_29CC = 0;
    var_1._id_29E8 = 1;
    return var_1;
}

_id_71B1()
{
    var_0 = getentarray( "ambient_helicopter", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\_vehicle::_id_2A12 );
    level._id_71B2 = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_utility::_id_1FA3();
        var_3 setmaxpitchroll( 20, 60 );
        level._id_71B2 = maps\_utility::_id_0BC3( level._id_71B2, var_3 );
    }
}

_id_71B3()
{
    level._id_4E8F thread maps\_anim::_id_124E( level._id_4E8F, "heli_ride", "intro_heli_hit" );
    level._id_4E8F thread maps\_utility::_id_168C( "berlin_cby_graniteteam" );
    common_scripts\utility::flag_wait( "intro_heli_hit" );
    level._id_4E8F notify( "intro_heli_hit" );
    level._id_4E8F maps\_anim::_id_1246( level._id_4E8F, "heli_crash_reaction" );
}

_id_71B4( var_0 )
{
    common_scripts\utility::array_thread( level._id_71B2, maps\_vehicle::_id_1FA6 );
    thread _id_71B6();
    var_1 = _id_71B5();
    var_1 setmaxpitchroll( 10, 40 );
    var_1 thread _id_71B7();
    var_2 = getent( "attack_apache2", "script_noteworthy" );
    var_3 = maps\_vehicle::_id_211F( var_2 );
    var_3 setmaxpitchroll( 20, 60 );
    maps\_vehicle::_id_1FA6( var_3 );
    var_3 thread _id_71BE( "attack_apache2_fire", "apache_attack2_target" );
    var_4 = getent( "attack_apache3", "script_noteworthy" );
    var_5 = maps\_vehicle::_id_211F( var_4 );
    var_5 setmaxpitchroll( 20, 60 );
    var_5 maps\_vehicle::_id_2A12();
    maps\_vehicle::_id_1FA6( var_5 );
    var_5 thread _id_71BE( "attack_apache3_fire", "apache_attack3_target" );
    var_5 thread _id_71BE( "player_unloaded_from_intro_flight", "apache_attack3_target2" );
    var_0 maps\_vehicle::_id_2A12();
    var_6 = getent( "dead_little_bird_crash_location", "script_noteworthy" );
    var_0 thread _id_71C6( var_6 );
    thread _id_71BB( var_0 );
    thread _id_71BC( var_0 );
    var_0 thread _id_71B8();
    common_scripts\utility::flag_wait( "apache_fire2" );
    common_scripts\utility::flag_wait( "player_unloaded_from_intro_flight" );
    level notify( "stop_battlefield_effects" );
    level notify( "stop_drone_spawner" );
}

_id_71B5()
{
    var_0 = getent( "ambient_little_bird_crasher", "targetname" );
    var_1 = maps\_vehicle::_id_211F( var_0 );
    var_2 = common_scripts\utility::getstruct( "ambient_little_bird_crash_location", "targetname" );
    var_1._id_29DC = var_2;
    var_1._id_29CC = 1;
    maps\_vehicle::_id_1FA6( var_1 );
    return var_1;
}

_id_71B6()
{
    common_scripts\utility::flag_wait( "start_sandman_vo" );
    wait 0.5;
    var_0 = common_scripts\utility::getstructarray( "javelin_launch_site", "targetname" );
    var_1 = getent( "javelin_target_behind", "targetname" );
    var_2 = var_1 _id_7344( var_0[0] );
    maps\_audio::aud_send_msg( "intro_javelin_fire_1", var_2 );
    common_scripts\utility::flag_wait( "ambient_little_bird_hit" );
    wait 3.8;
    var_3 = getent( "javelin_target_riverfront", "targetname" );
    var_4 = var_3 _id_7344( var_0[1] );
    maps\_audio::aud_send_msg( "intro_javelin_fire_3", var_4 );
}

_id_71B7()
{
    common_scripts\utility::flag_wait( "start_sandman_vo" );
    wait 4.2;
    var_0 = common_scripts\utility::getstruct( "ambient_little_bird_crasher_missile_fire", "targetname" );
    var_1 = _id_7344( var_0 );
    maps\_audio::aud_send_msg( "intro_javelin_fire_2", var_1 );
}

_id_71B8()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "deadbird_kill" );
    self notify( "death" );
}

_id_71B9( var_0, var_1, var_2, var_3 )
{
    if ( !isarray( var_0 ) )
        var_0 = [ var_0 ];

    foreach ( var_5 in var_0 )
        var_5 thread _id_71BA( var_1, var_2, var_3 );
}

_id_71BA( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
        self endon( var_4 );

    common_scripts\utility::flag_wait( var_1 );

    foreach ( var_7 in var_2 )
        self notify( var_7 );
}

_id_71BB( var_0 )
{
    common_scripts\utility::flag_wait( "aa_building_start_rpg_attackers" );
    var_1 = maps\_utility::_id_272D( "aa_building_rpg_attacker" );
    common_scripts\utility::array_thread( var_1, ::_id_71BD );
}

_id_71BC( var_0 )
{
    common_scripts\utility::flag_wait( "apache_fire2" );
    var_1 = getent( "aa_building_rpg_attacker_scripted", "script_noteworthy" );
    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 thread maps\_utility::_id_0D04();
    var_2 maps\_utility::_id_2709( "stinger_speedy", "back" );
    var_2._id_1032 = "generic";
    var_3 = getent( "aa_building_rpg_attack_anim", "targetname" );
    var_3 maps\_anim::_id_124A( var_2, "contengency_rocket_moment" );
    var_2 maps\_utility::_id_2709( "stinger_speedy", "chest" );
    var_3 thread maps\_anim::_id_1246( var_2, "contengency_rocket_moment" );
    var_2 waittillmatch( "single anim", "fire rocket" );
    common_scripts\utility::flag_set( "rpg_attacker_fires" );
    var_4 = var_2 gettagorigin( "TAG_INHAND" );
    var_0 maps\_vehicle::_id_2A13();
    var_5 = magicbullet( "stinger_speedy", var_4, var_0.origin );
    var_5 missile_settargetent( var_0 );
    maps\_audio::aud_send_msg( "RPG_fires_at_deadbird", var_5 );
    var_2 thread maps\_utility::_id_1902();
    var_2 maps\_utility::_id_2709( "stinger_speedy", "none" );
    thread _id_71CA( level._id_4E86, level._id_4E8F.origin, var_2.origin + ( 0.0, 0.0, 32.0 ), var_2 );
    var_2 waittillmatch( "single anim", "end" );
}

_id_71BD()
{
    self endon( "death" );
    self._id_4625 = self.weapon;
    self._id_1032 = "generic";
    maps\_utility::_id_104A( "rpg", "primary" );
    self waittill( "goal" );
    wait 3.5;
    var_0 = common_scripts\utility::getstruct( "amb_missile_hit", "targetname" );
    var_1 = self gettagorigin( "TAG_INHAND" );
    var_2 = magicbullet( "stinger_speedy", var_1, var_0.origin );
    maps\_utility::_id_104A( self._id_4625, "primary" );
    self._id_1382 = 0;

    while ( isdefined( var_2 ) )
        wait 0.05;

    playfx( common_scripts\utility::getfx( "tank_shot_impact" ), var_0.origin );
    self.ignoreall = 0;
}

_id_71BE( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    var_2 = getent( var_1, "targetname" );
    _id_71C2( var_2, 3 );
    var_2 delete();
}

_id_71BF()
{
    var_0 = getentarray( "intro_vehicle_column", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_4 = getentarray( "flyover_street_battle", "targetname" );
    maps\_utility::_id_135B( var_4 );
}

_id_71C0( var_0, var_1 )
{
    var_0 maps\_vehicle::_id_2A12();
    common_scripts\utility::flag_wait( "apache_fire1" );
    var_2 = getent( "aa_building_hit0", "targetname" );
    var_0 _id_71C2( var_2, 3 );
    var_2 delete();
    maps\_audio::aud_send_msg( "apache_fires_missiles1", var_0 );
    var_2 = getent( "aa_building_hit1", "targetname" );
    var_0 _id_71C2( var_2, 2 );
    var_2 delete();
    maps\_audio::aud_send_msg( "apache_fires_missiles2", var_0 );
    var_2 = getent( "aa_building_hit2", "targetname" );
    var_0 _id_71C2( var_2, 3 );
    var_2 delete();
}

_id_71C1( var_0 )
{
    self waittill( "cheap_hind_fire" );
    thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 3, var_0, 0.3 );
}

_id_71C2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0.0, 0.0, 0.0 );

    self setturrettargetent( var_0 );
    var_4 = level._id_71C3[var_1];
    var_5 = level._id_71C4[var_1];
    self setvehweapon( var_4 );

    for ( var_6 = 0; var_6 < var_2; var_6++ )
    {
        var_7 = self fireweapon( var_5[var_6 % var_5.size], var_0, var_3 );
        maps\_audio::aud_send_msg( "apache_fire_missile", var_7 );

        if ( isdefined( var_7 ) )
            var_7 common_scripts\utility::delaycall( 1, ::missile_cleartarget );

        if ( var_1 == 1 )
        {
            wait 0.1;
            continue;
        }

        wait(randomfloatrange( 0.2, 0.3 ));
    }
}

_id_71C5( var_0 )
{
    common_scripts\utility::flag_wait( "little_bird_unload_at_next_node" );
    maps\_utility::_id_1425( "little_bird_unload_01" );
    level._id_4E8F notify( "stop_heli_ride_anim" );
    var_1 = common_scripts\utility::getstruct( "player_exit_little_bird", "script_noteworthy" );
    var_0 common_scripts\utility::waittill_any( "goal", "near_goal" );
    var_0 waittill( "unloading" );
    level.player maps\_utility::_id_13E2( var_1.origin, level.player.angles, 0.5, 0.1 );
    level.player unlink();
    common_scripts\utility::flag_set( "player_unloaded_from_intro_flight" );
}

_id_71C6( var_0 )
{
    while ( isdefined( self ) )
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( !isdefined( var_5 ) )
            continue;

        if ( !isdefined( var_2 ) )
            continue;

        if ( !isdefined( var_1 ) )
            continue;

        if ( isplayer( var_2 ) )
            continue;

        if ( var_5 == "MOD_PROJECTILE" && var_1 > 999 )
            break;

        if ( var_5 == "MOD_PROJECTILE_SPLASH" && var_1 == 4000 )
            break;
    }

    common_scripts\utility::flag_set( "intro_heli_hit" );
    maps\_utility::_id_2698();
    self setvehgoalpos( var_0.origin, 0 );
    maps\_audio::aud_send_msg( "deadbird_hit", self );
    earthquake( 0.3, 1.5, level.player.origin, 1600 );
    self vehicle_setspeed( 80 );
    thread _id_71C7();
    common_scripts\utility::array_thread( self._id_0A39, ::_id_71C8, self );
    playfxontag( common_scripts\utility::getfx( "crash_main_01" ), self, "tag_deathfx" );

    while ( distance( self.origin, var_0.origin ) > 100 )
    {
        playfxontag( common_scripts\utility::getfx( "chopper_smoke_trail" ), self, "tag_deathfx" );
        wait 0.1;
    }

    maps\_audio::aud_send_msg( "deadbird_crash", self );
    var_6 = spawn( "script_origin", self gettagorigin( "tag_deathfx" ) );
    playfx( common_scripts\utility::getfx( "crash_end_01" ), var_6.origin );
    earthquake( 0.3, 2, level.player.origin, 1600 );
    self delete();
    var_6 delete();

    foreach ( var_8 in self._id_0A39 )
    {
        if ( isdefined( var_8 ) && isalive( var_8 ) )
            var_8 kill();
    }

    level.player maps\_utility::delaythread( 2.3, ::_id_006D, "light_1s" );
}

_id_006D( var_0 )
{
    self playrumbleonentity( var_0 );
}

_id_71C7()
{
    self setmaxpitchroll( 100, 200 );
    self setturningability( 1 );
    var_0 = 1400;
    var_1 = 200;
    var_2 = undefined;

    while ( isdefined( self ) )
    {
        var_2 = self.angles[1] - 300;
        self setyawspeed( var_0, var_1 );
        self settargetyaw( var_2 );
        wait 0.1;
    }
}

_id_71C8( var_0 )
{
    if ( self._id_2252 == 0 || self._id_2252 == 1 )
        return;

    var_1 = "tag_detach_left";
    self._id_2571 = 1;
    var_2 = 0;
    var_3 = undefined;

    if ( self._id_2252 == 2 || self._id_2252 == 3 || self._id_2252 == 4 )
        var_1 = "tag_detach_right";

    if ( self._id_2252 == 2 || self._id_2252 == 5 )
        var_3 = "little_bird_death_guy1";
    else if ( self._id_2252 == 3 || self._id_2252 == 6 || self._id_2252 == 7 )
        var_3 = "little_bird_death_guy3";
    else if ( self._id_2252 == 4 )
    {
        var_2 = 1;
        var_3 = "little_bird_death_guy2";
    }

    self._id_1032 = "generic";
    self setcontents( 0 );
    self stopanimscripted();
    self._id_0EC3 = 1;
    maps\_utility::delaythread( randomfloatrange( 0.3, 1 ), common_scripts\utility::play_sound_in_space, "generic_death_falling" );
    var_4 = var_0 gettagorigin( var_1 );
    var_5 = var_0 gettagangles( var_1 );
    var_6 = undefined;

    if ( var_2 )
        var_0 maps\_anim::_id_11C1( self, var_3, var_1 );
    else
    {
        var_6 = spawn( "script_origin", var_4 );
        var_6.angles = var_5;
        var_6 thread _id_4A52( var_0, var_1 );
        var_6 thread _id_71C9( var_0 );
        self unlink();
        self linkto( var_6 );
        var_6 maps\_anim::_id_11C1( self, var_3 );

        if ( isdefined( self ) )
            self unlink();
    }

    if ( isdefined( self ) )
        self kill();
}

_id_71C9( var_0 )
{
    var_0 waittill( "death" );
    self delete();
}

_id_4A52( var_0, var_1 )
{
    var_0 endon( "death" );
    self endon( "death " );
    var_2 = undefined;

    for (;;)
    {
        wait 0.05;
        var_2 = var_0 gettagorigin( var_1 );
        self.origin = var_2;
    }
}

_id_71CA( var_0, var_1, var_2, var_3 )
{
    wait 0.2;
    magicbullet( var_0, var_1, var_2 );

    if ( isdefined( var_3 ) && isalive( var_3 ) )
    {
        var_3 notify( "killanimscript" );
        var_4 = getnode( "path_rpg_attacker_after_node", "targetname" );
        var_3 maps\_utility::_id_2053( var_4 );
    }

    wait 3;

    if ( isdefined( var_3 ) && isalive( var_3 ) )
        var_3 _id_441E();
}

_id_71CB()
{
    var_0 = getentarray( "aa_trigger_indoor_think", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_71CE );
}

_id_71CC()
{
    var_0 = getentarray( "aa_trigger_outdoor_think", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_71CD );
}

_id_71CD()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isai( var_0 ) )
            continue;

        var_0 thread maps\_utility::_id_211C( 0.15 );
        var_0 maps\_utility::_id_109E();
    }
}

_id_71CE()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isai( var_0 ) )
            continue;

        var_0 thread maps\_utility::_id_211C( 0.15 );
        var_0 maps\_utility::_id_109B();
    }
}

_id_71CF()
{
    level._id_4E8F thread _id_7338( "lone_star_near_building_throw", "lone_star_near_building_throw" );
    common_scripts\utility::flag_wait( "player_near_building_throw" );
    maps\_audio::aud_send_msg( "mus_enter_aa_building_stairwell" );
    var_0 = [];
    var_0[0] = level._id_4E8F;
    var_1 = getent( "building_throw_victim", "script_noteworthy" );
    var_2 = getent( "building_throw_clear_volume", "targetname" );
    thread _id_71D1( var_2, "building_throw_victim" );
    var_1 maps\_utility::add_spawn_function( ::_id_71D0 );
    common_scripts\utility::flag_wait( "lone_star_near_building_throw" );
    var_3 = common_scripts\utility::getstruct( "berlin_throw_from_building_delta_wait", "targetname" );
    var_0[0] maps\_utility::_id_123B();
    var_0[0] maps\_utility::_id_1237( var_3.origin );
    var_0[0] thread _id_71D3();
    common_scripts\utility::flag_wait( "building_throw_start" );
    level notify( "stop_clearing_enemies_in_volume" );
    var_0[1] = var_1 maps\_utility::_id_166F();

    if ( !isdefined( var_0[1] ) || !isalive( var_0[1] ) || maps\_utility::_id_0B20( var_0[1] ) )
    {
        level notify( "building_throw_cancelled" );
        var_0[0] maps\_utility::_id_2053( getnode( "essex_cover_after_throw", "targetname" ) );
        var_0[0] maps\_utility::_id_2688();
        return;
    }

    var_0[1] notify( "anim_point_of_no_return" );
    var_0[1] thread _id_71D4();
    _id_71D5( var_0 );
    maps\_audio::aud_send_msg( "mus_enter_aa_building_combat" );
}

_id_71D0()
{
    self endon( "death" );
    self endon( "anim_point_of_no_return" );
    level waittill( "building_throw_cancelled" );
    var_0 = common_scripts\utility::getstruct( "building_throw_clear_loc", "targetname" );
    maps\_utility::_id_2724( 8 );
    maps\_utility::_id_1237( var_0.origin );
}

_id_71D1( var_0, var_1 )
{
    level endon( "stop_clearing_enemies_in_volume" );
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = 0;

    if ( isdefined( var_1 ) )
        var_3 = 1;

    var_4 = undefined;

    for (;;)
    {
        var_5 = getaiarray( "axis" );

        foreach ( var_7 in var_5 )
        {
            if ( var_3 && isdefined( var_7.script_noteworthy ) && var_7.script_noteworthy == var_1 )
                break;
            else if ( var_7 istouching( var_0 ) )
                var_7 thread _id_71D2( var_2 );
        }

        wait 0.2;
    }
}

_id_71D2( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_2724( 6 );
    maps\_utility::_id_1237( var_0.origin );

    if ( isdefined( var_0.radius ) )
    {
        self waittill( "goal" );

        if ( isdefined( self ) )
            maps\_utility::_id_2724( var_0.radius );
    }
}

_id_71D3()
{
    self endon( "death" );
    self.goalradius = 10;
    self.allowpain = 0;
    self._id_0EEE = 1;
    self.ignoreall = 1;
    self.ignoreme = 1;
    level common_scripts\utility::waittill_either( "building_throw_complete", "building_throw_cancelled" );
    self.allowpain = 1;
    self._id_0EEE = 0;
    self.ignoreall = 0;
    self.ignoreme = 0;
}

_id_71D4()
{
    self endon( "death" );
    self._id_1032 = "defender";
    self.allowpain = 0;
    self._id_0EEE = 1;
    self.ignoreme = 1;
}

_id_71D5( var_0 )
{
    level._id_71D6 = 0;
    var_1 = common_scripts\utility::getstruct( "berlin_throw_from_building", "targetname" );
    var_1 maps\_anim::_id_1203( var_0, "berlin_throw_from_building" );

    if ( isalive( var_0[1] ) )
    {
        var_1 maps\_anim::_id_11DE( var_0, "berlin_throw_from_building" );

        if ( isalive( var_0[1] ) )
            var_0[1] kill();
    }

    level notify( "building_throw_complete" );
    var_0[0] maps\_utility::_id_2724( 32 );
    var_0[0] maps\_utility::_id_2053( getnode( "essex_cover_after_throw", "targetname" ) );
    var_0[0] maps\_utility::_id_2688();
}

_id_71D7()
{
    var_0 = getent( "aa_frag_throw_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = common_scripts\utility::getstructarray( var_0.script_noteworthy, "script_noteworthy" );
    var_2 = [ level._id_71A0, level._id_45C4 ];
    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        var_6 = var_5;
        var_7 = var_1[var_3];
        var_8 = var_7.origin - var_6.origin;
        var_9 = ( 0.1 * var_8[0], 0.1 * var_8[1], 96 );
        var_10 = var_6.origin + var_9;
        var_11 = ( 1.1, 1.1, 3.3 );
        var_8 *= var_11;
        var_5.grenadeweapon = "fraggrenade";
        var_5 magicgrenademanual( var_10, var_8, 2.3 );
        wait 0.6;
        var_3++;
    }
}

_id_71D8()
{
    common_scripts\utility::flag_wait( "mainstreet_battle_start" );
    thread _id_7346( "mainstreet_west_tracer", "mainstreet_east_tracer", "mainstreet_battle_stop" );
    thread _id_7346( "mainstreet_west_tracer", "mainstreet_east_tracer", "mainstreet_battle_stop" );
    thread _id_7346( "alley_west_tracer", "alley_east_tracer", "mainstreet_battle_stop" );
    thread _id_7346( "alley_west_tracer", "alley_east_tracer", "mainstreet_battle_stop" );
    common_scripts\utility::flag_wait( "mainstreet_battle_stop" );
    level notify( "stop_battlefield_effects" );
    level notify( "stop_drone_spawner" );
}

_id_71D9( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    var_2 = 0;

    while ( !var_2 )
    {
        wait(var_1);
        var_2 = 1;

        foreach ( var_4 in var_0 )
        {
            if ( isdefined( var_4 ) )
                var_2 = 0;

            break;
        }
    }
}

_id_71DA( var_0 )
{
    foreach ( var_3, var_2 in level._id_71DB )
    {
        if ( var_2 == var_0 )
        {
            level._id_71DB = maps\_utility::array_remove_index( level._id_71DB, var_3 );
            break;
        }
    }
}

_id_71DC()
{
    level._id_71DD++;
    var_0 = 0;

    foreach ( var_2 in level._id_71DB )
    {
        if ( var_2 > var_0 )
            var_0 = var_2;
    }

    return var_0;
}

_id_71DE( var_0 )
{
    thread _id_71E0();

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !isdefined( level._id_71DF ) )
        level._id_71DF = 0;

    if ( !isdefined( level._id_71DD ) )
        level._id_71DD = 0;

    if ( !isdefined( level._id_71DB ) )
        level._id_71DB = [];

    level._id_71DB[level._id_71DB.size] = var_0;

    while ( level._id_71DF || _id_71DC() != var_0 )
        level waittill( "berlin_reload_airspace_open" );

    _id_71DA( var_0 );
    level._id_71DF = var_0;
}

_id_71E0()
{
    level notify( "airspace_fail_controller" );
    level endon( "airspace_fail_controller" );

    for (;;)
    {
        level waittill( "berlin_reload_airspace_open" );

        while ( level._id_71DD < level._id_71DB.size )
            wait 0.05;

        if ( !level._id_71DF && level._id_71DB.size )
        {
            _id_71DA( _id_71DC() );
            common_scripts\utility::delaycall( 0.1, ::_id_71E1 );
        }
    }
}

_id_71E1()
{
    level._id_71DD = 0;
    level._id_71DF = 0;
    level notify( "berlin_reload_airspace_open" );
}

_id_71E2()
{
    self endon( "death" );
    var_0 = getent( "mainstreet_heli1_fire_target", "targetname" );
    _id_71C1( var_0 );
}

_id_71E3()
{
    thread _id_71E5( "trigger_aa_building_north" );
    var_0 = getent( "trigger_aa_building_east", "targetname" );
    var_0 thread _id_71E6();
    var_0 = getent( "trigger_aa_building_west", "targetname" );
    var_0 thread _id_71E8();
    var_0 = getent( "trigger_aa_building_south", "targetname" );
    var_1 = var_0 _id_71E7();
    common_scripts\utility::flag_wait( "player_on_roof" );
    thread _id_7350( "roof_guy", "roof_scene", "snipe_player_in_position" );
}

_id_71E4( var_0 )
{
    maps\_vehicle::_id_2A12();

    while ( isdefined( self ) )
    {
        level waittill( var_0 );
        glassradiusdamage( self.currentnode.origin, 256, 1000, 100 );
        physicsjitter( self.currentnode.origin, 1024, 0.0, 0.5, 4.0 );
        common_scripts\utility::flag_clear( var_0 );
        wait 0.05;
    }
}

_id_71E5( var_0 )
{
    level endon( "player_on_roof" );
    level waittill( var_0 );
    var_1 = getent( "flyby_a10", "targetname" );
    var_2 = var_1 thread maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "spawn_aabuilding_a10_flyby", var_2 );
}

_id_71E6()
{
    level endon( "player_on_roof" );
    self waittill( "trigger" );
}

_id_71E7()
{
    level endon( "player_on_roof" );
    self waittill( "trigger" );
    var_0 = getent( "hind_flyby_spawner", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1 setmaxpitchroll( 10, 60 );
    maps\_audio::aud_send_msg( "hind_flyby_stairwell", var_1 );
    return var_1;
}

_id_71E8()
{
    level endon( "player_on_roof" );
    self waittill( "trigger" );
}

_id_71E9()
{
    level._id_71EA = 0;
    level._id_71EB = 0;
    level._id_71EC = 7;
    level._id_71ED = 6;
    level._id_71EE = level._id_71EC + level._id_71ED;
    level._id_71EF = 0;
    level._id_71F0 = 0;
    level._id_71F1 = 0;
    level._id_71F2 = 2;
    level._id_71F3 = 0;
    level._id_71F4 = 0;
    level._id_71F5 = 15;
    level._id_71F6 = 1;
    _id_7206();
    thread _id_720A();
    thread _id_7220( "sniper_complete" );
    common_scripts\utility::flag_wait_either( "aa_building_level4_dead", "snipe_player_in_position" );
    maps\_audio::aud_send_msg( "mus_aa_building_roof_guys_dead" );
    thread _id_7222();
    thread _id_7223();
    common_scripts\utility::flag_wait( "snipe_player_in_position" );
    maps\_utility::_id_1425( "sniper_01" );
    thread _id_71F8();
    thread _id_7213();
    common_scripts\utility::array_thread( level.heroes, ::_id_486F, 1.5, "sniper_complete" );
    common_scripts\utility::flag_wait( "bravo_team_spawned" );
    thread _id_720E();
    thread _id_7226();
    common_scripts\utility::flag_wait( "sniper_delta_support_squad_unloaded" );
    maps\_utility::_id_1425( "sniper_02" );
    common_scripts\utility::flag_wait( "snipe_hotel_roof_complete" );
    maps\_utility::_id_1425( "sniper_03" );
    level._id_71F6 = 0;
    level._id_71F7 = common_scripts\utility::getstruct( "sniper_enemies_retreat", "targetname" );
    thread _id_7231();
    thread _id_7218();
    thread _id_721C();
    thread _id_7210();
    thread _id_722D();
    level waittill( "last_sniper_tank_dead" );
    maps\_utility::_id_1425( "sniper_04" );
    _id_720F();
}

_id_71F8()
{
    var_0 = getnodearray( "sniper_rooftop_nodes", "targetname" );

    foreach ( var_2 in level._id_71F9 )
    {
        var_0 = maps\_utility::_id_0B53( var_0 );
        var_3 = var_0[0];

        if ( isdefined( var_2 ) && isalive( var_2 ) && isdefined( var_3 ) )
        {
            var_2 thread _id_71FA( var_3 );
            var_0 = common_scripts\utility::array_remove( var_0, var_3 );
            wait(randomfloatrange( 1, 2 ));
        }
    }
}

_id_71FA( var_0 )
{
    self endon( "death" );
    var_1 = self.goalradius;
    maps\_utility::_id_2724( 32 );
    maps\_utility::_id_2053( var_0 );
    self waittill( "goal" );
    wait 3;
    maps\_utility::_id_2724( var_1 );
}

_id_71FB()
{
    common_scripts\utility::flag_wait( "snipe_player_in_position" );
    level._id_71FD = level.objective_count;
    objective_add( level._id_71FD, "current", &"BERLIN_SNIPE_B" );
    level.objective_count++;

    if ( !common_scripts\utility::flag( "sniper_hotel_roof_clear" ) )
    {
        objective_setpointertextoverride( level._id_71FD, &"BERLIN_TARGETS" );
        level._id_71F9 thread _id_7204( level._id_71FD, "sniper_hotel_roof_clear" );
    }

    common_scripts\utility::flag_wait( "bravo_team_spawned" );
    common_scripts\utility::flag_wait_either( "sniper_hotel_roof_clear", "sniper_delta_support_squad_unloaded" );
    wait 0.05;
    objective_onentity( level._id_71FD, level._id_71FE[3] );
    objective_setpointertextoverride( level._id_71FD, &"BERLIN_PROTECT" );
    common_scripts\utility::flag_wait( "spawn_hotel_rooftop_enemies_complete" );
    objective_setpointertextoverride( level._id_71FD, &"BERLIN_TARGETS" );
    level._id_71FF thread _id_7204( level._id_71FD, "snipe_hotel_roof_complete" );
    common_scripts\utility::flag_wait( "snipe_hotel_roof_complete" );
    wait 0.05;
    objective_onentity( level._id_71FD, level._id_71FE[3] );
    objective_setpointertextoverride( level._id_71FD, &"BERLIN_PROTECT" );
    common_scripts\utility::flag_wait( "tanks_scripted_fire" );
    wait 4;
    objective_position( level._id_71FD, ( 0.0, 0.0, 0.0 ) );
    level._id_7200 = level.objective_count;
    objective_add( level._id_7200, "current", &"BERLIN_AIR_SUPPORT" );
    level.objective_count++;
    objective_setpointertextoverride( level._id_7200, &"BERLIN_DESTROY" );

    if ( isalive( level._id_7201 ) )
        level._id_7201 thread _id_7235( level._id_7200, 1 );

    common_scripts\utility::flag_wait( "spawn_sniper_tanks_complete" );

    if ( isalive( level._id_7202 ) )
        level._id_7202 thread _id_7235( level._id_7200, 3 );

    if ( isalive( level._id_7203 ) )
        level._id_7203 thread _id_7235( level._id_7200, 2 );

    common_scripts\utility::flag_wait( "parkway_tank_dead" );
    maps\_utility::_id_2727( level._id_7200 );
    wait 0.05;
    objective_onentity( level._id_71FD, level._id_71FE[0] );
    objective_setpointertextoverride( level._id_71FD, &"BERLIN_GRANITE" );
    common_scripts\utility::flag_wait( "granite_team_dead" );
    objective_position( level._id_71FD, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "sniper_complete" );
    maps\_utility::_id_2727( level._id_71FD );
}

_id_7204( var_0, var_1 )
{
    level endon( var_1 );
    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2 thread _id_7205( var_0, var_1 );
    objective_onentity( var_0, var_2 );
    objective_state_nomessage( var_0, "current" );
    var_3 = 0;

    while ( isdefined( self ) && self.size > 0 )
    {
        var_4 = maps\_utility::_id_1361( self );

        if ( var_3 != var_4.size )
        {
            var_3 = self.size;
            var_5 = ( 0.0, 0.0, 0.0 );
            var_6 = 0;
            var_7 = 0;

            foreach ( var_9 in self )
            {
                if ( isdefined( var_9 ) && isalive( var_9 ) )
                {
                    var_5 += var_9.origin;
                    var_6++;
                }
            }

            var_5 /= var_6;
            var_5 += ( 0.0, 0.0, 128.0 );

            if ( 128 < distance2d( var_2.origin, var_5 ) )
                var_2.origin = var_5;
        }

        wait 0.25;
    }

    var_2 notify( "no_cleanup" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    var_2 delete();
    wait 0.05;
}

_id_7205( var_0, var_1 )
{
    self endon( "no_cleanup" );
    common_scripts\utility::flag_wait( var_1 );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    wait 0.05;
    self delete();
}

_id_7206()
{
    var_0 = getentarray( "hotel_snipe_roof_enemies_patrol", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_723A );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7245, level._id_71EE );
    level._id_71F9 = maps\_utility::_id_272B( var_0, 1 );
    level._id_7207 = maps\_utility::_id_272C( "sniper_support_friendlies" );
    common_scripts\utility::array_thread( level._id_7207, ::_id_7208 );
    thread _id_7209();
    var_1 = getentarray( "sniper_dummy_targets", "targetname" );
    common_scripts\utility::array_thread( level._id_71F9, ::_id_7212, var_1, "snipe_player_in_position" );
}

_id_7208()
{
    maps\_utility::_id_0D04();
    common_scripts\utility::flag_wait( "start_parkway_tank" );
    maps\_utility::_id_1902();
}

_id_7209()
{
    _id_733F( "rooftop_axis" );
    level._id_71F9 _id_7340( "rooftop_axis" );
    _id_733F( "street_level_friendlies" );
    level._id_7207 _id_7340( "street_level_friendlies" );
    _id_733F( "friendlies" );
    level.heroes _id_7340( "friendlies" );
    _id_733F( "player" );
    level.player setthreatbiasgroup( "player" );
    maps\_utility::_id_26BA( "friendlies", "rooftop_axis" );
    setignoremegroup( "player", "rooftop_axis" );
    setthreatbias( "rooftop_axis", "street_level_friendlies", 100 );
    common_scripts\utility::flag_wait( "snipe_player_in_position" );
    common_scripts\utility::flag_wait( "allies_in_sniping_position" );
    setthreatbias( "friendlies", "rooftop_axis", 100 );
    setthreatbias( "rooftop_axis", "friendlies", 90 );
}

_id_720A()
{
    common_scripts\utility::flag_wait( "player_halfway_through_rooftop" );
    _id_71DE( 9 );
    level._id_720B = maps\_vehicle::_id_2A9A( "sniper_friendly_ambient_helis" );
    maps\_audio::aud_send_msg( "ambient_ally_helis", level._id_720B );
    level._id_720B thread _id_720C();
    _id_71D9( level._id_720B );
    _id_71E1();
    level notify( "rooftop_ally_helis_dead" );
}

_id_720C()
{
    var_0 = common_scripts\utility::getstruct( "ambient_ally_heli_preferred_crash_loc", "targetname" );
    var_1 = _id_7337( "victim", level._id_720B );

    foreach ( var_3 in self )
    {
        if ( var_3 != var_1[0] )
        {
            var_3 setcandamage( 0 );
            continue;
        }

        var_3._id_4699 = var_0;
        _id_720D( var_1 );
    }
}

_id_720D( var_0 )
{
    level endon( "rooftop_ally_helis_dead" );
    common_scripts\utility::flag_wait( "sniper_victim_heli_shoot" );
    var_1 = _id_7337( "rpg_guys", level._id_71F9 );
    wait 0.05;
    common_scripts\utility::array_thread( var_1, ::_id_7335, var_0[0] );
}

_id_720E()
{
    common_scripts\utility::flag_wait( "sniper_delta_support_squad_unloaded" );
    wait 2;
    var_0 = getentarray( "hotel_snipe_roof_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_723A );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7245, level._id_71EE );
    level._id_71FF = maps\_utility::_id_272B( var_0 );
    common_scripts\utility::flag_set( "spawn_hotel_rooftop_enemies_complete" );
}

_id_720F()
{
    common_scripts\utility::flag_wait( "sniper_delta_support_guys_dead" );
    common_scripts\utility::flag_wait( "sniper_vo_complete" );
    common_scripts\utility::flag_set( "sniper_complete" );
    level notify( "stop_monitoring_reload" );
    level notify( "stop_processing_aim_vo_feedback" );
    common_scripts\utility::flag_wait( "player_rappels" );
    common_scripts\utility::array_thread( getentarray( "bravo_team_ground_enemies1", "script_noteworthy" ), maps\_utility::_id_2705 );
    common_scripts\utility::array_thread( getentarray( "bravo_team_ground_enemies1_2", "script_noteworthy" ), maps\_utility::_id_2705 );
    common_scripts\utility::array_thread( getentarray( "bravo_team_ground_enemies2", "script_noteworthy" ), maps\_utility::_id_2705 );
    common_scripts\utility::array_thread( getentarray( "bravo_team_ground_enemies3", "script_noteworthy" ), maps\_utility::_id_2705 );
    common_scripts\utility::array_thread( getentarray( "bravo_team_ground_enemies4", "script_noteworthy" ), maps\_utility::_id_2705 );
    common_scripts\utility::array_thread( getentarray( "bravo_team_ground_enemies5", "script_noteworthy" ), maps\_utility::_id_2705 );
    level._id_7207 = maps\_utility::_id_1361( level._id_7207 );
    common_scripts\utility::array_thread( level._id_7207, maps\_utility::_id_2705 );
    _id_734E();
}

_id_7210()
{
    common_scripts\utility::flag_wait( "bravo_team_reached_lower_rooftop" );
    wait 2;
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_2612, 1 );
    common_scripts\utility::flag_wait( "sniper_complete" );
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_2612, 0 );
}

_id_7211( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "parkway_tank_dead" );
    wait 10;
    self._id_4B64 = 1;
    _id_460E();
    thread maps\_utility::_id_1237( var_0.origin );
    wait 5;
    var_1 = [];
    var_1[0] = self;
    thread maps\_utility::_id_2756( var_1, 1024 );
}

_id_7212( var_0, var_1 )
{
    self endon( "death" );
    self endon( "sniper_complete" );

    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_wait( var_1 );

    wait(randomfloatrange( 1, 3 ));

    for (;;)
    {
        var_0 = maps\_utility::_id_0B53( var_0 );
        self setentitytarget( var_0[0] );
        wait(randomfloatrange( 1, 3 ));
    }
}

_id_7213()
{
    common_scripts\utility::flag_wait( "sniper_hotel_roof_spawn_helis" );
    _id_71DE( 10 );
    common_scripts\utility::flag_wait_or_timeout( "sniper_hotel_roof_clear", 17 );
    var_0 = maps\_vehicle::_id_2A9A( "sniper_delta_support_helis" );
    maps\_audio::aud_send_msg( "sniper_support_helis", var_0 );
    level._id_7214 = undefined;
    level._id_7215 = [];
    level._id_7216 = [];

    foreach ( var_2 in var_0 )
    {
        var_2 setcandamage( 0 );

        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "sniper_delta_support_main_heli" )
        {
            level._id_7214 = var_2;
            level._id_7214 maps\_utility::_id_0D04();
        }

        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "attacker" )
        {
            level._id_7215[level._id_7215.size] = var_2;
            var_2 setmaxpitchroll( 10, 60 );
        }

        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "protector" )
        {
            level._id_7216 = var_2;
            var_2 setmaxpitchroll( 20, 60 );
        }
    }

    level._id_71FE = [];

    foreach ( var_5 in level._id_7214._id_0A39 )
    {
        if ( isdefined( var_5.script_noteworthy ) && var_5.script_noteworthy != "sniper_delta_support_pilots" )
            level._id_71FE[level._id_71FE.size] = var_5;
    }

    wait 0.05;
    common_scripts\utility::array_thread( level._id_71FE, maps\_utility::_id_0D04 );
    common_scripts\utility::flag_set( "bravo_team_spawned" );
    var_7 = getentarray( "granite_attack_heli_fire_locs", "targetname" );
    common_scripts\utility::flag_wait( "delta_support_squad_heli_check_failure" );

    foreach ( var_2 in level._id_7215 )
        var_2 thread _id_7217( level._id_71F9, var_7 );

    level._id_7216 thread _id_7217( level._id_71F9, var_7, 1, "start_heli_fire" );
    level._id_7214 waittill( "unloaded" );
    common_scripts\utility::flag_set( "sniper_delta_support_squad_unloaded" );
    level._id_7214 maps\_utility::_id_1902();
    _id_71D9( var_0 );
    _id_71E1();
    level notify( "delta_support_helis_complete" );
}

_id_7217( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "stop_heli_fire" );
    level endon( "stop_heli_fire" );

    if ( isdefined( var_4 ) )
    {
        if ( !isarray( var_4 ) )
            var_4 = [ var_4 ];

        foreach ( var_6 in var_4 )
            level endon( var_6 );
    }

    if ( isdefined( var_3 ) )
        self waittill( var_3 );

    if ( !isdefined( var_2 ) )
        var_2 = 3;

    var_0 = maps\_utility::_id_1361( var_0 );

    if ( var_0.size > 0 )
    {
        var_0 = maps\_utility::_id_0B53( var_0 );

        foreach ( var_9 in var_0 )
        {
            if ( isdefined( var_9 ) && isalive( var_9 ) )
            {
                _id_71C2( var_9, var_2, 1 );

                if ( isalive( var_9 ) )
                    var_9 kill();
            }

            wait(randomfloatrange( 0.1, 0.2 ));
        }
    }

    if ( isdefined( var_1 ) )
    {
        var_1 = maps\_utility::_id_0B53( var_1 );

        foreach ( var_12 in var_1 )
            _id_71C2( var_12, var_2, randomint( 2 ) + 1 );

        wait(randomfloatrange( 0.1, 0.2 ));
    }
}

_id_7218()
{
    wait 2;
    var_0 = getentarray( "sniper_tanks", "script_noteworthy" );
    var_1 = getentarray( "sniper_tank_fire_loc", "script_noteworthy" );
    var_2 = getentarray( "sniper_tank_fire_loc_alt", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_721B );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7341, var_2, 5, 7, "tanks_scripted_fire" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7341, var_1, 5, 7, "tanks_random_fire" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6CEC );
    level._id_7219 = 0;
    level._id_7201 = maps\_vehicle::_id_2881( "bravo_team_tank_first" );
    level._id_7201 thread _id_721D( "sniper_tank_1_reached_path_end", 33 );
    maps\_audio::aud_send_msg( "sniper_tank_01", level._id_7201 );
    wait 4;
    common_scripts\utility::flag_wait( "start_parkway_tank" );
    wait 2;
    level._id_7219 = 0;
    level._id_7203 = maps\_vehicle::_id_2881( "bravo_team_tank_second" );
    level._id_7203 thread _id_721D( "sniper_tank_2_reached_path_end", 12, "sniper_tank_2_mission_failing" );
    level._id_7203 thread _id_721A( 9 );
    maps\_audio::aud_send_msg( "sniper_tank_02", level._id_7203 );
    wait 5;
    level._id_7202 = maps\_vehicle::_id_2881( "bravo_team_tank_final" );
    level._id_7202 thread _id_721D( "park_way_tank_arrived", 15 );
    level._id_7202 thread _id_721A( 9 );
    maps\_audio::aud_send_msg( "sniper_tank_03", level._id_7202 );
    common_scripts\utility::flag_set( "spawn_sniper_tanks_complete" );
    wait 2;
    maps\berlin_a10::_id_4E2C();
}

_id_721A( var_0 )
{
    level endon( "parkway_tank_dead" );
    self waittill( "death" );

    if ( !isdefined( level._id_7219 ) )
        level._id_7219 = 0;

    level._id_7219 += var_0;
}

_id_6CEC()
{
    _id_6CED();
    self notify( "newpath" );
}

_id_6CED()
{
    self endon( "death" );
    self endon( "driver dead" );
    level waittill( "eternity" );
}

_id_721B()
{
    self endon( "death" );
    thread _id_7240();
    maps\berlin_a10::a10_add_target();
    thread maps\berlin_a10::a10_remove_target_ondeath();
    thread _id_7236();
    thread _id_733E( "player_rappels" );
}

_id_721C()
{
    for (;;)
    {
        if ( level._id_71F0 >= 1 )
        {
            common_scripts\utility::flag_set( "sniper_tanks_one_dead" );
            common_scripts\utility::flag_set( "start_parkway_tank" );
            break;
        }

        wait 0.1;
    }

    for (;;)
    {
        if ( level._id_71F0 >= 2 )
        {
            common_scripts\utility::flag_set( "sniper_tanks_two_dead" );
            break;
        }

        wait 0.1;
    }

    for (;;)
    {
        if ( level._id_71F0 >= 3 )
        {
            common_scripts\utility::flag_set( "parkway_tank_dead" );
            level notify( "last_sniper_tank_dead" );
            break;
        }

        wait 0.1;
    }
}

_id_721D( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( isdefined( level._id_7219 ) )
        wait(level._id_7219);

    if ( !isdefined( level._id_721E ) )
        level._id_721E = 0;

    if ( level._id_721E )
        return;

    if ( !self._id_721F )
    {
        self notify( "stop_random_tank_fire" );

        if ( isdefined( var_2 ) )
            common_scripts\utility::flag_set( var_2 );

        self notify( "stop_firing" );
        self setturrettargetent( level.heroes[1] );
        wait 3.7;

        if ( !self._id_721F && !level._id_721E )
        {
            level._id_721E = 1;
            self fireweapon();
            playfx( level._effect["artillery"], level.heroes[1].origin );
            level.heroes[1] maps\_utility::_id_1902();
            level.heroes[1] kill();
            objective_state( level._id_7200, "failed" );
            setdvar( "ui_deadquote", &"BERLIN_SNIPER_TANK_FAIL_QUOTE" );
            maps\_utility::_id_1826();
        }
    }
}

_id_7220( var_0 )
{
    thread maps\berlin_util::_id_4E93( var_0 );
    var_1 = 0;
    level._id_7221 = gettime();

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        common_scripts\utility::waittill_any( "start_reload", var_0 );

        if ( common_scripts\utility::flag( var_0 ) )
            break;

        if ( level._id_7221 < gettime() )
        {
            level._id_7221 = gettime() + 10000;
            var_1++;

            switch ( var_1 )
            {
                case 1:
                    _id_71DE();
                    var_2 = maps\_vehicle::_id_2A9A( "aa_building_flyover_1" );
                    maps\_audio::aud_send_msg( "warthog_A10_flyby_01", var_2 );
                    wait 2;
                    var_3 = maps\_vehicle::_id_2A9A( "aa_building_flyover_2" );
                    maps\_audio::aud_send_msg( "warthog_A10_flyby_02", var_3 );
                    _id_71D9( var_2 );
                    _id_71D9( var_3 );
                    _id_71E1();
                    continue;
                case 2:
                    if ( !isdefined( level._id_71F6 ) || level._id_71F6 == 1 )
                    {
                        _id_71DE();
                        var_4 = maps\_vehicle::_id_2A9A( "mainstreet_hind" );
                        common_scripts\utility::array_thread( var_4, ::_id_71E2 );
                        maps\_audio::aud_send_msg( "missile_hinds", var_4 );
                        _id_71D9( var_4 );
                        _id_71E1();
                    }

                    continue;
                case 3:
                    _id_71DE();
                    var_5 = maps\_vehicle::_id_2A9A( "mainstreet_hind2" );
                    maps\_audio::aud_send_msg( "mainstreet_hind2", var_5 );
                    _id_71D9( var_5 );
                    _id_71E1();
                    continue;
                case 4:
                    _id_71DE();
                    var_6 = maps\_vehicle::_id_2A9A( "mainstreet_hind3" );
                    maps\_audio::aud_send_msg( "mainstreet_hind3", var_6 );
                    _id_71D9( var_6 );
                    _id_71E1();
                    continue;
                case 5:
                    _id_71DE();
                    var_7 = maps\_vehicle::_id_2A9A( "mainstreet_hind_random" );
                    _id_71D9( var_7 );
                    _id_71E1();
                    continue;
                case 6:
                    _id_71DE();
                    var_8 = maps\_vehicle::_id_2A9A( "hind_attack_apache3_killer" );
                    maps\_audio::aud_send_msg( "hind_attack_apache3_killer", var_8 );
                    _id_71D9( var_8 );
                    _id_71E1();
                    continue;
            }
        }
    }
}

_id_7222()
{
    level._id_45C4 thread _id_7237();
    level._id_4E8F thread _id_7238();
    level._id_71A0 thread _id_7239();
}

_id_7223()
{
    _id_0240();
    var_0 = getent( "aa_building_sniper_rifle", "targetname" );

    if ( !common_scripts\utility::flag( "stop_sniper_glow" ) )
        var_0 _id_7224( "stop_sniper_glow" );
}

_id_0240()
{
    var_0 = level.player getweaponslistprimaries();
    var_1 = level.player getcurrentprimaryweapon();

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level._id_1C73 )
        {
            var_4 = level.player getammocount( var_3 );

            if ( var_3 == var_1 && var_4 > 0 )
            {
                common_scripts\utility::flag_set( "stop_sniper_glow" );
                return;
            }
        }
    }

    thread _id_0241();
}

_id_0241()
{
    level endon( "sniper_complete" );

    for (;;)
    {
        var_0 = level.player getweaponslistprimaries();
        var_1 = level.player getcurrentprimaryweapon();

        foreach ( var_3 in var_0 )
        {
            if ( var_3 == level._id_1C73 )
            {
                var_4 = level.player getammocount( var_3 );

                if ( var_3 == var_1 && var_4 > 0 )
                {
                    common_scripts\utility::flag_set( "stop_sniper_glow" );
                    return;
                }
            }
        }

        wait 0.1;
    }
}

_id_7224( var_0, var_1 )
{
    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2 setcontents( 0 );
    var_3 = self.model + "_obj";
    var_2 setmodel( var_3 );
    var_4 = self.classname;

    if ( common_scripts\utility::string_starts_with( var_4, "weapon_" ) )
        var_4 = getsubstr( var_4, 7 );

    var_2 maps\_shg_common::_id_16B4( var_4, var_3 );

    if ( !isdefined( var_1 ) || !var_1 )
        self hide();

    var_2.origin = self.origin;
    var_2.angles = self.angles;
    maps\_utility::_id_09C9( maps\_utility::_id_2770 );

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::flag_assert( var_0 );
        maps\_utility::_id_09C9( common_scripts\utility::flag_wait, var_0 );
    }

    maps\_utility::_id_09CB();

    if ( isdefined( self ) )
        self show();

    if ( isdefined( var_2 ) )
        var_2 delete();
}

_id_7225( var_0, var_1, var_2, var_3 )
{
    level endon( var_3 );
    level._id_71F1 = var_1 * level._id_71F2;

    while ( level._id_71F1 )
    {
        var_1 = level._id_71F1 * level._id_71F2;
        level._id_71F1 = 0;
        wait(var_1);
    }

    if ( level._id_71EB < var_0 )
    {
        foreach ( var_5 in level._id_71FE )
        {
            var_5 maps\_utility::_id_1902();
            wait 0.05;
            var_5 kill();
        }

        if ( isdefined( level._id_71FD ) )
            objective_state( level._id_71FD, "failed" );

        setdvar( "ui_deadquote", var_2 );
        maps\_utility::_id_1826();
    }
}

_id_7226()
{
    common_scripts\utility::flag_wait( "sniper_delta_support_squad_unloaded" );
    maps\_utility::_id_26BF( "sniper_delta_support_squad_path_roof_1" );
    common_scripts\utility::flag_wait( "delta_support_squad_roof_advance_2" );
    maps\_utility::_id_26BF( "sniper_delta_support_squad_path_roof_2" );
    common_scripts\utility::flag_wait( "snipe_hotel_roof_complete" );
    maps\_utility::_id_26BF( "sniper_delta_support_squad_path_roof_3" );
    common_scripts\utility::flag_wait( "tanks_scripted_fire" );
    maps\_utility::_id_26BF( "sniper_delta_support_squad_path_roof_4" );
    common_scripts\utility::flag_wait( "parkway_tank_dead" );
    level._id_7227 = 0;
    level._id_71FE[0] thread _id_723B( 0, "bravo_rappel_drop" );
    level._id_71FE[1] thread _id_723B( 1, "bravo_rappel_drop02" );
    level._id_71FE[2] thread _id_723B( 2, "bravo_rappel_drop03" );
    level._id_71FE[3] thread _id_723B( 3, "bravo_rappel_drop04" );
    common_scripts\utility::flag_wait( "bravo_team_reached_lower_rooftop" );
    wait 2;
    common_scripts\utility::flag_wait_or_timeout( "player_looking_at_granite", 25 );
    common_scripts\utility::flag_set( "player_looking_at_granite" );
    _id_722A( level._id_71FE, "hotel_lower_door_animent" );
    var_0 = common_scripts\utility::getstruct( "snipe_hotel_interior_loc", "targetname" );
    common_scripts\utility::array_thread( level._id_71FE, maps\_utility::_id_2724, 8 );
    common_scripts\utility::array_thread( level._id_71FE, ::_id_7228, var_0.origin );
    common_scripts\utility::flag_set( "delta_support_in_hotel" );
    wait 4;
    var_1 = common_scripts\utility::getfx( "m16_muzzleflash" );
    var_2 = common_scripts\utility::getstruct( "snipe_hotel_interior_fire_start", "targetname" );
    var_3 = common_scripts\utility::getstruct( "snipe_hotel_interior_fire_end", "targetname" );
    common_scripts\utility::array_thread( level._id_71FE, maps\_utility::_id_1902 );
    var_4 = 1.25;
    var_5 = 0;

    while ( var_5 < var_4 )
    {
        level.player playfx( var_1, var_2.origin );
        magicbullet( "ak47", var_2.origin, var_3.origin + _id_722C( 32 ) );
        var_6 = 0.05;

        if ( common_scripts\utility::cointoss() )
            var_6 = 0.15;

        var_5 += var_6;
        wait(var_6);
    }

    common_scripts\utility::flag_wait( "sniper_delta_support_guys_dead" );
    common_scripts\utility::exploder( 2222 );
    maps\_audio::aud_send_msg( "granite_dead_room_explode", 2222 );
    physicsexplosionsphere( var_3.origin, 200, 200, 3 );
    common_scripts\utility::array_call( maps\_utility::_id_1361( level._id_71FE ), ::kill );
    common_scripts\utility::flag_set( "granite_team_dead" );
    common_scripts\utility::flag_wait( "sniper_complete" );
    maps\_utility::_id_2756( level._id_71FE, 1024 );
}

_id_7228( var_0 )
{
    wait(self._id_7229);
    maps\_utility::_id_1237( var_0 );
}

_id_722A( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( var_4._id_722B == "essex" || var_4._id_722B == "lone_star" )
        {
            var_2[var_2.size] = var_4;
            var_4._id_1032 = var_4._id_722B;
            var_4._id_7229 = 0.05;
            continue;
        }

        var_4 thread _id_6E35( var_4._id_722B );
        var_4._id_7229 = randomfloatrange( 0.5, 2 );
    }

    var_6 = common_scripts\utility::getstruct( var_1, "targetname" );
    var_6 maps\_anim::_id_1203( var_2, "breach_kick" );
    common_scripts\utility::flag_set( "delta_support_breach_kick" );
    var_6 thread maps\_anim::_id_11DD( var_2, "breach_kick" );
    thread maps\berlin_fx::_id_4EB9();
    wait 0.4;
    var_7 = getent( "hotel_lower_roof_door", "targetname" );
    var_7 _id_7319();
}

_id_722C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    if ( !isdefined( var_2 ) )
        var_2 = var_1;

    var_3 = [ var_0, var_1, var_2 ];
    return ( randomint( var_3[0] * 2 ) - var_3[0], randomint( var_3[1] * 2 ) - var_3[1], randomint( var_3[2] * 2 ) - var_3[2] );
}

_id_722D()
{
    common_scripts\utility::flag_wait( "paint_targets_vo" );
    thread _id_722E();
    thread maps\berlin_a10::_id_4DCE( 1 );
}

_id_722E()
{
    if ( getdvar( "r_polygonOffsetBiasMult", "not_set" ) != "not_set" )
    {
        setsaveddvar( "r_polygonOffsetBiasMult", 0 );
        common_scripts\utility::flag_wait( "player_rappels" );
        setsaveddvar( "r_polygonOffsetBiasMult", 1 );
    }
}

_id_722F( var_0 )
{
    thread _id_7230();
    self endon( "death" );
    thread _id_7211( var_0 );
    var_1 = getentarray( "sniper_dummy_targets", "targetname" );
    thread _id_7212( var_1, "parkway_tank_dead" );
    self setthreatbiasgroup( "axis" );
    _id_486F( 0.125 );
    maps\_utility::_id_260D();
}

_id_7230()
{
    self waittill( "death", var_0 );
    level._id_71F3++;

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        level._id_71F4++;

    if ( level._id_71F3 >= 6 && !common_scripts\utility::flag( "delta_support_street_enemies4" ) )
        common_scripts\utility::flag_set( "delta_support_street_enemies4" );
}

_id_7231()
{
    level endon( "parkway_tank_dead" );
    thread _id_7234();
    wait 0.05;
    var_0 = getentarray( "bravo_team_ground_tank_escort", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_722F, level._id_71F7 );
    var_1 = maps\_utility::_id_272D( "bravo_team_ground_tank_escort" );
    wait 7;
    level._id_7232 = _id_7233( "bravo_team_ground_enemies3" );
    common_scripts\utility::flag_wait( "delta_support_street_enemies4" );
    var_2 = thread _id_7233( "bravo_team_ground_enemies5" );
}

_id_7233( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_wait( var_1 );

    var_2 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_722F, level._id_71F7 );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        var_6 = getaiarray( "axis" );

        if ( var_6.size <= 10 )
        {
            var_7 = var_5 maps\_utility::_id_166F( 1 );
            var_3[var_3.size] = var_7;

            if ( isdefined( var_7 ) )
                var_7.dropweapon = 0;

            continue;
        }

        return var_3;
    }

    return var_3;
}

_id_7234()
{
    _id_733F( "player_other" );
    level.player setthreatbiasgroup( "player_other" );
    setignoremegroup( "player_other", "axis" );
    wait 0.05;
    common_scripts\utility::flag_wait( "sniper_complete" );
    _id_733F( "player" );
    level.player setthreatbiasgroup( "player" );
    wait 0.05;
}

_id_7235( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        wait(var_2);

    if ( isalive( self ) )
    {
        objective_additionalentity( var_0, var_1, self, ( 0.0, 0.0, 128.0 ) );
        self waittill( "death" );
        objective_additionalposition( var_0, var_1, ( 0.0, 0.0, 0.0 ) );
    }
}

_id_7236()
{
    self waittill( "death" );
    level._id_71F0++;
}

_id_7237()
{
    var_0 = getnode( "aa_building_spot_point", "targetname" );
    maps\_utility::_id_123B();
    maps\_utility::_id_2724( 8 );
    maps\_utility::_id_1237( var_0.origin );
    self waittill( "goal" );
    var_0 maps\_anim::_id_1246( self, "berlin_crouch_2_spotting" );
    thread maps\_anim::_id_124E( self, "sniper_escape_spotter_idle", "stop_snipe_anim" );
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( level._id_1F90["binocs"] );
    var_1 linkto( self, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "sniper_complete" );
    self notify( "stop_snipe_anim" );
    var_1 delete();
    common_scripts\utility::flag_wait_or_timeout( "player_near_rappel", 5 );
    common_scripts\utility::flag_set( "truck_sniping_position_complete" );
}

_id_7238()
{
    var_0 = common_scripts\utility::getstruct( "lone_star_spot_point", "targetname" );
    var_0 maps\_anim::_id_124A( self, "sniper_escape_spotter_idle" );
    var_0 maps\berlin_util::_id_4E9B( self, "stand_2_crouch" );
    maps\berlin_util::_id_4E9B( self, "casual_crouch_idle_in" );
    maps\berlin_util::_id_4E9B( self, "bog_b_spotter_casual_2_spot" );
    thread maps\_anim::_id_124E( self, "bog_b_spotter_spot_idle", "stop_snipe_anim" );
    common_scripts\utility::flag_set( "allies_in_sniping_position" );
    common_scripts\utility::flag_wait( "sniper_delta_support_squad_unloaded" );
    self notify( "stop_snipe_anim" );
    maps\_anim::_id_1246( self, "bog_b_spotter_spot_2_casual" );
    maps\_anim::_id_1246( self, "casual_crouch_idle_out" );
    self allowedstances( "crouch" );
    var_1 = getnode( "aa_building_spot_point_2", "targetname" );
    maps\_utility::_id_2724( 8 );
    maps\_utility::_id_2053( var_1 );
    self waittill( "goal" );
    maps\_utility::_id_2724( 8 );
    common_scripts\utility::flag_wait( "parkway_tank_dead" );
    var_1 maps\_anim::_id_124A( self, "sniper_escape_spotter_idle" );
    var_1 maps\berlin_util::_id_4E9B( self, "stand_2_crouch" );
    maps\berlin_util::_id_4E9B( self, "casual_crouch_idle_in" );
    maps\berlin_util::_id_4E9B( self, "bog_b_spotter_casual_2_spot" );
    thread maps\_anim::_id_124E( self, "bog_b_spotter_spot_idle", "stop_snipe_anim" );
    common_scripts\utility::flag_wait( "sniper_complete" );
    self allowedstances( "stand", "crouch", "prone" );
    self notify( "stop_snipe_anim" );
    maps\_anim::_id_1246( self, "bog_b_spotter_spot_2_casual" );
    maps\_anim::_id_1246( self, "casual_crouch_idle_out" );
    common_scripts\utility::flag_wait_or_timeout( "player_near_rappel", 2 );
    common_scripts\utility::flag_set( "lone_star_sniping_position_complete" );
}

_id_7239()
{
    var_0 = getnode( "aa_building_snipe_point", "targetname" );
    maps\_utility::_id_123B();
    maps\_utility::_id_2724( 8 );
    maps\_utility::_id_1237( var_0.origin );
    wait 0.05;
    self waittill( "goal" );
    self allowedstances( "crouch" );
    maps\_utility::_id_2724( 75 );
    self._id_4625 = self.weapon;
    maps\_utility::_id_104A( level._id_4E86, "primary" );
    common_scripts\utility::flag_wait( "sniper_complete" );
    self allowedstances( "stand", "crouch", "prone" );
    maps\_utility::_id_104A( self._id_4625, "primary" );
    common_scripts\utility::flag_wait_or_timeout( "player_near_rappel", 1 );
    common_scripts\utility::flag_set( "grinch_sniping_position_complete" );
}

_id_723A()
{
    self endon( "death" );
    maps\_utility::_id_260D();
}

_id_723B( var_0, var_1 )
{
    self endon( "death" );
    var_2 = common_scripts\utility::getstructarray( "delta_support_squad_rappel_loc", "targetname" );
    self._id_723C = var_2[var_0];
    var_3 = self._id_723C.script_noteworthy;
    self setgoalpos( self._id_723C.origin );
    self.goalradius = 8;
    self waittill( "goal" );
    thread _id_723E( var_1 );
    self._id_1032 = "generic";
    wait 1.0;
    self._id_723C maps\_anim::_id_124A( self, "bravo_rappel_mount" );
    self._id_723C maps\_anim::_id_1246( self, "bravo_rappel_mount" );
    self._id_723C thread maps\_anim::_id_124E( self, "bravo_rappel_idle", "start_drop" );
    common_scripts\utility::flag_set( "bravo_team_begin_rappel" );
    _id_723D( var_3, var_1 );
}

_id_723D( var_0, var_1 )
{
    self._id_723C notify( "start_drop" );
    self stopanimscripted();
    var_2[0] = self;

    if ( isdefined( var_1 ) )
        self._id_723C thread maps\_anim::_id_11DD( var_2, var_1 );
    else
        self._id_723C thread maps\_anim::_id_11DD( var_2, "bravo_rappel_drop" );

    var_3 = getnodearray( "delta_support_on_ground_cover", "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        if ( var_6.script_noteworthy == var_0 )
        {
            var_4 = var_6;
            break;
        }
    }

    self setgoalnode( var_4 );
    self._id_722B = var_4._id_164F;
    wait 0.05;
    self waittill( "goal" );
    level._id_71EF++;

    if ( level._id_71EF >= level._id_71FE.size )
        common_scripts\utility::flag_set( "bravo_team_reached_lower_rooftop" );
}

_id_723E( var_0 )
{
    self waittill( "spawn_rope" );
    var_1 = maps\_utility::_id_1287( "rope", self._id_723C.origin );
    self._id_723C maps\_anim::_id_11CF( var_1, "bravo_rappel_mount" );
    thread _id_723F( var_1, var_0 );
    self._id_723C maps\_anim::_id_1246( var_1, "bravo_rappel_mount" );
    self._id_723C thread maps\_anim::_id_124E( var_1, "bravo_rappel_idle", "start_drop" );
    common_scripts\utility::flag_wait( "player_rappels" );
    var_1 delete();
}

_id_723F( var_0, var_1 )
{
    self._id_723C waittill( "start_drop" );
    var_0 stopanimscripted();

    if ( isdefined( var_1 ) )
        self._id_723C thread maps\_anim::_id_1246( var_0, var_1 );
    else
        self._id_723C thread maps\_anim::_id_1246( var_0, "bravo_rappel_drop" );
}

_id_7240()
{
    self._id_721F = 0;
    self endon( "death" );
    level waittill( "laser_coordinates_received" );
    self._id_721F = 1;
}

_id_7241( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = 10;
    wait 0.05;
    self waittill( "goal" );
    wait 0.5;

    if ( isalive( self ) )
    {
        var_1 maps\_anim::_id_1246( self, "berlin_crouch_2_spotting" );
        thread maps\_anim::_id_124E( self, "berlin_crouch_2_spotting_idle", "stop_snipe_anim" );
        var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_2 setmodel( level._id_1F90["binocs"] );
        var_2 linkto( self, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        self.allowdeath = 1;
        self waittill( "death" );
        var_2 delete();
    }
}

_id_7242( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = 10;
}

_id_7243( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_3 = ( 0.0, 0.0, 16.0 );

            if ( var_2.a._id_0D26 == "stand" )
                var_3 = ( 0.0, 0.0, 32.0 );
            else if ( var_2.a._id_0D26 == "crouch" )
                var_3 = ( 0.0, 0.0, 24.0 );

            magicbullet( level._id_4E86, level._id_71A0.origin + anglestoforward( level._id_71A0.angles ) * 60, var_2.origin + var_3 );
            wait 0.2;
            var_2 kill();
            wait 0.5;
        }
    }
}

_id_7244()
{
    level endon( "sniper_patrollers_alerted" );
    var_0 = self;

    while ( isdefined( var_0 ) && !isplayer( var_0 ) )
    {
        self waittill( "damage", var_1, var_0 );
        wait 0.05;
    }

    level notify( "player_hit_patroller" );
}

_id_7245( var_0 )
{
    self waittill( "death", var_1 );
    level notify( "snipe_hotel_roof_death" );

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        level._id_71EB++;
        level._id_71F1 += 5;
        level notify( "snipe_hotel_roof_player_kill" );
    }

    level._id_71EA++;

    if ( level._id_71EA >= 2 )
        common_scripts\utility::flag_set( "sniper_hotel_roof_spawn_helis" );

    if ( level._id_71EA >= var_0 )
        common_scripts\utility::flag_set( "snipe_hotel_roof_complete" );
    else if ( level._id_71EA >= var_0 - 2 )
        common_scripts\utility::flag_set( "delta_support_squad_roof_advance_2" );
    else if ( level._id_71EA >= var_0 - 4 )
        common_scripts\utility::flag_set( "delta_support_squad_roof_advance_1" );
    else if ( level._id_71EA >= level._id_71EC )
    {
        common_scripts\utility::flag_set( "sniper_hotel_roof_clear" );
        common_scripts\utility::flag_set( "spawn_sniper_patrol_wave2" );
    }
}

_id_7246( var_0, var_1 )
{
    self waittill( "death", var_2 );
    level endon( var_1 );

    if ( isdefined( var_2 ) && isplayer( var_2 ) )
        level._id_71EA++;

    if ( level._id_71EA >= var_0 )
        common_scripts\utility::flag_set( var_1 );
    else
        _id_7247( var_0, var_1 );
}

_id_7247( var_0, var_1 )
{
    var_2 = getentarray( self.script_noteworthy, "script_noteworthy" );
    level endon( var_1 );

    for (;;)
    {
        foreach ( var_4 in var_2 )
        {
            if ( isdefined( var_4.spawnflags ) && var_4.spawnflags == 1 )
            {
                var_4.count++;
                wait(randomintrange( 1, 6 ));
                var_5 = var_4 maps\_utility::_id_166F();

                if ( isdefined( var_5 ) )
                {
                    var_5 thread _id_7246( var_0, var_1 );
                    return;
                }
            }
        }

        wait 0.5;
    }
}

_id_7248()
{
    var_0 = getentarray( self.script_noteworthy, "script_noteworthy" );
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        if ( !isspawner( var_3 ) && isalive( var_3 ) )
            var_1++;
    }

    return var_1;
}

_id_7249()
{
    level._id_4E8F thread _id_7262( "rappel_ai_anim_ent1" );
    level._id_71A0 thread _id_7262( "rappel_ai_anim_ent2" );
    level._id_45C4 thread _id_7262( "rappel_ai_anim_ent3" );
    _id_7261( "rappel_player_rope_obj", "rope_player", "rappel_player", "player_rope_long_obj" );
}

_id_724A()
{
    wait 0.05;
    thread _id_724B();
    level._id_4E8F thread _id_724E( "rappel_ai_anim_ent1", "rappel_lone_star_wait" );
    level._id_71A0 thread _id_724E( "rappel_ai_anim_ent2", "rappel_essex_wait" );
    level._id_45C4 thread _id_724E( "rappel_ai_anim_ent3", "rappel_truck_wait" );
    common_scripts\utility::flag_wait( "player_rappels" );
    setsaveddvar( "compass", "0" );
    maps\_audio::aud_send_msg( "player_rappels" );
    thread maps\berlin_fx::_id_4EB2();
    thread _id_7258();
    common_scripts\utility::flag_set( "rappel_end" );
    common_scripts\utility::flag_wait( "rappel_complete" );
    setsaveddvar( "compass", "1" );
}

_id_724B()
{
    common_scripts\utility::flag_set( "player_can_rappel" );
    level._id_724C hide();
    level._id_724D = maps\_utility::_id_1287( "player_rope_long_obj" );
    var_0 = common_scripts\utility::getstruct( "rappel_player_rope_obj", "targetname" );
    var_0 maps\_anim::_id_11CF( level._id_724D, "rappel_player" );
    common_scripts\utility::flag_wait( "player_near_rappel" );
    thread _id_725A( "rappel_animent", "rappel_player", "rappel_trigger", "player_rappels" );
}

_id_724E( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_3 = "rappel_ai";

    if ( self == level._id_4E8F )
        common_scripts\utility::flag_wait( "lone_star_sniping_position_complete" );

    if ( self == level._id_45C4 )
        common_scripts\utility::flag_wait( "truck_sniping_position_complete" );

    if ( self == level._id_71A0 )
        common_scripts\utility::flag_wait( "grinch_sniping_position_complete" );

    _id_7250( var_1 );
    common_scripts\utility::flag_wait( "player_near_rappel" );

    if ( self == level._id_45C4 )
    {
        thread _id_7253( var_2, var_3 );
        return;
    }

    common_scripts\utility::flag_wait( "player_rappels" );
    common_scripts\utility::flag_wait( "rappel_teleport_dudes" );

    if ( !self._id_724F )
    {
        wait(randomfloatrange( 0.5, 2 ));
        var_2 maps\_anim::_id_11CF( self, var_3 );
    }

    _id_7255( var_2, var_3 );
    maps\_utility::_id_2686();
}

_id_7250( var_0 )
{
    self notify( "rappel_new_goal" );
    self endon( "rappel_new_goal" );
    level endon( "rappel_teleport_dudes" );
    var_1 = getnode( var_0, "targetname" );
    self._id_7251 = var_1;
    self._id_724F = 0;
    maps\_utility::_id_2724( 32 );
    maps\_utility::_id_2053( var_1 );
    childthread _id_7252();
}

_id_7252()
{
    self waittill( "goal" );
    self._id_724F = 1;
}

_id_7253( var_0, var_1 )
{
    maps\_utility::_id_123B();
    self._id_117F = 1;
    _id_7254();
    self._id_117F = 0;

    if ( !self._id_724F )
    {
        self allowedstances( "stand" );
        var_0 maps\_anim::_id_11CF( self, var_1 );
    }

    _id_7255( var_0, var_1 );
    var_2 = getnode( "path_truck_post_rappel", "targetname" );
    maps\_utility::_id_2053( var_2 );
    maps\_utility::_id_2686();
    self allowedstances( "stand", "crouch", "prone" );
}

_id_7254( var_0, var_1 )
{
    var_2 = getnode( "rappel_truck_path_1", "targetname" );
    var_3 = getnode( "rappel_truck_path_1", "targetname" );
    self._id_7251 = var_3;
    self._id_724F = 0;
    self notify( "rappel_new_goal" );
    self endon( "rappel_new_goal" );
    level endon( "rappel_teleport_dudes" );
    maps\_utility::_id_2724( 32 );
    maps\_utility::_id_2053( var_2 );
    self waittill( "goal" );
    maps\_utility::_id_2053( var_3 );
    self waittill( "goal" );
    self._id_724F = 1;
}

_id_7255( var_0, var_1 )
{
    self.fixednode = 1;
    var_0 maps\_anim::_id_124A( self, var_1 );
    self._id_7256 = 1;
    var_2 = [];
    var_2[0] = self;
    var_2[1] = self._id_7257;
    var_0 thread maps\_anim::_id_11DE( var_2, var_1 );
    self._id_7256 = undefined;
}

_id_7258()
{
    wait 4.5;
    var_0 = getent( "a10_rappel", "targetname" );
    var_0 = var_0 maps\_vehicle::_id_1F9E();
    common_scripts\utility::flag_wait( "a10_rappel_start_firing" );
    var_0 thread maps\berlin_util::_id_4E1C( "a10_rappel_stop_firing" );
    maps\_audio::aud_send_msg( "a10_rappel_fire", var_0 );
    common_scripts\utility::flag_wait( "a10_rappel_start_shells" );
    var_0 thread _id_7259( "a10_rappel_stop_shells" );
}

_id_006E()
{
    common_scripts\utility::flag_wait( "trigger_vfx_window_expl_rappel" );
    wait 1.3;
    level.player playrumbleonentity( "heavy_3s" );
    wait 1.25;
    level.player playrumbleonentity( "heavy_3s" );
    wait 1.25;
    level.player playrumbleonentity( "heavy_3s" );
}

_id_7259( var_0 )
{
    level endon( var_0 );
    var_1 = common_scripts\utility::getfx( "a10_shells" );
    var_2 = [];
    var_2[0] = distance2d( self.origin, level.player.origin );
    wait 0.05;
    var_2[1] = distance2d( self.origin, level.player.origin );
    var_3 = var_2[0] - var_2[1];
    var_4 = var_3 / 0.05;
    var_5 = var_2[1] / var_4;
    var_6 = 0.0;
    var_7 = 0.05;

    for (;;)
    {
        var_8 = 0.0;

        if ( var_6 == var_5 )
            var_8 = 0.01;

        var_9 = abs( 1 / ( var_6 - var_5 + var_8 ) );
        playfxontag( var_1, self, "tag_gun" );
        var_10 = self gettagorigin( "tag_gun" );
        var_11 = ( 0.0, 0.0, -1024.0 );
        var_10 += var_11;
        var_12 = anglestoforward( self.angles ) * -32;
        playfx( var_1, var_10 + var_12 );
        var_12 = anglestoforward( self.angles ) * -64;
        playfx( var_1, var_10 + var_12 );
        var_12 = anglestoforward( self.angles ) * 32;
        playfx( var_1, var_10 + var_12 );
        var_12 = anglestoforward( self.angles ) * 64;
        playfx( var_1, var_10 + var_12 );

        if ( var_9 > 10 )
        {
            var_12 = anglestoforward( self.angles ) * 96;
            playfx( var_1, var_10 + var_12 );
            var_12 = anglestoforward( self.angles ) * -96;
            playfx( var_1, var_10 + var_12 );

            if ( var_9 > 20 )
            {
                var_12 = anglestoforward( self.angles ) * 16;
                playfx( var_1, var_10 + var_12 + ( 0.0, 0.0, 32.0 ) );
                var_12 = anglestoforward( self.angles ) * -16;
                playfx( var_1, var_10 + var_12 + ( 0.0, 0.0, 32.0 ) );
                var_12 = anglestoforward( self.angles ) * 16;
                playfx( var_1, var_10 + var_12 + ( 0.0, 0.0, 64.0 ) );
                var_12 = anglestoforward( self.angles ) * -16;
                playfx( var_1, var_10 + var_12 + ( 0.0, 0.0, 64.0 ) );

                if ( var_9 > 80 )
                {
                    var_13 = ( level.player.origin[0], level.player.origin[1], var_10[2] );
                    playfx( var_1, var_13 );
                    playfx( var_1, var_13 + ( 0.0, 0.0, 32.0 ) );
                    playfx( var_1, var_13 + ( 0.0, 0.0, 64.0 ) );
                    playfx( var_1, var_13 + ( 0.0, 0.0, 96.0 ) );
                    playfx( var_1, var_13 + ( 0.0, 0.0, 128.0 ) );
                }
            }
        }

        wait(var_7);
        var_6 += var_7;
    }
}

_id_725A( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_725B = level._id_724D;
    var_4._id_5E0C = level._id_724C;
    var_4._id_725C = var_3;
    var_4._id_725D = common_scripts\utility::getstruct( var_0, "targetname" );
    var_4._id_725E = var_1;
    var_4._id_725F = 9.3;
    var_5 = getent( var_2, "script_noteworthy" );
    var_5 sethintstring( &"BERLIN_RAPPEL_HINT" );
    common_scripts\utility::flag_wait( var_4._id_725C );
    maps\_audio::aud_send_msg( "mus_player_rappel" );
    var_5 delete();
    maps\_shg_common::_id_1670();

    if ( isdefined( var_4._id_725B ) )
        var_4._id_725B delete();

    var_4._id_725B = undefined;
    var_6 = maps\_utility::_id_1287( "player_rig", var_4._id_725D.origin );
    var_6 dontcastshadows();
    var_6 hide();
    var_4._id_725D maps\_anim::_id_11CF( var_6, var_4._id_725E );
    var_7 = maps\_utility::_id_1287( "player_legs", var_4._id_725D.origin );
    var_7 hide();
    var_8 = maps\_utility::_id_1287( "rope_carabiner", var_4._id_725D.origin );
    var_8 hide();
    var_9 = [];
    var_9[0] = var_4._id_5E0C;
    var_9[1] = var_6;
    var_9[2] = var_7;
    var_9[3] = var_8;
    level.player disableweapons();
    var_10 = 0.5;
    level.player playerlinktoblend( var_6, "tag_player", var_10, 0.2, 0.2 );
    level.player common_scripts\utility::waittill_notify_or_timeout( "weapon_change", 2 );
    var_11 = 0.05;
    var_6 common_scripts\utility::delaycall( var_11, ::show );
    var_7 common_scripts\utility::delaycall( var_11, ::show );
    var_4._id_5E0C common_scripts\utility::delaycall( var_11, ::show );
    var_8 common_scripts\utility::delaycall( var_11, ::show );
    level._id_7260 = gettime();
    level.player common_scripts\utility::delaycall( var_4._id_725F, ::unlink );
    level.player common_scripts\utility::delaycall( var_4._id_725F - 0.35, ::enableweapons );
    level.player common_scripts\utility::delaycall( var_4._id_725F - 0.35, ::allowcrouch, 1 );
    level.player common_scripts\utility::delaycall( var_4._id_725F - 0.35, ::allowprone, 1 );
    var_6 common_scripts\utility::delaycall( var_4._id_725F, ::delete );
    var_7 common_scripts\utility::delaycall( var_4._id_725F, ::delete );
    var_8 common_scripts\utility::delaycall( var_4._id_725F, ::delete );
    var_12 = getanimlength( maps\_utility::_id_127E( var_4._id_725E, var_9[1]._id_1032 ) );
    maps\_utility::delaythread( var_12, common_scripts\utility::flag_set, "rappel_complete" );
    maps\_utility::delaythread( 0.5, common_scripts\utility::flag_set, "rappel_teleport_dudes" );
    var_4._id_725D maps\_anim::_id_11DD( var_9, var_4._id_725E );
    maps\_shg_common::_id_1671();
}

_id_7261( var_0, var_1, var_2, var_3 )
{
    var_4 = common_scripts\utility::getstruct( var_0, "targetname" );
    level._id_724C = maps\_utility::_id_1287( var_1 );
    level._id_724C._id_1032 = var_1;
    var_4 maps\_anim::_id_11CF( level._id_724C, "rappel_player_idle" );
    level._id_724C dontcastshadows();
}

_id_7262( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2 = maps\_utility::_id_1287( "ai_rope" );
    var_2._id_1032 = "ai_rope";
    self._id_7257 = var_2;
    var_1 maps\_anim::_id_11CF( var_2, "rappel_ai" );
}

_id_7263()
{
    thread _id_7264();
    thread _id_7265();
    thread _id_7266();
}

_id_7264()
{
    maps\_utility::_id_262C( "player_passed_apache" );
    common_scripts\utility::flag_set( "player_passed_apache" );
}

_id_7265()
{
    var_0 = [];
    var_1 = getent( "downed_apache_corpse_1", "targetname" );
    var_2 = getent( "downed_apache_corpse_2", "targetname" );
    var_1 thread _id_6C5C( var_1, "dying_corpse_pose", "clean_up_downed_apache" );
    var_2 thread _id_6C5C( var_2, "dying_corpse_pose", "clean_up_downed_apache" );
}

_id_7266()
{
    var_0 = getent( "apache_crawling_death_guy_1", "targetname" );
    var_1 = common_scripts\utility::getstruct( "apache_wounded_soldier_check_org", "targetname" );
    var_2 = var_0 _id_6C5C( var_1, "hunted_woundedhostage_idle_start" );
    var_3 = [];
    var_3[0] = level._id_45C4;
    var_3[1] = var_2;
    var_2._id_1032 = "generic";
    var_3[0] _id_7338( "trig_apache_wounded_soldier_check" );
    common_scripts\utility::flag_set( "vo_check_wounded_soldier" );
    var_3[1] thread _id_733E( "clean_up_downed_apache" );
    var_1 maps\_anim::_id_124A( var_3[0], "hunted_woundedhostage_check" );
    var_1 maps\_anim::_id_11DD( var_3, "hunted_woundedhostage_check" );
    var_1 maps\_anim::_id_11DD( var_3, "hunted_woundedhostage_check_end" );
    var_3[0] maps\_utility::_id_2686();

    if ( !common_scripts\utility::flag( "player_passed_apache" ) )
        maps\_utility::_id_26BF( "trig_path_after_downed_apache" );
}

_id_7267()
{
    level._id_7268 = 0;
    common_scripts\utility::flag_wait( "start_bridge_battle" );
    thread _id_726D();
    common_scripts\utility::array_thread( getentarray( "bridge_usa_troops", "script_noteworthy" ), maps\_utility::_id_166F, 1 );
    thread _id_7276();
    thread _id_7278();
    level._id_7269 = [];
    level._id_7269[0] = getent( "rus_tank1", "script_noteworthy" );
    level._id_7269[0] = level._id_7269[0] thread maps\_utility::_id_1FA3();
    level._id_7269[0]._id_726A = 0;
    maps\_audio::aud_send_msg( "rus_bridge_tanks", level._id_7269[0] );
    level._id_7269[0] maps\berlin_a10::a10_add_target();
    level._id_7269[0] thread maps\berlin_a10::a10_remove_target_ondeath();
    var_0 = common_scripts\utility::getstructarray( "muzzle_flash_loc", "targetname" );
    common_scripts\utility::array_thread( level._id_7269, ::_id_726C, var_0 );
    var_1 = getentarray( "turret_gunners", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::_id_726F );
    common_scripts\utility::flag_wait( "player_at_bridge_battle" );
    thread _id_734D( "muzzle_flash_loc", "rus_all_tanks_dead" );
    thread _id_734D( "muzzle_flash_loc", "rus_all_tanks_dead" );
    thread _id_726B( level._id_7269[0] );
}

_id_726B( var_0 )
{
    var_1 = getent( "tank1_fire_at_player_volume", "script_noteworthy" );
    _id_730D( var_0, var_1, "trig_bridge_kill_player", undefined, "rus_all_tanks_dead" );
}

_id_726C( var_0 )
{
    self endon( "death" );
    var_1 = self.mgturret[1];

    while ( !isdefined( var_1 getturretowner() ) )
        wait 0.05;

    var_1._id_0FA3 endon( "death" );
    var_2 = spawn( "script_origin", var_0[0].origin );
    var_1 setmode( "manual" );
    var_1 _id_486F( 0.01 );

    while ( !common_scripts\utility::flag( "bridge_fighters_start_fighting" ) )
    {
        var_0 = maps\_utility::_id_0B53( var_0 );
        var_2.origin = var_0[0].origin;
        var_1 settargetentity( var_2, ( 0.0, 0.0, 0.0 ) );
        wait 2.5;
        var_1 cleartargetentity();
        wait 0.05;
    }

    wait(randomfloatrange( 0.3, 1 ));
    var_1 cleartargetentity();
    thread maps\_utility::_id_25EE( "tank_turret_target_player", 12 );
    var_3 = getaiarray( "allies" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "tank_turret_target_player" ) )
            break;

        var_3 = maps\_utility::_id_0B53( var_3 );

        if ( isdefined( var_3[0] ) && isalive( var_3[0] ) )
        {
            var_1 settargetentity( var_3[0], ( 0.0, 0.0, 0.0 ) );
            wait 2.5;
            var_1 cleartargetentity();
        }

        wait 0.05;
    }

    var_1 setmode( "sentry" );
}

_id_726D()
{
    var_0 = getent( "parking_garage_break_glass", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    magicbullet( "rpg_straight", var_1.origin, var_2.origin );
}

_id_726E()
{
    _id_733F( "friendlies" );
    level.heroes _id_7340( "friendlies" );
    _id_733F( "player" );
    level.player setthreatbiasgroup( "player" );
    setignoremegroup( "friendlies", "bridge_sleeper" );
    setignoremegroup( "player", "bridge_sleeper" );
}

_id_726F()
{
    self waittill( "death" );
    level._id_7270++;
    common_scripts\utility::flag_set( "bridge_fighters_start_fighting" );
}

_id_7271()
{
    self endon( "death" );
    self endon( "stop_random_shooting" );
    self waittill( "goal" );

    for (;;)
    {
        self shoot();
        wait(randomfloatrange( 0.5, 1.5 ));

        if ( self._id_1005 == "rpg" )
            wait(randomfloatrange( 5.5, 8.5 ));
    }
}

_id_7272( var_0 )
{
    var_1 = sortbydistance( var_0, level.player.origin );
    var_2 = 0;

    for ( var_3 = 0; var_3 <= var_1.size; var_3++ )
    {
        if ( isalive( var_1[var_3] ) )
        {
            var_1[var_3] _id_7273();
            var_2++;
        }

        if ( var_2 > 2 )
        {
            wait 3.0;
            var_2 = 0;
        }
    }
}

_id_7273()
{
    self endon( "death" );
    wait(randomfloatrange( 0.3, 1 ));
    self setthreatbiasgroup( "axis" );
    self notify( "stop_random_shooting" );
    self.ignoreall = 0;
    self.goalradius = 512;
}

_id_7274()
{
    self endon( "death" );
    wait(randomfloatrange( 0.3, 1 ));
    var_0 = getnode( "bridge_spawn1_first_guy_goal", "targetname" );
    self setgoalnode( var_0 );
    self setthreatbiasgroup( "axis" );
    self notify( "stop_random_shooting" );
    self.ignoreall = 0;
    self.goalradius = 512;
}

_id_7275()
{
    self setthreatbiasgroup( "bridge_sleeper" );
    self.ignoreall = 1;
    self.goalradius = 10;
}

_id_7276()
{
    createthreatbiasgroup( "bridge_sleeper" );
    level._id_7270 = 0;
    var_0 = getentarray( "bridge_spawn1", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_726F );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7271 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7275 );
    var_1 = maps\_utility::_id_272B( var_0, 1 );
    thread _id_726E();
    common_scripts\utility::flag_wait( "player_at_bridge_battle" );
    var_1 = common_scripts\utility::array_removeundefined( var_1 );

    if ( var_1.size > 0 )
    {
        var_2 = sortbydistance( var_1, level.player.origin );
        var_2[0] thread _id_7274();
        common_scripts\utility::flag_wait( "bridge_fighters_start_fighting" );
        thread _id_7272( var_1 );
    }

    while ( level._id_7270 < 6 )
        wait 0.1;

    var_3 = getentarray( "bridge_spawn_flood2", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_726F );

    if ( var_3.size > 0 )
        maps\_spawner::_id_2135( var_3 );

    wait 1;
    common_scripts\utility::flag_wait( "bridge_one_tank_destroyed" );

    while ( level._id_7270 < 8 )
        wait 0.1;

    var_3 = getentarray( "bridge_spawn_flood", "targetname" );

    if ( var_3.size > 0 )
        maps\_spawner::_id_2135( var_3 );
}

_id_7277()
{
    common_scripts\utility::trigger_off( "bridge_battle_color_advance_1", "targetname" );
    common_scripts\utility::trigger_off( "bridge_battle_color_advance_2", "targetname" );
    common_scripts\utility::flag_wait( "rus_all_tanks_dead" );
    common_scripts\utility::trigger_on( "bridge_battle_color_advance_1", "targetname" );
    common_scripts\utility::trigger_on( "bridge_battle_color_advance_2", "targetname" );
}

_id_7278()
{
    thread _id_7279();
    common_scripts\utility::flag_wait( "enemies_retreat" );
    maps\_spawner::_id_213C( 19 );
    maps\_spawner::_id_213C( 18 );
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::getstruct( "bridge_fall_back_pos", "targetname" );
    var_2 = sortbydistance( var_0, var_1.origin );
    var_3 = 0;

    for ( var_4 = var_2.size - 1; var_4 >= 0; var_4-- )
    {
        if ( isalive( var_2[var_4] ) )
        {
            var_2[var_4] maps\_utility::_id_1237( var_1.origin );
            var_2[var_4] maps\_utility::_id_2724( var_1.radius );
            var_2[var_4] notify( "retreat" );
            var_3++;
        }

        if ( var_3 > 3 )
        {
            wait 6.0;
            var_3 = 0;
        }
    }
}

_id_7279()
{
    common_scripts\utility::flag_wait( "rus_all_tanks_dead" );
    maps\_utility::delaythread( 30, common_scripts\utility::flag_set, "rus_all_tanks_dead_delay" );
}

_id_727A()
{
    self endon( "death" );
    self endon( "stop_firing" );
    self._id_727B = 0;

    if ( isdefined( self._id_727C ) )
    {
        while ( isdefined( self ) && isalive( self ) )
        {
            if ( _id_4BEF( self._id_727C ) && self._id_727B == 0 )
            {
                self notify( "stop_random_tank_fire" );
                self fireweapon();
                level.player kill();
                self._id_727B = 1;
                wait 5;
            }
            else if ( self._id_727B == 1 )
            {
                self notify( "stop_tank_fire_at_player" );
                thread maps\_shg_common::_id_166B( "bridge_usa_troops" );
                self._id_727B = 0;
                wait 5;
            }

            wait 1;
        }
    }
}

_id_4BEF( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( level.player istouching( var_2 ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

_id_4F5A()
{
    self endon( "death" );
    self endon( "stop_tank_fire_at_player" );
    var_0 = level.player;

    while ( isdefined( self ) && isalive( self ) )
    {
        if ( isdefined( var_0 ) && var_0.health > 0 )
        {
            self setturrettargetent( var_0, ( randomintrange( -64, 64 ), randomintrange( -64, 64 ), randomintrange( -16, 100 ) ) );

            if ( sighttracepassed( self.origin + ( 0.0, 0.0, 100.0 ), var_0.origin + ( 0.0, 0.0, 40.0 ), 0, self ) )
            {
                self fireweapon();
                wait(randomintrange( 2, 7 ));
            }
            else
                wait 1;

            continue;
        }

        wait 1;
    }
}

_id_727D( var_0 )
{
    var_1 = getent( "bridge_rpg", "targetname" );
    level._id_727E = level.objective_count;
    objective_add( level._id_727E, "current", &"BERLIN_DESTROY_TANKS_OBJ", var_1.origin );
    objective_position( level._id_727E, var_1.origin );
    level.objective_count++;
    common_scripts\utility::flag_wait( "player_sees_bridge_battle" );
    _id_7280();

    if ( !common_scripts\utility::flag( "stop_rpg_glow" ) )
        var_1 _id_7224( "stop_rpg_glow", 1 );

    common_scripts\utility::flag_set( "bridge_rpg_picked_up" );
    maps\_audio::aud_send_msg( "bridge_rpg_picked_up" );

    if ( isdefined( var_0[0] ) && isalive( var_0[0] ) )
    {
        objective_position( level._id_727E, var_0[0].origin + ( 0.0, 0.0, 0.0 ) );
        var_0[0] thread _id_7284();
        maps\_audio::aud_send_msg( "destroy_tank_with_rpg_objective", var_0[0] );
    }
    else
        level._id_7268++;

    objective_setpointertextoverride( level._id_727E, &"BERLIN_DESTROY" );
    level.objective_count++;

    for (;;)
    {
        if ( level._id_7268 == 1 )
        {
            common_scripts\utility::flag_set( "rus_all_tanks_dead" );
            common_scripts\utility::flag_set( "stop_rpg_glow" );
            return;
        }

        wait 0.5;
    }
}

_id_727F()
{
    var_0 = level.player getcurrentprimaryweapon();

    if ( var_0 == "rpg_player" || var_0 == "rpg" )
        return 1;

    return 0;
}

_id_7280()
{
    var_0 = level.player getweaponslistprimaries();
    var_1 = level.player getcurrentprimaryweapon();

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == "rpg_player" || var_3 == "rpg" )
        {
            var_4 = level.player getammocount( var_3 );

            if ( var_3 == var_1 )
            {
                if ( var_4 > 0 )
                {
                    common_scripts\utility::flag_set( "stop_rpg_glow" );
                    return;
                }
            }
            else
            {
                maps\_utility::delaythread( 6, maps\_utility::_id_1F61, "rpg_secondary" );

                if ( var_4 > 0 )
                {
                    common_scripts\utility::flag_set( "stop_rpg_glow" );
                    return;
                }
            }
        }
    }

    thread _id_7281();
}

_id_7281()
{
    level endon( "rus_all_tanks_dead" );

    for (;;)
    {
        var_0 = level.player getweaponslistprimaries();
        var_1 = level.player getcurrentprimaryweapon();

        foreach ( var_3 in var_0 )
        {
            if ( var_3 == "rpg_player" || var_3 == "rpg" )
            {
                var_4 = level.player getammocount( var_3 );

                if ( var_3 == var_1 )
                {
                    if ( var_4 > 0 )
                    {
                        common_scripts\utility::flag_set( "stop_rpg_glow" );
                        return;
                    }
                }
            }
        }

        wait 0.1;
    }
}

_id_7282()
{
    common_scripts\utility::trigger_off( "bridge_color_trig_01", "targetname" );
    common_scripts\utility::flag_wait( "rus_all_tanks_dead" );
    wait 7;
    thread maps\_utility::_id_26BF( "path_allies_post_destroy_bridge_tank" );
    common_scripts\utility::trigger_on( "bridge_color_trig_01", "targetname" );
    common_scripts\utility::flag_wait( "bridge_combat_dudes_dead" );
    maps\_utility::_id_26BF( "trig_path_heroes_bridge_02" );
    var_0 = getent( "bridge_color_trig_02", "targetname" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::trigger_off( "bridge_color_trig_02", "targetname" );
}

_id_7283()
{
    common_scripts\utility::flag_wait( "usa_tanks_start_parkway" );
    wait 5;

    if ( !common_scripts\utility::flag( "cancel_scripted_color_trigs" ) )
        thread maps\_utility::_id_26BF( "path_heroes_post_tanks_over_barrier_1" );

    common_scripts\utility::flag_wait( "parkway_tank_right_pause_01" );

    if ( !common_scripts\utility::flag( "cancel_scripted_color_trigs" ) )
        thread maps\_utility::_id_26BF( "trig_path_heroes_parkway_02" );

    common_scripts\utility::flag_wait( "parkway_tank_left_pause_01" );

    if ( !common_scripts\utility::flag( "cancel_scripted_color_trigs" ) )
        thread maps\_utility::_id_26BF( "trig_path_heroes_parkway_01" );
}

_id_7284()
{
    self waittill( "death" );
    objective_position( level._id_727E, ( 0.0, 0.0, 0.0 ) );
    level._id_7268++;
    common_scripts\utility::flag_set( "bridge_one_tank_destroyed" );
}

_id_7285( var_0 )
{
    level endon( "rus_all_tanks_dead" );

    if ( isdefined( level._id_7269 ) )
    {
        var_0 waittill( "death" );
        objective_state( level._id_7286, "failed" );
        setdvar( "ui_deadquote", &"BERLIN_BRIDGE_BATTLE_FAIL_QUOTE" );
        maps\_utility::_id_1826();
    }
}

_id_7287( var_0, var_1 )
{
    self endon( "death" );
    maps\_vehicle::_id_1FA6();
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( var_1 ) )
        wait(var_1);

    for (;;)
    {
        if ( isdefined( level._id_7269 ) )
        {
            foreach ( var_3 in level._id_7269 )
            {
                if ( isalive( var_3 ) && var_3._id_726A == 0 )
                {
                    var_3 _id_7288( self );
                    break;
                }
            }
        }

        wait 0.25;
    }
}

_id_7288( var_0 )
{
    self endon( "death" );
    self notify( "stop_firing" );
    self._id_726A = 1;
    self setturrettargetent( var_0 );
    wait 2;
    self fireweapon();
    var_0 maps\_vehicle::_id_2A13();
    self._id_726A = 0;
    var_0 notify( "death" );
}

_id_0242( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        level endon( var_1 );

    self waittill( "death" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_set( var_0 );
}

_id_7289()
{
    thread _id_728B();
    thread _id_728C();
}

_id_728A()
{
    level waittill( "bridge_activate_a10_hint" );

    if ( !common_scripts\utility::flag( "rus_all_tanks_dead" ) )
        maps\berlin_a10::_id_4E2C();
}

_id_728B()
{
    common_scripts\utility::flag_wait( "start_ambient_apache_shotdown" );
    var_0 = getent( "bridge_battle_apache_shotdown", "targetname" );
    var_0 = var_0 maps\_vehicle::_id_1F9E();
    var_0._id_29E0 = 0;
    maps\_audio::aud_send_msg( "bridge_battle_apache_shotdown_spawn", var_0 );
    var_1 = common_scripts\utility::getstruct( "bridge_battle_apache_shotdown_crash_location", "script_noteworthy" );
    var_0._id_29DC = var_1;
    common_scripts\utility::flag_wait( "bridge_battle_apache_shotdown_fire1" );
    var_2 = getent( "bridge_battle_apache_shotdown_target2", "targetname" );
    var_0 thread _id_71C2( var_2, 2, 2 );
    common_scripts\utility::flag_wait( "bridge_battle_apache_shotdown_start" );
    var_3 = common_scripts\utility::getstruct( "bridge_battle_apache_shotdown_loc", "targetname" );
    var_4 = var_0 thread _id_7344( var_3, "direct" );
    maps\_audio::aud_send_msg( "bridge_battle_apache_shotdown_jav_launch", var_4 );
}

_id_728C()
{
    common_scripts\utility::flag_wait( "start_ambient_apaches" );
    var_0 = getentarray( "bridge_battle_apache", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_vehicle::_id_1F9E );
}

_id_728D()
{
    common_scripts\utility::array_thread( getentarray( "parkway_friendly_drone", "script_noteworthy" ), ::_id_728E );
    common_scripts\utility::flag_wait( "start_parkway_drones2" );
    maps\_utility::_id_2756( getentarray( "parkway_friendly_drone", "script_noteworthy" ), 512 );
    common_scripts\utility::array_thread( getentarray( "parkway_friendly_drone_2", "script_noteworthy" ), ::_id_728E );
}

_id_728E()
{
    level notify( "stop_basic_drone_spawner" );
    level endon( "stop_basic_drone_spawner" );

    for (;;)
    {
        if ( self.count < 1 )
            return;

        var_0 = maps\_utility::_id_166F();

        if ( !maps\_utility::_id_13AF( self ) )
            var_0 waittill( "death" );
        else
            wait 8;

        wait 0.05;
    }
}

_id_728F()
{
    level notify( "stop_basic_drone_spawner" );
    level endon( "stop_basic_drone_spawner" );
    var_0 = undefined;

    for (;;)
    {
        if ( !isdefined( self._id_4E6C ) || !isalive( self._id_4E6C ) )
        {
            self.count++;
            self._id_4E6C = maps\_utility::_id_166F();
            self._id_4E6C.spawner = self;
        }

        wait 8.0;
    }
}

_id_7290()
{
    _id_733F( "friendlies" );
    level.heroes _id_7340( "friendlies" );
    var_0 = getentarray( "parkway_spawners_right", "targetname" );
    var_1 = getentarray( "parkway_spawners_left", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_7291, "right" );
    common_scripts\utility::array_thread( var_1, ::_id_7291, "left" );
}

_id_7291( var_0 )
{
    self waittill( "trigger" );
    wait 1;

    if ( var_0 == "left" )
    {

    }

    if ( isdefined( self.script_noteworthy ) )
    {
        var_1 = getentarray( self.script_noteworthy, "script_noteworthy" );

        foreach ( var_3 in var_1 )
            var_3 delete();
    }
}

_id_7292()
{
    level endon( "missionfailed" );
    level._id_7293 = [];
    common_scripts\utility::flag_wait( "usa_tanks_start_bridge_advance" );
    var_0 = getent( "usa_tank2", "script_noteworthy" );
    var_1 = getent( "usa_tank3", "script_noteworthy" );
    var_2 = getent( "usa_tank4", "script_noteworthy" );
    var_3 = var_0 maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "ally_deadtank", var_3 );
    var_3 thread _id_7287( "usa_deadtank_in_pos" );
    var_3 thread _id_0242( "bridge_deadtank_dead", "rus_all_tanks_dead" );
    var_3 thread maps\_shg_common::_id_166B( "bridge_tank_target" );
    var_3 thread maps\berlin_a10::a10_add_target();
    var_3 thread maps\berlin_a10::a10_remove_target_ondeath();
    var_3 maps\_vehicle::_id_2A12();
    var_3 setvehiclelookattext( "Blutertragen", &"" );
    level._id_7293[0] = var_3;
    var_4 = [];
    var_5 = getent( "parkway_right_volume", "targetname" );
    var_4[0] = var_1 maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "ally_tank_00", var_4[0] );
    thread _id_7285( var_4[0] );
    var_4[0] thread _id_7287( "usa_tanks_half_way_on_bridge", 5 );
    var_4[0] setvehiclelookattext( "Vorschlaghammer", &"" );
    var_4[0] thread _id_7299( var_5 );
    var_4[0] thread _id_7294();
    var_4[0] thread _id_7295();
    level._id_7293[1] = var_4[0];
    maps\_audio::aud_send_msg( "ally_tank_01", level._id_7293[1] );
    var_4[0]._id_2A7D = 2;
    var_6 = getent( "parkway_left_volume", "targetname" );
    var_4[1] = var_2 maps\_vehicle::_id_1F9E();
    var_4[1] setvehiclelookattext( "Zerstörer", &"" );
    var_4[1] thread _id_729F();
    var_4[1] thread _id_7296();
    var_4[1] thread _id_7295();
    level._id_7293[2] = var_4[1];
    maps\_audio::aud_send_msg( "ally_tank_02", level._id_7293[2] );
    var_4[1]._id_2A7D = 2;
    common_scripts\utility::array_thread( var_4, ::_id_7297, "lone_star_going_down" );
    common_scripts\utility::array_thread( var_4, ::_id_7298 );
    common_scripts\utility::flag_wait( "rus_all_tanks_dead" );
    common_scripts\utility::array_call( var_4, ::vehicle_setspeed, 10, 5, 5 );
    common_scripts\utility::flag_wait( "usa_tank2_in_pos" );
    common_scripts\utility::array_thread( var_4, maps\_vehicle::_id_29F7, "tank_rumble", 0.05, 1.5, 300, 0.3, 0.3 );
    common_scripts\utility::array_thread( var_4, maps\_utility::_id_1DAA, "stop_random_tank_fire" );
    common_scripts\utility::array_call( var_4, ::clearturrettarget );
    common_scripts\utility::array_thread( var_4, ::_id_729A, "berlin_parkway_busy_targets" );
}

_id_7294()
{
    common_scripts\utility::flag_wait( "usa_tank1_in_pos" );
    common_scripts\utility::flag_wait( "usa_tanks_start_parkway" );
    maps\_audio::aud_send_msg( "usa_tank1_start_parkway", self );
    thread maps\berlin_fx::_id_4EBB( self );
}

_id_7295()
{
    self endon( "death" );
    maps\_vehicle::_id_2A12();

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_1 == level.player && var_4 == "MOD_PROJECTILE" )
            break;
    }

    maps\_utility::_id_1F61( "damage_leapard_hint" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_1 == level.player && var_4 == "MOD_PROJECTILE" )
            break;
    }

    maps\_vehicle::_id_2A13();
    self kill();
}

_id_7296()
{
    common_scripts\utility::flag_wait( "usa_tank2_in_pos" );
    common_scripts\utility::flag_wait( "usa_tanks_start_parkway" );
    maps\_audio::aud_send_msg( "usa_tank2_start_parkway", self );
    thread maps\berlin_fx::_id_4EBC( self );
}

_id_7297( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    self notify( "stop_random_tank_fire" );
}

_id_7298()
{
    self endon( "death" );
    thread maps\berlin_a10::a10_add_target();
    thread maps\berlin_a10::a10_remove_target_ondeath();
    thread _id_7356( "player_interacting_with_wounded_lonestar" );
    self vehicle_setspeed( 5, 5, 5 );
    maps\_vehicle::_id_2A12();

    if ( !common_scripts\utility::flag( "rus_all_tanks_dead" ) )
        wait 1;

    thread maps\_shg_common::_id_166B( "bridge_tank_target" );
    thread _id_7357( "parkway_target_point", "rus_all_tanks_dead" );
}

_id_7299( var_0 )
{
    self endon( "death" );
    level endon( "lone_star_going_down" );
    common_scripts\utility::flag_wait( "usa_tanks_start_parkway" );
    wait(randomfloatrange( 1, 2 ));
}

_id_729A( var_0 )
{
    self endon( "death" );
    self notify( "stop_random_tank_fire" );
    self endon( "stop_random_tank_fire" );

    if ( !isdefined( level._id_729B ) )
    {
        level._id_729B = 1;
        level._id_729C = 5000;
        level._id_729D = gettime();
    }

    var_1 = 0;
    var_2 = cos( 45 );
    var_3 = cos( 10 );
    var_4 = 2048;
    var_5 = var_4 * var_4;
    maps\_vehicle::_id_2A3E();
    var_6 = 2;
    var_7 = 0;
    var_8 = [];

    if ( isdefined( var_0 ) )
        var_8 = getentarray( var_0, "targetname" );

    _id_729B();

    for (;;)
    {
        var_9 = undefined;

        while ( !isdefined( var_9 ) )
        {
            wait 0.05;

            if ( gettime() > var_7 + 1000 * var_6 )
            {
                var_7 = gettime();
                var_10 = getaiarray( "axis" );

                foreach ( var_12 in var_10 )
                {
                    if ( isdefined( var_12.script_noteworthy ) && var_12.script_noteworthy == "tank_ignoreme" )
                        var_10 = common_scripts\utility::array_remove( var_10, var_12 );
                }

                var_14 = self gettagorigin( "tag_flash" );
                var_10 = sortbydistance( var_10, var_14 );
                var_15 = anglestoforward( self.angles );
                var_16 = 0;

                foreach ( var_18 in var_10 )
                {
                    if ( !isdefined( var_18 ) || !isalive( var_18 ) )
                        continue;

                    if ( distancesquared( var_14, var_18.origin ) > var_5 )
                        break;

                    var_19 = _id_729E( var_18, var_14 );
                    var_20 = vectordot( var_15, var_19 );

                    if ( var_20 > var_2 )
                    {
                        var_9 = var_18;
                        break;
                    }

                    var_16++;

                    if ( var_16 == 10 || var_16 == 20 )
                        wait 0.05;
                }

                continue;
            }

            if ( var_8.size > 0 )
                var_9 = var_8[randomint( var_8.size )];
        }

        self setturrettargetent( var_9, var_9 maps\berlin_util::_id_4E9F() );
        var_22 = 0;
        var_23 = 0;
        var_24 = 3;

        while ( isdefined( var_9 ) && var_22 < var_3 )
        {
            var_14 = self gettagorigin( "tag_flash" );
            var_25 = self gettagangles( "tag_turret" );
            var_26 = anglestoforward( var_25 );
            var_19 = _id_729E( var_9, var_14 );
            var_22 = vectordot( var_26, var_19 );
            var_15 = anglestoforward( self.angles );
            var_20 = vectordot( var_15, var_19 );

            if ( var_20 < var_2 )
            {
                var_9 = undefined;
                break;
            }
            else if ( var_22 > var_3 )
                break;
            else
            {

            }

            var_28 = 0.15;
            var_23 += var_28;
            wait(var_28);

            if ( var_23 > var_24 )
                var_9 = undefined;
        }

        self clearturrettarget();

        if ( isdefined( var_9 ) )
        {
            if ( isai( var_9 ) )
            {
                wait 0.6;
                self setvehweapon( "leopard_2a7_sabot" );
                self fireweapon();
                _id_729B();
                continue;
            }

            wait 0.8;
            self setvehweapon( "leopard_2a7_turret" );
            self fireweapon();
            _id_729B();
        }
    }
}

_id_729B()
{
    var_0 = gettime();
    var_1 = level._id_729D - gettime();
    level._id_729D += level._id_729C;

    if ( var_1 > 0 )
        wait(var_1 / 1000);
}

_id_729E( var_0, var_1 )
{
    return vectornormalize( var_0.origin + var_0 maps\berlin_util::_id_4E9F() - var_1 );
}

_id_729F()
{
    self endon( "death" );
    _id_72A1();
    thread _id_729A( "berlin_parkway_busy_targets" );
}

_id_72A0( var_0 )
{
    var_0 endon( "start_parkway_cover_scene" );
    var_0 endon( "parkway_cover_scene_missed" );
    self waittill( "trigger" );
    var_0 notify( "parkway_cover_scene_missed" );
}

_id_72A1()
{
    self endon( "death" );
    level endon( "parkway_cover_scene_missed" );
    var_0 = getentarray( "parkway_color_triggers1", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_72A0, self );
    common_scripts\utility::flag_wait( "usa_tank2_in_pos" );
    wait 1;
    self notify( "stop_random_tank_fire" );
    var_1 = self;
    var_2 = getent( "tank_shot_target", "targetname" );
    var_1 setturrettargetent( var_2 );
    common_scripts\utility::flag_wait( "parkway_tank_shot" );
    self notify( "start_parkway_cover_scene" );
    wait 1;
    var_1 fireweapon();
    wait 0.25;
    playfx( common_scripts\utility::getfx( "tank_destroy_cover" ), var_2.origin );
    var_3 = getentarray( "tank_shot_destructible", "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5._id_72A2 ) )
        {
            var_5 setmodel( var_5._id_72A2 );
            continue;
        }

        var_5 delete();
    }

    var_7 = getentarray( "parkway_scripted_tank_fire_col", "targetname" );

    if ( isdefined( var_7 ) )
    {
        foreach ( var_9 in var_7 )
            var_9 delete();
    }

    physicsexplosionsphere( var_2.origin, 256, 100, 4 );
    var_1 clearturrettarget();
}

_id_72A3()
{
    maps\_utility::_id_262C( "trigger_lone_star_wounded" );
    common_scripts\utility::flag_set( "lone_star_going_down" );
    var_0 = common_scripts\utility::getstruct( "lone_star_grenade_hit_anim_loc", "targetname" );
    common_scripts\utility::flag_set( "lone_star_wounded" );
    maps\_utility::_id_262C( "trigger_player_help_auto" );
    maps\_shg_common::_id_1670();
    common_scripts\utility::flag_clear( "lone_star_wounded" );
    common_scripts\utility::flag_set( "player_interacting_with_wounded_lonestar" );
    maps\_spawner::_id_213C( 28 );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "hud_showStance", "0" );
    level.player disableweapons();
    thread _id_72A5();
    thread _id_72A7();
    var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_2[0] = level._id_4E8F;
    var_2[1] = var_1;
    var_3 = getent( "building_to_destroy", "script_noteworthy" );
    var_3 delete();
    var_4 = maps\_utility::_id_1287( "bahn_tower_collapse", var_0.origin );
    maps\_audio::aud_send_msg( "destroyBuilding", var_4 );
    var_2 = maps\_utility::_id_0BC3( var_2, var_4 );
    var_2 = maps\_utility::_id_0BC3( var_2, level._id_72A4 );
    var_5 = "bahn_tower";
    var_1._id_1032 = "player_rig";
    level.player playerlinktoblend( var_1, "tag_player", 0.5, 0.2, 0.2 );
    level.player freezecontrols( 1 );
    level.player enableinvulnerability();
    level._id_71A0 hide();
    level._id_45C4 hide();
    maps\_utility::delaythread( 0.05, ::_id_72A8 );
    var_0 thread maps\_anim::_id_11DD( var_2, var_5, undefined );
    level notify( "building_collapsed" );
    wait 8.5;
    var_0 thread maps\_anim::_id_124E( level._id_4E8F, "building_explosion_hit_wounded_loop", "end_lone_star_wounded_loop" );
    level.player playerlinktodelta( var_1, "tag_player", 0.5, 15, 15, 15, 15, 1 );
    var_6 = _id_473C();
    var_6 maps\_utility::delaythread( 1, ::_id_473B, 0.6, 0.75 );
    var_6 maps\_utility::delaythread( 1.6, ::_id_473B, 0, 0.5 );
    var_4 thread maps\berlin_fx::_id_4EAA();
    maps\_utility::vision_set_fog_changes( "berlin_collapse", 2.25 );
    var_6 maps\_utility::delaythread( 3.7, ::_id_473B, 0.9, 0.5 );
    var_6 maps\_utility::delaythread( 4.3, ::_id_473B, 0.2, 0.5 );
    maps\_utility::delaythread( 8.3, ::_id_473E, 7, 1.5 );
    var_6 maps\_utility::delaythread( 11.4, ::_id_473B, 1, 0.4 );
    var_6 maps\_utility::delaythread( 12.0, ::_id_473B, 0, 0.5 );
    wait 0.2;
    earthquake( 0.2, 10, level.player.origin, 512 );
    playrumbleonposition( "heavy_3s", level.player.origin );
    wait 3.2;
    level.player shellshock( "berlin_building", 35 );
    earthquake( 0.1, 0.5, level.player.origin, 512 );
    playrumbleonposition( "heavy_3s", level.player.origin );
    wait 8.4;
    level.player unlink();
    var_7 = common_scripts\utility::getstruct( "player_teleport", "targetname" );
    maps\_utility::_id_1FDF( var_7 );
    maps\_shg_common::_id_1671();
    level.player disableinvulnerability();
    var_0 notify( "end_lone_star_wounded_loop" );
    level._id_4E8F notify( "killanimscript" );
    var_8 = common_scripts\utility::getstruct( "lone_star_teleport", "targetname" );
    level._id_4E8F forceteleport( var_8.origin, var_8.angles );
    level._id_4E8F maps\_shg_common::_id_16B3( "body_hero_sandman_delta_dusty" );
    level._id_4E8F maps\_utility::_id_2713();
    var_9 = common_scripts\utility::getstruct( "essex_teleport", "targetname" );
    level._id_71A0 forceteleport( var_9.origin, var_9.angles );
    level._id_71A0 maps\_shg_common::_id_16B3( "body_delta_woodland_assault_aa_dusty" );
    level._id_71A0 show();
    var_10 = common_scripts\utility::getstruct( "truck_teleport", "targetname" );
    level._id_45C4 forceteleport( var_10.origin, var_10.angles );
    level._id_45C4 maps\_shg_common::_id_16B3( "body_hero_truck_delta_dusty" );
    level._id_45C4 show();
    common_scripts\utility::flag_set( "player_teleport_after_collapse_complete" );
    maps\_audio::aud_send_msg( "building_collapse_teleport_complete" );
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

_id_72A5()
{
    level._id_72A6 = maps\_utility::_id_272B( getentarray( "building_victim", "targetname" ), 1 );
}

_id_72A7()
{
    level waittill( "building_collapsed" );

    if ( isdefined( level._id_7293 ) )
    {
        foreach ( var_1 in level._id_7293 )
        {
            if ( isdefined( var_1 ) )
            {
                var_1 notify( "stop_random_tank_fire" );
                var_1 notify( "stop_targeted_firing" );

                if ( var_1 == level._id_7293[2] )
                {
                    if ( !common_scripts\utility::flag( "usa_tank_left_past_end" ) )
                    {
                        var_2 = getent( "usa_tank_left_delete_volume", "targetname" );
                        var_1 vehicle_setspeed( 0, 5, 5 );
                        var_3 = spawn( "script_origin", var_1.origin + ( 0.0, 0.0, 32.0 ) );

                        if ( var_3 istouching( var_2 ) )
                            var_1 maps\_utility::delaythread( 0.3, maps\_utility::_id_2705 );
                    }

                    continue;
                }

                var_1 maps\_utility::delaythread( 2.9, maps\_utility::_id_2705 );
            }
        }
    }
}

_id_72A8()
{
    thread _id_72A9();
    thread maps\berlin_fx::_id_4EB1();
    var_0 = common_scripts\utility::getstruct( "building_victim_explosion_org", "targetname" );
    radiusdamage( var_0.origin, 500, 1000, 700 );
    playrumbleonposition( "heavy_3s", level.player.origin );
    wait 0.2;
    maps\_utility::_id_2772( 0.3 );
    maps\_utility::_id_2774( 0 );
    maps\_utility::_id_2775();
    wait 0.3;
    maps\_utility::_id_0A16( 0 );
    maps\_utility::_id_0A17();

    foreach ( var_2 in level._id_72A6 )
    {
        if ( isalive( var_2 ) )
            var_2 kill();
    }

    common_scripts\utility::array_thread( getaiarray( "axis" ), maps\_utility::_id_2705 );
}

_id_72A9()
{
    var_0 = common_scripts\utility::getstruct( "building_to_collapse_origin", "targetname" );
    thread maps\berlin_fx::_id_4EAB();
}

_id_72AA()
{
    var_0 = common_scripts\utility::getstruct( "lone_star_grenade_hit_anim_loc", "targetname" );
    level._id_72A4 = maps\_utility::_id_1287( "car", var_0.origin );
    var_0 maps\_anim::_id_11CF( level._id_72A4, "bahn_tower" );
}

_id_72AB( var_0 )
{
    playrumbleonposition( "light_1s", level.player.origin );
}

_id_72AC()
{
    setsaveddvar( "sm_sunsamplesizenear", "0.07" );
    wait 15.0;
    var_0 = 0.07;
    var_1 = 0.25;
    var_2 = 3.0;
    var_3 = 0.0;

    while ( var_3 < var_2 )
    {
        var_4 = ( var_1 - var_0 ) * var_3 / var_2 + var_0;
        setsaveddvar( "sm_sunsamplesizenear", "" + var_4 );
        var_3 += 0.07;
        wait 0.05;
    }

    setsaveddvar( "sm_sunsamplesizenear", "0.25" );
}

_id_72AD()
{
    level.player setviewmodel( "viewhands_delta_dirty" );
    maps\_shg_common::_id_1670();
    thread _id_72BA();
    thread _id_72AC();
    var_0 = maps\_utility::_id_1287( "player_rig_bloody", level.player.origin );
    var_1[0] = level._id_4E8F;
    var_1[1] = var_0;
    maps\_utility::delaythread( 3.6, ::_id_72B1 );
    maps\_utility::delaythread( 3.8, ::_id_473E, 1, 0.5 );
    maps\_utility::delaythread( 2.5, ::_id_006B );
    var_0._id_1032 = "player_rig_bloody";
    var_0.weapon = "none";
    var_0 thread maps\berlin_fx::_id_4EAC();
    level.player playerlinktoblend( var_0, "tag_player", 0.5, 0.2, 0.2 );
    var_2 = common_scripts\utility::getstruct( "aftermath_anim_org", "targetname" );
    var_2 thread _id_72AE( var_1[0], "aftermath" );
    var_2 maps\_anim::_id_1246( var_1[1], "aftermath" );
    var_3 = maps\_utility::_id_1287( "berlin_sgt_down_recovery_wires", var_2.origin );
    var_2 thread maps\_anim::_id_1246( var_3, "bahn_tower_parts" );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "compass", "1" );
    level.player maps\_utility::_id_13E2( level.player.origin + ( 0.0, 0.0, 60.0 ), level.player.angles - ( 0.0, 40.0, 0.0 ), 0.5, 0.1 );
    level.player unlink();
    var_0 delete();
    level.player enableweapons();
    level.player freezecontrols( 0 );
    thread _id_72B3();
    maps\_shg_common::_id_1671();
    common_scripts\utility::flag_set( "aftermath_se_complete" );
}

_id_72AE( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "sandman_start_aftermath" );
    thread maps\_anim::_id_1246( var_0, var_1 );
    var_0 maps\_utility::_id_168C( "head_for_building" );
    common_scripts\utility::flag_set( "intro_lone_star_facial_anim_complete" );
}

_id_72AF( var_0, var_1 )
{
    var_2 = 50;
    level.player shellshock( var_0, var_2 );
    common_scripts\utility::flag_wait( var_1 );
    level.player stopshellshock();
}

_id_72B0( var_0, var_1 )
{
    level.player shellshock( var_0, var_1 );
}

_id_72B1()
{
    level.player stopshellshock();
}

_id_72B2()
{
    common_scripts\utility::flag_set( "ambush_after_building_collapse_start" );
    level endon( "intro_sequence_complete" );
    level.player enableinvulnerability();
    thread _id_72B6();
    wait 8.1;
    var_0 = common_scripts\utility::getstruct( "scripted_artillery_spot", "targetname" );
    var_1 = 1.85;
    thread _id_72B9( var_0.origin, undefined, var_1, "artillery_ambush_first_incoming", "artillery_ambush_first_explosion" );
    maps\_utility::delaythread( var_1, ::_id_006F );
    wait 1.5;
    thread _id_72B7();
    wait 13;

    if ( common_scripts\utility::flag( "not_intro" ) )
        thread _id_72B8();

    level.player disableinvulnerability();
}

_id_006F()
{
    _id_006C();
    level.player playrumbleonentity( "heavy_3s" );
    earthquake( 0.5, 0.5, level.player.origin, 512 );
}

_id_72B3()
{
    thread _id_473E( 3, 0.5 );
    wait 0.5;
    thread _id_473E( 1.5, 0.1 );
    wait 0.7;
    thread _id_473E( 3, 0.2 );
    wait 0.4;
    thread _id_473E( 1.3, 0.1 );
    wait 0.3;
    thread _id_473E( 3, 0.3 );
    wait 0.4;
    thread _id_473E( 1, 0.1 );
    wait 0.7;
    thread _id_473E( 0, 3 );
}

_id_72B4()
{
    level._id_4E8F thread _id_72B5( "lone_star_regroup" );
    level._id_71A0 thread _id_72B5( "essex_regroup" );
    level._id_45C4 thread _id_72B5( "truck_regroup" );
    level._id_4E8F maps\_utility::_id_26F7( "patrol_jog" );
    wait 16;
    level._id_4E8F maps\_utility::_id_140C();
}

_id_72B5( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    self.goalradius = 8;
    self setgoalnode( var_1 );
}

_id_72B6()
{
    common_scripts\utility::flag_wait( "entered_building_collapse" );
    level notify( "stop_building_collapse_ambush" );
    common_scripts\utility::array_thread( getentarray( "building_collapse_ambient", "script_noteworthy" ), maps\_utility::_id_2705 );
}

_id_72B7()
{
    level notify( "stop_artillery_ambush" );
    level endon( "stop_artillery_ambush" );
    level endon( "stop_building_collapse_ambush" );
    var_0 = common_scripts\utility::getstructarray( "artillery_explosion", "targetname" );
    var_1 = randomintrange( 3, 6 );
    var_2 = 0;

    for (;;)
    {
        var_2++;

        if ( var_2 != var_1 )
        {
            var_3 = var_0[randomintrange( 0, var_0.size )].origin;
            thread _id_72B9( var_3 );
        }
        else
        {
            var_1 = randomintrange( 3, 6 );
            var_2 = 0;
        }

        wait(randomfloatrange( 0.1, 1.5 ));
    }
}

_id_72B8()
{
    level notify( "stop_artillery_ambush" );
    level endon( "stop_artillery_ambush" );
    level endon( "stop_building_collapse_ambush" );
    var_0 = common_scripts\utility::getstructarray( "artillery_explosion", "targetname" );
    var_1 = randomintrange( 3, 6 );
    var_2 = 0;
    var_3 = getent( "ambush_hurt_player_volume", "targetname" );

    for (;;)
    {
        var_2++;

        if ( var_2 != var_1 )
        {
            if ( level.player istouching( var_3 ) )
            {
                var_4 = anglestoforward( level.player.angles );
                var_5 = var_4 * randomintrange( 200, 300 );
                var_6 = bullettrace( level.player.origin + var_5 + ( 0.0, 0.0, 100.0 ), level.player.origin + var_5 - ( 0.0, 0.0, 1000.0 ), 0 );
                _id_72B9( var_6["position"] );
                earthquake( 0.1, 0.5, level.player.origin, 512 );
                playrumbleonposition( "heavy_3s", level.player.origin );
                level.player dodamage( 50, var_6["position"] );
            }
            else
            {
                var_7 = var_0[randomintrange( 0, var_0.size )].origin;
                thread _id_72B9( var_7 );
            }
        }
        else
        {
            var_1 = randomintrange( 3, 6 );
            var_2 = 0;
        }

        wait(randomfloatrange( 0.1, 1.5 ));
    }
}

_id_72B9( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "artillery";

    if ( !isdefined( var_2 ) )
    {
        var_5 = randomint( 5 );

        if ( var_5 < 4 )
            var_2 = randomfloatrange( 0.25, 0.65 );
        else
            var_2 = randomfloatrange( 0.65, 1.0 );
    }

    if ( !isdefined( var_3 ) )
        var_3 = "artillery_ambush_incoming";

    if ( !isdefined( var_4 ) )
        var_4 = "artillery_ambush_explosion";

    maps\_audio::aud_send_msg( var_3, [ var_0, var_2 ] );
    wait(var_2);
    maps\_audio::aud_send_msg( var_4, var_0 );
    playfx( level._effect[var_1], var_0 );
    earthquake( 0.3, 0.75, var_0, 1024 );
    playrumbleonposition( "heavy_3s", var_0 );
    return var_2;
}

_id_72BA()
{
    level notify( "kill_color_replacements" );
    level notify( "stop_basic_drone_spawner" );
    wait 0.05;
    common_scripts\utility::flag_wait( "player_teleport_after_collapse_complete" );
    var_0 = getent( "parkway_clean_up_vol", "script_noteworthy" );
    var_1 = getaiarray();
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) )
        {
            var_2[var_2.size] = var_4;

            if ( isdefined( var_4._id_0D04 ) && var_4._id_0D04 == 1 )
                var_4 maps\_utility::_id_1902();
        }
    }

    maps\_utility::_id_135B( var_2 );
    maps\_utility::_id_135B( level._id_1FFB["allies"]._id_0C6D );
    maps\_utility::_id_135B( level._id_1FFB["axis"]._id_0C6D );
}

_id_72BB( var_0 )
{
    var_1 = getentarray( "building_collapse_ambient", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_72BC, var_0 );
}

_id_72BC( var_0 )
{
    var_1 = self.animation;
    var_2 = undefined;

    if ( isdefined( var_0 ) && var_0 )
        var_3 = "intro_sequence_complete";
    else
        var_3 = "emerge_door_open";

    switch ( var_1 )
    {
        case "dcburning_elevator_corpse_idle_B":
            var_2 = _id_6C5C( self, "dcburning_elevator_corpse_idle_B" );
            break;
        case "hunted_dying_deadguy_endidle":
            var_2 = _id_6C5C( self, "hunted_dying_deadguy_endidle" );
            break;
        case "death_sitting_pose_v2":
            var_2 = _id_6C5C( self, "death_sitting_pose_v2" );
            break;
        case "paris_npc_dead_poses_v02":
            var_2 = _id_6C5C( self, "paris_npc_dead_poses_v02" );
            break;
        case "paris_npc_dead_poses_v06":
            var_2 = _id_6C5C( self, "paris_npc_dead_poses_v06" );
            break;
        case "paris_npc_dead_poses_v07":
            var_2 = _id_6C5C( self, "paris_npc_dead_poses_v07" );
            break;
        case "dying_crawl":
            if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "double" )
            {
                wait(randomfloatrange( 0.2, 0.5 ));
                var_2 = maps\_utility::_id_166F( 1 );
                var_2.allowdeath = 1;
                var_2._id_0EC0 = 1;
                var_2 endon( "death" );
                var_2 maps\_utility::_id_24F5();
                var_2 maps\_anim::_id_11C2( var_2, "dying_crawl" );
                var_2 maps\_anim::_id_11C2( var_2, "dying_crawl" );
                var_2 maps\_anim::_id_11C2( var_2, "dying_crawl_death_v2" );
                var_2 _id_4BF3();
                break;
            }
            else
            {
                var_2 = maps\_utility::_id_166F( 1 );
                var_2 maps\_utility::_id_24F5();
                var_2.allowdeath = 1;
                var_2._id_0EC0 = 1;
                var_2 endon( "death" );
                var_2 maps\_anim::_id_11C2( var_2, "dying_crawl" );
                var_2 maps\_anim::_id_11C2( var_2, "dying_crawl_death_v1" );
                var_2 _id_4BF3();
                break;
            }
        case "DC_Burning_bunker_stumble":
            var_4 = spawn( "script_origin", self.origin );
            var_4.angles = self.angles;
            var_2 = maps\_utility::_id_166F( 1 );
            var_2.allowdeath = 1;
            var_2._id_0EC0 = 1;
            var_2 endon( "death" );
            var_2 maps\_utility::_id_24F5();
            var_4 maps\_anim::_id_11C2( var_2, "DC_Burning_bunker_stumble" );
            var_2 thread maps\_anim::_id_11C8( var_2, "DC_Burning_bunker_sit_idle", var_3 );
            break;
        case "civilain_crouch_hide_idle":
            var_2 = maps\_utility::_id_166F( 1 );
            var_2.allowdeath = 1;
            var_2._id_0EC0 = 1;
            var_2 endon( "death" );
            var_2 maps\_utility::_id_24F5();
            var_2 thread maps\_anim::_id_11C8( var_2, "civilain_crouch_hide_idle", var_3 );
            break;
        default:
            break;
    }

    if ( isdefined( var_2 ) )
        var_2 thread _id_72BD( var_3 );
}

_id_72BD( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    wait 0.05;

    if ( isdefined( self ) )
    {
        self notify( "stop_loop" );
        maps\_utility::_id_1414();
        self delete();
    }
}

_id_72BE( var_0 )
{
    level endon( "intro_sequence_complete" );
    _id_72BF();
    thread _id_72C3( var_0 );
    level._id_4E8F thread _id_72C0();
    level._id_4E8F thread _id_72C2();
    common_scripts\utility::flag_wait_either( "player_at_ceiling_collapse", "lone_star_at_ceiling_collapse" );

    if ( common_scripts\utility::flag( "player_at_ceiling_collapse" ) )
        common_scripts\utility::flag_set( "collapse_roof" );
    else
        maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "collapse_roof" );
}

_id_72BF()
{
    var_0 = getentarray( "collapse_building_roof_fall", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();
}

_id_72C0()
{
    self endon( "death" );
    self endon( "intro_sequence_complete" );

    if ( !common_scripts\utility::flag( "player_at_ceiling_collapse" ) )
    {
        common_scripts\utility::flag_wait( "player_near_ceiling_collapse" );
        var_0 = getnode( "ceiling_collapse_node", "targetname" );
        thread _id_72C1( var_0, "ceiling_collapse" );
    }

    common_scripts\utility::flag_wait( "lone_star_at_ceiling_collapse" );

    if ( !common_scripts\utility::flag( "player_at_ceiling_collapse" ) )
    {
        var_1 = common_scripts\utility::getstruct( "fallen_building_ceiling_collapse", "targetname" );
        maps\_utility::_id_123B();
        maps\_utility::_id_26BF( "path_post_ceiling_collapse" );
        var_1 maps\_anim::_id_124A( self, "roof_collapse" );
        var_2 = getanimlength( maps\_utility::_id_127E( "roof_collapse", self._id_1032 ) );
        var_1 thread maps\_anim::_id_1247( self, "roof_collapse" );
        wait(var_2 - 0.5);
        maps\_utility::_id_109B();
        maps\_utility::_id_2686();
    }

    common_scripts\utility::flag_set( "ceiling_collapse_complete" );
}

_id_72C1( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_1 ) )
        level endon( var_1 );

    var_2 = self.goalradius;
    self.goalradius = 8;
    maps\_utility::_id_2053( var_0 );
    self waittill( "goal" );

    if ( isdefined( var_2 ) )
        maps\_utility::_id_2724( var_2 );
}

_id_72C2()
{
    level endon( "intro_sequence_complete" );
    _id_7338( "trig_lone_star_enter_collapsed_building" );
    common_scripts\utility::flag_set( "lone_star_at_ceiling_collapse" );
}

_id_72C3( var_0 )
{
    level endon( "collapse_fx_stop" );
    common_scripts\utility::flag_wait( "collapse_roof" );
    var_1 = common_scripts\utility::getstruct( "ceiling_collapse_org", "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = vectortoangles( var_2.origin - var_1.origin );
    var_4 = distance( var_1.origin, var_2.origin );
    var_5 = anglestoforward( var_3 );
    var_6 = common_scripts\utility::getstruct( "ceiling_collapse_org2", "targetname" );
    var_7 = common_scripts\utility::getstruct( var_6.target, "targetname" );
    var_8 = vectortoangles( var_7.origin - var_6.origin );
    var_9 = distance( var_6.origin, var_7.origin );
    var_10 = anglestoforward( var_8 );
    common_scripts\utility::exploder( 10105 );
    var_11 = getentarray( "collapse_building_roof_fall", "targetname" );
    thread _id_72C4( var_0 );
    earthquake( 0.5, 3.5, var_1.origin, 850 );
    level.player playrumbleonentity( "heavy_3s" );
    maps\_audio::aud_send_msg( "ceiling_collapse_begins" );
    wait 3.0;

    foreach ( var_13 in var_11 )
        var_13 show();
}

_id_72C4( var_0 )
{
    var_1 = getentarray( "ceiling_collapse_anim_large", "targetname" );
    var_2 = getentarray( "ceiling_collapse_anim_small1", "targetname" );
    var_3 = getentarray( "ceiling_collapse_anim_small2", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_72C5, ( 0.0, 0.0, 20.0 ), 0, var_0 );
    common_scripts\utility::array_thread( var_3, ::_id_72C5, ( 0.0, 0.0, 30.0 ), 0, var_0 );
    common_scripts\utility::array_thread( var_1, ::_id_72C5, ( 0.0, 0.0, -35.0 ), 0.25, var_0 );
}

_id_72C5( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    self rotateto( self.angles - var_0, 0.5, 0.5, 0 );
    wait 5;
    self hide();

    if ( var_2 )
    {
        common_scripts\utility::flag_wait( "intro_sequence_complete" );
        self.angles += var_0;
        wait 0.05;
        self show();
    }
}

_id_72C6( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "collapse_fx_stop" );
    var_5 = spawnstruct();
    var_5 endon( "stop" );
    var_5 maps\_utility::delaythread( var_4, maps\_utility::_id_1DAA, "stop" );
    var_6 = common_scripts\utility::getfx( var_3 );
    var_7 = 0.5;

    for (;;)
    {
        var_8 = var_0 + var_1 * randomfloat( var_2 );
        playfx( var_6, var_8 );
        wait(var_7);
        var_7 -= 0.35;

        if ( var_7 < 0.5 )
            var_7 = 0.5;
    }
}

_id_72C7()
{
    level endon( "intro_sequence_complete" );
    common_scripts\utility::array_thread( level.heroes, ::_id_72C8 );
    common_scripts\utility::array_thread( level.heroes, ::_id_72CA );
    var_0 = common_scripts\utility::getstruct( "fallen_building_slide_org", "targetname" );
    common_scripts\utility::flag_wait( "not_intro" );
    common_scripts\utility::array_thread( level.heroes, ::_id_72CD, var_0 );
    level._id_4E8F thread _id_72CF();
    level._id_4E8F thread _id_72DC( "lone_star_at_emerge_door" );
    level._id_45C4 thread _id_72DC( "truck_at_emerge_door" );
}

_id_72C8()
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    _id_7338( "trig_lone_star_enter_collapsed_building" );
    thread _id_72C9();
}

_id_72C9()
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    maps\_utility::_id_109B();
    common_scripts\utility::flag_wait( "building_traverse_end" );
    maps\_utility::_id_109E();
}

_id_72CA()
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    _id_7338( "traverse_building_begin_force_crouch" );
    thread _id_72CB();
    _id_7338( "traverse_building_end_force_crouch" );
    self notify( "traverse_end_crouch_walk" );
}

_id_72CB()
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    self notify( "begin_crouching" );
    var_0 = self._id_0FC6;
    thread _id_72CC( var_0 );
    maps\_utility::_id_109E();
    self._id_0FC6 = 1.1;
    maps\_anim::_id_1246( self, "cqb_to_ventwalk" );
    maps\_utility::_id_26F7( "ventwalk" );
}

_id_72CC( var_0 )
{
    self waittill( "traverse_end_crouch_walk" );
    maps\_utility::_id_140C();

    if ( isdefined( var_0 ) )
        self._id_0FC6 = var_0;

    maps\_utility::_id_109B();
    thread maps\berlin_util::_id_4E96();
    self notify( "done_crouching" );
}

_id_72CD( var_0 )
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    _id_7338( "traverse_building_begin_slide" );
    _id_72CE( var_0 );
    wait 0.05;
}

_id_72CE( var_0 )
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    maps\berlin_util::_id_4E98();
    self notify( "begin_sliding" );
    var_1 = self._id_0FC6;
    self._id_0FC6 = 1;
    var_0 maps\_anim::_id_124A( self, "slide" );
    var_0 maps\_anim::_id_1247( self, "slide" );
    thread maps\berlin_util::_id_4E96();
    maps\_utility::_id_2686();
    self._id_0FC6 = var_1;
    self notify( "sliding_complete" );
}

_id_72CF()
{
    self endon( "death" );
    level endon( "intro_sequence_complete" );
    var_0 = getent( "fallen_building_patrol_360_turn", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    _id_7338( "fallen_building_patrol_360_turn" );
    maps\berlin_util::_id_4E98();
    var_2 = getanimlength( maps\_utility::_id_127E( "patrol_jog_360_once", self._id_1032 ) );
    var_1 maps\_anim::_id_124A( self, "patrol_jog_360_once" );
    var_1 thread maps\berlin_util::_id_4E9B( self, "patrol_jog_360_once" );
    thread _id_72D0();
    wait(var_2 - 0.23);
    self stopanimscripted();
    var_1 notify( "patrol_jog_360_once" );
    wait 0.6;
    maps\_utility::_id_2686();
    thread maps\berlin_util::_id_4E96();
    self notify( "patrol_jog_360_complete" );
}

_id_72D0()
{
    self endon( "death" );
    maps\_utility::_id_123B();
    var_0 = getnode( "path_lone_star_post_360_jog", "targetname" );
    maps\_utility::_id_1237( var_0.origin );
    maps\_utility::_id_2724( 30 );
}

_id_72D1()
{
    thread _id_711F( "beam_fall_trigger", 1 );
    thread _id_711F( "ibeam_fall_trigger", 3, "heavy_3s" );
    thread _id_711F( "ibeam_fall2_trigger", 3, "heavy_3s" );
    thread _id_711F( "ceiling_fall_trigger", 1 );
    thread _id_72D7( "falling_office_objects_trigger" );
    thread _id_72D7( "falling_office_objects_trigger2" );
}

_id_72D2( var_0 )
{
    level endon( "intro_sequence_complete" );

    if ( !isdefined( level._id_72D3 ) )
        level._id_72D3 = getent( "building_falling_column", "targetname" );

    level._id_72D3._id_1032 = "berlin_falling_column";
    level._id_72D3 maps\_utility::_id_2629( "berlin_falling_column" );
    var_1 = common_scripts\utility::getstruct( "building_falling_column_org", "targetname" );
    var_1 thread maps\_anim::_id_11CF( level._id_72D3, "falling_column" );
    _id_72D4();
    maps\_audio::aud_send_msg( "building_falling_column", level._id_72D3 );

    if ( var_0 )
        thread _id_72D5( var_1 );

    _id_72D6( var_1 );
}

_id_72D4()
{
    level endon( "intro_sequence_complete" );
    common_scripts\utility::flag_wait( "sandman_start_aftermath" );

    for (;;)
    {
        var_0 = maps\_utility::_id_262C( "building_falling_column_trig" );

        if ( var_0 == level._id_4E8F || var_0 == level.player )
            break;

        wait 0.05;
    }
}

_id_72D5( var_0 )
{
    common_scripts\utility::flag_wait( "intro_sequence_complete" );
    level._id_72D3 maps\_utility::_id_1414();
    wait 0.1;
    level._id_72D3 delete();
    level._id_72D3 = spawn( "script_model", var_0.origin );
    level._id_72D3 setmodel( "concrete_column_collapse" );
}

_id_72D6( var_0 )
{
    level._id_72D3 thread maps\berlin_fx::_id_4EAF();
    var_1 = common_scripts\utility::getstruct( "building_falling_column_artillery", "targetname" );
    playfx( level._effect["artillery"], var_1.origin );
    var_0 maps\_anim::_id_1246( level._id_72D3, "falling_column" );
    common_scripts\utility::flag_set( "falling_column_fell" );
}

_id_72D7( var_0 )
{
    level endon( "building_traverse_end" );
    var_1 = getent( var_0, "targetname" );
    var_1 waittill( "trigger" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    maps\_audio::aud_send_msg( "aftermath_falling_object", [ var_0, var_1 ] );
    playfx( common_scripts\utility::getfx( "falling_objects" ), var_2.origin );
}

_id_711F( var_0, var_1, var_2 )
{
    level endon( "end_current_object_fall_threads" );
    var_3 = getent( var_0, "targetname" );
    var_4 = getent( var_3.target, "targetname" );
    var_5 = undefined;
    var_6 = getentarray( var_4.target, "targetname" );

    if ( isdefined( var_6 ) )
    {
        foreach ( var_8 in var_6 )
        {
            if ( isdefined( var_8.script_noteworthy ) && var_8.script_noteworthy == "center_mass" )
            {
                var_5 = var_8;
                continue;
            }

            var_8 linkto( var_4 );
        }
    }

    var_10 = common_scripts\utility::getstruct( var_4.target, "targetname" );

    if ( !isdefined( var_5 ) )
        var_5 = var_4;

    var_11 = var_5.origin[2] - var_10.origin[2];
    var_12 = sqrt( var_11 / 39.3701 / 4.9 );
    var_13 = randomfloatrange( 0.2, 0.3 );
    var_3 waittill( "trigger" );

    if ( var_12 > 0 )
    {
        maps\_audio::aud_send_msg( "aftermath_falling_object", [ var_0, var_4 ] );
        wait 0.3;

        if ( isdefined( var_1 ) )
        {
            earthquake( var_13, var_1, level.player.origin, 500 );

            if ( !isdefined( var_2 ) )
                var_2 = "light_1s";

            playrumbleonposition( var_2, var_10.origin );
        }

        wait 0.3;
        thread _id_7120( var_10 );
        var_4 rotateto( var_10.angles, var_12, var_12, 0 );
        var_4 moveto( var_10.origin, var_12, var_12, 0 );

        if ( isdefined( var_10._id_164F ) )
        {
            wait(var_12);
            playfx( common_scripts\utility::getfx( var_10._id_164F ), var_10.origin );
        }
    }
}

_id_7120( var_0 )
{
    if ( isdefined( var_0.target ) )
    {
        var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );

        if ( isdefined( var_1.target ) )
            thread _id_7120( var_1 );

        if ( isdefined( var_1.script_delay ) )
            wait(var_1.script_delay);

        var_2 = "rock_falling";

        if ( isdefined( var_1._id_164F ) )
            var_2 = var_1._id_164F;

        playfx( common_scripts\utility::getfx( var_2 ), var_1.origin );
        maps\_audio::aud_send_msg( "building_shake_rock_falling", var_1.origin );
    }
}

_id_72D9()
{
    var_0 = common_scripts\utility::getstructarray( "random_shake_vfx_loc", "script_noteworthy" );
    level endon( "building_traverse_end" );

    for (;;)
    {
        wait 0.05;
        var_1 = randomfloatrange( 1.0, 2.0 );
        var_2 = randomfloatrange( 4.0, 6.0 );
        var_3 = randomfloatrange( 0.1, 0.25 );
        var_4 = 0;

        if ( var_3 >= 0.17 )
        {
            maps\_audio::aud_send_msg( "building_shake_rumble_lg" );
            var_4 = 1;
        }
        else if ( var_3 >= 0.13 )
        {
            maps\_audio::aud_send_msg( "building_shake_rumble_med" );
            var_4 = 0;
        }
        else if ( var_3 >= 0.1 )
        {
            maps\_audio::aud_send_msg( "building_shake_rumble_sm" );
            var_4 = 0;
        }

        wait 0.3;
        earthquake( var_3, var_1, level.player.origin, 500 );

        if ( isdefined( var_0 ) && var_4 == 1 )
        {
            wait 0.3;
            thread _id_72DA( var_0 );
        }

        wait(var_2);
    }
}

_id_72DA( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( maps\_utility::within_fov( level.player.origin, level.player.angles, var_2.origin, cos( 45 ) ) == 0 )
            var_0 = common_scripts\utility::array_remove( var_0, var_2 );
    }

    var_4 = maps\_utility::_id_0AE9( level.player.origin, var_0 );

    if ( isdefined( var_4 ) )
    {
        if ( isdefined( var_4.script_delay ) )
            wait(var_4.script_delay);

        playfx( common_scripts\utility::getfx( "postcollapse_falling_dirt_camShk" ), var_4.origin );
        maps\_audio::aud_send_msg( "building_shake_dirt_debris", var_4.origin );
    }
}

_id_72DB()
{
    var_0 = getent( "traverse_building_tank_corpse", "targetname" );
    var_1 = common_scripts\utility::getstruct( "traverse_building_tank_corpse_org", "targetname" );
    var_0 thread _id_6C5C( var_1, "tank_corpse", "clean_up_tank_corpse" );
    thread maps\berlin_fx::_id_4EB7();
}

_id_72DC( var_0 )
{
    level endon( "intro_sequence_complete" );
    _id_7338( "trig_lone_star_at_emerge_door" );
    common_scripts\utility::flag_set( var_0 );
}

_id_72DD()
{
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    thread _id_72DE();
}

_id_72DE()
{
    common_scripts\utility::flag_wait( "emerge_door_begin_open" );
    thread _id_4618();
    common_scripts\utility::flag_wait( "player_top_of_hotel_stairwell" );
    level notify( "stop_cinematic" );
    stopcinematicingame();
}

_id_4618()
{
    level endon( "stop_cinematic" );

    for (;;)
    {
        cinematicingameloopresident( "berlin_tvanamorphic" );
        wait 5;

        while ( iscinematicplaying() )
            wait 1;
    }
}

_id_72DF()
{
    thread _id_7300();
    thread _id_7302( "emerge_friendlies_advance", "emerge_dudes_dead" );
    thread _id_72E0();
    thread _id_72FF();
}

_id_72E0()
{
    var_0 = getentarray( "emerge_combat_wave_1", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_72E1 );
    common_scripts\utility::flag_wait( "emerge_door_in_position" );
    maps\_utility::_id_272B( var_0, 1 );
}

_id_72E1()
{
    self endon( "death" );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "emerge_door_open" );
    wait 1.7;
    self.ignoreall = 0;
}

_id_72FF()
{
    common_scripts\utility::flag_wait( "emerge_dudes_dead" );
    var_0 = getentarray( "emerge_combat_wave_2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F, 1 );
}

_id_7300()
{
    common_scripts\utility::flag_wait( "building_traverse_end" );
    common_scripts\utility::flag_wait( "lone_star_at_emerge_door" );
    common_scripts\utility::array_thread( level.heroes, maps\berlin_util::_id_4E98 );
    common_scripts\utility::array_thread( level.heroes, ::_id_7347, "emerge_door_open" );
    wait 0.05;
    var_0 = common_scripts\utility::getstruct( "emerge_essex_open_door", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_4E8F, "emerge_open_door" );
    common_scripts\utility::flag_set( "emerge_door_in_position" );
    var_1 = getentarray( "emerge_exit_door", "targetname" );
    var_0 thread maps\_anim::_id_1246( level._id_4E8F, "emerge_open_door" );
    common_scripts\utility::flag_wait( "emerge_door_begin_open" );
    thread maps\berlin_fx::_id_4EB8();
    var_2 = getent( "emerge_exit_door", "targetname" );
    var_2 _id_7319( 110 );
    common_scripts\utility::flag_set( "emerge_door_open" );
    level._id_4E8F thread _id_6E35( "lone_star_wait_after_emerge" );
    maps\_utility::_id_1425( "emerge_01" );
}

_id_6E35( var_0 )
{
    self endon( "death" );
    var_1 = self.goalradius;
    maps\_utility::_id_2724( 8 );
    var_2 = getnode( var_0, "targetname" );
    self setgoalnode( var_2 );
    wait 0.05;
    maps\_utility::_id_2688();
    self waittill( "goal" );
    maps\_utility::_id_2724( var_1 );
}

_id_7301()
{
    var_0 = getentarray( "emerge_exit_door", "targetname" );
    var_1 = getentarray( "emerge_exit_attachments", "targetname" );
    var_2 = var_0[0];
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        if ( var_5 != var_0[0] )
            var_3[var_3.size] = var_5;
    }

    foreach ( var_8 in var_3 )
        var_8 linkto( var_2 );

    foreach ( var_11 in var_1 )
        var_11 linkto( var_2 );

    var_2 _id_7319( 110 );
    common_scripts\utility::flag_set( "emerge_door_open" );
}

_id_486F( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( isdefined( var_2 ) )
        level endon( var_2 );

    var_3 = undefined;

    if ( isdefined( self.accuracy ) )
        var_3 = self.accuracy;

    if ( !isdefined( var_0 ) )
        var_0 = 0.25;

    self.accuracy *= var_0;

    if ( isdefined( var_1 ) )
    {
        common_scripts\utility::flag_wait( var_1 );

        if ( isdefined( var_3 ) )
            self.accuracy = var_3;
    }
}

_id_7302( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_1 );
    var_2 = getent( var_0, "targetname" );

    if ( isdefined( var_2 ) )
        maps\_utility::_id_26BF( var_0 );
}

_id_7303()
{
    level._id_7304 = maps\_vehicle::_id_2A9A( "last_stand_tank" );
    maps\_audio::aud_send_msg( "last_stand_tanks", level._id_7304 );
    level._id_7305 = maps\_vehicle::_id_2881( "scripted_last_stand_tank" );
    maps\_audio::aud_send_msg( "last_stand_tank_scripted", level._id_7305 );
    level._id_7305 thread _id_7306();
    thread _id_7309();
    thread _id_730C( level._id_7305 );
    maps\_utility::delaythread( 3, maps\_utility::_id_272C, "ending_north_spawn", 1 );
    var_0 = getentarray( "stairwell_target_loc", "targetname" );
    var_1 = getentarray( "last_stand_stairwell_shooters", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_7212, var_0, "player_looking_at_door_to_stairwell" );
    wait 3.5;
    maps\_utility::_id_1425( "last_stand_1" );
    wait 3;
    maps\_utility::_id_1425( "last_stand_2" );
    wait 1.5;
}

_id_7306()
{
    self endon( "death" );
    self endon( "stop_firing" );
    level endon( "stop_firing" );
    var_0 = getent( "hotel_scripted_tank_fire", "targetname" );
    self setturrettargetent( var_0 );
    common_scripts\utility::flag_wait( "hotel_scripted_tank_fire" );
    wait 0.05;
    self fireweapon();
    thread _id_7307();
}

_id_7307()
{
    self endon( "death" );
    self endon( "stop_firing" );
    level endon( "stop_firing" );
    self._id_7308 = getentarray( self.script_noteworthy, "script_noteworthy" );
    _id_730B();
    level._id_7304 = maps\_utility::_id_0BC3( level._id_7304, self );

    if ( common_scripts\utility::flag( "last_stand_tanks_stopped_firing" ) )
        thread _id_7309();
}

_id_7309()
{
    level endon( "stop_firing" );

    foreach ( var_1 in level._id_7304 )
        var_1._id_7308 = getentarray( var_1.script_noteworthy, "script_noteworthy" );

    var_3 = undefined;

    for (;;)
    {
        level._id_7304 = maps\_utility::_id_0B53( level._id_7304 );

        foreach ( var_1 in level._id_7304 )
        {
            if ( isdefined( var_1 ) && isalive( var_1 ) )
            {
                var_3 = var_1;
                break;
            }
            else
            {
                common_scripts\utility::array_remove( level._id_7304, var_1 );

                if ( level._id_7304.size <= 0 )
                {
                    common_scripts\utility::flag_set( "last_stand_tanks_stopped_firing" );
                    return;
                }
            }
        }

        if ( isdefined( var_3 ) && isalive( var_3 ) )
            var_3 _id_730A();

        wait(randomfloatrange( 5, 6 ));
    }
}

_id_730A()
{
    self endon( "death" );
    self endon( "stop_firing" );
    level endon( "stop_firing" );
    thread _id_730B();
    wait(randomfloatrange( 2, 3 ));
    self fireweapon();
}

_id_730B()
{
    self endon( "death" );
    self endon( "stop_firing" );
    level endon( "stop_firing" );

    for (;;)
    {
        var_0 = maps\_utility::_id_0B53( self._id_7308 );

        if ( self vehicle_canturrettargetpoint( var_0[0].origin ) )
        {
            self setturrettargetent( var_0[0], ( randomintrange( -64, 64 ), randomintrange( -64, 64 ), randomintrange( -16, 100 ) ) );
            break;
        }

        wait 0.05;
    }
}

_id_730C( var_0 )
{
    var_1 = getent( "last_stand_kill_player", "targetname" );
    level._id_7304 = common_scripts\utility::array_remove( level._id_7304, var_0 );
    _id_730D( var_0, var_1, "last_stand_kill_player_trig", ::_id_7307, "reverse_breach_start", &"BERLIN_LAST_STAND_FAIL" );
}

_id_730D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        level endon( var_4 );

    for (;;)
    {
        if ( level.player istouching( var_1 ) )
        {
            if ( isdefined( var_0 ) && isalive( var_0 ) )
            {
                var_0 notify( "stop_firing" );
                var_0 setturrettargetent( level.player, ( 0.0, 0.0, 20.0 ) );
                var_0 thread _id_730E();
            }

            _id_730F( var_1, var_2 );

            if ( common_scripts\utility::flag( "tank_killed_player" ) )
            {
                if ( isdefined( var_5 ) )
                {
                    setdvar( "ui_deadquote", var_5 );
                    maps\_utility::_id_1826();
                }

                level.player kill();
            }
            else if ( isdefined( var_0 ) && isalive( var_0 ) && isdefined( var_3 ) )
                var_0 thread [[ var_3 ]]();
        }

        wait 0.1;
    }
}

_id_730E()
{
    level endon( "player_not_in_tank_kill_volume" );
    self endon( "death" );
    common_scripts\utility::flag_wait_or_timeout( "tank_killed_player", 5 );

    if ( isdefined( self ) )
    {
        self fireweapon();
        wait 0.5;
    }
}

_id_730F( var_0, var_1 )
{
    level endon( "player_not_in_tank_kill_volume" );
    thread _id_7310( var_0 );
    thread _id_7311( var_1, "tank_killed_player" );
    common_scripts\utility::flag_wait( "tank_killed_player" );
}

_id_7310( var_0 )
{
    level endon( "tank_killed_player" );

    while ( level.player istouching( var_0 ) )
        wait 0.05;

    level notify( "player_not_in_tank_kill_volume" );
    return;
}

_id_7311( var_0, var_1 )
{
    level endon( "player_not_in_tank_kill_volume" );
    maps\_utility::_id_262C( var_0 );
    common_scripts\utility::flag_set( var_1 );
}

_id_7312()
{
    common_scripts\utility::flag_wait( "player_reached_lower_floor_hotel" );
    common_scripts\utility::array_thread( level.heroes, ::_id_7313, 0 );
    common_scripts\utility::flag_wait( "player_looking_at_door_to_stairwell" );
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_109E );
    common_scripts\utility::array_thread( level.heroes, ::_id_5F09, 1 );
    _id_7315();
    common_scripts\utility::array_thread( level.heroes, ::_id_7313, 1 );
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_2688 );
    common_scripts\utility::array_thread( level.heroes, ::_id_460E );
    level._id_4E8F maps\_utility::_id_13A4( "o" );
    level._id_71A0 maps\_utility::_id_13A4( "r" );
    level._id_45C4 maps\_utility::_id_13A4( "y" );
    maps\_utility::_id_26BF( "last_stand_stairwell_wait" );
    common_scripts\utility::array_thread( level.heroes, ::_id_7314 );
    common_scripts\utility::flag_wait( "player_top_of_hotel_stairwell" );
    maps\_audio::aud_send_msg( "mus_player_at_top_of_hotel_stairwell" );
    thread _id_7318();
    maps\_utility::_id_1425( "run_up_to_roof_01" );
    level notify( "stop_firing" );
    level._id_4E8F maps\_utility::_id_13A4( "o" );
    level._id_71A0 maps\_utility::_id_13A4( "r" );
    level._id_45C4 maps\_utility::_id_13A4( "r" );
    maps\_utility::_id_26BF( "exfil_hall_color_trig_01" );
    wait 2;
    maps\_utility::_id_26BF( "exfil_hall_color_trig_02" );
}

_id_7313( var_0 )
{
    self.allowpain = var_0;
}

_id_7314()
{
    _id_7338( "trig_ally_last_stand_door_kick_2" );
    thread maps\_utility::_id_109B();
    thread _id_460C();
}

_id_7315()
{
    thread _id_7317();
    var_0 = common_scripts\utility::getstruct( "door_hotel_stairs_restaurant_point", "targetname" );
    var_1 = level._id_4E8F;
    var_2 = getent( "door_hotel_stairs_restaurant", "targetname" );
    var_0 maps\_anim::_id_124A( var_1, "doorkick_2_cqbrun" );
    var_0 thread _id_0070( var_1, "doorkick_2_cqbrun" );
    thread maps\berlin_fx::_id_4EB9();
    maps\_audio::aud_send_msg( "last_stand_door_kick", var_2 );
    wait 0.5;
    var_2 thread _id_7316();
}

_id_0070( var_0, var_1 )
{
    var_0 pushplayer( 1 );
    maps\_anim::_id_1248( var_0, var_1 );
    var_0 pushplayer( 0 );
}

_id_7316()
{
    _id_7319();
    common_scripts\utility::flag_set( "door_hotel_stairs_1_open" );
}

_id_7317()
{
    level._id_45C4 maps\_utility::_id_123B();
    var_0 = getnode( "open_first_door_truck_wait", "targetname" );
    level._id_45C4.goalradius = 10;
    level._id_45C4 setgoalnode( var_0 );
}

_id_460E()
{
    self._id_4B64 = 0;
    self.ignoreall = 1;
    self._id_100A = 1;
    self.ignoresuppression = 1;
    self._id_460D = self.suppressionwait;
    self.suppressionwait = 0;
    maps\_utility::_id_0EEC();
    self.ignorerandombulletdamage = 1;
    maps\_utility::_id_2714();
    maps\_utility::_id_1057();
    maps\_utility::_id_280D();
    self.grenadeawareness = 0;
    self.ignoreme = 1;
    maps\_utility::_id_27CC();
    self._id_1106 = 1;
}

_id_4BF4()
{
    return self._id_4B64;
}

_id_460C()
{
    self._id_4B64 = 1;
    self.ignoreall = 0;
    self._id_100A = undefined;
    self.ignoresuppression = 0;
    self.suppressionwait = self._id_460D;
    self._id_460D = undefined;
    maps\_utility::_id_27B8();
    self.ignorerandombulletdamage = 0;
    maps\_utility::_id_2715();
    maps\_utility::_id_1071();
    self.grenadeawareness = 1;
    self.ignoreme = 0;
    maps\_utility::_id_27CD();
    self._id_1106 = undefined;
}

_id_7318()
{
    var_0 = maps\_utility::_id_272B( getentarray( "exfil_rus_3", "script_noteworthy" ) );
}

_id_7319( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = -120;

    if ( !isdefined( var_1 ) )
        var_1 = 0.5;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0.5;

    if ( isdefined( self.target ) )
    {
        var_4 = getentarray( self.target, "targetname" );

        foreach ( var_6 in var_4 )
            var_6 linkto( self );
    }

    self rotateto( self.angles + ( 0, var_0, 0 ), var_1, var_2, var_3 );
    self waittill( "rotatedone" );
    self connectpaths();
}

_id_731A( var_0, var_1, var_2, var_3 )
{
    magicgrenade( var_0, var_1, var_2, var_3 );
}

_id_731B()
{
    var_0 = getentarray( "breach_fx", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4CCD );
    thread _id_731D();
}

_id_731C( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    maps\_utility::_id_123B();
    level._id_4E8F maps\_utility::_id_2053( var_1 );
    maps\_utility::_id_109E();
}

_id_731D()
{
    var_0 = common_scripts\utility::getstruct( "reverse_breach_anim_point", "targetname" );
    var_1 = _id_7323();
    thread maps\berlin_fx::_id_4EB4( var_1 );
    var_2 = _id_7324();
    var_2 = maps\_utility::_id_0BC3( var_2, var_1 );
    var_0 thread maps\_anim::_id_11D6( var_2, "reverse_breach_idle" );
    common_scripts\utility::flag_wait_or_timeout( "exfil_hallway_dudes_dead", 15 );
    common_scripts\utility::flag_set( "exfil_hallway_dudes_dead" );
    var_0 maps\_anim::_id_124A( level._id_4E8F, "reverse_breach_guy_enter" );
    var_0 maps\_anim::_id_1246( level._id_4E8F, "reverse_breach_guy_enter" );
    var_0 thread maps\_anim::_id_124E( level._id_4E8F, "reverse_breach_stand_idle", "stop_ground_dudes_idle" );
    common_scripts\utility::flag_set( "reverse_breach_ready" );
    thread _id_731F();
    common_scripts\utility::flag_wait( "trigger_start_reverse_breach" );
    maps\_audio::aud_send_msg( "reverse_breach_start" );
    maps\_shg_common::_id_1670();
    _id_7320();
    common_scripts\utility::flag_set( "reverse_breach_start" );
    var_3 = maps\_utility::_id_1287( "player_rig", var_0.origin );
    var_3 hide();
    level._id_731E = maps\_utility::_id_1287( "reverse_breach_player_body", var_0.origin );
    level._id_731E hide();
    level._id_731E._id_1032 = "reverse_breach_player_body";
    var_4 = maps\_utility::_id_1287( "reverse_breach_gun", var_0.origin );
    var_4 hidepart( "TAG_SILENCER" );
    var_4._id_1032 = "reverse_breach_gun";
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_2612, 1 );
    var_5 = [];
    var_5[0] = var_3;
    var_5[1] = level._id_731E;
    var_5[2] = var_4;
    var_5[3] = level._id_4E8F;
    var_0 maps\_anim::_id_11BF( var_5, "reverse_breach" );
    var_3 maps\_utility::_id_270A( level.player, "tag_player", 0.5, 1, 50, 50, 25, 5 );
    level.player playerlinktodelta( var_3, "tag_player", 1, 50, 50, 25, 5 );
    var_3 common_scripts\utility::delaycall( 0.6, ::show );
    level._id_731E common_scripts\utility::delaycall( 0.6, ::show );
    var_6 = getent( "reverse_breach_door_collision", "targetname" );
    var_6 connectpaths();
    var_6 delete();
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "hud_showStance", "0" );
    level.player allowads( 0 );
    level._id_4E8F maps\_utility::_id_1414();
    var_0 notify( "stop_ground_dudes_idle" );
    var_0 maps\_anim::_id_11DD( var_5, "reverse_breach" );

    if ( !common_scripts\utility::flag( "reverse_breach_complete" ) )
        var_0 thread maps\_anim::_id_11D6( var_5, "reverse_breach_idle", "stop_breach_actor_idle" );

    common_scripts\utility::flag_wait( "reverse_breach_complete" );
    wait 0.5;
    level._id_71A0.ignoreall = 0;
    level._id_45C4.ignoreall = 0;
    level.player disableweapons();
    level._id_4E8F maps\_utility::_id_1414();
    var_0 notify( "stop_breach_actor_idle" );
    maps\_audio::aud_send_msg( "reverse_breach_getup" );
    var_0 thread maps\_anim::_id_11DD( var_2, "reverse_breach_getup" );
    var_0 thread _id_7327( level._id_4E8F );
    var_7 = [];
    var_7[0] = level._id_71A0;
    var_0 thread _id_7328( var_7 );
    var_8 = [];
    var_8[0] = var_3;
    var_8[1] = level._id_731E;
    var_0 maps\_anim::_id_11BF( var_8, "reverse_breach_getup" );
    var_9 = ( -14.35, -1.056, -2.094 );
    var_10 = ( 7.341, 171.453, -82.298 );
    var_4 linkto( var_3, "j_wrist_ri", var_9, var_10 );
    var_11 = getanimlength( maps\_utility::_id_127E( "reverse_breach_getup", "player_rig" ) );
    thread maps\_utility::_id_273C( 6.16, 40 );
    var_0 thread maps\_anim::_id_11DD( var_8, "reverse_breach_getup" );
    level.player playerlinktoblend( var_3, "tag_player", 0.5 );
    maps\_utility::delaythread( 5, ::_id_7321 );
    maps\_utility::delaythread( 7.9, ::_id_7322 );
    wait(var_11);
    level.player allowads( 1 );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "compass", "1" );
    setsaveddvar( "g_friendlyNameDist", 15000 );
    var_4 delete();
    level.player unlink();
    maps\_shg_common::_id_1671();
    var_3 delete();
    level._id_731E delete();
    common_scripts\utility::flag_set( "reverse_breach_player_back_in_business" );
}

_id_731F()
{
    var_0 = getent( "reverse_breach_trig", "script_noteworthy" );
    var_0 sethintstring( &"BERLIN_BREACH_HINT" );
    common_scripts\utility::flag_wait( "trigger_start_reverse_breach" );
    var_0 delete();
}

_id_7320()
{
    var_0 = getweaponarray();

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
            var_2 delete();
    }
}

_id_7321()
{
    maps\_audio::aud_send_msg( "reverse_breach_getup_slowmo" );
    common_scripts\utility::flag_set( "reverse_breach_getup_slowmo_start" );
    maps\_utility::_id_2772( 0.5 );
    maps\_utility::_id_2774( 0.3 );
    maps\_utility::_id_2775();
}

_id_7322()
{
    maps\_audio::aud_send_msg( "reverse_breach_getup_regular_speed" );
    maps\_utility::_id_0A16( 0.3 );
    maps\_utility::_id_0A17();
}

_id_7323()
{
    var_0 = maps\_vehicle::_id_2A99( "enemy_heli_exfil" );
    var_0._id_1032 = "heli";
    var_0.mgturret[0] hide();
    maps\_audio::aud_send_msg( "spawn_reverse_breach_heli", var_0 );
    return var_0;
}

_id_7324()
{
    var_0 = [];
    var_1 = getent( "pres_daughter", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_7326, "girl" );
    var_2 = var_1 maps\_utility::_id_166F( 1 );
    level._id_7325 = var_2;
    level._id_7325._id_1032 = "alena";
    var_3 = getent( "exfil_rus_2", "script_noteworthy" );
    var_3 setspawnerteam( "neutral" );
    var_3 maps\_utility::add_spawn_function( ::_id_7326, "guy_2" );
    var_4 = var_3 maps\_utility::_id_166F( 1 );
    var_4 maps\_utility::_id_24F5();
    var_4.team = "neutral";
    var_0 = [];
    var_0[0] = var_2;
    var_0[1] = var_4;
    return var_0;
}

_id_7326( var_0 )
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    maps\_utility::_id_0D04();
    self._id_1032 = var_0;
}

_id_7327( var_0, var_1 )
{
    maps\_anim::_id_1246( var_0, "reverse_breach_getup", var_1 );
    var_0 thread maps\_utility::_id_168C( "berlin_cby_cantriskit" );
    maps\_anim::_id_1246( var_0, "reverse_breach_end_1", var_1 );
    var_0 thread maps\_utility::_id_168C( "berlin_cby_welosther" );
    maps\_anim::_id_1246( var_0, "reverse_breach_end_2", var_1 );
}

_id_45FD( var_0 )
{
    var_1 = level.scr_sound[self._id_1032][var_0];
    maps\_audio::_id_170B( var_1 );
}

_id_7328( var_0, var_1 )
{
    maps\_anim::_id_11DD( var_0, "reverse_breach_getup", var_1 );
    common_scripts\utility::exploder( "end_heli_dust" );
    maps\_anim::_id_11DD( var_0, "reverse_breach_end", var_1 );
}

_id_7329( var_0 )
{
    level._id_1674 = level._id_732A;
    level._id_1673 = undefined;
    maps\_shg_common::_id_1672();
}

_id_732B( var_0 )
{
    var_1 = getent( "reverse_breach_door_test", "targetname" );
    var_2 = common_scripts\utility::getstruct( "reverse_breach_destroyed", "targetname" );
    maps\_audio::aud_send_msg( "reverse_breach_door_explode" );
    common_scripts\utility::exploder( "breach_please_work" );
    var_3 = maps\_utility::_id_1287( "breach_door_model", var_2.origin );
    var_3._id_1032 = "breach_door_model";
    var_2 thread maps\_anim::_id_1246( var_3, "breach" );
    var_1 delete();
    var_4 = getentarray( "reverse_breach_chunk", "targetname" );

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6 ) )
            var_6 delete();
    }

    common_scripts\utility::flag_set( "reverse_breach_door_blown" );
    level.player playsound( "detpack_explo_main" );
    level.player disableweapons();
    setblur( 3, 0.1 );
    maps\_utility::vision_set_fog_changes( "berlin_breach", 0 );
    level._id_732C = 0;
    level._id_732D = 2;
    thread _id_732F( 0.5, "reverse_breach_enemy_right", "reverse_breach_anim_point", "reverse_breach_enemy_right" );
    thread _id_732F( 0.5, "reverse_breach_enemy_left", "reverse_breach_anim_point", "reverse_breach_enemy_left" );
    wait 0.5;
    maps\_utility::_id_2772( 0.3 );
    maps\_utility::_id_2774( 0 );
    maps\_utility::_id_2775();
    setsaveddvar( "sm_sunenable", 1 );
    setsaveddvar( "sm_spotlimit", 1 );
    maps\_utility::vision_set_fog_changes( "berlin_end", 10 );
    wait 12.0;

    if ( !common_scripts\utility::flag( "reverse_breach_complete" ) )
        level.player kill();
}

_id_4CCD()
{
    var_0 = self.script_fxid;
    var_1 = common_scripts\utility::createexploder( var_0 );
    var_1.v["origin"] = self.origin;
    var_1.v["angles"] = self.angles;
    var_1.v["fxid"] = var_0;
    var_1.v["delay"] = 0;
    var_1.v["exploder"] = "breach_please_work";
    var_1.v["soundalias"] = "nil";
    var_1.v["forward"] = anglestoforward( self.angles );
    var_1.v["up"] = anglestoup( self.angles );
}

_id_732E( var_0 )
{
    wait 0.5;
    maps\_utility::_id_0A16( 0.3 );
    maps\_utility::_id_0A17();
    setblur( 0, 2 );
    common_scripts\utility::flag_set( "breach_weapon_drawn" );
}

_id_732F( var_0, var_1, var_2, var_3 )
{
    wait(var_0);
    var_4 = getent( var_1, "targetname" );
    var_5 = common_scripts\utility::getstruct( var_2, "targetname" );
    var_6 = var_4 maps\_utility::_id_166F( 1 );
    waittillframeend;
    var_6._id_1032 = "generic";
    var_6.health = 1;
    var_6.allowdeath = 1;
    var_6 maps\_utility::_id_260D();
    var_6 thread _id_7330();
    var_5 maps\_anim::_id_124F( var_6, var_3 );
    var_5 maps\_anim::_id_1246( var_6, var_3 );
    var_6 waittill( "death" );
    level._id_732C++;

    if ( level._id_732C == level._id_732D )
        common_scripts\utility::flag_set( "reverse_breach_complete" );
}

_id_7330()
{
    self endon( "death" );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "breach_weapon_drawn" );
    wait 1;
    self.ignoreall = 0;
    self.accuracy *= 1.5;
    self.favoriteenemy = level.player;
    self setlookatentity( level.player );
    maps\_utility::_id_1237( self.origin );
    maps\_utility::_id_2724( 100 );
}

_id_7331()
{
    common_scripts\utility::flag_wait( "reverse_breach_ending_vo_complete" );
    wait 2;
    maps\_utility::_id_2727( level._id_7332 );
    wait 0.75;
    var_0 = _id_473C();
    var_0 _id_473B( 1, 2 );
    wait 1.5;
    maps\_utility::_id_195A();
}

_id_441E( var_0 )
{
    self endon( "death" );

    if ( !issentient( self ) || !isalive( self ) )
        return;

    if ( isdefined( self._id_441E ) && self._id_441E )
        return;

    self._id_441E = 1;

    if ( isdefined( var_0 ) )
        wait(randomfloat( var_0 ));

    var_1 = [];
    var_1[0] = "j_hip_le";
    var_1[1] = "j_hip_ri";
    var_1[2] = "j_head";
    var_1[3] = "j_spine4";
    var_1[4] = "j_elbow_le";
    var_1[5] = "j_elbow_ri";
    var_1[6] = "j_clavicle_le";
    var_1[7] = "j_clavicle_ri";

    for ( var_2 = 0; var_2 < 3 + randomint( 5 ); var_2++ )
    {
        var_3 = randomintrange( 0, var_1.size );
        thread _id_50B6( var_1[var_3], undefined );
        wait(randomfloat( 0.1 ));
    }

    self dodamage( self.health + 50, self.origin );
}

_id_50B6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._effect["flesh_hit"];

    playfxontag( var_1, self, var_0 );
}

_id_7333( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getentarray( "pipe_shootable", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4 ) && var_4 istouching( var_1 ) )
            var_4 delete();
    }
}

kill_player_triggers( var_0, var_1 )
{
    level endon( var_1 );
    common_scripts\utility::flag_wait( var_0 );
    level.player kill();
}

_id_7335( var_0 )
{
    self endon( "death" );
    self._id_7336 = var_0;
}

_id_7337( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = getentarray( var_0, "script_noteworthy" );

    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) && isdefined( var_4.script_noteworthy ) )
        {
            if ( var_4.script_noteworthy == var_0 )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

_id_7338( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        var_2 = maps\_utility::_id_262C( var_0 );

        if ( var_2 == self )
        {
            if ( isdefined( var_1 ) )
                common_scripts\utility::flag_set( var_1 );

            break;
        }
    }
}

_id_7339()
{
    self endon( "death" );

    if ( !isdefined( self._id_733A ) )
        _id_733C();

    _id_733D();
    wait 0.05;
    self._id_733A = 1;
}

_id_733B()
{
    self endon( "death" );
    self._id_733A = 0;
}

_id_733C()
{
    self endon( "death" );
    self._id_733A = 0;
}

_id_733D()
{
    self endon( "death" );

    if ( self._id_733A )
    {
        while ( self._id_733A )
            wait 0.05;
    }
}

_id_6C5C( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::_id_166F( 1 );
    var_3 maps\_utility::_id_24F5();
    var_3._id_1032 = "generic";
    var_4 = var_3 maps\_utility::_id_1281( var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_0 maps\_anim::_id_11C0( var_3, var_1 );
    var_5 = maps\_vehicle_aianim::_id_25C1( var_3 );
    var_5 setanim( var_4, 1, 0.2 );
    var_5 notsolid();

    if ( isdefined( var_2 ) )
    {
        common_scripts\utility::flag_wait( var_2 );
        var_5 delete();
    }
    else
        return var_5;
}

_id_4BF3()
{
    if ( !isalive( self ) )
        return;

    self.allowdeath = 1;
    self.a._id_0D55 = 1;
    maps\_utility::_id_0D72( 0 );
    self kill();
}

_id_733E( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    maps\_utility::_id_2705();
}

_id_584A( var_0 )
{
    self waittill( "death" );

    if ( isdefined( var_0 ) && !common_scripts\utility::flag( var_0 ) )
        common_scripts\utility::flag_set( var_0 );
}

_id_733F( var_0 )
{
    if ( !threatbiasgroupexists( var_0 ) )
    {
        createthreatbiasgroup( var_0 );
        return 0;
    }
    else
        return 1;
}

_id_7340( var_0 )
{
    foreach ( var_2 in self )
    {
        if ( isdefined( var_2 ) && isalive( var_2 ) )
            var_2 setthreatbiasgroup( var_0 );
    }
}

_id_7341( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( isdefined( var_3 ) )
        common_scripts\utility::flag_wait( var_3 );

    self notify( "stop_firing" );
    self endon( "stop_firing" );
    level endon( "stop_firing" );

    if ( !isdefined( var_0 ) )
        var_0 = getentarray( self.script_noteworthy, "script_noteworthy" );

    var_0 = maps\_utility::_id_0B53( var_0 );
    self setturrettargetent( var_0[0], ( randomintrange( -64, 64 ), randomintrange( -64, 64 ), randomintrange( -64, 64 ) ) );
    wait(randomfloatrange( 2, 3 ));

    for (;;)
    {
        self fireweapon();
        wait 0.05;
        var_0 = maps\_utility::_id_0B53( var_0 );
        self setturrettargetent( var_0[0], ( randomintrange( -64, 64 ), randomintrange( -64, 64 ), randomintrange( -64, 64 ) ) );

        if ( isdefined( var_1 ) && isdefined( var_2 ) )
        {
            wait(randomfloatrange( var_1, var_2 ));
            continue;
        }

        wait 3;
    }
}

_id_7342( var_0 )
{
    self endon( "death" );
    self endon( "stop_random_tank_fire" );
    var_1 = undefined;

    for (;;)
    {
        if ( isdefined( var_1 ) && var_1.health > 0 )
        {
            self setturrettargetent( var_1, ( randomintrange( -64, 64 ), randomintrange( -64, 64 ), randomintrange( -16, 100 ) ) );

            if ( sighttracepassed( self.origin + ( 0.0, 0.0, 100.0 ), var_1.origin + ( 0.0, 0.0, 40.0 ), 0, self ) )
            {
                self._id_166C++;
                self fireweapon();

                if ( self._id_166C >= 3 )
                {
                    if ( ( !isdefined( var_1.damageshield ) || var_1.damageshield == 0 ) && ( !isdefined( var_1._id_0D04 ) || var_1._id_0D04 == 0 ) )
                        var_1 notify( "death" );
                }

                wait(randomintrange( 4, 10 ));
            }
            else
            {
                var_1 = undefined;
                wait 1;
            }
        }
        else
        {
            if ( !isalive( self ) )
                break;

            var_1 = _id_7343( var_0 );
            self._id_166C = 0;
            wait 1;
        }

        wait(randomfloatrange( 0.05, 0.5 ));
    }
}

_id_7343( var_0 )
{
    var_1 = getaiarray( "axis" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) )
            var_2[var_2.size] = var_4;
    }

    if ( isdefined( var_2 ) )
    {
        var_6 = common_scripts\utility::random( var_2 );

        if ( isdefined( var_6 ) && !isspawner( var_6 ) && var_6.health > 0 )
        {
            var_7 = var_6;
            self notify( "new_target" );
            return var_7;
        }
        else
            return undefined;
    }

    return undefined;
}

_id_7344( var_0, var_1 )
{
    var_2 = magicbullet( "javelin_berlin", var_0.origin, self.origin );
    var_2 thread _id_7345( self );
    var_2 missile_settargetent( self );

    if ( isdefined( var_1 ) && var_1 == "direct" )
        var_2 missile_setflightmodedirect();
    else
        var_2 missile_setflightmodetop();

    return var_2;
}

_id_7345( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    self waittill( "death" );
    earthquake( 1.2, 1.5, var_1.origin, 1600 );
    wait 0.05;
    var_1 delete();
}

_id_7346( var_0, var_1, var_2 )
{
    level endon( var_2 );
    var_3 = common_scripts\utility::getstructarray( var_0, "targetname" );
    var_4 = common_scripts\utility::getstructarray( var_1, "targetname" );

    for (;;)
    {
        var_3 = maps\_utility::_id_0B53( var_3 );
        var_4 = maps\_utility::_id_0B53( var_4 );
        var_5 = var_3[0];
        var_6 = var_4[0];

        if ( common_scripts\utility::cointoss() )
        {
            var_5 = var_4[0];
            var_6 = var_3[0];
        }

        bullettracer( var_5.origin, var_6.origin, 1 );

        if ( common_scripts\utility::cointoss() )
        {
            wait 0.1;
            bullettracer( var_5.origin, var_6.origin, 1 );
            wait 0.1;
            bullettracer( var_5.origin, var_6.origin, 1 );
        }

        wait(randomfloatrange( 0.05, 0.3 ));
    }
}

_id_7347( var_0 )
{
    self endon( "death" );
    self.ignoreall = 1;

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::flag_wait( var_0 );
        self.ignoreall = 0;
    }
}

_id_7348()
{
    self.ignoreall = 0;
}

_id_7349( var_0, var_1, var_2, var_3 )
{
    var_4 = 1;

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        playfx( level._id_285A[var_0.vehicletype], var_0 gettagorigin( level._id_734A[var_0.vehicletype] ) );

        if ( isdefined( var_0._id_2857 ) )
        {
            level.stats["flares_used"]++;
            var_0 notify( "dropping_flares" );

            if ( var_4 )
                var_0 playsound( "cobra_flare_fire" );

            var_4 = !var_4;
        }

        wait 0.1;
    }
}

_id_734B( var_0 )
{
    var_0 endon( "death" );
    var_1 = 5.0;

    if ( isdefined( var_0._id_285C ) )
        var_1 = var_0._id_285C;

    _id_7349( var_0, 8, 1, var_1 );
}

_id_734C()
{
    var_0 = 0;

    for (;;)
    {
        var_1 = maps\_utility::_id_262C( "start_ramp_run" );

        if ( var_1 == self )
            break;
    }

    if ( isdefined( self._id_109A ) && self._id_109A )
    {
        maps\_utility::_id_109E();
        var_0 = 1;
    }

    if ( common_scripts\utility::cointoss() )
        maps\_utility::_id_26F7( "combatcombat_run_fast_rampup_short" );
    else
        maps\_utility::_id_26F7( "combatcombat_run_fast_rampup_short_alt" );

    for (;;)
    {
        var_1 = maps\_utility::_id_262C( "end_ramp_run" );

        if ( var_1 == self )
            break;
    }

    if ( var_0 == 1 )
        maps\_utility::_id_109B();

    maps\_utility::_id_140C();
}

_id_734D( var_0, var_1 )
{
    level endon( var_1 );
    var_2 = common_scripts\utility::getstructarray( var_0, "targetname" );
    var_3 = common_scripts\utility::getstructarray( "tracer_end_loc", "targetname" );
    var_4 = common_scripts\utility::getfx( "m16_muzzleflash" );

    for (;;)
    {
        var_2 = maps\_utility::_id_0B53( var_2 );
        var_5 = var_2[0];
        var_3 = maps\_utility::_id_0B53( var_3 );
        var_6 = var_3[0];
        level.player playfx( var_4, var_5.origin );
        bullettracer( var_5.origin, var_6.origin, 1 );

        if ( common_scripts\utility::cointoss() )
        {
            wait 0.1;
            bullettracer( var_5.origin, var_6.origin, 1 );
            wait 0.1;
            bullettracer( var_5.origin, var_6.origin, 1 );
        }

        wait(randomfloatrange( 0.05, 0.2 ));
    }
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

    self delete();
}

_id_734E()
{
    level._id_167D = undefined;
}

_id_46B8( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1.5;

    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.foreground = 1;
    var_4 setshader( var_0, 640, 480 );

    if ( isdefined( var_3 ) && var_3 > 0 )
    {
        var_4.alpha = 0;
        var_4 fadeovertime( var_3 );
        var_4.alpha = 1;
        wait(var_3);
    }

    wait(var_1);
    var_4 destroy();
}

_id_734F( var_0, var_1 )
{
    var_2 = getarraykeys( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_5 = var_3 * var_1 + 1;
        maps\_utility::delaythread( var_5, ::_id_46BA, var_0[var_4], var_0.size - var_3 - 1, var_1, var_4 );
    }
}

_id_46BA( var_0, var_1, var_2, var_3 )
{
    level notify( "new_introscreen_element" );

    if ( !isdefined( level._id_1DA0 ) )
        level._id_1DA0 = 0;
    else
        level._id_1DA0++;

    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4.horzalign = "center";
    var_4.vertalign = "middle_adjustable";
    var_4.sort = 1;
    var_4.foreground = 1;
    var_4 settext( var_0 );
    var_4.alpha = 0;
    var_4 fadeovertime( 0.2 );
    var_4.alpha = 1;
    var_4.hidewheninmenu = 1;
    var_4.fontscale = 2.4;
    var_4.color = ( 0.8, 1.0, 0.8 );
    var_4.font = "objective";
    var_4.glowcolor = ( 0.3, 0.6, 0.3 );
    var_4.glowalpha = 1;
    var_5 = int( var_2 * 1000 + 4000 );
    var_4 setpulsefx( 30, var_5, 700 );
    thread maps\_introscreen::_id_1DA3( var_4 );

    if ( !isdefined( var_3 ) )
        return;

    if ( !isstring( var_3 ) )
        return;

    if ( var_3 != "date" )
        return;
}

_id_7350( var_0, var_1, var_2 )
{
    level endon( var_2 );
    var_3 = getent( var_0, "script_noteworthy" );
    var_4 = var_3 maps\_utility::_id_166F();

    if ( isdefined( var_4 ) )
    {
        var_4 endon( "death" );
        waittillframeend;
        var_4.goalradius = 8;
        var_4 waittill( "goal" );
        var_4.goalradius = 8;
        level common_scripts\utility::flag_wait( var_1 );
        var_4 thread _id_7351();
    }
}

_id_7351()
{
    var_0 = common_scripts\utility::getstruct( self.script_noteworthy, "script_noteworthy" );
    var_1 = vectornormalize( var_0.origin - self.origin );
    var_2 = ( -1.0, -1.0, 0.0 ) * var_1;
    var_3 = getdvar( "scr_expDeathMayMoveCheck", "on" );
    setdvar( "scr_expDeathMayMoveCheck", "off" );
    magicgrenademanual( "fraggrenade", self.origin + 24 * var_2 + ( 0.0, 0.0, 12.0 ), ( 0.0, 0.0, 0.0 ), 0.05 );
    self waittill( "death" );
    wait 0.5;
    setdvar( "scr_expDeathMayMoveCheck", var_3 );
}

_id_7352()
{
    self endon( "death" );
    self endon( "kill_badplace_forever" );
    var_0 = isdefined( level._id_29D2[self.model] ) && level._id_29D2[self.model];
    var_1 = 0.5;
    var_2 = 17;
    var_3 = 17;
    var_4 = 300;

    for (;;)
    {
        if ( !self._id_2941 )
        {
            while ( !self._id_2941 )
                wait 0.5;
        }

        var_5 = self vehicle_getspeed();
        var_6 = 0;

        if ( var_5 <= 1 )
        {
            var_7 = 150;
            var_6 = 1;
        }
        else if ( var_5 < 5 )
            var_7 = 200;
        else if ( var_5 > 5 && var_5 < 8 )
            var_7 = 350;
        else
            var_7 = 500;

        if ( isdefined( self._id_29B4 ) )
            var_7 *= self._id_29B4;

        if ( var_0 )
            var_8 = anglestoforward( self gettagangles( "tag_turret" ) );
        else
            var_8 = anglestoforward( self.angles );

        badplace_arc( self.unique_id + "arc", var_1, self.origin, var_7 * 1.9, var_4, var_8, var_2, var_3, "axis", "team3", "allies" );

        if ( var_6 )
            badplace_cylinder( self.unique_id + "cyl", var_1, self.origin, 200, var_4, "axis", "team3" );
        else
            badplace_cylinder( self.unique_id + "cyl", var_1, self.origin, 200, var_4, "axis", "team3", "allies" );

        wait(var_1 + 0.05);
    }
}

_id_7353()
{
    var_0 = anglestoforward( self.angles );
    var_1 = ( -1.0, -1.0, 0.0 ) * var_0;
    var_2 = getdvar( "scr_expDeathMayMoveCheck", "on" );
    setdvar( "scr_expDeathMayMoveCheck", "off" );
    magicgrenademanual( "fraggrenade", self.origin + 24 * var_1 + ( 0.0, 0.0, 12.0 ), ( 0.0, 0.0, 0.0 ), 0.05 );
    self waittill( "death" );
    wait 0.5;
    setdvar( "scr_expDeathMayMoveCheck", var_2 );
}

_id_7354()
{
    level endon( "stop_chopper_blade" );
    var_0 = getentarray( "rotating_heli_blade", "targetname" );
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        var_3 childthread _id_7355( var_1 + 2 );
        var_1++;
    }
}

_id_7355( var_0 )
{
    for (;;)
    {
        self addpitch( var_0 );
        wait 0.05;
    }
}

_id_7356( var_0 )
{
    level endon( var_0 );
    self waittill( "death" );

    if ( isdefined( self ) )
    {
        setdvar( "ui_deadquote", &"BERLIN_ALLY_TANKS_FAIL" );
        maps\_utility::_id_1826();
    }
}

_id_5F09( var_0 )
{
    self._id_1099 = var_0;
}

_id_7357( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_1 );
    var_2 = getent( var_0, "targetname" );
    self setturrettargetent( var_2 );
}
