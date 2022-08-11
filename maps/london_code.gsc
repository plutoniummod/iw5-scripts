// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_56F8()
{
    maps\_utility::_id_26CD( "y" );
    maps\_utility::_id_26CD( "o" );
    precachemenu( "offensive_skip" );
    _id_56F9();
    _id_56FD();
    _id_4D6D();
    _id_56FC();
    _id_56FE();
    maps\_drone_civilian::init();
    maps\_drone_ai::init();
    maps\london_amb::main();
    level._id_01DC = 1;
    level._id_13B1 = ::_id_5703;
    maps\_compass::setupminimap( "compass_map_london_start", "start_minimap_corner" );
}

_id_56F9()
{
    var_0 = getentarray( "sas_squad", "targetname" );
    level._id_56FA = [];

    foreach ( var_2 in var_0 )
    {
        var_2 thread maps\_utility::_id_0D04();

        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "sas_leader" )
        {
            var_2._id_1032 = "sas_leader";
            level._id_56DE = var_2;
            level._id_56FA = maps\_utility::_id_2673( level._id_56FA, var_2, 0 );
            continue;
        }
        else
            var_2._id_1032 = "sas_guy";

        level._id_56FA = maps\_utility::_id_0BC3( level._id_56FA, var_2 );
    }
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "trucks_are_moving" );
    common_scripts\utility::flag_init( "uav_focusing_on_player" );
    common_scripts\utility::flag_init( "uav_focusing_on_enemies" );
    common_scripts\utility::flag_init( "uav_focusing_on_enemies2" );
    common_scripts\utility::flag_init( "uav_slamzoom" );
    common_scripts\utility::flag_init( "uav_slamzoom_done" );
    common_scripts\utility::flag_init( "uav_dialog_done" );
    common_scripts\utility::flag_init( "start_fence_climb" );
    common_scripts\utility::flag_init( "docks_assault" );
    common_scripts\utility::flag_init( "docks_on_the_trail" );
    common_scripts\utility::flag_init( "docks_entrance" );
    common_scripts\utility::flag_init( "docks_check_truck" );
    common_scripts\utility::flag_init( "docks_open_truck_door" );
    common_scripts\utility::flag_init( "docks_truck_door_opened" );
    common_scripts\utility::flag_init( "docks_truck_searched" );
    common_scripts\utility::flag_init( "docks_ambush" );
    common_scripts\utility::flag_init( "docks_shoot_catwalk" );
    common_scripts\utility::flag_init( "docks_almost_to_street" );
    common_scripts\utility::flag_init( "docks_street" );
    common_scripts\utility::flag_init( "slamzoom_rotate" );
    common_scripts\utility::flag_init( "docks_littlebird_rocket" );
    common_scripts\utility::flag_init( "warehouse_sniper_done" );
    common_scripts\utility::flag_init( "alley_start" );
    common_scripts\utility::flag_init( "alley_begin_movement" );
    common_scripts\utility::flag_init( "alley_leader_headstart" );
    common_scripts\utility::flag_init( "alley_enemy_cellphone_dead" );
    common_scripts\utility::flag_init( "alley_enemy_sleeping_dead" );
    common_scripts\utility::flag_init( "alley_enemy_warehouse_dead" );
    common_scripts\utility::flag_init( "last_alley_dialogue_done" );
    maps\_utility::_id_282C( "alley_enemy_warehouse_dead", 2 );
    common_scripts\utility::flag_init( "docks_enemy_fallback" );
    common_scripts\utility::flag_init( "alley_sas_breacher_dialog" );
    common_scripts\utility::flag_init( "warehouse_breacher_enter" );
    common_scripts\utility::flag_init( "warehouse_breacher_in_position" );
    common_scripts\utility::flag_init( "warehouse2_breach_go" );
    maps\_utility::_id_282C( "warehouse2_breach_go", 3 );
    common_scripts\utility::flag_init( "warehouse2_breach_enter" );
    common_scripts\utility::flag_init( "warehouse2_breach_go_dialog" );
    common_scripts\utility::flag_init( "warehouse2_done" );
    common_scripts\utility::flag_init( "warehouse_melee_ready" );
    common_scripts\utility::flag_init( "warehouse_exit_dialogue_done" );
    common_scripts\utility::flag_init( "warehouse_complete" );
    common_scripts\utility::flag_init( "warehouse_exit" );
    common_scripts\utility::flag_init( "sas_van_destroyed" );
    common_scripts\utility::flag_init( "snipers_in_position" );
    common_scripts\utility::flag_init( "player_open_doors" );
    common_scripts\utility::flag_init( "docks_after_ambush" );
    common_scripts\utility::flag_init( "docks_sas_get_in_position" );
    common_scripts\utility::flag_init( "docks_assault_start" );
    common_scripts\utility::flag_init( "london_warehouse_door_kicked" );
    common_scripts\utility::flag_init( "docks_reiterate_action" );
    common_scripts\utility::flag_init( "sewer_pipes_done" );
    common_scripts\utility::flag_init( "littlebird_at_catwalk" );
    common_scripts\utility::flag_init( "littlebird_rpg_shot" );
    common_scripts\utility::flag_init( "ride_without_wait" );
    common_scripts\utility::flag_init( "riding_train_already" );
    common_scripts\utility::flag_init( "friendly_truck_fast_load" );
    common_scripts\utility::flag_init( "friendly_truck_other_fast_load" );
    common_scripts\utility::flag_init( "transition_to_train" );
    common_scripts\utility::flag_init( "train_goes" );
    common_scripts\utility::flag_init( "player_mount_car_complete" );
    common_scripts\utility::flag_init( "train_chase_ended" );
    common_scripts\utility::flag_init( "last_guy_running_to_train" );
    common_scripts\utility::flag_init( "player_mounts_car" );
    common_scripts\utility::flag_init( "start_train_encounter" );
    common_scripts\utility::flag_init( "teleport_to_west" );
    common_scripts\utility::flag_init( "train_crashed" );
    common_scripts\utility::flag_init( "train_crashing" );
    common_scripts\utility::flag_init( "rocky_road" );
    common_scripts\utility::flag_init( "guys_shot_enough_at_train" );
    common_scripts\utility::flag_init( "train_crash_fast_forward" );
    common_scripts\utility::flag_init( "escalator_grenade_thrown" );
    common_scripts\utility::flag_init( "start_station_music" );
    common_scripts\utility::flag_init( "start_train_traverse" );
    common_scripts\utility::flag_init( "player_has_flashed" );
    common_scripts\utility::flag_init( "enemy_takedown" );
    common_scripts\utility::flag_init( "truck_spawned" );
    common_scripts\utility::flag_init( "setup_blockade" );
    common_scripts\utility::flag_init( "truck_stopped" );
    common_scripts\utility::flag_init( "truck_hit" );
    common_scripts\utility::flag_init( "truck_explodes" );
    common_scripts\utility::flag_init( "take_down_finished" );
    common_scripts\utility::flag_init( "westminster_entity_cleanup" );
    common_scripts\utility::flag_init( "ending_police_car_stopped" );
}

_id_56FB()
{
    precachestring( &"LONDON_OBJECTIVE_STACK_UP" );
    precachestring( &"LONDON_OBJECTIVE_CLEAR_WAREHOUSE" );
    precachestring( &"LONDON_OBJECTIVE_ASSAULT_DOCKS" );
    precachestring( &"LONDON_OBJECTIVE_CHASE_HOSTILES" );
    precachestring( &"LONDON_OBJECTIVE_CHASE_HOSTILES_TO_STATION" );
    precachestring( &"LONDON_OBJECTIVE_TRAIN_CHASE" );
    precachestring( &"LONDON_OBJECTIVE_TRAIN_TAILGATE" );
    precachestring( &"LONDON_OBJECTIVE_CLEAR_STATION" );
    var_0 = getentarray( "westminster_tunnels_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DB( var_0 );
    maps\_utility::_id_27D9( var_0 );
    maps\_utility::_id_27DC( var_0 );
    var_1 = getentarray( "westminster_tunnels_crash_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DB( var_1 );
    maps\_utility::_id_27D9( var_1 );
    maps\_utility::_id_27DC( var_1 );
}

_id_56FC()
{
    soundsettimescalefactor( "Music", 0 );
    soundsettimescalefactor( "Menu", 0 );
    soundsettimescalefactor( "local3", 0.0 );
    soundsettimescalefactor( "Mission", 0.0 );
    soundsettimescalefactor( "Announcer", 0.0 );
    soundsettimescalefactor( "Bulletimpact", 0.6 );
    soundsettimescalefactor( "Voice", 0.4 );
    soundsettimescalefactor( "effects1", 0.2 );
    soundsettimescalefactor( "effects2", 0.2 );
    soundsettimescalefactor( "local", 0.2 );
    soundsettimescalefactor( "local2", 0.2 );
    soundsettimescalefactor( "physics", 0.2 );
    soundsettimescalefactor( "ambient", 0.5 );
    soundsettimescalefactor( "auto", 0.5 );
}

_id_56FD()
{

}

_id_56FE()
{
    maps\_utility::_id_27CB( "rpg_vehicle", ::_id_5715 );
}

_id_56FF()
{
    if ( level.player getlocalplayerprofiledata( "canSkipOffensiveMissions" ) != 1 )
        return;

    level.player openpopupmenu( "offensive_skip" );
}

_id_5700( var_0, var_1, var_2 )
{
    var_3 = getentarray( "sas_squad", "targetname" );
    var_4 = common_scripts\utility::getstructarray( var_0, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !var_2 )
        var_3[var_3.size] = level.player;

    if ( isdefined( var_1 ) )
        var_3 = common_scripts\utility::array_combine( var_3, var_1 );

    foreach ( var_6 in var_3 )
    {
        foreach ( var_8 in var_4 )
        {
            if ( isdefined( var_8.script_noteworthy ) )
            {
                if ( isdefined( var_6.script_noteworthy ) && var_8.script_noteworthy == var_6.script_noteworthy )
                {
                    var_6 _id_5702( var_8 );
                    break;
                }
                else if ( isplayer( var_6 ) && var_8.script_noteworthy == "player" )
                {
                    var_6 _id_5702( var_8 );
                    break;
                }
            }
        }
    }

    foreach ( var_6 in var_3 )
    {
        if ( isdefined( var_6._id_5701 ) )
            continue;

        foreach ( var_8 in var_4 )
        {
            if ( isdefined( var_8._id_5701 ) )
                continue;

            var_6 _id_5702( var_8 );
            break;
        }
    }

    foreach ( var_6 in var_3 )
        var_6._id_5701 = undefined;

    foreach ( var_8 in var_4 )
        var_8._id_5701 = undefined;
}

_id_5702( var_0 )
{
    if ( isplayer( self ) )
    {
        self setorigin( var_0.origin );
        self setplayerangles( var_0.angles );
    }
    else
    {
        self forceteleport( var_0.origin, var_0.angles );
        self setgoalpos( var_0.origin );

        if ( isdefined( var_0.target ) )
            self.target = var_0.target;
    }

    self._id_5701 = 1;
    var_0._id_5701 = 1;
}

_id_5703()
{
    if ( !common_scripts\utility::flag( "docks_street" ) )
        wait 7;
    else
        wait 2;
}

_id_5704()
{
    var_0 = self;

    if ( isdefined( self.target ) )
    {
        var_0 = getnode( self.target, "targetname" );

        if ( !isdefined( var_0 ) )
            var_0 = getent( self.target, "targetname" );

        if ( !isdefined( var_0 ) )
            var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    }

    if ( !isdefined( self._id_1032 ) )
        self._id_1032 = "generic";

    if ( isdefined( self._id_205B ) )
        var_1 = self._id_205B;
    else
        var_1 = var_0._id_205B;

    if ( isdefined( self._id_164F ) )
    {
        if ( self._id_164F == "allowdeath" )
            self.allowdeath = 1;
    }

    var_0 maps\_anim::_id_1246( self, var_1 );
}

_id_5705( var_0 )
{
    if ( !isdefined( var_0.entity ) )
        return;

    var_0.entity endon( "death" );
    stopfxontag( var_0._id_536B, var_0.entity, var_0._id_536A );

    if ( !_id_5709() )
        return;

    if ( isdefined( var_0._id_536C ) && isdefined( var_0.entity ) )
    {
        playfxontag( var_0._id_536C, var_0.entity, var_0._id_536A );

        if ( !_id_5709() )
            return;
    }
}

_id_5275( var_0, var_1, var_2, var_3 )
{
    while ( isdefined( level._id_5706 ) )
        wait 0.05;

    level._id_5706 = 1;

    if ( !isdefined( level._id_5369 ) )
        level._id_5369 = [];

    if ( level._id_5369.size >= 1 )
    {
        foreach ( var_5 in level._id_5369 )
        {
            if ( isdefined( var_5.entity ) && var_5.entity == self )
            {
                level._id_5706 = undefined;
                return;
            }
        }

        var_7 = level._id_5369[0];
        level._id_5369 = common_scripts\utility::array_remove( level._id_5369, var_7 );
        _id_5705( var_7 );
    }

    if ( isdefined( self._id_536C ) )
    {
        stopfxontag( self._id_5275._id_536C, self, self._id_5275._id_536A );
        self._id_5707 = undefined;
        self._id_5708 = undefined;

        if ( !_id_5709() )
            return;
    }

    var_7 = spawnstruct();
    var_7._id_536B = common_scripts\utility::getfx( var_0 );
    var_7._id_536C = common_scripts\utility::getfx( var_1 );
    var_7.entity = self;
    self._id_5275 = var_7;
    var_7._id_536A = var_2;
    playfxontag( var_7._id_536B, var_7.entity, var_7._id_536A );

    if ( isdefined( var_3 ) )
        thread _id_536E( var_3 );

    level._id_5369[level._id_5369.size] = var_7;
    level._id_5706 = undefined;
}

_id_5709()
{
    wait 0.05;

    if ( isdefined( self ) )
        return 1;

    level._id_5706 = undefined;
    return 0;
}

_id_536D()
{
    if ( !isdefined( level._id_5369 ) )
        return;

    foreach ( var_1 in level._id_5369 )
    {
        if ( !isdefined( var_1.entity ) )
            continue;

        stopfxontag( var_1._id_536B, var_1.entity, var_1._id_536A );
    }

    level._id_5369 = [];
}

_id_536E( var_0 )
{
    self notify( "new_spot_light_death" );
    self endon( "new_spot_light_death" );
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

_id_570A()
{
    return getdvarint( "show_wip" );
}

_id_570B( var_0, var_1, var_2 )
{
    var_3 = cos( var_1[1] );
    var_4 = sin( var_1[1] );
    var_5 = var_2[0] * var_3 - var_2[1] * var_4;
    var_6 = var_2[0] * var_4 + var_2[1] * var_3;
    var_5 += var_0[0];
    var_6 += var_0[1];
    return ( var_5, var_6, var_0[2] + var_2[2] );
}

_id_570C( var_0, var_1 )
{
    self endon( "death" );

    while ( self getanimtime( var_0 ) < var_1 )
        wait 0.05;
}

_id_570D( var_0, var_1, var_2, var_3, var_4 )
{
    level.player lerpviewangleclamp( var_0, var_0 * 0.5, var_0 * 0.5, var_1, var_2, var_3, var_4 );
}

_id_570E( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_3 = spawn( "script_origin", level.player.origin );
        level.player playerlinkto( var_3 );
    }

    if ( !isdefined( var_2 ) )
        var_2 = 5;

    var_4 = newhudelem();
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4.sort = 1;
    var_4.x = 320;
    var_4.y = 340;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.fontscale = 2;
    var_4.alpha = 1;
    var_4.foreground = 1;
    var_4 settext( var_0 );
    var_4 thread _id_570F();
    wait(var_2);
    var_4 notify( "stop_pulse" );
    var_4 fadeovertime( 0.5 );
    var_4.alpha = 0;

    if ( isdefined( var_1 ) )
    {
        level.player unlink();
        var_3 delete();
    }

    var_4 destroy();
}

_id_570F()
{
    self endon( "stop_pulse" );
    var_0 = 0.5;

    for (;;)
    {
        self fadeovertime( var_0 );
        self.alpha = 0;
        wait(var_0);
        self fadeovertime( var_0 );
        self.alpha = 1;
        wait(var_0 + 0.5);
    }
}

_id_5710( var_0 )
{
    var_1 = _id_5713( var_0 );
    var_2 = _id_5713( level._id_1F19 );

    if ( isdefined( var_1 ) && isdefined( var_2 ) )
        return var_2 < var_1;

    return undefined;
}

_id_5711( var_0 )
{
    var_1 = _id_5713( var_0 );
    var_2 = _id_5713( level._id_1F19 );

    if ( isdefined( var_1 ) && isdefined( var_2 ) )
        return var_2 > var_1;

    return undefined;
}

_id_5712( var_0 )
{
    var_1 = _id_5713( var_0 );
    var_2 = _id_5713( level._id_1F19 );

    if ( isdefined( var_1 ) && isdefined( var_2 ) )
        return var_2 <= var_1;

    return undefined;
}

_id_5713( var_0 )
{
    foreach ( var_3, var_2 in level._id_1F18 )
    {
        if ( var_2["name"] == var_0 )
            return var_3;
    }

    return undefined;
}

_id_5714( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 1.0, 1.0, 1.0 );

    for (;;)
        wait 0.05;
}

_id_5715()
{
    self setmodel( "projectile_rpg7" );
    var_0 = common_scripts\utility::getfx( "rpg_trail" );
    playfxontag( var_0, self, "tag_origin" );
    var_0 = common_scripts\utility::getfx( "rpg_muzzle" );
    playfxontag( var_0, self, "tag_origin" );
    self playsound( "weap_rpg_fire_npc" );

    if ( isdefined( self.script_sound ) )
    {
        if ( isdefined( self._id_2133 ) )
            common_scripts\utility::delaycall( self._id_2133, ::playsound, self.script_sound );
        else
            self playsound( self.script_sound );
    }
    else
        self playloopsound( "weap_rpg_loop" );

    self waittill( "reached_end_node" );
    self notify( "explode", self.origin );

    if ( isdefined( self.script_exploder ) )
        common_scripts\utility::exploder( self.script_exploder );

    self delete();
}

_id_5716()
{
    while ( level.player islinked() )
    {
        if ( !isalive( level.player ) )
        {
            level.player unlink();
            return;
        }

        wait 0.05;
    }
}

_id_5717()
{
    if ( !common_scripts\utility::flag_exist( "limp" ) )
        common_scripts\utility::flag_init( "limp" );

    common_scripts\utility::flag_set( "limp" );
    level._id_5718 = 1;
    level._id_5258 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( level._id_5258 );
    thread _id_5719( undefined, 1 );
    thread _id_571C();
    var_0 = 4.1;
    var_1 = 4.1;
    var_2 = 300;
    var_3 = 4.1 / var_2;
    var_4 = 0.2;
    var_5 = ( 1 - var_4 ) / var_2;
    var_6 = 0.8;
    var_7 = ( 1 - var_6 ) / var_2;
    level.player setmovespeedscale( 0.3 );
    var_8 = 0.1;
    var_9 = var_8 * 0.5;
    var_10 = 0;
    var_11 = level.player getplayerangles()[1];
    var_12 = 0;
    var_13 = "down";

    for (;;)
    {
        var_14 = level.player getplayerangles()[1];
        var_15 = var_14 - var_11;
        var_16 = var_15;
        var_11 = var_14;
        var_17 = length( level.player getvelocity() );

        if ( var_17 == 0 )
        {
            wait 0.05;
            continue;
        }

        var_18 = var_0 / var_1;
        var_10 += var_17 * 0.06;
        var_19 = sin( var_10 );
        var_19 = abs( var_19 );
        var_6 += var_7;
        var_4 += var_5;

        if ( var_12 != var_19 )
        {
            if ( var_12 - var_19 > 0 )
            {
                if ( var_13 != "up" )
                {
                    var_13 = "up";
                    level.player maps\_utility::_id_279B( var_6, 0.25 );
                }
            }
            else if ( var_13 != "down" )
            {
                thread _id_5719( var_18 );
                var_13 = "down";
                level.player maps\_utility::_id_279B( var_4, 0.1 );
            }
        }

        if ( var_0 > 0 )
        {
            var_0 -= var_3;
            var_0 = max( var_0, 0 );
        }

        var_20 = var_19 * 4 * var_0;
        var_12 = var_19;
        var_21 = ( var_20 * 0.5 * -1, 0, var_20 * 0.6 );
        level._id_5258 rotateto( var_21, var_8, var_8 * 0.5, var_8 * 0.5 );
        wait 0.05;

        if ( var_0 == 0 )
            break;
    }

    common_scripts\utility::flag_clear( "limp" );
    setslowmotion( 0.95, 1, 0.5 );
    level._id_5718 = undefined;
    var_22 = _id_473C();
    var_22 fadeovertime( 0.5 );
    var_22.alpha = 0;
    wait 1;
    var_22 destroy();
    setblur( 0, 1 );
}

_id_5719( var_0, var_1 )
{
    level endon( "limp" );
    level notify( "stop_limp_stun" );
    level endon( "stop_limp_stun" );

    if ( !common_scripts\utility::flag( "limp" ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( var_0 < 0.2 )
        return;

    if ( !isdefined( var_1 ) )
    {
        for (;;)
        {
            var_2 = distance( ( 0.0, 0.0, 0.0 ), level.player getvelocity() );

            if ( var_2 > 80 )
                break;

            wait 0.05;
        }
    }

    var_3 = 2.3 * var_0;
    level.player thread maps\_utility::play_sound_on_entity( "breathing_hurt" );
    common_scripts\utility::noself_delaycall( 0.5, ::setblur, 4 * var_0, 0.25 );
    common_scripts\utility::noself_delaycall( 1.2, ::setblur, 0, 1 );
    maps\_utility::delaythread( var_3, ::_id_571B );
    thread _id_571A( var_3 );
    level.player playrumbleonentity( "damage_light" );
}

_id_571A( var_0 )
{
    if ( !common_scripts\utility::flag( "limp" ) )
        return;

    var_1 = _id_473C();
    var_1 fadeovertime( var_0 * 3 );
    var_1.alpha = randomfloatrange( 0.9, 0.95 );
    wait(var_0);

    if ( !common_scripts\utility::flag( "limp" ) )
        return;

    var_1 fadeovertime( var_0 );
    var_1.alpha = 0;
}

_id_571B()
{
    level endon( "limp" );
    level notify( "stop_random_blur" );
    level endon( "stop_random_blur" );

    if ( !common_scripts\utility::flag( "limp" ) )
        return;

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
        wait 3;
    }
}

_id_571C()
{
    level endon( "limp" );
    var_0 = 1;
    var_1 = 3;

    if ( !common_scripts\utility::flag( "limp" ) )
        return;

    wait 3;

    for (;;)
    {
        setslowmotion( var_0, 0.89, var_1 );
        wait(var_1 + randomfloat( 1 ));
        setslowmotion( var_0, 1.06, var_1 );
        wait(var_1 + randomfloat( 1 ));
    }
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
    wait(var_0);
}

_id_09FA( var_0 )
{
    var_1 = _id_473C();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 1;
    wait(var_0);
}

_id_473C()
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D.sort = -1;
    level._id_473D.foreground = 0;
    return level._id_473D;
}

callback( var_0, var_1 )
{
    if ( !isdefined( level._id_571D[var_0] ) )
        return;

    var_2 = level._id_571D[var_0];

    if ( isdefined( var_1 ) )
        self [[ var_2 ]]( var_1 );
    else
        self [[ var_2 ]]();
}

_id_571E( var_0, var_1 )
{
    level._id_571D[var_0] = var_1;
}

_id_00FE()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( level.player ismeleeing() )
        {
            wait 1;
            continue;
        }

        if ( level.player isthrowinggrenade() )
            continue;

        break;
    }
}

_id_571F( var_0, var_1 )
{
    self notify( "stop_chopper_hover" );
    self notify( "stop_follow_path" );
    self endon( "stop_follow_path" );
    maps\_utility::_id_13DC( "follow_path" );

    if ( isdefined( var_1 ) )
        self thread [[ var_1 ]]();

    var_2 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_3 = var_2;

    for ( var_4 = 1; isdefined( var_3 ); var_3 = common_scripts\utility::getstruct( var_3.target, "targetname" ) )
    {
        _id_5726( var_3 );
        var_5 = 100;

        if ( isdefined( var_3.radius ) )
            var_5 = var_3.radius;

        self setneargoalnotifydist( var_5 );
        var_6 = _id_5725( var_3 );
        var_7 = 0;

        if ( isdefined( var_3._id_5720 ) )
            var_7 = !var_3._id_5720;

        if ( !var_7 )
        {
            self setgoalyaw( var_3.angles[1] );
            self settargetyaw( var_3.angles[1] );
        }

        if ( isdefined( var_3._id_2952 ) )
        {
            switch ( var_3._id_2952 )
            {
                case "fast":
                    self setmaxpitchroll( 80, 80 );
                    break;
                case "rocketing":
                    self setmaxpitchroll( 20, 50 );
                    break;
                case "strafing":
                    self setmaxpitchroll( 40, 50 );
                    break;
                default:
                    self setmaxpitchroll( 25, 45 );
            }
        }

        self setvehgoalpos( var_3.origin, var_6 );
        common_scripts\utility::waittill_either( "near_goal", "goal" );

        if ( isdefined( var_3._id_214A ) )
        {
            self delete();
            return;
        }

        if ( isdefined( var_3.script_noteworthy ) )
        {
            if ( var_3.script_noteworthy == "mgon" )
                maps\_vehicle::_id_2A3E();
            else if ( var_3.script_noteworthy == "mgoff" )
            {
                foreach ( var_9 in self.mgturret )
                {
                    if ( isdefined( var_9._id_5721 ) )
                        var_9._id_5721 delete();

                    var_9 cleartargetentity();
                }

                self notify( "stop_mg" );
                maps\_vehicle::_id_2A3D();
            }
            else if ( var_3.script_noteworthy == "start_firing" )
            {
                foreach ( var_9 in self.mgturret )
                {
                    var_9 setmode( "manual" );
                    var_9 startfiring();
                }
            }
            else if ( var_3.script_noteworthy == "stop_firing" )
            {
                foreach ( var_9 in self.mgturret )
                {
                    var_9 stopfiring();
                    var_9 notify( "stopfiring" );
                }
            }
            else if ( var_3.script_noteworthy == "mgon_straight" )
            {
                _id_5722();

                foreach ( var_9 in self.mgturret )
                {
                    var_9 setmode( "manual" );
                    var_9 startfiring();
                }
            }
            else if ( var_3.script_noteworthy == "fire_rockets" )
            {
                self notify( "fire_rockets" );
                thread _id_5724();
            }
            else if ( var_3.script_noteworthy == "stop_fire_rockets" )
            {
                self notify( "stop_fire_rockets" );
                self clearlookatent();
            }
            else if ( var_3.script_noteworthy == "prep_stop_rockets" )
                self notify( "prep_stop_rockets" );
            else if ( var_3.script_noteworthy == "spotlight_off" )
                thread _id_5730();
            else if ( var_3.script_noteworthy == "clear_lookat" )
                self clearlookatent();
        }

        if ( var_6 )
        {
            var_17 = 100;
            self setgoalyaw( var_3.angles[1] );

            if ( isdefined( var_3.script_radius ) )
                var_17 = var_3.script_radius;
            else if ( isdefined( var_3.radius ) )
                var_17 = var_3.radius;

            if ( var_17 > 0 )
                thread _id_572F( var_3.origin, var_17, "stop_follow_path" );

            waittillframeend;
        }

        if ( isdefined( var_3._id_2057 ) )
            common_scripts\utility::flag_set( var_3._id_2057 );

        if ( isdefined( var_3._id_1288 ) )
            common_scripts\utility::flag_wait( var_3._id_1288 );

        if ( isdefined( var_3._id_2058 ) )
            maps\_utility::_id_13DC( var_3._id_2058 );

        if ( isdefined( var_3._id_294A ) )
            maps\_utility::_id_1654( var_3._id_294A );

        var_3 maps\_utility::script_delay();
        self notify( "stop_chopper_hover" );
        var_4 = 0;

        if ( !isdefined( var_3.target ) )
            break;
    }

    self cleartargetyaw();
    maps\_utility::_id_13DE( "follow_path" );
    self notify( "follow_path_done" );
}

_id_5722()
{
    var_0 = 500;

    foreach ( var_2 in self.mgturret )
    {
        var_3 = anglestoforward( self.angles );
        var_4 = var_2 gettagorigin( "tag_flash" );
        var_4 += var_3 * var_0;
        var_2._id_5721 = spawn( "script_origin", var_4 );
        var_2._id_5721 linkto( self );
        var_2 settargetentity( var_2._id_5721 );
        thread _id_5723( var_2 );
    }
}

_id_5723( var_0 )
{
    self endon( "stop_mg" );
    var_1 = "tag_flash";
    var_2 = 500;

    for (;;)
    {
        wait 0.05;

        if ( self.angles[0] < 0 )
            continue;

        var_3 = var_0 gettagangles( var_1 );
        var_4 = anglestoforward( var_3 );
        var_5 = self gettagorigin( var_1 );
        var_6 = var_5[2] - 460;
        var_7 = var_6 / sin( var_3[0] );
        var_8 = var_5 + var_4 * var_7;
        radiusdamage( var_8, 64, 100, 20, self );
    }
}

_id_5724()
{
    self endon( "stop_follow_path" );
    self endon( "stop_fire_rockets" );
    self setvehweapon( "missile_attackheli" );
    var_0 = 0.2;
    var_1 = 0;

    for (;;)
    {
        if ( var_1 % 2 == 0 )
        {
            var_2 = "tag_missile_left";
            var_3 = anglestoright( ( 0, self.angles[1], 0 ) + ( 0.0, 180.0, 0.0 ) );
        }
        else
        {
            var_2 = "tag_missile_right";
            var_3 = anglestoright( ( 0, self.angles[1], 0 ) );
        }

        var_4 = var_3 * 60;
        self fireweapon( var_2, self.target_ent, var_4 );
        wait(var_0);
        var_1++;
    }
}

_id_5725( var_0 )
{
    if ( isdefined( var_0.script_delay ) || isdefined( var_0.script_delay_min ) )
        return 1;

    if ( isdefined( var_0._id_295D ) )
        return 1;

    if ( isdefined( var_0._id_1288 ) )
    {
        if ( !common_scripts\utility::flag( var_0._id_1288 ) )
            return 1;
    }

    return 0;
}

_id_5726( var_0 )
{
    if ( isdefined( var_0.speed ) )
    {
        var_1 = var_0.speed;
        var_2 = 20;
        var_3 = 10;

        if ( isdefined( var_0.script_accel ) )
            var_2 = var_0.script_accel;

        if ( isdefined( var_0._id_294B ) )
            var_3 = var_0._id_294B;

        self vehicle_setspeed( var_0.speed, var_2, var_3 );
    }

    if ( isdefined( var_0._id_2AFE ) )
    {
        var_1 = var_0._id_2AFE;
        var_2 = 20;
        var_3 = 10;

        if ( isdefined( var_0.script_accel ) )
            var_2 = var_0.script_accel;

        if ( isdefined( var_0._id_294B ) )
            var_3 = var_0._id_294B;

        self vehicle_setspeedimmediate( var_0._id_2AFE, var_2, var_3 );
    }
}

_id_5727()
{
    self setvehgoalpos( self._id_5728._id_5729["point"] );
    common_scripts\utility::waittill_either( "near_goal", "goal" );
}

_id_572A( var_0 )
{
    var_1 = _id_572C();

    if ( var_0 < 0 )
        var_0 = self._id_5728._id_572B - 1;
    else
        var_0++;

    if ( var_0 >= var_1.size )
        var_0 = 0;

    var_2 = [];
    var_2["point"] = var_1[var_0];
    var_2["index"] = var_0;
    return var_2;
}

_id_572C()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self._id_5728._id_572B; var_1++ )
        var_0[var_1] = _id_572D( var_1 );

    return var_0;
}

_id_572D( var_0 )
{
    var_1 = 360 / self._id_5728._id_572B * self._id_5728.direction;
    var_2 = ( 0, var_1 * var_0, 0 );
    var_3 = anglestoforward( var_2 );
    var_4 = self._id_5728._id_572E.origin + var_3 * self._id_5728._id_572E.radius;
    return var_4;
}

_id_572F( var_0, var_1, var_2 )
{
    self endon( "stop_chopper_hover" );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( !isdefined( var_1 ) )
        var_1 = 100;

    for (;;)
    {
        var_3 = randomfloatrange( var_1 * -1, var_1 );
        var_4 = randomfloatrange( var_1 * -1, var_1 );
        var_5 = randomfloatrange( var_1 * -1, var_1 );
        self setvehgoalpos( var_0 + ( var_3, var_4, var_5 ), 1 );
        self vehicle_setspeed( 5 + randomint( 10 ), 3, 3 );
        self waittill( "goal" );
    }
}

_id_5730()
{
    _id_536D();
}
