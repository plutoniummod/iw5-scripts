// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7950()
{
    var_0 = self._id_1FDB;

    if ( isdefined( level._id_1F1D[var_0] ) )
        return;

    self waittill( "trigger" );

    if ( level._id_1F19 != "train_start_ride" )
        return;

    var_1 = [];
    iprintlnbold( "start: " + var_0 + " dumped!" );
    return 1;
}

_id_7951()
{
    var_0 = vehicle_getarray();
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1 = var_3 _id_7952( var_1 );

    return var_1;
}

_id_7952( var_0 )
{
    if ( isspawner( self ) )
        return var_0;

    if ( !isdefined( self.currentnode ) )
        return var_0;

    if ( !isdefined( self._id_296A ) )
        return var_0;

    var_0[var_0.size] = self;
    return var_0;
}

_id_7953( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        var_6 = distance( var_5.v["origin"], var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_7954()
{
    if ( !isdefined( self.targetname ) )
        return undefined;

    var_0 = getvehiclenodearray( self.targetname, "target" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.script_noteworthy == "train_section" )
            return var_2;
    }

    return undefined;
}

_id_7955()
{
    self endon( "death" );
    var_0 = self vehicle_getspeed();

    for (;;)
    {
        wait 0.05;
        var_1 = self vehicle_getspeed();

        if ( var_1 == var_0 )
            continue;

        var_0 = var_1;
        _id_7956();
    }
}

_id_7956()
{
    var_0 = self;

    foreach ( var_2 in self._id_7957 )
    {
        var_2._id_7958 = 0;
        var_2 thread _id_7959( var_0 );
        var_0 = var_2;
    }
}

_id_7959( var_0 )
{
    if ( common_scripts\utility::flag( "riding_train_already" ) )
    {
        if ( self vehicle_getspeed() == var_0 vehicle_getspeed() )
        {
            self._id_7958 = 1;
            return;
        }
    }

    var_0 endon( "death" );
    var_0 endon( "reached_end_node" );
    self endon( "death" );
    self notify( "train_stackup_thread" );
    self endon( "train_stackup_thread" );
    var_1 = var_0 vehicle_getspeed();
    self vehicle_setspeedimmediate( var_1, 40, 40 );

    for (;;)
    {
        for ( var_2 = distancesquared( self.origin, var_0.origin ); var_1 > 5 && var_2 < 788544; var_1 = var_0 vehicle_getspeed() )
        {
            if ( var_1 < 22 )
                var_1 = 22;

            self vehicle_setspeed( var_1 - 22, 40, 40 );
            wait 0.05;
            var_2 = distancesquared( self.origin, var_0.origin );
        }

        if ( _id_795A( var_2, var_0 ) )
            break;

        while ( var_2 > 799236 )
        {
            self vehicle_setspeed( var_1 + 22, 40, 40 );
            wait 0.05;
            var_2 = distancesquared( self.origin, var_0.origin );
            var_1 = var_0 vehicle_getspeed();
        }

        if ( _id_795A( var_2, var_0 ) )
            break;

        wait 0.05;

        if ( _id_795A( var_2, var_0 ) )
            break;
    }

    var_1 = var_0 vehicle_getspeed();
    self vehicle_setspeedimmediate( var_1, 40, 40 );

    if ( !var_0._id_7958 )
    {
        wait 0.05;
        thread _id_7959( var_0 );
        return;
    }

    self._id_7958 = 1;
}

_id_795A( var_0, var_1 )
{
    return var_0 > 788544 && var_0 < 799236 && var_1._id_7958;
}

_id_795B( var_0 )
{
    var_1 = 460;
    var_2 = ( var_0 - 140 ) / var_1;
    var_2 = clamp( var_2, 0.01, 1 );
    var_3 = 39;
    var_4 = ( gettime() - self._id_795C ) / 9000;
    var_4 = clamp( var_4, 0.01, 1 );
    var_3 *= var_4;
    var_5 = 1 + var_3 * var_2;
    return var_5;
}

_id_795D( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self notify( "match_position_of_target_vehicle" );
    self endon( "match_position_of_target_vehicle" );
    self endon( "death" );
    var_3 = 45;
    var_4 = 3;
    var_5 = gettime();
    self._id_795C = gettime();

    for (;;)
    {
        wait 0.05;
        var_6 = var_0 gettagorigin( "tag_body" );
        var_7 = var_0 gettagangles( "tag_body" );
        var_8 = var_0 vehicle_getspeed();
        var_9 = self gettagorigin( "tag_body" );
        var_10 = maps\_utility::_id_26AC( var_6, var_7, var_9 );
        var_11 = distance( var_6, var_9 );

        if ( var_11 > 50 )
            var_5 = gettime();

        if ( var_8 < 30 )
            var_5 = gettime();

        self._id_795E = undefined;

        if ( var_10 > 0 )
        {
            var_3 = var_8;

            if ( var_11 > 30 )
                var_3 = var_8 - 5;
        }
        else if ( var_10 < 0 )
        {
            if ( var_11 < 10 )
                self resumespeed( 550 );
            else if ( var_11 < 86 )
                self resumespeed( 11 );
            else
            {
                var_3 = var_8 + _id_795B( var_11 );

                if ( var_11 > 1900 )
                    self._id_795E = 1;
            }
        }

        if ( gettime() - var_5 > 6000 )
        {
            self resumespeed( 550 );
            return;
        }

        var_3 = clamp( var_3, 5, 95 );
        self vehicle_setspeed( var_3, 25, 25 );
    }
}

_id_795F()
{
    var_0 = "pillar_flag" + self._id_7960;
    level endon( var_0 );
    waittillframeend;
    common_scripts\utility::flag_wait( self._id_7960 );
    common_scripts\utility::exploder( self.script_exploder );
    level notify( var_0 );
}

setup_pillar_exploders()
{
    var_0 = maps\_utility::_id_2695( "collumn_explosion" );
    var_1 = maps\_utility::_id_2695( "collumn_explosion_dense" );
    var_0 = common_scripts\utility::array_combine( var_0, var_1 );
    var_2 = getentarray( "tunnel_crash_pillar", "script_noteworthy" );
    level._id_7962 = [];

    foreach ( var_4 in var_2 )
    {
        var_5 = _id_7953( var_4.origin, var_0, 100 );

        if ( !isdefined( var_5 ) )
            continue;

        var_6 = spawnstruct();
        var_6._id_7960 = var_5.v["flag"];
        var_6.script_exploder = var_4.script_exploder;
        level._id_7962 = maps\_utility::_id_0BC3( level._id_7962, var_6 );
    }
}

_id_7963( var_0 )
{
    level endon( "stop_guys_trickle_into_train" );
    self.ignoresuppression = 1;
    self.dontavoidplayer = 1;
    self.takedamage = 0;
    self.suppressionwait = 0;
    self.pathenemyfightdist = 0;
    self.pathenemylookahead = 0;
    self.maxfaceenemydist = 32;
    self.ignoreexplosionevents = 1;
    maps\_utility::_id_0EEC();
    self.grenadeawareness = 0;
    self.ignorerandombulletdamage = 1;
    self._id_0EEE = 1;
    self.fixednode = 1;
    maps\_utility::_id_2053( var_0 );
    maps\_utility::_id_2724( 32 );
    maps\_utility::_id_2712();
    self endon( "death" );
    self waittill( "goal" );
    _id_7964();
}

_id_7964()
{
    var_0 = getentarray( "script_vehicle_subway_cart_destructible", "classname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isspawner( var_3 ) )
            continue;

        var_1 = maps\_utility::_id_0BC3( var_1, var_3 );
    }

    var_5 = maps\_utility::_id_0AE9( self.origin, var_1 );
    self linkto( var_5 );
    self._id_7965 = 1;
    _id_79A0( self, var_5 );
}

setup_subway_cart_enemy()
{
    self startusingheroonlylighting();
    self allowedstances( "stand", "crouch" );
}

_id_7967( var_0 )
{
    foreach ( var_2 in var_0._id_2974 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "player_spot" )
        {
            var_2 hidepart( "TAG_RAIL" );
            var_2 notsolid();
            return var_2;
        }
    }
}

_id_7968( var_0 )
{
    foreach ( var_2 in var_0._id_2974 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "animate_truck" )
            return var_2;
    }
}

_id_7969( var_0 )
{
    if ( !isdefined( var_0._id_2974 ) )
        return;

    foreach ( var_2 in var_0._id_2974 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "headlight" )
        {
            var_2 hide();
            var_2 setmodel( "tag_origin" );
            return var_2;
        }
    }
}

_id_796A()
{
    self._id_0EF1 = undefined;
    self._id_24EC = undefined;
    self notify( "newanim" );
    self unlink();
    self stopanimscripted();
}

_id_796B()
{
    var_0 = self;

    if ( isdefined( var_0._id_796C ) )
        var_0.pathenemyfightdist = var_0._id_796C;

    if ( isdefined( var_0._id_796D ) )
        var_0.pathenemylookahead = var_0._id_796D;

    if ( isdefined( var_0._id_796E ) )
        var_0.maxfaceenemydist = var_0._id_796E;
}

_id_796F()
{
    if ( isdefined( level._id_56DE ) )
        level._id_56DE _id_796B();

    level._id_56DE._id_100A = undefined;
}

_id_7970()
{
    level notify( "stop_guys_trickle_into_train" );
    var_0 = maps\_utility::_id_2641( "subway_enemy", "script_noteworthy" );

    if ( isdefined( level._id_57F7 ) )
        var_0 = common_scripts\utility::array_combine( var_0, level._id_57F7 );

    var_1 = getent( "on_train_trigger", "targetname" );
    var_2 = getnodearray( "runaway_nodes", "targetname" );

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4._id_7965 ) && var_4._id_7965 )
            continue;

        var_4._id_20AF = 0.1;
        var_4.accuracy = 0.1;
        var_4 maps\_utility::_id_2712();

        if ( var_4 istouching( var_1 ) )
        {
            var_4 _id_7964();
            continue;
        }

        var_4.badplaceawareness = 0;
        var_4.attackeraccuracy = 1;
        var_4.health = int( min( 75, var_4.health ) );
        var_4 maps\_utility::_id_2612( 1 );
        var_4.fixednode = 0;
        var_4 maps\_utility::_id_0A23( 1 );
        var_4 maps\_utility::_id_2724( 32 );
        var_4 thread _id_7971();
        var_5 = var_2[randomint( var_2.size )];
        var_4 maps\_utility::_id_2053( var_5 );
    }
}

_id_7971()
{
    self waittill( "goal" );
    self delete();
}

_id_7972( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_2.attackeraccuracy = 0;
        var_2.fixednode = 1;
        var_2.accuracy = 1;
        var_2 maps\_utility::_id_26F3( 1 );
        var_2 maps\_utility::_id_2712();
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

_id_7973()
{
    self waittill( "enteredvehicle" );
    _id_796B();
    thread _id_7974();
}

_id_7974()
{
    self allowedstances( "crouch" );
    self.fixednode = 1;
    self.attackeraccuracy = 0;
    self.ignorerandombulletdamage = 1;
    self.ignoreexplosionevents = 0;
    self.ignoresuppression = 1;
    maps\_utility::_id_2612( 0 );
    maps\_utility::_id_104A( "mp5", "primary" );
}

_id_7975( var_0 )
{
    var_1 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_3 in var_1 )
    {
        if ( isspawner( var_3 ) )
        {
            if ( var_3.origin == var_0 )
                return var_3;
        }
    }

    return;
}

_id_7976( var_0 )
{
    var_1 = getallvehiclenodes();

    foreach ( var_3 in var_1 )
    {
        if ( var_3.origin == var_0 )
            return var_3;
    }

    return;
}

_id_7977( var_0 )
{
    if ( isdefined( level._id_7978 ) )
    {
        if ( var_0 == level._id_7978 )
            var_0 = level._id_7979;
    }

    if ( isdefined( level._id_7979 ) )
    {
        if ( var_0 == level._id_797A )
            var_0 = level._id_797B;
    }

    return var_0;
}

_id_797C( var_0 )
{
    if ( distance( var_0.origin, self.origin ) > 1000 )
    {
        maps\_utility::_id_2830( ::_id_797C );
        return;
    }

    var_0 = _id_7977( var_0 );
    var_0 _id_797D();
}

_id_797D()
{
    var_0 = _id_7969( self );

    if ( !isdefined( var_0 ) )
        return;

    if ( self.classname == "script_vehicle_subway_engine_destructible" )
        var_0 maps\london_code::_id_5275( "spotlight_train", "spotlight_train_cheap", "tag_origin", self );
    else
        var_0 maps\london_code::_id_5275( "spotlight_truck_player", "spotlight_truck_player_cheap", "tag_origin", self );
}

_id_797E()
{
    var_0 = getvehiclenodearray( "dumpstart_node", "targetname" );
    var_1 = [];
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4.script_noteworthy ) )
            continue;

        if ( var_4.script_noteworthy != level._id_1F19 )
            continue;

        var_5 = _id_7975( var_4._id_797F );
        var_5.origin = var_4.origin;
        var_5.angles = var_4.angles;

        if ( issubstr( var_5.targetname, "_ghost" ) )
        {
            var_1 = maps\_utility::_id_2673( var_1, var_5, 0 );
            var_2 = maps\_utility::_id_2673( var_2, var_4, 0 );
            continue;
        }

        var_1 = maps\_utility::_id_0BC3( var_1, var_5 );
        var_2 = maps\_utility::_id_0BC3( var_2, var_4 );
    }

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
        _id_7980( var_1[var_7], var_2[var_7] );

    maps\_utility::_id_194E( "london_tube" );
}

_id_7980( var_0, var_1 )
{
    var_0._id_296B = 1;
    var_2 = var_1.targetname;

    if ( isdefined( var_0.targetname ) )
    {
        switch ( var_0.targetname )
        {
            case "friend_truck":
                if ( isdefined( level._id_7978 ) )
                    var_1 = level._id_7978._id_296A._id_7981;

                break;
            case "player_truck":
                if ( isdefined( level._id_797A ) )
                    var_1 = level._id_797A._id_296A._id_7981;

                break;
            default:
                break;
        }
    }

    var_0._id_7981 = var_1;
    var_3 = maps\_vehicle::_id_211F( var_0 );

    if ( isdefined( var_0.targetname ) )
    {
        switch ( var_0.targetname )
        {
            case "friend_truck":
                var_4 = _id_7969( var_3 );
                level._id_7979 = var_3;
                break;
            case "friend_truck_ghost":
                var_3 hide();
                level._id_7978 = var_3;
                break;
            case "player_truck":
                level._id_797B = var_3;
                var_3 maps\_utility::delaythread( 0.05, ::_id_797D );
                break;
            case "player_truck_ghost":
                var_3 hide();
                level._id_797A = var_3;
                break;
            default:
                break;
        }
    }

    var_5 = getvehiclenode( var_1.target, "targetname" );
    var_6 = _id_7976( var_5._id_797F );
    var_3._id_291A = var_1;
    var_3 attachpath( var_1 );
    var_3 thread maps\_vehicle::_id_1FA6();
    var_3 maps\_vehicle::_id_2B1B( var_5, var_6 );
}

_id_7982()
{
    var_0 = _id_7969( self );
    _id_7983();
}

_id_7983()
{
    if ( !isdefined( self._id_2974 ) )
        return;

    foreach ( var_1 in self._id_2974 )
    {
        if ( var_1.model == "axis" )
            var_1 hide();

        _id_799A( var_1 );
    }
}

_id_7984( var_0, var_1, var_2 )
{
    maps\_utility::_id_2829( var_0 );
    self waittillmatch( "animontagdone", "window_break" );

    if ( var_1 )
        var_2 _id_79B7( "tag_glass_right_front" );
    else
        var_2 _id_79B7( "tag_glass_left_front" );

    self waittillmatch( "animontagdone", "door_open" );

    if ( var_1 )
        var_2 thread maps\_utility::play_sound_on_tag( "uk_utility_door_open", "tag_glass_right_front" );
    else
        var_2 thread maps\_utility::play_sound_on_tag( "uk_utility_door_open", "tag_glass_left_front" );

    self waittillmatch( "animontagdone", "door_close" );

    if ( self == level._id_56DE )
    {
        var_2 maps\_utility::delaythread( 0.5, maps\_utility::play_sound_on_tag, "scn_london_utility_truck_startup", "TAG_DRIVER" );
        var_2 common_scripts\utility::delaycall( 1, ::vehicle_turnengineon );
    }

    if ( var_1 )
        var_2 thread maps\_utility::play_sound_on_tag( "uk_utility_door_close", "tag_glass_right_front" );
    else
        var_2 thread maps\_utility::play_sound_on_tag( "uk_utility_door_close", "tag_glass_left_front" );

    maps\_utility::_id_282B( var_0 );
}

_id_7985()
{
    level._id_7986 = gettime();
    level endon( "stop_manage_players_attacker_accuracy" );

    for (;;)
    {
        var_0 = gettime() - level._id_7986;
        var_1 = level.player.attackeraccuracy;
        var_2 = 0;

        if ( var_0 > 6000 )
        {
            var_1 = 1;
            var_2 = 1;
        }
        else if ( var_0 > 4000 )
        {
            var_1 = 0.6;
            var_2 = 1;
        }
        else if ( var_0 > 2500 )
        {
            var_1 = 0.4;
            var_2 = 1;
        }
        else if ( var_0 > 1000 )
            var_1 = 0.3;

        if ( level.player._id_0F53 )
        {
            var_1 *= 0.5;
            var_1 = clamp( var_1, 0.1, 1 );
        }

        level.player.attackeraccuracy = var_1;

        if ( var_2 )
            common_scripts\utility::array_thread( getaiarray( "axis" ), maps\_utility::_id_2613, level.player );

        wait 0.05;
    }
}

_id_7987()
{
    level._id_7988 = getentarray( "train_guy_damager", "targetname" );

    foreach ( var_1 in level._id_7988 )
    {
        var_1._id_7989 = var_1.origin;
        var_1 thread _id_79B0();
    }
}

_id_798A()
{
    var_0 = level._id_7988[0];
    level._id_7988 = common_scripts\utility::array_remove( level._id_7988, var_0 );
    var_0.origin = self.origin;
    var_0._id_798B = self;
    var_0 thread maps\_utility::_id_2765( self );
    self waittill( "death" );
    level._id_7988 = maps\_utility::_id_0BC3( level._id_7988, var_0 );
    var_0.origin = var_0._id_7989;
}

_id_798C()
{
    self waittill( "trigger" );
    var_0 = level._id_798D;

    if ( isdefined( self._id_16A5 ) )
        var_0 = var_0._id_7957[self._id_16A5];

    switch ( self.script_noteworthy )
    {
        case "switch_door_guys":
            var_0 _id_798E();
            break;
    }
}

_id_798E()
{
    foreach ( var_1 in self._id_798F )
    {
        if ( isdefined( var_1._id_7990 ) )
        {
            if ( var_1._id_7991 == "left" )
                var_1._id_7991 = "right";
            else
                var_1._id_7991 = "left";

            _id_7995( var_1, self, var_1._id_7991, var_1._id_7992 );
        }
    }
}

_id_7993()
{
    self waittill( "trigger" );
    var_0 = level._id_798D;
    var_1 = 4;
    var_2 = 1;
    var_3 = 0;
    var_4 = 0;
    var_5 = undefined;
    var_6 = 0;

    if ( self.script_noteworthy == "spawn_train_door_guys" )
    {
        if ( !isdefined( self._id_5E45 ) )
            var_1 = 1;

        var_4 = 1;
        var_5 = self._id_7994;
    }

    if ( isdefined( self._id_5E45 ) )
        var_1 = self._id_5E45;

    if ( isdefined( self._id_214A ) )
        var_2 = self._id_214A;

    if ( isdefined( self._id_16A5 ) )
        var_0 = var_0._id_7957[self._id_16A5];

    if ( isdefined( self._id_164F ) )
    {
        switch ( self._id_164F )
        {
            case "end":
                var_3 = 1;
                break;
            case "delete_door_guys":
                var_6 = 1;
                break;
        }
    }

    var_7 = [];

    foreach ( var_9 in var_0._id_2974 )
    {
        if ( !isdefined( var_9.spawner ) )
            continue;

        if ( !var_4 && isdefined( var_9._id_164F ) )
        {
            if ( var_9._id_164F == "door_opener" )
                continue;
        }

        var_7[var_7.size] = var_9;
    }

    var_7 = maps\_utility::_id_0B53( var_7 );

    if ( !isdefined( var_0._id_798F ) )
        var_0._id_798F = [];

    if ( var_2 )
    {
        if ( isdefined( var_0._id_798F ) )
            maps\_utility::_id_135B( var_0._id_798F );

        var_0._id_798F = [];
    }

    if ( var_6 )
    {
        foreach ( var_12 in var_0._id_798F )
        {
            if ( isdefined( var_12._id_7990 ) )
                var_12 delete();
        }

        if ( !isdefined( var_0._id_798F ) )
            var_0._id_798F = [];
    }

    if ( var_3 )
    {
        var_14 = [];

        foreach ( var_9 in var_7 )
        {
            if ( !isdefined( var_9._id_164F ) )
                continue;

            if ( var_9._id_164F != "front_guy_for_end" )
                continue;

            var_14[var_14.size] = var_9;
        }

        var_7 = var_14;
    }

    if ( var_4 )
    {
        foreach ( var_9 in var_7 )
        {
            if ( !isdefined( var_9._id_164F ) )
                continue;

            if ( var_9._id_164F != "door_opener" )
                continue;

            var_18 = [];
            var_19 = undefined;

            if ( isdefined( self._id_251B ) )
            {
                var_18[var_18.size] = self._id_251B;
                var_19 = 1;
            }
            else
            {
                var_18[var_18.size] = 1;
                var_18[var_18.size] = 2;
                var_18 = maps\_utility::_id_0B53( var_18 );
                var_19 = clamp( var_1, 1, 2 );
            }

            var_1 -= var_19;

            for ( var_20 = 0; var_20 < var_19; var_20++ )
            {
                var_9.spawner.origin = var_9.origin;
                var_9.spawner.count = 1;
                var_12 = var_9.spawner stalingradspawn();

                if ( maps\_utility::_id_13AF( var_12 ) )
                    continue;

                _id_7995( var_12, var_0, var_5, var_18[var_20] );
                _id_79A1( var_12, var_0 );

                if ( var_19 - var_20 > 1 )
                    wait 0.05;
            }
        }
    }

    foreach ( var_9 in var_7 )
    {
        if ( var_0._id_798F.size >= var_1 )
            return;

        var_9.spawner.origin = var_9.origin;
        var_9.spawner.count = 1;
        var_12 = var_9.spawner stalingradspawn();

        if ( maps\_utility::_id_13AF( var_12 ) )
            continue;

        thread _id_7996( var_0, var_12, var_9, var_3 );
    }
}

_id_7995( var_0, var_1, var_2, var_3 )
{
    var_0._id_7991 = var_2;
    var_0._id_7990 = 1;
    var_0._id_7992 = var_3;

    if ( var_2 == "right" )
        var_4 = "RI";
    else
        var_4 = "LE";

    var_5 = "TAG_DOOR_" + var_3 + "_" + var_4;
    var_1 thread vehicle_scripts\_subway::_id_56BE( var_5, var_0 );
}

_id_7996( var_0, var_1, var_2, var_3 )
{
    var_1._id_7997 = 1;
    var_0 _id_7999( var_2 );
    var_1._id_7998 = var_2;
    var_4 = var_0;

    if ( isdefined( var_0.modeldummy ) )
        var_4 = var_0.modeldummy;

    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5 linkto( var_4, var_2._id_2A92, var_2._id_2A94, combineangles( var_2._id_2A93, ( 0.0, 180.0, 0.0 ) ) );
    var_1 linkto( var_5, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    thread _id_79A0( var_1, var_0 );

    if ( isdefined( var_2._id_164F ) )
        var_0 thread _id_799C( var_1, var_2 );

    if ( !var_3 )
        var_5 maps\_anim::_id_11C1( var_1, "crouch2stand" );

    var_0 _id_7999( var_2 );

    if ( isalive( var_1 ) )
        var_1 _id_79BA( var_1._id_7998 );

    var_1._id_7997 = undefined;
    wait 1;
    var_5 delete();
}

_id_7999( var_0 )
{
    var_1 = self;

    if ( isdefined( self.modeldummy ) )
        var_1 = self.modeldummy;

    var_0 linkto( var_1, var_0._id_2A92, var_0._id_2A94, var_0._id_2A93 );
}
#using_animtree("vehicles");

_id_799A( var_0 )
{
    if ( !isdefined( var_0._id_164F ) )
        return;

    switch ( var_0._id_164F )
    {
        case "lights_off_version":
            self._id_56C2 = var_0;
            var_0 useanimtree( #animtree );
            var_0 hide();
            var_0 notsolid();
            break;
        case "hero_light":
            var_0 startusingheroonlylighting();
            break;
        case "blood":
            var_0 startusingheroonlylighting();

            if ( !isdefined( self._id_799B ) )
                self._id_799B = [ var_0 ];
            else
                self._id_799B = maps\_utility::_id_0BC3( self._id_799B, var_0 );

            var_0 hide();
            break;
        default:
            break;
    }
}

_id_799C( var_0, var_1 )
{
    switch ( var_1._id_164F )
    {
        case "runner":
            thread _id_799D( var_0, var_1 );
            break;
        case "hero_light":
            var_0 startusingheroonlylighting();
            break;
        default:
            break;
    }
}

_id_799D( var_0, var_1 )
{
    var_0 endon( "death" );
    wait(randomfloatrange( 3.0, 6.0 ));

    while ( !_id_799F( var_0 ) )
        wait 0.05;

    var_2 = common_scripts\utility::random( [ "run_lowready_reload", "run_n_gun_l_120", "run_n_gun_l", "heat_run_loop" ] );
    var_3 = maps\_utility::_id_26EC( var_2 );
    var_4 = getanimlength( var_3 );
    var_5 = getmovedelta( var_3, 0, 1 );
    var_4 = getanimlength( var_3 );
    var_6 = getangledelta( var_3, 0, 1 );
    var_0 maps\_utility::delaythread( 0.1, maps\_utility::_id_26F6, 1 );
    var_1 maps\_anim::_id_11C1( var_0, var_2 );
    var_1 linkto( self, var_1._id_2A92, var_1._id_2A94 + var_5, ( 0.0, 0.0, 0.0 ) );
}

_id_799E( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0.origin;
    var_1 linkto( self );
    var_0 linkto( var_1, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 waittill( "death" );
    var_1 delete();
}

_id_799F( var_0 )
{
    if ( isdefined( var_0._id_7997 ) )
        return 0;

    if ( distancesquared( var_0.origin, level.player.origin ) > 1000000 )
        return 0;

    if ( gettime() - var_0._id_0A7F > 3000 )
        return 0;

    return 1;
}

_id_79A0( var_0, var_1 )
{
    var_0 thread _id_79B8();
    var_0._id_0D50 = maps\_utility::_id_26EC( "death_in_place" );
    var_0.maxsightdistsqrd = 4000000;
    var_0 thread _id_785D();
    _id_79A1( var_0, var_1 );
}

_id_79A1( var_0, var_1 )
{
    var_1 thread _id_79A6( var_0 );
    var_0._id_56C6 = var_1;
    maps\_utility::_id_282D( var_0, "guys_on_train" );
    var_0 thread _id_798A();
    var_0 maps\_utility::_id_12E2( ::_id_79A2 );
    var_0.dropweapon = 0;
}

_id_79A2( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = common_scripts\utility::spawn_tag_origin();
    var_7.origin = var_3;
    var_7.angles = vectortoangles( var_2 );

    if ( isdefined( self._id_56C6 ) )
        var_7 linkto( self._id_56C6 );

    playfxontag( common_scripts\utility::getfx( "subway_cart_guy_damage" ), var_7, "tag_origin" );

    if ( common_scripts\utility::cointoss() )
        _id_79A3();

    wait 3;
    var_7 delete();
}

_id_79A3()
{
    if ( !isalive( self ) )
        return;

    if ( !isdefined( self._id_56C6._id_799B ) )
        return;

    var_0 = maps\_utility::_id_0AE9( self.origin, self._id_56C6._id_799B, 330 );

    if ( !isdefined( var_0 ) )
        return;

    self._id_56C6._id_799B = common_scripts\utility::array_remove( self._id_56C6._id_799B, var_0 );
    var_0 show();
}

_id_79A4()
{
    self endon( "death" );
    self endon( "stop_orient_to_player" );

    for (;;)
    {
        if ( isdefined( self.enemy ) )
            self orientmode( "face point", self.enemy geteye() );

        wait 0.05;
    }
}

_id_79A5( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self endon( "stop_orient_to_player" );

    for (;;)
    {
        self orientmode( "face point", var_0.origin );
        wait 0.05;
    }
}

_id_785D()
{
    self endon( "death" );
    self endon( "stop_orient_to_player" );

    for (;;)
    {
        self orientmode( "face point", level.player geteye() );
        wait 0.05;
    }
}

_id_79A6( var_0 )
{
    self endon( "death" );

    if ( !isdefined( self._id_798F ) )
        self._id_798F = [];

    self._id_798F = maps\_utility::_id_0BC3( self._id_798F, var_0 );
    var_0 waittill( "death" );
    self._id_798F = common_scripts\utility::array_remove( self._id_798F, var_0 );
}

_id_79A7()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::getstruct( "train_car_crash_234", "targetname" );
    var_1 = maps\_utility::_id_1287( "train_intersect_car" );
    var_0 maps\_anim::_id_124F( var_1, "intersection_crash" );
    var_0 maps\_anim::_id_1246( var_1, "intersection_crash" );
}

_id_79A8()
{
    self waittill( "trigger" );
    thread _id_79A9();
    _id_79AC( "london_station_civ1", 7000 );
    _id_79AC( "london_station_civ2", 6000 );
    _id_79AC( "london_station_civ3", 10000 );
    _id_79AC( "london_station_civ4", 3000 );
    _id_79AC( "london_station_civ5", 4500 );
    _id_79AC( "london_station_civ6", 5000 );
    _id_79AC( "london_station_civ7", 3000 );
    _id_79AC( "london_station_civ8", 15000 );
}

_id_79A9()
{
    thread _id_79AA( "scn_walla_london_subway_scream_l", -400 );
    thread _id_79AA( "scn_walla_london_subway_scream_r", 400 );
}

_id_79AA( var_0, var_1 )
{
    var_2 = level.player.origin[0] + var_1;
    var_3 = 34000;
    var_4 = 216;
    var_5 = spawn( "script_origin", ( var_2, var_3, var_4 ) );
    var_5 endon( "sound_done" );
    var_5 thread _id_79AB( var_1, var_3, var_4 );
    var_5 playsound( var_0, "sound_done" );
    var_5 waittill( "sound_done" );
    var_5 delete();
}

_id_79AB( var_0, var_1, var_2 )
{
    self endon( "death" );

    while ( self.origin[0] > 49416 )
    {
        wait 0.05;

        if ( level.player.origin[0] > 55856 )
            var_3 = 55856;
        else
            var_3 = level.player.origin[0] + -50 + var_0;

        self.origin = ( var_3, var_1, var_2 );
    }
}

_id_79AC( var_0, var_1 )
{
    _id_79AD( var_0, var_0, var_1 );
}

_id_79AD( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::getstructarray( var_1, "targetname" );
    common_scripts\utility::array_thread( var_3, ::_id_79AF, var_0, var_1, var_2 );
}

_id_79AE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !isspawner( var_4 ) )
            continue;

        var_4.count = 1;
        var_2[var_2.size] = var_4;
    }

    return common_scripts\utility::random( var_2 );
}

_id_79AF( var_0, var_1, var_2 )
{
    var_3 = self;

    if ( !isspawner( self ) )
        var_3 = _id_79AE( "dronepool_station_civs" );

    var_4 = maps\_utility::_id_212D( var_3 );
    var_4 endon( "death" );
    maps\_utility::_id_282D( var_4, "station_civs" );
    var_4._id_1032 = var_0;

    if ( var_4 maps\_utility::_id_26EB( "idle" ) )
        thread maps\_anim::_id_124E( var_4, "idle", "stop_" + var_0 );
    else if ( var_4 maps\_utility::_id_26EB( "reaction" ) )
        maps\_anim::_id_11CF( var_4, "reaction" );

    if ( !var_4 maps\_utility::_id_26EB( "reaction" ) )
        return;

    level.player maps\_utility::_id_27B4( self.origin, var_2 + randomintrange( -1000, 1000 ), 0.05 );
    self notify( "stop_" + var_0 );
    maps\_anim::_id_1246( var_4, "reaction" );
}

_id_79B0()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !_id_79B3( var_1 ) )
            continue;

        common_scripts\utility::array_thread( getaiarray( "axis" ), maps\_utility::_id_2613 );
        level.player.attackeraccuracy = 0.01;
        level._id_7986 = gettime();

        if ( !isalive( self._id_798B ) )
            continue;

        if ( !isdefined( level._id_79B1 ) )
            level._id_79B1 = gettime();

        if ( gettime() - level._id_79B1 < 500 )
            continue;

        if ( !isdefined( self._id_798B._id_79B2 ) )
            self._id_798B._id_79B2 = 0;

        self._id_798B._id_79B2++;

        if ( !common_scripts\utility::flag( "rocky_road" ) && isalive( self._id_798B ) && isdefined( var_1 ) && distance( var_1.origin, self._id_798B.origin ) < 1500 && self._id_798B._id_79B2 > 3 )
        {
            self._id_798B._id_79B2 = 0;
            var_7 = common_scripts\utility::random( [ "J_Spine4", "J_Elbow_LE", "J_Hip_LE", "J_Clavicle_RI" ] );
            var_8 = self._id_798B gettagorigin( var_7 );
            magicbullet( "nosound_magicbullet", var_8 + var_2 * -20, var_8 );
            level._id_79B1 = gettime();
        }
    }
}

_id_79B3( var_0 )
{
    if ( var_0 == level.player )
        return 1;

    return 0;
}

_id_5423()
{
    waittillframeend;
    var_0 = maps\_utility::_id_26EC( "subway_doors_root" );
    var_1 = maps\_utility::_id_26EC( "subway_doors_open" );
    var_2 = maps\_utility::_id_26EC( "subway_doors_open2" );
    self clearanim( var_0, 0 );
    self setanim( var_1 );
    self setanim( var_2 );
    self._id_56C2 clearanim( var_0, 0 );
    self._id_56C2 setanim( var_1 );
    self._id_56C2 setanim( var_2 );
}

_id_79B4()
{
    waittillframeend;

    if ( isspawner( self ) )
        return;

    var_0 = maps\_utility::_id_26EC( "subway_doors_root" );
    var_1 = maps\_utility::_id_26EC( "subway_doors_close" );
    var_2 = maps\_utility::_id_26EC( "subway_doors_close2" );
    self clearanim( var_0, 0 );
    self setanim( var_1 );
    self setanim( var_2 );
    self._id_56C2 clearanim( var_0, 0 );
    self._id_56C2 setanim( var_1 );
    self._id_56C2 setanim( var_2 );
    var_3 = getanimlength( var_1 );
    wait(var_3);
    self clearanim( var_0, 0 );
    self._id_56C2 clearanim( var_0, 0 );
}

_id_79B5()
{
    self hidepart( "TAG_WINDOW_SMALL_02_LE" );
    self hidepart( "TAG_WINDOW_SMALL_02_LE_D" );
    self hidepart( "TAG_WINDOW_SMALL_03_LE" );
    self hidepart( "TAG_WINDOW_SMALL_03_LE_D" );
    self hidepart( "TAG_WINDOW_SMALL_04_LE" );
    self hidepart( "TAG_WINDOW_SMALL_04_LE_D" );
    self hidepart( "TAG_WINDOW_SMALL_05_LE" );
    self hidepart( "TAG_WINDOW_SMALL_05_LE_D" );
    self hidepart( "TAG_WINDOW_SMALL_02_RI" );
    self hidepart( "TAG_WINDOW_SMALL_02_RI_D" );
    self hidepart( "TAG_WINDOW_SMALL_03_RI" );
    self hidepart( "TAG_WINDOW_SMALL_03_RI_D" );
    self hidepart( "TAG_WINDOW_SMALL_04_RI" );
    self hidepart( "TAG_WINDOW_SMALL_04_RI_D" );
    self hidepart( "TAG_WINDOW_SMALL_05_RI" );
    self hidepart( "TAG_WINDOW_SMALL_05_RI_D" );
    self hidepart( "TAG_FRONT_LIGHT_LE" );
    self hidepart( "TAG_FRONT_LIGHT_RI" );
    self hidepart( "TAG_FRONT_WINDOW" );
    self hidepart( "TAG_FRONT_WINDOW_D" );
    self hidepart( "TAG_INT_WINDOW_03_RI" );
    self hidepart( "TAG_WINDOW_011_LE" );
    self hidepart( "TAG_WINDOW_011_LE_D" );
    self hidepart( "TAG_WINDOW_011_RI" );
    self hidepart( "TAG_WINDOW_011_RI_D" );
    self hidepart( "TAG_WINDOW_012_LE" );
    self hidepart( "TAG_WINDOW_012_LE_D" );
    self hidepart( "TAG_WINDOW_012_RI" );
    self hidepart( "TAG_WINDOW_012_RI_D" );
    self hidepart( "TAG_WINDOW_014_LE" );
    self hidepart( "TAG_WINDOW_014_LE_D" );
    self hidepart( "TAG_WINDOW_014_RI" );
    self hidepart( "TAG_WINDOW_014_RI_D" );
    self hidepart( "TAG_WINDOW_01_LE" );
    self hidepart( "TAG_WINDOW_01_LE_D" );
    self hidepart( "TAG_WINDOW_01_RI" );
    self hidepart( "TAG_WINDOW_01_RI_D" );
    self hidepart( "TAG_WINDOW_03_LE" );
    self hidepart( "TAG_WINDOW_03_LE_D" );
    self hidepart( "TAG_WINDOW_03_RI" );
    self hidepart( "TAG_WINDOW_03_RI_D" );
    self hidepart( "TAG_WINDOW_04_LE" );
    self hidepart( "TAG_WINDOW_04_LE_D" );
    self hidepart( "TAG_WINDOW_04_RI" );
    self hidepart( "TAG_WINDOW_04_RI_D" );
    self hidepart( "TAG_WINDOW_07_LE" );
    self hidepart( "TAG_WINDOW_07_LE_D" );
    self hidepart( "TAG_WINDOW_07_RI" );
    self hidepart( "TAG_WINDOW_07_RI_D" );
    self hidepart( "TAG_WINDOW_08_LE" );
    self hidepart( "TAG_WINDOW_08_LE_D" );
    self hidepart( "TAG_WINDOW_08_RI" );
    self hidepart( "TAG_WINDOW_08_RI_D" );
}

_id_79B6()
{
    self hidepart( "TAG_GLASS_LEFT_FRONT" );
    self hidepart( "TAG_GLASS_LEFT_FRONT_D" );
    self hidepart( "TAG_GLASS_BACK" );
    self hidepart( "TAG_GLASS_BACK_D" );
    self hidepart( "TAG_GLASS_FRONT" );
    self hidepart( "TAG_GLASS_FRONT_D" );
    self hidepart( "TAG_GLASS_RIGHT_FRONT" );
    self hidepart( "TAG_GLASS_RIGHT_FRONT_D" );
}

_id_79B7( var_0 )
{
    var_1 = "MOD_RIFLE_BULLET";
    var_2 = "";
    var_3 = self gettagorigin( var_0 );
    var_4 = anglestoforward( self gettagangles( var_0 ) ) * -1;
    self notify( "damage", 200, level.player, var_4, var_3, var_1, "", var_0, 0 );
}

_id_79B8()
{
    self.a._id_0D55 = 1;
    self._id_2145 = 1;
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = gettime();
    var_1 = isdefined( self._id_79B9 );
    var_2 = self._id_0D50;
    var_3 = self._id_56C6;

    if ( isdefined( var_3.modeldummy ) )
        var_3 = var_3.modeldummy;

    var_4 = undefined;

    if ( isdefined( self._id_7998 ) )
        var_4 = self._id_7998;

    var_5 = maps\_vehicle_aianim::_id_25C1( self );

    if ( isdefined( var_4 ) )
        var_5 _id_79BA( var_4 );
    else
        var_5 linkto( var_3 );

    var_5 animscripted( "death_on_train_done", var_5.origin, var_5.angles, var_2 );
    var_6 = getanimlength( var_2 );
    wait(var_6 - 0.05);

    if ( !var_1 )
        maps\_utility::_id_1254( var_0, 10.4 );

    var_5 delete();
}

_id_79BA( var_0 )
{
    self linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

_id_79BB( var_0 )
{
    thread maps\_utility::_id_11F4( "london_ldr_finghell" );
    thread maps\_utility::_id_194E( "london_tube_end", 2 );
    level.player allowcrouch( 0 );
    var_1 = level._id_79BC;
    _id_79BD( var_1, "tag_player" );

    if ( !common_scripts\utility::flag( "train_crash_fast_forward" ) )
        thread _id_79C0( 0.5, var_1, "tag_player", 180, 0 );

    level.player playersetgroundreferenceent( level._id_5A23 );
    level._id_457C = var_1;
    var_1 common_scripts\utility::delaycall( 0.2, ::show );
}

_id_79BD( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 0.0, 180.0, 0.0 );

    if ( !isdefined( level._id_5A23 ) )
        level._id_5A23 = common_scripts\utility::spawn_tag_origin();

    level._id_5A23 maps\_utility::_id_27A0( var_0, var_1 );
    level._id_5A23 dontinterpolate();
    level._id_5A23 linkto( var_0, var_1, ( 0.0, 0.0, 0.0 ), var_2 );
}

_id_79BE( var_0 )
{

}

_id_79BF( var_0 )
{
    wait 0.5;
    var_1 = maps\london_code::_id_473C();
    var_1 fadeovertime( 0.5 );
    var_1.alpha = 1;
    wait 0.5;
    maps\_loadout::_id_1C7B( "london", 1 );
    maps\_utility::_id_195A();
}

_id_79C0( var_0, var_1, var_2, var_3, var_4 )
{
    level.player freezecontrols( 1 );
    var_5 = var_0 * 20;
    var_6 = var_3;
    var_7 = var_4 - var_3;
    var_8 = var_7 / var_5;
    var_5 = int( var_5 );

    for ( var_9 = 0; var_9 < var_5; var_9++ )
    {
        var_6 += var_8;
        level.player playerlinktodelta( var_1, var_2, 1, var_6, var_6, var_6, var_6 );
        wait 0.05;
    }

    level.player freezecontrols( 0 );
}

_id_79C1( var_0 )
{
    maps\_utility::_id_282E( "station_civs" );
}

_id_79C2( var_0 )
{
    if ( !isdefined( var_0._id_795E ) )
    {
        maps\_utility::_id_2830( ::_id_79C2 );
        return;
    }

    var_1 = getvehiclenode( self.target, "targetname" );
    var_2 = getvehiclenode( "vehicle_node_player_fast_detour", "script_noteworthy" );
    var_0 maps\_vehicle::_id_2B1B( var_1, var_2 );
}

_id_79C3( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );

    if ( distance( self.origin, var_1.origin ) < var_1.radius )
        return;

    self forceteleport( var_1.origin, var_1.angles );
}

_id_79C4( var_0 )
{
    if ( !_id_79C9( var_0 ) )
        maps\_utility::_id_2830( ::_id_79C4 );
    else
    {
        maps\_utility::_id_2133();

        if ( isarray( level._id_11BB[self.script_sound] ) )
        {
            for ( var_1 = 0; var_1 < level._id_11BB[self.script_sound].size; var_1++ )
            {
                var_2 = level._id_11BB[self.script_sound][var_1];
                maps\_utility::_id_11F4( var_2 );
            }

            return;
        }

        maps\_utility::_id_11F4( self.script_sound );
    }
}

_id_79C5( var_0 )
{
    maps\_utility::_id_2133();

    if ( isdefined( self.script_sound ) )
        thread maps\_utility::_id_11F4( self.script_sound );

    var_1 = maps\_vehicle::_id_2881( self._id_164F );
}

_id_79C6( var_0 )
{
    maps\_utility::_id_2133();
    var_1 = maps\_vehicle::_id_2A99( self._id_164F );
}

_id_0B1A( var_0 )
{
    var_1 = self._id_164F;
    setsaveddvar( "ui_hideMap", "1" );
}

_id_79C7()
{
    maps\_utility::_id_1402( "spotlight_on" );
    maps\_utility::_id_13DE( "spotlight_on" );
    maps\_utility::_id_1402( "follow_path" );
    maps\_vehicle::_id_2A3D();
    thread maps\london_code::_id_571F( self.target );
    wait 0.05;

    foreach ( var_1 in self.mgturret )
    {
        var_1.script_delay_min = 0.05;
        var_1.script_delay_min = 0.1;
        var_1._id_2279 = 20;
        var_1._id_227A = 30;
        var_1._id_227B = common_scripts\utility::getfx( "minigun_shells" );
        var_1._id_227E = "scn_london_gattling_shells";
        var_1 notify( "stop_burst_fire_unmanned" );
        var_1 thread maps\_mgturret::_id_2278();
    }

    self setmaxpitchroll( 30, 50 );
    thread _id_79C8();
}

_id_79C8()
{
    self endon( "death" );
    var_0 = getent( "trainride_littlebird_target", "targetname" );
    self setlookatent( var_0 );

    foreach ( var_2 in self.mgturret )
        var_2 settargetentity( var_0 );

    var_4 = var_0.origin[1] - self.origin[1];

    for (;;)
    {
        var_5 = self.origin[1] + var_4;
        var_0.origin = ( var_0.origin[0], var_5, var_0.origin[2] );
        wait 0.05;
    }
}

_id_79C9( var_0 )
{
    if ( !isdefined( level._id_797B ) )
        return 0;

    if ( distance( self.origin, var_0.origin ) > 400 )
        return 0;

    if ( var_0 == level._id_797A && distance( level._id_797B.origin, level._id_797A.origin ) < 32 )
        return 1;

    if ( var_0 != level._id_797B )
        return 0;

    return 1;
}

_id_79CA( var_0 )
{
    if ( !_id_79C9( var_0 ) )
    {
        maps\_utility::_id_2830( ::_id_79CA );
        return;
    }

    maps\_utility::_id_1425( "tunnel_save" );
}

train_one_flyby_1_spawn()
{
    thread _id_79CD();

    if ( isdefined( self._id_164F ) && self._id_164F == "last_cart" )
        return;

    self vehicle_turnengineoff();

    if ( self.classname != "script_vehicle_subway_engine_destructible" )
        return;

    maps\_utility::play_sound_on_entity( "scn_london_subway_passby1" );
}

train_one_flyby_2_spawn()
{
    thread _id_79CD();

    if ( isdefined( self._id_164F ) && self._id_164F == "last_cart" )
        return;

    self vehicle_turnengineoff();

    if ( self.classname != "script_vehicle_subway_engine_destructible" )
        return;

    maps\_utility::play_sound_on_entity( "scn_london_subway_passby2" );
}

_id_79CD()
{
    self waittill( "reached_end_node" );
    self delete();
}

_id_79CE( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_mounts_car" );
    _id_79D1();
    childthread _id_79CF();

    if ( isdefined( level._id_4553 ) )
        var_1 = level._id_4553;
    else
    {
        var_1 = level.player maps\_utility::_id_27AB();
        var_1.intensity = 0.035;
        level._id_4553 = var_1;
    }

    common_scripts\utility::flag_set( "rocky_road" );

    while ( level.player istouching( self ) )
        wait 0.05;

    common_scripts\utility::flag_clear( "rocky_road" );

    if ( !common_scripts\utility::flag( "train_crashing" ) )
        _id_79D0();

    if ( isdefined( var_1 ) )
        var_1.intensity = 0.025;

    self delete();
}

_id_79CF()
{
    level._id_797B joltbody( level._id_797B.origin + ( 0.0, 0.0, 64.0 ) + common_scripts\utility::randomvector( 32 ), 0.7 );
    level.player playrumbleonentity( "damage_heavy" );

    for (;;)
    {
        wait(randomfloatrange( 0.15, 0.4 ));

        if ( common_scripts\utility::cointoss() )
        {
            var_0 = "TAG_DRIVER";
            level._id_797B joltbody( level._id_797B gettagorigin( var_0 ), 0.4 );
            level._id_797B thread maps\_utility::play_sound_on_tag( "uk_utility_suspension_heavy", "TAG_DRIVER" );
            earthquake( 0.2, 1.75, level.player.origin, 2800 );
            level.player playrumbleonentity( "damage_heavy" );
            continue;
        }

        earthquake( 0.1, 1.5, level.player.origin, 2000 );
        level.player playrumbleonentity( "damage_light" );
    }
}

_id_79D0()
{
    var_0 = _id_7967( level._id_797B );
    level.player playerlinktodelta( var_0, "tag_player", 0.1, 180, 180, 80, 80, 1 );
}

_id_79D1()
{
    var_0 = _id_7967( level._id_797B );
    level.player playerlinktodelta( var_0, "tag_player", 0.7, 180, 180, 80, 80, 1 );
}

_id_79D2( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( isdefined( var_1.team ) && var_1.team != "allies" )
        return;

    if ( isdefined( var_3 ) && common_scripts\utility::cointoss() && isdefined( self._id_79D3 ) )
        playfx( common_scripts\utility::getfx( "vehicle_scrape_sparks" ), var_3 + self vehicle_getvelocity() * 0.2, var_2 * -1 );

    if ( !isdefined( self._id_79D4 ) )
        self._id_79D4 = gettime();

    if ( !isdefined( self._id_79D5 ) )
        self._id_79D5 = 0;

    if ( gettime() - self._id_79D4 > 300 )
        self._id_79D5 = 0;

    self._id_79D4 = gettime();
    self._id_79D5++;

    if ( common_scripts\utility::cointoss() )
        return;

    if ( isdefined( self._id_79D3 ) )
        return;

    playfx( common_scripts\utility::getfx( "vehicle_scrape_sparks" ), var_3 + self vehicle_getvelocity() * 0.2, var_2 * -1 );

    if ( !isdefined( self._id_56C2 ) )
        return;

    if ( self._id_79D5 < 5 )
        return;

    self._id_79D3 = 1;

    if ( common_scripts\utility::flag( "train_crash_explode" ) )
        return;

    var_7 = randomintrange( 10, 15 );

    for ( var_8 = 0; var_8 < var_7; var_8++ )
    {
        self hidepart( "TAG_INTERIOR_UNLIT" );
        self._id_56C2 show();
        wait(randomfloatrange( 0.05, 0.2 ));

        if ( common_scripts\utility::flag( "train_crash_explode" ) )
            return;

        self showpart( "TAG_INTERIOR_UNLIT" );
        self._id_56C2 hide();
        wait(randomfloatrange( 0.05, 0.2 ));

        if ( common_scripts\utility::flag( "train_crash_explode" ) )
            return;
    }

    self._id_79D3 = undefined;
}

_id_79D6( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_5A23;

    var_1 = combineangles( var_0.angles, self getplayerangles() );
    self unlink();
    self playersetgroundreferenceent( undefined );
    self setplayerangles( var_1 );
}

player_pushes_stick_for_a_bit()
{
    var_0 = 300;
    var_1 = distance( ( 0.0, 0.0, 0.0 ), level.player getnormalizedmovement() );

    if ( var_1 == 0 )
    {
        level._id_79D8 = gettime();
        return 0;
    }

    if ( !isdefined( level._id_79D8 ) )
    {
        level._id_79D8 = gettime();
        return 0;
    }

    return gettime() - level._id_79D8 > var_0;
}

_id_79D9( var_0 )
{
    level._id_798D thread _id_5423();
    common_scripts\utility::array_thread( level._id_798D._id_7957, ::_id_5423 );
}

_id_79DA( var_0 )
{
    level._id_798D thread _id_79B4();
    common_scripts\utility::array_thread( level._id_798D._id_7957, ::_id_79B4 );
}

_id_404E( var_0 )
{
    level.player dodamage( level.player.health * 0.75, level.player geteye() );
    level._id_79DB thread maps\_utility::play_sound_on_entity( "scn_london_player_truck_crash_impact" );
    level.player thread maps\_utility::play_sound_on_entity( "hand_slide_plr_start" );
    level.player thread common_scripts\utility::play_loop_sound_on_entity( "hand_slide_plr_loop" );
    level.player thread _id_79DD();
    level.player shellshock( "westminster_truck_crash", 6 );
    level.player maps\_utility::delaythread( 1, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 3, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 7, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 8, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 11, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    wait 3;
    level.player dodamage( level.player.health * 0.75, level.player geteye() );
    earthquake( 0.25, 3.5, level.player.origin, 2000 );
    level.player notify( "done_sliding" );
    level.player common_scripts\utility::stop_loop_sound_on_entity( "hand_slide_plr_loop" );
    level.player maps\_utility::play_sound_on_entity( "hand_slide_plr_end" );
}

_id_79DC( var_0 )
{
    level.player dodamage( level.player.health * 0.75, level.player geteye() );
    level.player thread _id_79DD();
    level.player shellshock( "westminster_truck_crash", 6 );
    level.player maps\_utility::delaythread( 1, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 3, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 7, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 8, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    level.player maps\_utility::delaythread( 11, maps\_utility::play_sound_on_entity, "breathing_heartbeat" );
    wait 3;
    level.player dodamage( level.player.health * 0.75, level.player geteye() );
    earthquake( 0.25, 3.5, level.player.origin, 2000 );
    level.player notify( "done_sliding" );
}

_id_79DD()
{
    self endon( "done_sliding" );
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( 0.05, 0.1 ));

        if ( common_scripts\utility::cointoss() )
            earthquake( 0.3, 0.55, level.player.origin, 2800 );
        else
            earthquake( 0.15, 1.5, level.player.origin, 2000 );

        level.player playrumbleonentity( "damage_heavy" );
    }
}
