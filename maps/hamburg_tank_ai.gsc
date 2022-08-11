// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7D9A()
{
    common_scripts\utility::create_lock( "hamburg_tank_ai_troop_trace" );
    common_scripts\utility::create_lock( "hamburg_tank_ai_getNearestVectorOutsideRange" );
    common_scripts\utility::create_lock( "hamburg_tank_ai_vistarget" );
    common_scripts\utility::create_lock( "hamburg_tank_ai_troop_cache" );
    precacherumble( "hamburg_tank_fire" );
}

_id_7D9B( var_0 )
{
    self._id_29AE = 0;
    self._id_29B3 = 500;
    self._id_29B1 = 1400;
    self._id_29B2 = 710;
    self._id_2955 = 1;

    if ( !isdefined( var_0 ) )
        thread _id_7D9C();
}

_id_7D9C()
{
    self notify( "stop_turret_attack_think_hamburg" );
    self endon( "stop_turret_attack_think_hamburg" );

    if ( !isdefined( level._id_7D9D ) )
        level._id_7D9D = 0;

    if ( !isdefined( self._id_29AA ) )
        self._id_29AA = 1;

    if ( !isdefined( self._id_29A8 ) )
        self._id_29A8 = 1;

    if ( !isdefined( level.tanks ) )
        level.tanks = [];

    if ( !maps\_utility::_id_133C( "stunned_tank" ) )
        maps\_utility::_id_1402( "stunned_tank" );

    level.tanks = maps\_utility::_id_1843( level.tanks, [ self ] );
    childthread _id_7DA7();
    self._id_299F = 0;
    self._id_299E = 1;
    self._id_29AC = 0;
    self._id_29AD = [];
    self._id_29AF = [];
    self._id_29B0 = gettime();

    if ( !isdefined( self._id_29A8 ) )
        self._id_29A8 = 1;

    self._id_29A2 = 30;
    self._id_29C0 = 430;
    self._id_29A3 = self._id_29A2 - self._id_29C0;

    if ( !isdefined( self._id_2168 ) )
        self._id_2168 = 0.44;

    if ( self.script_team == "allies" )
        _id_7DA0();

    self._id_2168 = clamp( self._id_2168, 0, 0.9999 );

    if ( !isdefined( self._id_296F ) )
        self._id_296F = 0;

    self.accuracy = self._id_29C0 + self._id_29A3 * self._id_2168;
    self endon( "death" );
    self._id_29AB = 2;
    var_0 = 0;
    self._id_29BB = gettime();
    self._id_29BA = 0.35;
    self._id_29B9 = 1 - self._id_29BA;
    self._id_29AC = 0;
    self._id_29A0 = 0;

    if ( self.script_team == "allies" )
    {
        foreach ( var_2 in self._id_0A39 )
        {
            if ( isdefined( var_2 ) )
                var_2._id_4886 = 0;
        }
    }

    for (;;)
    {
        while ( maps\_vehicle::_id_2AE0() )
            wait 0.05;

        var_4 = undefined;

        for (;;)
        {
            if ( !_id_7DBB() )
                break;

            if ( !_id_7DBA() )
                break;

            if ( maps\_vehicle::_id_2AE0() )
                break;

            var_4 = _id_7D9F();

            if ( !isdefined( var_4 ) )
                break;

            childthread _id_7DAC( var_4, "vehicle" );

            while ( _id_7DBA() && !self._id_29BC && !self._id_299F && isalive( var_4 ) && !self._id_29BD )
                wait 0.2;

            if ( self._id_299F )
                break;

            if ( _id_7DA4( var_4 ) )
                break;

            if ( self._id_29BD )
                break;

            self notify( "novistarget" );
            self._id_29BC = 0;

            if ( !_id_7DBA() )
                break;

            while ( gettime() < self._id_29BB && _id_7DBA() && isalive( var_4 ) )
                wait 0.05;

            wait 0.1;

            if ( !_id_7DBA() )
                break;

            if ( _id_7DA4( var_4 ) )
                break;

            var_5 = 1;

            for (;;)
            {
                common_scripts\utility::lock( "hamburg_tank_ai_troop_trace" );
                var_5 = _id_7DB5( var_4 );
                common_scripts\utility::unlock_wait( "hamburg_tank_ai_troop_trace" );

                if ( !( gettime() < self._id_29BB && isalive( var_4 ) && var_5 ) )
                    break;
            }

            if ( !var_5 )
                break;

            if ( gettime() < level._id_7D9D )
            {
                wait(( level._id_7D9D - gettime() ) / 1000);
                break;
            }

            if ( maps\_vehicle::_id_2AE0() )
                break;

            self clearturrettarget();

            if ( isdefined( level._id_7D9E ) )
                thread [[ level._id_7D9E ]]();
            else
                self fireweapon();

            _id_7DB8();

            if ( self vehicle_getspeed() == 0 )
                self._id_29AC++;

            if ( self._id_29AC > 9 )
                self._id_29AC = 9;

            _id_7DA3();
            var_0++;
            var_6 = gettime() + 1000;

            while ( gettime() < var_6 && _id_7DBA() )
                wait 0.05;

            if ( !_id_7DBA() )
                break;

            if ( var_0 > self._id_29AB )
            {
                var_0 = 0;
                break;
            }
        }

        if ( !self._id_29AA )
        {
            wait 0.1;
            continue;
        }

        if ( self._id_299F )
        {
            wait 0.05;
            self._id_299F = 0;
        }

        self._id_29AC = 0;
        var_0 = 0;

        if ( self._id_29AD.size )
            _id_7DA8( self._id_29AD[0] );

        _id_7DB4();

        if ( !self._id_29AD.size )
            _id_7DB8();

        _id_7DAF();
        wait 0.3;
    }
}

_id_7D9F()
{
    var_0 = undefined;

    if ( self._id_29AE > 0 )
    {
        var_1 = [];
        var_2 = self._id_29AE * self._id_29AE;

        foreach ( var_4 in self._id_29AD )
        {
            if ( distancesquared( self.origin, var_4.origin ) < self._id_29AE )
                var_1[var_1.size] = var_4;
        }

        if ( var_1.size > 0 )
        {
            var_1 = sortbydistance( var_1, self.origin );
            var_0 = var_1[0];
        }
    }
    else
        var_0 = self._id_29AD[0];

    return var_0;
}

_id_7DA0()
{
    if ( !isdefined( self.mgturret ) )
        return;

    var_0 = common_scripts\utility::array_removeundefined( self.mgturret );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_22A7 ) )
            var_2._id_22A6 = 1;

        var_2._id_22A5 = 1;

        if ( self.script_team == "axis" )
        {

        }

        maps\_mgturret::_id_229F( var_2, "easy" );

        if ( var_2.model == "weapon_m1a1_minigun" )
            var_2._id_48D2 = 3;

        if ( var_2 _id_7DA1() )
        {
            var_2._id_22AE = 1;
            var_2._id_22AA = animscripts\hummer_turret\common::_id_48C2;
            var_2 thread maps\hamburg_tank_sentry::_id_7D94( self.script_team, -1 );
            continue;
        }

        var_2 thread maps\_mgturret::_id_22A3( 1, self.script_team, 0.88 );
    }
}

_id_7DA1()
{
    switch ( self.model )
    {
        case "weapon_m1a1_minigun":
        case "weapon_dshk_turret_t90":
            return 1;
        default:
            return 0;
    }
}

_id_7DA2()
{
    foreach ( var_1 in self.mgturret )
    {
        var_1._id_22A5 = 0;
        var_1 notify( "stop_mg42_target_drones" );
    }
}

_id_7DA3()
{
    self._id_29BB = gettime() + 4500 + randomint( 1000 );
}

_id_7DA4( var_0 )
{
    if ( !isalive( var_0 ) )
    {
        _id_7DA9();
        return 1;
    }

    return 0;
}

_id_7DA5()
{
    if ( !_id_7DA6() )
        return 0;

    if ( self._id_29AD.size )
        return 0;

    return 1;
}

_id_7DA6()
{
    if ( !self._id_29AA )
        return 0;

    return self._id_29A8;
}

_id_7DA7()
{
    self waittill( "death" );
    level.tanks = common_scripts\utility::array_remove( level.tanks, self );
}

_id_7DA8( var_0 )
{
    if ( self._id_29AD.size == 0 )
    {

    }

    self._id_29AD = common_scripts\utility::array_remove( self._id_29AD, var_0 );
}

_id_7DA9()
{
    self._id_29AD = maps\_utility::_id_1361( self._id_29AD );
}

_id_7DAA( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0.health > 0 )
        self._id_29AD = _id_7DAE( self._id_29AD, var_0 );
}

_id_7DAB( var_0, var_1 )
{
    var_2 = [];
    var_3 = 0;

    if ( var_0.size > 1 )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( var_4 != 0 )
            {
                var_2[var_3] = var_0[var_4];
                var_3++;
            }
        }

        var_2[var_3] = var_0[0];
        return var_2;
    }
    else
        return var_0;
}

_id_7DAC( var_0, var_1 )
{
    self notify( "new_turret_on_vistarget" );
    self endon( "new_turret_on_vistarget" );
    self endon( "death" );

    if ( !self._id_29AA )
        return;

    self._id_29BC = 0;
    self._id_29BD = 0;
    common_scripts\utility::lock( "hamburg_tank_ai_vistarget" );

    if ( !isdefined( var_0 ) )
    {
        common_scripts\utility::unlock( "hamburg_tank_ai_vistarget" );
        return;
    }

    var_2 = distance( self.origin, var_0.origin );
    var_3 = getfxvisibility( self.origin, var_0.origin );
    var_4 = 3;
    var_5 = 1 + var_4 - var_3 * var_4;

    if ( self vehicle_getspeed() < 1 && var_1 == "troop" )
        var_6 = self.accuracy * ( 1 - 0.1 * self._id_29AC ) * var_5 * var_2 / 5000;
    else
    {
        self._id_29AC = 0;
        var_6 = self.accuracy * var_5 * var_2 / 5000;
    }

    var_7 = randomfloat( var_6 * self._id_29B9 ) + var_6 * self._id_29BA;
    var_8 = common_scripts\utility::flat_angle( vectortoangles( var_0.origin - self.origin ) );
    var_9 = -20 + randomint( 220 );

    if ( var_1 == "vehicle" )
        var_10 = ( 0.0, 0.0, 78.0 );
    else
        var_10 = ( 0.0, 0.0, 16.0 );

    var_11 = var_8 + ( var_9, 90, 0 );
    var_12 = anglestoforward( var_11 ) * var_7;
    var_13 = bullettrace( self gettagorigin( "tag_barrel" ), var_0.origin + var_12 + var_10, var_1 == "troop", self );
    var_12 = var_13["position"] - var_0.origin;

    if ( distance( var_13["position"], var_0.origin + var_10 ) / var_6 > 1.5 && ( !isdefined( var_13["entity"] ) || var_13["entity"] != var_0 ) && var_0 != level.player )
    {
        self._id_29A0++;

        if ( self._id_29A0 > 5 )
        {
            if ( var_1 == "vehicle" )
                self._id_29AD = _id_7DAB( self._id_29AD, var_0 );

            self._id_29A0 = 0;
        }

        common_scripts\utility::unlock( "hamburg_tank_ai_vistarget" );
        wait 0.05;
        self._id_299F = 1;
        return;
    }
    else
        self._id_29A0 = 0;

    if ( !_id_7DAD( var_0 ) )
    {
        self._id_29BD = 1;
        common_scripts\utility::unlock( "hamburg_tank_ai_vistarget" );
        return;
    }

    common_scripts\utility::unlock( "hamburg_tank_ai_vistarget" );
    self setturrettargetent( var_0, var_12 );
    self._id_29BC = 0;
    self endon( "weapon_fired" );
    self endon( "novistarget" );
    self waittill( "turret_on_target" );
    self._id_29BC = 1;
}

_id_7DAD( var_0 )
{
    var_1 = self getcentroid() + ( 0.0, 0.0, 100.0 );
    var_2 = var_0 getcentroid();
    var_3 = isai( var_0 );

    if ( var_3 )
        var_2 = var_0 geteye();
    else if ( var_0.code_classname == "script_vehicle" )
        var_2 = var_0 gettagorigin( "tag_body" );

    var_4 = bullettrace( var_1, var_2, var_3, self );
    var_5 = 1;

    if ( var_0 != level.player )
    {
        if ( !isdefined( var_4["entity"] ) )
            var_5 = 0;
        else if ( var_4["entity"] != var_0 )
            var_5 = 0;
    }

    if ( !var_5 && var_3 )
    {
        if ( distancesquared( var_4["position"], var_2 ) < 90000 )
            var_5 = 1;
    }

    return var_5;
}

_id_7DAE( var_0, var_1 )
{
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3] ) && var_0[var_3] == var_1 )
            var_2 = 0;
    }

    if ( var_2 == 1 )
        var_0 = common_scripts\utility::add_to_array( var_0, var_1 );

    return var_0;
}

_id_7DAF()
{
    if ( isdefined( self._id_29AA ) )
    {
        if ( !self._id_29AA )
            return;
    }

    if ( _id_7DBB() )
        return;

    self clearturrettarget();
    var_0 = ( 0.0, 0.0, 0.0 );

    if ( isdefined( self._id_29C6 ) )
        var_0 = self._id_29C6;
    else
        var_0 = ( 0.0, 0.0, 32.0 ) + self.origin + anglestoforward( self.angles ) * 3000;

    var_1 = vectortoangles( var_0 - self.origin );
    var_2 = self gettagangles( "tag_turret" );
    var_3 = var_2[1] - var_1[1];
    var_3 = abs( angleclamp180( var_3 ) );

    if ( var_3 < 10 )
        return;

    self setturrettargetvec( var_0 );
}

_id_7DB0()
{
    var_0 = ( 0.0, 0.0, 32.0 ) + self.origin + anglestoforward( self.angles ) * 3000;
    self setturrettargetvec( var_0 );
    self waittill( "turret_on_target" );
    self clearturrettarget();
}

_id_7DB1()
{
    if ( gettime() < self._id_29B0 )
        return self._id_29AF;

    if ( self.script_team == "axis" )
    {
        var_0 = _id_7DB2( "allies" );
        var_0 = maps\_utility::_id_2673( var_0, level.player, 0 );
    }
    else if ( self.script_team == "allies" )
        var_0 = _id_7DB2( "axis" );
    else
        var_0 = [];

    self._id_29AF = var_0;
    self._id_29B0 = gettime() + 400;
    return var_0;
}

_id_7DB2( var_0 )
{
    common_scripts\utility::lock( "hamburg_tank_ai_troop_cache" );
    var_1 = maps\_utility::_id_2616( sortbydistance( getaiarray( var_0 ), self.origin ) );
    var_2 = sortbydistance( level._id_1FFB[var_0]._id_0C6D, self.origin );
    var_1 = common_scripts\utility::array_combine( level._id_1FFB[var_0]._id_0C6D, var_1 );
    var_1 = _id_7DB3( var_1 );
    common_scripts\utility::unlock( "hamburg_tank_ai_troop_cache" );
    return var_1;
}

_id_7DB3( var_0 )
{
    if ( isdefined( self._id_29AE ) && self._id_29AE > 0 )
    {
        var_1 = self._id_29AE * self._id_29AE;
        var_2 = [];

        foreach ( var_4 in var_0 )
        {
            if ( distancesquared( self.origin, var_4.origin ) > var_1 )
                var_2[var_2.size] = var_4;
        }

        var_0 = var_2;
    }

    return var_0;
}

_id_7DB4()
{
    self endon( "death" );
    self endon( "attack" );
    self endon( "attacking origins" );
    self._id_29BC = 0;
    var_0 = 650;
    var_1 = 3;
    var_2 = [];
    var_3 = 0;
    var_4 = gettime() + 2000;

    while ( _id_7DA5() )
    {
        if ( gettime() > var_4 && _id_7DB9().size )
        {
            wait 0.05;
            return;
        }

        var_5 = undefined;
        var_5 = _id_7DB1();

        if ( !isdefined( var_5 ) )
            break;

        var_6 = var_5;

        for ( var_7 = 0; var_7 < var_2.size; var_7++ )
            var_5 = common_scripts\utility::array_remove( var_5, var_2[var_7] );

        if ( !var_5.size )
        {
            var_5 = var_6;
            var_2 = [];
            return;
        }

        var_8 = anglestoforward( self gettagangles( "tag_barrel" ) );
        var_9 = _id_7DB7( self gettagorigin( "tag_flash" ), var_8, var_5, var_0 );

        if ( !isdefined( var_9 ) )
        {
            wait 0.05;
            var_2 = [];
            _id_7DB8();
            continue;
        }

        if ( !self._id_29AA || !self._id_29A8 )
            return;

        var_10 = 0;

        while ( isalive( var_9 ) && distance( self.origin, var_9.origin ) > var_0 && var_10 < var_1 )
        {
            self notify( "novistarget" );
            childthread _id_7DAC( var_9, "troop" );

            while ( !self._id_29BC && !self._id_299F && _id_7DA5() && isalive( var_9 ) && !self._id_29BD )
            {
                wait 0.05;

                if ( !_id_7DA5() )
                    return;
            }

            if ( !_id_7DA5() )
                return;

            if ( self._id_299F )
            {
                wait 0.05;
                self._id_299F = 0;
                break;
            }

            if ( self._id_29BD )
                break;

            var_11 = 1;

            for (;;)
            {
                common_scripts\utility::lock( "hamburg_tank_ai_troop_trace" );
                var_11 = _id_7DB5( var_9 );
                common_scripts\utility::unlock_wait( "hamburg_tank_ai_troop_trace" );

                if ( !( gettime() < self._id_29BB && isalive( var_9 ) && var_11 ) )
                    break;
            }

            if ( !var_11 || !isalive( var_9 ) )
            {
                wait 0.05;
                break;
            }

            self clearturrettarget();

            if ( isdefined( level._id_7D9E ) )
                thread [[ level._id_7D9E ]]();
            else
                self fireweapon();

            level notify( "swing", self );
            var_3 = 0;
            var_10++;
            _id_7DA3();
        }

        if ( var_3 > 2 )
        {
            wait 0.1;
            _id_7DB8();
            var_3 = 0;
        }

        var_10 = 0;

        if ( !self._id_29AA || !self._id_29A8 )
            return;

        self notify( "novistarget" );

        if ( isalive( var_9 ) )
        {
            var_2[var_2.size] = var_9;
            var_3++;
        }

        wait 0.1;
    }
}

_id_7DB5( var_0 )
{
    if ( !isalive( var_0 ) )
        return 0;

    var_1 = self gettagorigin( "tag_flash" );
    var_2 = distance( var_1, var_0.origin );
    var_3 = var_1 + var_2 * vectornormalize( anglestoforward( self gettagangles( "tag_flash" ) ) );
    var_4 = bullettrace( var_1, var_3, 0, var_0 );

    if ( isdefined( var_4["entity"] ) )
    {
        var_5 = var_4["entity"];

        if ( isdefined( var_5.script_team ) && var_5.script_team == self.script_team )
            return 0;
    }

    if ( distancesquared( var_4["position"], var_0.origin ) > 1000000 )
        return 0;

    if ( !common_scripts\utility::flag( "player_ready_for_minigun_death" ) || common_scripts\utility::flag( "player_in_tank" ) )
    {
        if ( _id_7DB6( var_4["position"] ) )
            return 0;
    }

    return 1;
}

_id_7DB6( var_0 )
{
    if ( self.script_team == "axis" )
        return 0;

    var_1 = getaiarray( "allies" );

    foreach ( var_3 in var_1 )
    {
        if ( distancesquared( var_3.origin, var_0 ) < 250000 )
            return 1;
    }

    return 0;
}

_id_7DB7( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( var_2.size < 1 )
        return;

    var_5 = 0;
    var_6 = undefined;
    var_7 = -1;

    foreach ( var_9 in var_2 )
    {
        if ( !isalive( var_9 ) )
            continue;

        common_scripts\utility::lock( "hamburg_tank_ai_getNearestVectorOutsideRange" );

        if ( !isalive( var_9 ) )
        {
            common_scripts\utility::unlock( "hamburg_tank_ai_getNearestVectorOutsideRange" );
            continue;
        }

        var_10 = bullettrace( var_0, var_9.origin + ( 0.0, 0.0, 48.0 ), 1, self );
        common_scripts\utility::unlock( "hamburg_tank_ai_getNearestVectorOutsideRange" );

        if ( var_10["fraction"] < 0.7 )
            continue;

        var_11 = distance( var_9.origin, var_0 );

        if ( var_11 < var_3 )
            continue;

        var_12 = vectornormalize( var_9.origin - var_0 );
        var_13 = vectordot( var_12, var_1 );

        if ( var_13 > var_7 )
        {
            var_4 = var_9;
            var_5 = var_11;
            var_7 = var_13;
        }
    }

    return var_4;
}

_id_7DB8()
{
    var_0 = maps\_utility::_id_0B53( _id_7DB9() );

    foreach ( var_2 in var_0 )
        _id_7DAA( var_2 );
}

_id_7DB9()
{
    var_0 = [];

    foreach ( var_2 in level.tanks )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2.script_team != self.script_team )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_7DBA( var_0 )
{
    if ( !self._id_29AA )
        return 0;

    maps\_utility::_id_13DB( "stunned_tank" );

    if ( !_id_7DBB() )
        return 0;

    var_0 = self._id_29AD[0];

    if ( !isalive( var_0 ) )
        return 0;

    if ( var_0.health <= 0 )
        return 0;

    return 1;
}

_id_7DBB()
{
    if ( self._id_29AD.size > 0 )
        return 1;

    return 0;
}

_id_7DBC()
{
    self notify( "stop_turret_attack_think_hamburg" );
    self clearturrettarget();
}

_id_7DBD()
{
    level._id_7DBE = level.tanks;

    foreach ( var_1 in level.tanks )
        var_1 _id_7DBC();
}

_id_7DBF()
{
    foreach ( var_1 in level._id_7DBE )
        var_1 thread _id_7D9C();

    level._id_7DBE = undefined;
}
