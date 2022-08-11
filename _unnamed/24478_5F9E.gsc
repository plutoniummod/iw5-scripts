// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5EE0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
    {
        foreach ( var_4 in var_0 )
        {
            if ( isarray( var_4 ) )
            {
                _id_5EE0( var_4, var_1 );
                continue;
            }

            var_4 call [[ var_1 ]]();
        }
    }
    else
    {
        switch ( var_2.size )
        {
            case 0:
                foreach ( var_4 in var_0 )
                {
                    if ( isarray( var_4 ) )
                    {
                        _id_5EE0( var_4, var_1, var_2 );
                        continue;
                    }

                    var_4 call [[ var_1 ]]();
                }

                break;
            case 1:
                foreach ( var_4 in var_0 )
                {
                    if ( isarray( var_4 ) )
                    {
                        _id_5EE0( var_4, var_1, var_2 );
                        continue;
                    }

                    var_4 call [[ var_1 ]]( var_2[0] );
                }

                break;
            case 2:
                foreach ( var_4 in var_0 )
                {
                    if ( isarray( var_4 ) )
                    {
                        _id_5EE0( var_4, var_1, var_2 );
                        continue;
                    }

                    var_4 call [[ var_1 ]]( var_2[0], var_2[1] );
                }

                break;
            case 3:
                foreach ( var_4 in var_0 )
                {
                    if ( isarray( var_4 ) )
                    {
                        _id_5EE0( var_4, var_1, var_2 );
                        continue;
                    }

                    var_4 call [[ var_1 ]]( var_2[0], var_2[1], var_2[2] );
                }

                break;
            case 4:
                foreach ( var_4 in var_0 )
                {
                    if ( isarray( var_4 ) )
                    {
                        _id_5EE0( var_4, var_1, var_2 );
                        continue;
                    }

                    var_4 call [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3] );
                }

                break;
            case 5:
                foreach ( var_4 in var_0 )
                {
                    if ( isarray( var_4 ) )
                    {
                        _id_5EE0( var_4, var_1, var_2 );
                        continue;
                    }

                    var_4 call [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3], var_2[4] );
                }

                break;
        }
    }
}

_id_5EE1( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( _id_5F0D( var_1, var_3 ) )
            return 1;
    }

    return 0;
}

_id_5EE2( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = [ "death" ];

    var_2 = _id_5F0F( var_2, 0 );

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) )
        {
            if ( isarray( var_4 ) )
            {
                if ( var_2 > 0 )
                {
                    _id_5EE2( var_4, var_1, var_2 );
                    wait 0.05;
                }
                else
                    thread _id_5EE2( var_4, var_1, 0 );

                continue;
            }

            foreach ( var_6 in var_1 )
                var_4 notify( var_6 );

            if ( var_2 > 0 )
            {
                wait 0.05;

                if ( isdefined( var_4 ) )
                    var_4 delete();
            }
            else
                var_4 delete();
        }
    }
}

_id_5EE3( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {

    }

    thread _id_5EE4( var_0, var_1, var_2 );
}

_id_5EE4( var_0, var_1, var_2 )
{
    self endon( "death" );
    wait(var_0);

    if ( !isdefined( var_2 ) )
        thread [[ var_1 ]]();
    else
    {
        switch ( var_2.size )
        {
            case 0:
                thread [[ var_1 ]]();
                break;
            case 1:
                thread [[ var_1 ]]( var_2[0] );
                break;
            case 2:
                thread [[ var_1 ]]( var_2[0], var_2[1] );
                break;
            case 3:
                thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2] );
                break;
            case 4:
                thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3] );
                break;
            case 5:
                thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3], var_2[4] );
                break;
            case 6:
                thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5] );
                break;
            case 7:
                thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5], var_2[6] );
                break;
        }
    }
}

_id_5EE5( var_0 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_1 = spawnstruct();
    var_1._id_5EE6 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        var_1._id_5EE6[var_4] = 0;
        thread _id_5EE7( var_1, var_4, var_3 );
    }

    for (;;)
    {
        foreach ( var_6 in var_1._id_5EE6 )
        {
            if ( var_6 )
                return;
        }

        wait 0.05;
    }
}

_id_5EE7( var_0, var_1, var_2 )
{
    common_scripts\utility::waittill_any( var_2, "death" );
    var_0._id_5EE6[var_1] = 1;
}

_id_5EE8( var_0 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_2 in var_0 )
    {

    }

    var_4 = 0;

    while ( !var_4 )
    {
        var_4 = 1;

        foreach ( var_2 in var_0 )
        {
            if ( !common_scripts\utility::flag( var_2 ) )
            {
                var_4 *= 0;
                break;
            }
        }

        if ( var_4 )
            return;

        wait 0.05;
    }
}

_id_5EE9( var_0 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_2 in var_0 )
    {

    }

    self endon( "death" );
    var_4 = 0;

    while ( !var_4 && isdefined( self ) )
    {
        var_4 = 1;

        foreach ( var_2 in var_0 )
        {
            if ( !maps\_utility::_id_1008( var_2 ) )
            {
                var_4 *= 0;
                break;
            }
        }

        if ( var_4 || !isdefined( self ) )
            return;

        wait 0.05;
    }
}

_id_5EEA( var_0 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_2 in var_0 )
    {

    }

    var_4 = 0;

    while ( !var_4 )
    {
        foreach ( var_2 in var_0 )
        {
            if ( common_scripts\utility::flag( var_2 ) )
            {
                var_4 = 1;
                return;
            }
        }

        wait 0.05;
    }
}

_id_5EEB( var_0 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_2 in var_0 )
    {

    }

    self endon( "death" );
    var_4 = 0;

    while ( !var_4 && isdefined( self ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( maps\_utility::_id_1008( var_2 ) )
            {
                var_4 = 1;
                return;
            }
        }

        wait 0.05;
    }
}

_id_02F2( var_0, var_1, var_2 )
{
    var_0 = _id_5F0F( var_0, 0.05 );
    var_1 = _id_5F0F( var_1, 0.05 );
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = ( 0, self gettagangles( "j_head" )[1], 0 );
    var_4 = self gettagorigin( "j_head" ) + 32 * anglestoforward( var_3 );
    var_5 = spawn( "script_model", var_4 );
    var_5.angles = var_3;
    var_5 setmodel( "tag_origin" );
    var_5 linkto( self, "j_head" );
    self setlookatentity( var_5 );
    wait 0.05;
    var_5 unlink();
    var_6 = distance( var_5.origin, level.player geteye() );

    for ( var_7 = var_6 / var_0; isdefined( self ) && var_7 > 0; var_7 = _id_5F0E( var_7, 0.05, 0.05, 0 ) )
    {
        var_8 = level.player geteye() - var_5.origin;
        var_8 /= var_7 * 20;
        var_5 moveto( var_5.origin + var_8, 0.05 );
        wait 0.05;
    }

    if ( !isdefined( self ) )
        return;

    self setlookatentity( level.player );
    wait(var_2);
    var_5.origin = level.player geteye();
    var_3 = ( 0, self gettagorigin( "j_spine4" )[1], 0 );
    var_4 = self gettagorigin( "j_head" ) + 32 * anglestoforward( var_3 );
    var_6 = distance( var_5.origin, var_4 );

    for ( var_7 = var_6 / var_1; isdefined( self ) && var_7 > 0; var_7 = _id_5F0E( var_7, 0.05, 0.05, 0 ) )
    {
        var_3 = ( 0, self gettagorigin( "j_spine4" )[1], 0 );
        var_4 = self gettagorigin( "j_head" ) + 32 * anglestoforward( var_3 );
        var_8 = var_4 - var_5.origin;
        var_8 /= var_7 * 20;
        var_5 moveto( var_5.origin + var_8, 0.05 );
        wait 0.05;
    }

    if ( isdefined( self ) )
        self setlookatentity();

    var_5 delete();
}

_id_5EEC( var_0 )
{
    if ( isdefined( level.flag ) && isdefined( level.flag[var_0] ) )
        level.flag[var_0] = undefined;
}

_id_5EED( var_0 )
{
    if ( isdefined( self._id_1008 ) && isdefined( self._id_29C2 ) && isdefined( self._id_1008[var_0] ) && isdefined( self._id_29C2[var_0] ) )
    {
        self._id_1008[var_0] = undefined;
        self._id_29C2[var_0] = undefined;
    }
}

_id_5EEE( var_0, var_1, var_2, var_3 )
{
    var_1 = _id_5F0F( var_1, 0.05 );
    var_2 = _id_5F0F( var_2, 0.05 );
    var_3 = _id_5F0F( var_3, 0.05 );
    var_4 = ( var_2 - var_1 ) / var_3 * 20;
    var_5 = var_1;

    for ( var_6 = 0; isdefined( var_0 ) && target_istarget( var_0 ) && var_6 < var_3; var_6 += 0.05 )
    {
        var_5 = _id_5F0F( var_5 + var_4, 0 );
        target_drawsquare( var_0, var_5 );
        wait 0.05;
    }
}

_id_5EEF( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( var_2 == 0 )
        setsaveddvar( var_0, var_1 );

    var_3 = getdvarfloat( var_0 );

    for ( var_4 = ( var_1 - var_3 ) / var_2 * 20; abs( var_1 - var_3 ) > abs( var_4 ); var_3 += var_4 )
    {
        setsaveddvar( var_0, var_3 );
        wait 0.05;
    }

    setsaveddvar( var_0, var_1 );
}

_id_5EF0( var_0, var_1 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_3 in var_0 )
    {

    }

    var_1 = common_scripts\utility::array_removeundefined( var_1 );

    foreach ( var_6 in var_1 )
    {

    }

    _id_5EEA( var_0 );

    foreach ( var_6 in var_1 )
        common_scripts\utility::flag_set( var_6 );
}

_id_5EF1( var_0, var_1 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_3 in var_0 )
    {

    }

    var_1 = common_scripts\utility::array_removeundefined( var_1 );

    foreach ( var_6 in var_1 )
    {

    }

    _id_5EEB( var_0 );

    foreach ( var_6 in var_1 )
        maps\_utility::_id_13DC( var_6 );
}

_id_5EF2( var_0, var_1 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_3 in var_0 )
    {

    }

    var_1 = common_scripts\utility::array_removeundefined( var_1 );

    foreach ( var_6 in var_1 )
    {

    }

    _id_5EE8( var_0 );

    foreach ( var_6 in var_1 )
        common_scripts\utility::flag_set( var_6 );
}

_id_5EF3( var_0, var_1 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );

    foreach ( var_3 in var_0 )
    {

    }

    var_1 = common_scripts\utility::array_removeundefined( var_1 );

    foreach ( var_6 in var_1 )
    {

    }

    _id_5EE9( var_0 );

    foreach ( var_6 in var_1 )
        maps\_utility::_id_13DC( var_6 );
}

_id_5EF4( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        var_4[var_4.size] = var_5;

    var_3 = _id_5F0F( var_3, 0.05 );
    var_6 = "FLAG_do_random_sound_until_flags_" + var_0 getentitynumber() + "_" + randomint( 1000 ) + "_" + gettime();

    if ( !common_scripts\utility::flag_exist( var_6 ) )
        common_scripts\utility::flag_init( var_6 );

    common_scripts\utility::flag_clear( var_6 );
    thread _id_5EF2( var_2, [ var_6 ] );
    var_7 = 0;

    while ( !common_scripts\utility::flag( var_6 ) && isdefined( var_0 ) )
    {
        if ( var_4.size == 0 )
        {
            for ( var_5 = 0; var_5 < var_1.size; var_5++ )
                var_4[var_4.size] = var_5;

            if ( var_4.size > 1 )
                var_4 = maps\_utility::array_remove_index( var_4, var_7 );
        }

        var_7 = randomint( var_4.size );
        var_0 thread maps\_utility::_id_168C( var_1[var_4[var_7]] );
        var_4 = maps\_utility::array_remove_index( var_4, var_7 );
        wait(var_3);
    }

    common_scripts\utility::flag_set( var_6 );
    wait 0.05;
    _id_5EEC( var_6 );
}

_id_5EF5( var_0, var_1 )
{
    if ( var_0 & var_1 )
        return 0;

    if ( !var_0 & !var_1 )
        return 0;

    if ( var_0 | var_1 )
        return 1;
}

_id_5EF6( var_0 )
{
    return ( 0, var_0[1], 0 );
}

_id_4E3D( var_0, var_1 )
{
    return int( var_0 * var_1 ) / var_1;
}

_id_5CC6( var_0, var_1 )
{
    var_0 = abs( var_0 );
    var_1 = common_scripts\utility::ter_op( var_1 < 0, 0, var_1 );

    if ( var_1 <= 0 )
        return var_0;

    if ( var_1 >= 1 )
    {
        var_2 = int( var_0 );
        var_3 = 1;

        for ( var_4 = 1; var_2 - var_4 > 0; var_4 *= 10 )
            var_3++;

        var_5 = var_3 - 1;

        if ( var_1 > _id_5CC7( var_5 ) )
            return 0;

        while ( var_5 != var_1 && var_5 > 0 )
        {
            for ( var_6 = _id_5CC7( var_5 ); var_2 - var_6 >= 0; var_2 -= var_6 )
            {

            }

            var_5--;
        }

        return int( var_2 );
    }
    else
    {
        var_2 = var_0 - int( var_0 );
        var_1 = 1 / var_1;
        var_2 *= var_1;
        var_3 = 0;

        for ( var_4 = 1; var_2 - var_4 > 0; var_4 *= 10 )
            var_3++;

        for ( var_5 = var_3 - 1; var_5 > 0; var_5-- )
        {
            for ( var_6 = _id_5CC7( var_5 ); var_2 - var_6 >= 0; var_2 -= var_6 )
            {

            }
        }

        return int( var_2 );
    }
}

_id_5CC7( var_0 )
{
    var_1 = 1;

    if ( var_0 >= 1 )
    {
        for ( var_2 = 0; var_2 < var_0; var_2++ )
            var_1 *= 10;
    }
    else if ( var_0 < 0 )
    {
        for ( var_2 = 1; var_2 < abs( var_0 ); var_2++ )
            var_1 /= 10;
    }

    return var_1;
}

_id_5EF7( var_0, var_1, var_2, var_3, var_4 )
{
    var_4 = common_scripts\utility::ter_op( isdefined( var_4 ), var_4, ( 0.0, 0.0, 0.0 ) );
    var_2 = sortbydistance( var_2, var_0 );

    foreach ( var_6 in var_2 )
    {
        var_7 = vectornormalize( var_6.origin + var_4 - var_0 );
        var_8 = anglestoforward( var_1 );
        var_9 = vectordot( var_8, var_7 );

        if ( var_9 >= var_3 )
            return var_6;
    }
}

_id_5EF8()
{
    return isdefined( self.classname );
}

_id_5EF9()
{
    return !isdefined( self.classname );
}

_id_5EFA()
{
    self hide();
    self notsolid();
}

_id_5EFB()
{
    self show();
    self solid();
}

_id_5EFC()
{
    if ( randomint( 2 ) )
        return 1;

    return -1;
}

_id_5EFD( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::flat_angle( var_1.angles ) );
    var_3 = vectornormalize( common_scripts\utility::flat_origin( var_0.origin ) - var_1.origin );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_5EFE( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isarray( var_2 ) )
        return;

    foreach ( var_4 in var_0 )
    {
        foreach ( var_6 in var_2 )
            var_4 _id_5F50( var_1 _id_5F4F( var_6 ), var_6 );
    }
}

_id_5EFF( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_5 = 0;

        foreach ( var_7 in var_1 )
        {
            if ( isdefined( var_4 _id_5F4F( var_7 ) ) )
            {
                var_5 = 1;
                break;
            }
        }

        if ( !var_5 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_5F00( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) || !isdefined( var_2 ) )
        return var_0;

    var_3 = tolower( common_scripts\utility::ter_op( isdefined( var_3 ), var_3, "or" ) );

    switch ( var_3 )
    {
        case "or":
        case "and":
            break;
        default:
            var_3 = "and";
    }

    var_4 = [];
    var_5 = 1;

    foreach ( var_7 in var_0 )
    {
        switch ( var_3 )
        {
            case "and":
                var_5 = 0;

                foreach ( var_11, var_9 in var_1 )
                {
                    var_10 = var_7 _id_5F4F( var_9 );

                    if ( !_id_5F0D( var_10, var_2[var_11] ) )
                    {
                        var_5 = 1;
                        break;
                    }
                }

                break;
            case "or":
                var_5 = 1;

                foreach ( var_11, var_9 in var_1 )
                {
                    var_10 = var_7 _id_5F4F( var_9 );

                    if ( _id_5F0D( var_10, var_2[var_11] ) )
                    {
                        var_5 *= 0;
                        break;
                    }
                }

                break;
        }

        if ( var_5 )
            var_4[var_4.size] = var_7;
    }

    return var_4;
}

_id_5F01( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_5 = 0;

        foreach ( var_7 in var_1 )
        {
            if ( isdefined( var_4 _id_5F4F( var_7 ) ) )
            {
                var_5 = 1;
                break;
            }
        }

        if ( var_5 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_5F02( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) || !isdefined( var_2 ) )
        return var_0;

    var_3 = tolower( common_scripts\utility::ter_op( isdefined( var_3 ), var_3, "and" ) );

    switch ( var_3 )
    {
        case "or":
        case "and":
            break;
        default:
            var_3 = "and";
    }

    var_4 = [];
    var_5 = 1;

    foreach ( var_7 in var_0 )
    {
        switch ( var_3 )
        {
            case "and":
                var_5 = 1;

                foreach ( var_11, var_9 in var_1 )
                {
                    var_10 = var_7 _id_5F4F( var_9 );

                    if ( !_id_5F0D( var_10, var_2[var_11] ) )
                    {
                        var_5 *= 0;
                        break;
                    }
                }

                break;
            case "or":
                var_5 = 0;

                foreach ( var_11, var_9 in var_1 )
                {
                    var_10 = var_7 _id_5F4F( var_9 );

                    if ( _id_5F0D( var_10, var_2[var_11] ) )
                    {
                        var_5 = 1;
                        break;
                    }
                }

                break;
        }

        if ( var_5 )
            var_4[var_4.size] = var_7;
    }

    return var_4;
}

_id_5F03( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        var_6 = 0;

        foreach ( var_8 in var_2 )
        {
            if ( var_5 _id_5F0A( var_1, var_8 ) )
            {
                var_6 = 1;
                break;
            }
        }

        if ( var_6 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_5F04( var_0 )
{
    var_1 = [];

    foreach ( var_8, var_3 in var_0 )
    {
        var_4 = 1;

        foreach ( var_7, var_6 in var_0 )
        {
            if ( var_8 != var_7 && _id_5F0D( var_3, var_6 ) )
            {
                var_4 = 0;
                break;
            }
        }

        if ( var_4 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_5F05( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( _id_5F0D( var_1, var_3 ) )
            return 1;
    }

    return 0;
}

_id_5F06( var_0 )
{
    var_0 = _id_5F0F( var_0, 0 );
    var_1 = [];

    if ( var_0 )
    {
        for ( var_2 = 0; var_2 < var_0; var_2++ )
            var_1[var_2] = spawnstruct();
    }

    return var_1;
}

_id_5F07( var_0, var_1, var_2, var_3, var_4 )
{
    var_3 = _id_5F0F( var_3, 0 );
    var_4 = _id_5F0F( var_4, 0 );

    for ( var_5 = 0; var_5 < var_3; var_5++ )
    {
        playfx( var_0, var_1, var_2 );
        wait(var_4);
    }
}

_id_5F08( var_0 )
{
    self.grenadeawareness = var_0;
}

_id_5F09( var_0 )
{
    self._id_1099 = var_0;
}

_id_5F0A( var_0, var_1 )
{
    if ( !isdefined( self ) || !isdefined( var_1 ) )
        return 0;

    return _id_5F0D( _id_5F4F( var_0 ), var_1 );
}

_id_5F0B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) || !isarray( var_0 ) )
        return common_scripts\utility::ter_op( isdefined( var_2 ), var_2, 0 );

    var_3 = 1;

    foreach ( var_5 in var_0 )
    {
        if ( !isdefined( var_5 ) )
            return 0;
        else
            var_3 *= _id_5F0D( var_0[0] _id_5F4F( var_1 ), var_5 _id_5F4F( var_1 ) );
    }

    return var_3;
}

_id_5F0C( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) || !isarray( var_0 ) )
        return common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );

    var_4 = 1;

    foreach ( var_6 in var_0 )
    {
        if ( !isdefined( var_6 ) )
            return 0;
        else
            var_4 *= _id_5F0D( var_6 _id_5F4F( var_1 ), var_2 );
    }

    return var_4;
}

_id_5F0D( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
        return common_scripts\utility::ter_op( var_0 == var_1, 1, 0 );

    if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        return 0;

    if ( !isdefined( var_0 ) && isdefined( var_1 ) )
        return 0;

    if ( !isdefined( var_0 ) && !isdefined( var_1 ) )
        return 0;
}

_id_5F0E( var_0, var_1, var_2, var_3 )
{
    var_0 -= var_1;
    var_0 = common_scripts\utility::ter_op( var_0 < var_2, var_3, var_0 );
    return var_0;
}

_id_5F0F( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
        return common_scripts\utility::ter_op( var_0 > var_1, var_0, var_1 );

    if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) && isdefined( var_1 ) )
        return var_1;

    return var_2;
}

_id_5F10( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
        return common_scripts\utility::ter_op( var_0 < var_1, var_0, var_1 );

    if ( isdefined( var_0 ) && !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) && isdefined( var_1 ) )
        return var_1;

    return var_2;
}

_id_5EDF( var_0, var_1, var_2, var_3, var_4 )
{
    var_3 = common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );

    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        return clamp( var_0, var_1, var_2 );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_1 ) && !isdefined( var_2 ) )
            return common_scripts\utility::ter_op( var_1 <= var_0, var_1, var_2 );
        else if ( !isdefined( var_1 ) && isdefined( var_2 ) )
            return common_scripts\utility::ter_op( var_0 <= var_2, var_0, var_2 );
        else
            return var_0;
    }

    if ( !var_3 && isdefined( var_1 ) )
        return var_1;

    if ( isdefined( var_2 ) )
        return var_2;

    if ( isdefined( var_1 ) )
        return var_1;

    return var_4;
}

_id_5F11( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
            return common_scripts\utility::ter_op( _id_51FF( var_0, var_1 ) < squared( var_2 ) && abs( var_1[2] - var_0[2] ) < var_3, 1, 0 );
        else
            return common_scripts\utility::ter_op( _id_51FF( var_0, var_1 ) < squared( var_2 ), 1, 0 );
    }

    return common_scripts\utility::ter_op( isdefined( var_4 ), var_4, 0 );
}

_id_5F12( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
            return common_scripts\utility::ter_op( _id_51FF( var_0.origin, var_0.origin ) < squared( var_2 ) && abs( var_1.origin[2] - var_0.origin[2] ) < var_3, 1, 0 );
        else
            return common_scripts\utility::ter_op( _id_51FF( var_0.origin, var_1.origin ) < squared( var_2 ), 1, 0 );
    }

    return common_scripts\utility::ter_op( isdefined( var_4 ), var_4, 0 );
}

_id_5F13( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
            return common_scripts\utility::ter_op( _id_51FF( var_0.origin, var_0.origin ) > squared( var_2 ) && abs( var_1.origin[2] - var_0.origin[2] ) > var_3, 1, 0 );
        else
            return common_scripts\utility::ter_op( _id_51FF( var_0.origin, var_1.origin ) > squared( var_2 ), 1, 0 );
    }

    return common_scripts\utility::ter_op( isdefined( var_4 ), var_4, 0 );
}

_id_5F14( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
            return common_scripts\utility::ter_op( _id_51FF( var_0, var_1 ) > squared( var_2 ) && abs( var_1[2] - var_0[2] ) > var_3, 1, 0 );
        else
            return common_scripts\utility::ter_op( _id_51FF( var_0, var_1 ) > squared( var_2 ), 1, 0 );
    }

    return common_scripts\utility::ter_op( isdefined( var_4 ), var_4, 0 );
}

_id_5F15( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        return common_scripts\utility::ter_op( distancesquared( var_0, var_1 ) < squared( var_2 ), 1, 0 );

    return common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );
}

_id_5F16( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        return common_scripts\utility::ter_op( distancesquared( var_0, var_1 ) >= squared( var_2 ), 1, 0 );

    return common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );
}

_id_5F17( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        return common_scripts\utility::ter_op( distancesquared( var_0, var_1 ) > squared( var_2 ), 1, 0 );

    return common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );
}

_id_5F18( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        return common_scripts\utility::ter_op( distancesquared( var_0.origin, var_1.origin ) > squared( var_2 ), 1, 0 );

    return common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );
}

_id_5F19( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        return common_scripts\utility::ter_op( distancesquared( var_0.origin, var_1.origin ) < squared( var_2 ), 1, 0 );

    return common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 0 );
}

_id_5F1A( var_0 )
{
    level.createfxent = common_scripts\utility::array_removeundefined( level.createfxent );

    foreach ( var_2 in var_0 )
    {
        foreach ( var_5, var_4 in level.createfxent )
        {
            if ( isdefined( var_4 ) && isdefined( var_4.v ) )
            {
                if ( _id_5F0D( var_4.v["fxid"], var_2[0] ) && _id_5F0D( var_4.v["origin"], var_2[1] ) )
                {
                    if ( isdefined( var_4.looper ) )
                        var_4.looper delete();

                    level.createfxent[var_5] = undefined;
                }
            }
        }
    }

    level.createfxent = common_scripts\utility::array_removeundefined( level.createfxent );
}

_id_5F1B()
{
    var_0 = getent( "test_ss_pip", "targetname" );
    level._id_3EDA = level.player newpip();
    level._id_3EDA.freecamera = 1;
    level._id_3EDA.entity = var_0;
    level._id_3EDA.fov = 65;
    level._id_3EDA.enableshadows = 0;
    level._id_3EDA.tag = "tag_origin";
    level._id_3EDA.x = 0;
    level._id_3EDA.y = 0;
    level._id_3EDA.width = 64;
    level._id_3EDA.height = 64;
    level._id_3EDA.visionsetnaked = "paris_ac130_night";
    level._id_3EDA.enable = 1;
}

_id_5F1C( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[1];

    if ( var_1 > 320 || var_1 < -320 || var_2 > 240 || var_2 < -240 )
    {
        level._id_3EDA.enable = 0;
        return;
    }

    level._id_3EDA.enable = 1;
    level._id_3EDA.x = var_1 * 1.26562 + 277 + 32;
    level._id_3EDA.y = 0.866667 * var_2 + 208 - 32;
}

_id_5F1D( var_0, var_1 )
{
    return ( var_0[1] * var_1[2] - var_0[2] * var_1[1], var_0[2] * var_1[0] - var_0[0] * var_1[2], var_0[0] * var_1[1] - var_0[1] * var_1[0] );
}

_id_5F1E()
{
    var_0 = level.player geteye();
    var_1 = vectornormalize( anglestoforward( level.player getplayerangles() ) * 65535 + var_0 - var_0 );
    var_2 = _id_5F1D( var_1, ( 0.0, 0.0, 1.0 ) );
    var_3 = vectornormalize( var_2 - var_1 * vectordot( var_2, var_1 ) / vectordot( var_1, var_1 ) );
    var_4 = vectornormalize( _id_5F1D( var_3, var_1 ) );
    return _id_5F25( [ [ var_4[0], var_4[1], var_4[2], 0 ], [ var_3[0], var_3[1], var_3[2], 0 ], [ var_1[0], var_1[1], var_1[2], 0 ], [ 0, 0, 0, 1 ] ], [ [ 1, 0, 0, -1 * var_0[0] ], [ 0, 1, 0, -1 * var_0[1] ], [ 0, 0, 1, -1 * var_0[2] ], [ 0, 0, 0, 1 ] ] );
}

_id_5F1F()
{
    return _id_5F25( _id_5F25( [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 8 ], [ 0, 0, -1, 0 ] ], [ [ 1.92, 0, 0, 0 ], [ 0, 1.92, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ] ), [ [ 0.5625, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, 1 ] ] );
}

_id_5F20( var_0 )
{
    var_1 = _id_5F21( _id_5F1E(), [ [ var_0.origin[0] ], [ var_0.origin[1] ], [ var_0.origin[2] ], [ 1 ] ] );
    var_2 = _id_5F21( _id_5F1F(), var_1 );
    var_3 = [ [ var_2[0][0] / var_2[3][0] ], [ var_2[1][0] / var_2[3][0] ], [ var_2[2][0] / var_2[3][0] ] ];
    return [ [ 320 * var_3[0][0] + 320 ], [ 240 * var_3[1][0] + 240 ], [ 32765.5 * var_3[2][0] + 32769.5 ] ];
}

_id_5F21( var_0, var_1 )
{
    var_2 = [ [ 0 ], [ 0 ], [ 0 ], [ 0 ] ];

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        for ( var_4 = 0; var_4 < 1; var_4++ )
        {
            for ( var_5 = 0; var_5 < 4; var_5++ )
                var_2[var_3][var_4] += var_0[var_3][var_5] * var_1[var_5][var_4];
        }
    }

    return var_2;
}

_id_5F22( var_0, var_1 )
{
    var_2 = [ [ 0, 0, 0, 0 ] ];

    for ( var_3 = 0; var_3 < 1; var_3++ )
    {
        for ( var_4 = 0; var_4 < 4; var_4++ )
        {
            for ( var_5 = 0; var_5 < 4; var_5++ )
                var_2[var_3][var_4] += var_0[var_3][var_5] * var_1[var_5][var_4];
        }
    }

    return var_2;
}

_id_5F23( var_0, var_1 )
{
    var_2 = [ [ 0, 0, 0, 0 ] ];

    for ( var_3 = 0; var_3 < 1; var_3++ )
    {
        for ( var_4 = 0; var_4 < 3; var_4++ )
        {
            for ( var_5 = 0; var_5 < 3; var_5++ )
                var_2[var_3][var_4] += var_0[var_3][var_5] * var_1[var_5][var_4];
        }
    }

    return var_2;
}

_id_5F24( var_0, var_1 )
{
    var_2 = [ [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] ];

    for ( var_3 = 0; var_3 < 3; var_3++ )
    {
        for ( var_4 = 0; var_4 < 3; var_4++ )
        {
            for ( var_5 = 0; var_5 < 3; var_5++ )
                var_2[var_3][var_4] += var_0[var_3][var_5] * var_1[var_5][var_4];
        }
    }

    return var_2;
}

_id_5F25( var_0, var_1 )
{
    var_2 = [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ], [ 0, 0, 0, 0 ] ];

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        for ( var_4 = 0; var_4 < 4; var_4++ )
        {
            for ( var_5 = 0; var_5 < 4; var_5++ )
                var_2[var_3][var_4] += var_0[var_3][var_5] * var_1[var_5][var_4];
        }
    }

    return var_2;
}

_id_5F26( var_0 )
{
    var_1 = [ [ 0, 0, 0, 0 ], [ 1, 1, 1, 1 ], [ 1, 1, 1, 1 ], [ 1, 1, 1, 1 ] ];
    var_1[0][0] = var_0[1][1] * var_0[2][2] * var_0[3][3] - var_0[1][1] * var_0[2][3] * var_0[3][2] - var_0[2][1] * var_0[1][2] * var_0[3][3] + var_0[2][1] * var_0[1][3] * var_0[3][2] + var_0[3][1] * var_0[1][2] * var_0[2][3] - var_0[3][1] * var_0[1][3] * var_0[2][2];
    var_1[1][0] = -1 * var_0[1][0] * var_0[2][2] * var_0[3][3] + var_0[1][0] * var_0[2][3] * var_0[3][2] + var_0[2][0] * var_0[1][2] * var_0[3][3] - var_0[2][0] * var_0[1][3] * var_0[3][2] - var_0[3][0] * var_0[1][2] * var_0[2][3] + var_0[3][0] * var_0[1][3] * var_0[2][2];
    var_1[2][0] = var_0[1][0] * var_0[2][1] * var_0[3][3] - var_0[1][0] * var_0[2][3] * var_0[3][1] - var_0[2][0] * var_0[1][1] * var_0[3][3] + var_0[2][0] * var_0[1][3] * var_0[3][1] + var_0[3][0] * var_0[1][1] * var_0[2][3] - var_0[3][0] * var_0[1][3] * var_0[2][1];
    var_1[3][0] = -1 * var_0[1][0] * var_0[2][1] * var_0[3][2] + var_0[1][0] * var_0[2][2] * var_0[3][1] + var_0[2][0] * var_0[1][1] * var_0[3][2] - var_0[2][0] * var_0[1][2] * var_0[3][1] - var_0[3][0] * var_0[1][1] * var_0[2][2] + var_0[3][0] * var_0[1][2] * var_0[2][1];
    var_1[0][1] = -1 * var_0[0][1] * var_0[2][2] * var_0[3][3] + var_0[0][1] * var_0[2][3] * var_0[3][2] + var_0[2][1] * var_0[0][2] * var_0[3][3] - var_0[2][1] * var_0[0][3] * var_0[3][2] - var_0[3][1] * var_0[0][2] * var_0[2][3] + var_0[3][1] * var_0[0][3] * var_0[2][2];
    var_1[1][1] = var_0[0][0] * var_0[2][2] * var_0[3][3] - var_0[0][0] * var_0[2][3] * var_0[3][2] - var_0[2][0] * var_0[0][2] * var_0[3][3] + var_0[2][0] * var_0[0][3] * var_0[3][2] + var_0[3][0] * var_0[0][2] * var_0[2][3] - var_0[3][0] * var_0[0][3] * var_0[2][2];
    var_1[2][1] = -1 * var_0[0][0] * var_0[2][1] * var_0[3][3] + var_0[0][0] * var_0[2][3] * var_0[3][1] + var_0[2][0] * var_0[0][1] * var_0[3][3] - var_0[2][0] * var_0[0][3] * var_0[3][1] - var_0[3][0] * var_0[0][1] * var_0[2][3] + var_0[3][0] * var_0[0][3] * var_0[2][1];
    var_1[3][1] = var_0[0][0] * var_0[2][1] * var_0[3][2] - var_0[0][0] * var_0[2][2] * var_0[3][1] - var_0[2][0] * var_0[0][1] * var_0[3][2] + var_0[2][0] * var_0[0][2] * var_0[3][1] + var_0[3][0] * var_0[0][1] * var_0[2][2] - var_0[3][0] * var_0[0][2] * var_0[2][1];
    var_1[0][2] = var_0[0][1] * var_0[1][2] * var_0[3][3] - var_0[0][1] * var_0[1][3] * var_0[3][2] - var_0[1][1] * var_0[0][2] * var_0[3][3] + var_0[1][1] * var_0[0][3] * var_0[3][2] + var_0[3][1] * var_0[0][2] * var_0[1][3] - var_0[3][1] * var_0[0][3] * var_0[1][2];
    var_1[1][2] = -1 * var_0[0][0] * var_0[1][2] * var_0[3][3] + var_0[0][0] * var_0[1][3] * var_0[3][2] + var_0[1][0] * var_0[0][2] * var_0[3][3] - var_0[1][0] * var_0[0][3] * var_0[3][2] - var_0[3][0] * var_0[0][2] * var_0[1][3] + var_0[3][0] * var_0[0][3] * var_0[1][2];
    var_1[2][2] = var_0[0][0] * var_0[1][1] * var_0[3][3] - var_0[0][0] * var_0[1][3] * var_0[3][1] - var_0[1][0] * var_0[0][1] * var_0[3][3] + var_0[1][0] * var_0[0][3] * var_0[3][1] + var_0[3][0] * var_0[0][1] * var_0[1][3] - var_0[3][0] * var_0[0][3] * var_0[1][1];
    var_1[3][2] = -1 * var_0[0][0] * var_0[1][1] * var_0[3][2] + var_0[0][0] * var_0[1][2] * var_0[3][1] + var_0[1][0] * var_0[0][1] * var_0[3][2] - var_0[1][0] * var_0[0][2] * var_0[3][1] - var_0[3][0] * var_0[0][1] * var_0[1][2] + var_0[3][0] * var_0[0][2] * var_0[1][1];
    var_1[0][3] = -1 * var_0[0][1] * var_0[1][2] * var_0[2][3] + var_0[0][1] * var_0[1][3] * var_0[2][2] + var_0[1][1] * var_0[0][2] * var_0[2][3] - var_0[1][1] * var_0[0][3] * var_0[2][2] - var_0[2][1] * var_0[0][2] * var_0[1][3] + var_0[2][1] * var_0[0][3] * var_0[1][2];
    var_1[1][3] = var_0[0][0] * var_0[1][2] * var_0[2][3] - var_0[0][0] * var_0[1][3] * var_0[2][2] - var_0[1][0] * var_0[0][2] * var_0[2][3] + var_0[1][0] * var_0[0][3] * var_0[2][2] + var_0[2][0] * var_0[0][2] * var_0[1][3] - var_0[2][0] * var_0[0][3] * var_0[1][2];
    var_1[2][3] = -1 * var_0[0][0] * var_0[1][1] * var_0[2][3] + var_0[0][0] * var_0[1][3] * var_0[2][1] + var_0[1][0] * var_0[0][1] * var_0[2][3] - var_0[1][0] * var_0[0][3] * var_0[2][1] - var_0[2][0] * var_0[0][1] * var_0[1][3] + var_0[2][0] * var_0[0][3] * var_0[1][1];
    var_1[3][3] = var_0[0][0] * var_0[1][1] * var_0[2][2] - var_0[0][0] * var_0[1][2] * var_0[2][1] - var_0[1][0] * var_0[0][1] * var_0[2][2] + var_0[1][0] * var_0[0][2] * var_0[2][1] + var_0[2][0] * var_0[0][1] * var_0[1][2] - var_0[2][0] * var_0[0][2] * var_0[1][1];
    var_2 = var_0[0][0] * var_1[0][0] + var_0[0][1] * var_1[1][0] + var_0[0][2] * var_1[2][0] + var_0[0][3] * var_1[3][0];

    if ( var_2 == 0 )
        return;

    var_2 = 1.0 / var_2;

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        for ( var_4 = 0; var_4 < 4; var_4++ )
            var_1[var_3][var_4] *= var_2;
    }

    return var_1;
}

_id_5F27( var_0 )
{
    var_1 = [];

    foreach ( var_7, var_3 in var_0 )
    {
        foreach ( var_6, var_5 in var_3 )
            var_1[var_6][var_7] = var_5;
    }

    return var_1;
}

_id_5F28( var_0 )
{
    return [ [ 1, 0, 0 ], [ 0, cos( var_0 ), -1 * sin( var_0 ) ], [ 0, sin( var_0 ), cos( var_0 ) ] ];
}

_id_5F29( var_0 )
{
    return [ [ cos( var_0 ), 0, sin( var_0 ) ], [ 0, 1, 0 ], [ 0, -1 * sin( var_0 ), cos( var_0 ) ] ];
}

_id_5F2A( var_0 )
{
    return [ [ cos( var_0 ), -1 * sin( var_0 ), 0 ], [ sin( var_0 ), cos( var_0 ), 0 ], [ 0, 0, 1 ] ];
}

_id_5F2B( var_0, var_1 )
{
    var_2 = _id_5F23( [ [ var_0[0], var_0[1], var_0[2] ] ], _id_5F28( var_1 ) );
    return ( var_2[0][0], var_2[0][1], var_2[0][2] );
}

_id_5F2C( var_0, var_1 )
{
    var_2 = _id_5F23( [ [ var_0[0], var_0[1], var_0[2] ] ], _id_5F29( var_1 ) );
    return ( var_2[0][0], var_2[0][1], var_2[0][2] );
}

_id_5F2D( var_0, var_1 )
{
    var_2 = _id_5F23( [ [ var_0[0], var_0[1], var_0[2] ] ], _id_5F2A( var_1 ) );
    return ( var_2[0][0], var_2[0][1], var_2[0][2] );
}

_id_5F2E( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_5F23( [ [ var_0[0], var_0[1], var_0[2] ] ], _id_5F24( _id_5F28( var_1 ), _id_5F24( _id_5F29( var_2 ), _id_5F2A( var_3 ) ) ) );
    return ( var_4[0][0], var_4[0][1], var_4[0][2] );
}

_id_5F2F( var_0 )
{
    var_0 = _id_5F0F( var_0, 0 );

    if ( isdefined( self.badplaceawareness ) )
        self._id_5F30 = self.badplaceawareness;

    self.badplaceawareness = var_0;
}

_id_5F31()
{
    if ( isdefined( self._id_5F30 ) )
        self.badplaceawareness = self._id_5F30;
}

_id_5F32( var_0, var_1 )
{
    var_0 = _id_5F0F( var_0, 0 );
    var_1 = _id_5EDF( var_1, 0, 1 );
    level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    if ( var_0 > 0 )
        level._id_473D fadeovertime( var_0 );

    level._id_473D.alpha = var_1;
    level._id_473D.foreground = 1;
    wait(var_0);
}

_id_5F33( var_0, var_1 )
{
    var_0 = _id_5F0F( var_0, 0 );
    var_1 = _id_5EDF( var_1, 0, 1 );

    if ( !isdefined( level._id_473D ) )
        return;

    if ( var_0 > 0 )
        level._id_473D fadeovertime( var_0 );

    level._id_473D.alpha = var_1;
    wait(var_0);
    level._id_473D destroy();
}

_id_5F34( var_0, var_1, var_2, var_3 )
{
    var_0 = _id_5F0F( var_0, 0 );
    var_1 = _id_5F0F( var_1, 0.05 );
    var_3 = _id_5F0F( var_3, 0 );

    for ( var_4 = 0; isdefined( var_2 ) && var_4 < var_1; var_4 += 0.05 )
    {
        earthquake( var_0, 0.05, var_2.origin, var_3 );
        wait 0.05;
    }
}

_id_5F35( var_0, var_1, var_2, var_3 )
{
    if ( self != level )
    {

    }
    else
    {

    }

    var_0 = _id_5F0F( var_0, 0 );
    var_3 = _id_5F0F( var_3, 0 );
    var_4 = 0;

    while ( !var_4 )
    {
        if ( self != level )
            var_4 = maps\_utility::_id_1008( var_1 );
        else
            var_4 = common_scripts\utility::flag_exist( var_1 );

        earthquake( var_0, 0.05, var_2.origin, var_3 );
        wait 0.05;
    }
}

_id_5F36( var_0, var_1 )
{
    for ( var_1 = abs( var_1 ); var_0 > var_1; var_0 -= var_1 )
    {

    }

    while ( var_0 < 0 )
        var_0 += var_1;

    return common_scripts\utility::ter_op( var_0 == var_1, 0, var_0 );
}

_id_5F37( var_0, var_1 )
{
    return ( _id_5F36( var_0[0], var_1 ), _id_5F36( var_0[1], var_1 ), _id_5F36( var_0[2], var_1 ) );
}

_id_5F38()
{
    _id_5F39( 1.5 );
}

_id_5F39( var_0 )
{
    var_0 = _id_5F0F( var_0, 0 );
    setsaveddvar( "player_sprintSpeedScale", var_0 );
}

_id_5F3A( var_0 )
{
    if ( getdvarint( "mission_fail_enabled", 1 ) )
    {
        level notify( "new_quote_string" );
        setdvar( "ui_deadquote", var_0 );
        maps\_utility::_id_1826();
    }
}

_id_5F3B( var_0, var_1, var_2, var_3 )
{
    var_4 = 5000000;
    var_5 = undefined;

    foreach ( var_7 in var_1 )
    {
        var_3 = _id_51FF( var_0, var_7.origin );
        var_8 = var_7 _id_5F4F( var_2 );

        if ( isdefined( var_8 ) && var_3 >= var_4 )
            continue;

        var_4 = var_3;
        var_5 = var_7;
    }

    return var_5;
}

_id_5F3C( var_0 )
{
    self vehicle_teleport( var_0.origin, var_0.angles );

    if ( isdefined( var_0.targetname ) )
        self.target = var_0.targetname;

    self._id_291A = var_0;
    self startpath( var_0 );
}

_id_5F3D( var_0 )
{
    if ( isdefined( var_0.targetname ) )
    {
        var_1 = getvehiclenodearray( var_0.targetname, "targetname" );

        if ( var_1.size > 1 )
            self.target = var_0.target;
        else
            self.target = var_0.targetname;
    }

    self._id_291A = var_0;
    var_2 = _id_5F52( self.target );
    var_3 = _id_5F3B( var_0.origin, var_2, "speed" );
    var_4 = 1;

    if ( isdefined( var_2[0].speed ) )
        var_4 = var_2[0].speed;
    else if ( isdefined( var_3 ) )
        var_4 = var_3.speed;
    else if ( isdefined( var_0.speed ) )
        var_4 = var_0.speed;

    self startpath( var_0 );
    self resumespeed( abs( var_4 ) );
}

_id_5F3E( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "trigger", var_2 );
    _id_5F3C( var_1 );
}

_id_5F3F( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "trigger", var_2 );
    _id_5F3D( var_1 );
}

_id_5F40( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 waittill( "trigger", var_3 );
    _id_5F3D( var_1 );
    common_scripts\utility::flag_set( var_2 );
}

_id_5F41( var_0, var_1 )
{
    var_1 = _id_5F0F( var_1, var_0 + 0.05 );
    return ( randomfloatrange( var_0, var_1 ), randomfloatrange( var_0, var_1 ), randomfloatrange( var_0, var_1 ) );
}

_id_5F42( var_0, var_1 )
{
    var_1 = _id_5F0F( var_1, var_0 + 1 );
    return ( randomintrange( var_0, var_1 ), randomintrange( var_0, var_1 ), randomintrange( var_0, var_1 ) );
}

_id_5F43()
{
    if ( isdefined( self ) )
    {
        self notify( "death" );
        self delete();
    }
}

_id_5F44( var_0, var_1, var_2 )
{
    if ( var_1 > 0 )
        return var_0.origin[1] >= var_1 * var_0.origin[0] + var_2;

    if ( var_1 < 0 )
        return var_0.origin[1] <= var_1 * var_0.origin[0] + var_2;
}

_id_5F45( var_0, var_1 )
{
    var_0 = _id_5EDF( var_0, 0, var_1.size );
    var_1 = maps\_utility::_id_0B53( var_1 );
    var_2 = [];

    foreach ( var_4 in var_1 )
        var_2[var_2.size] = var_4;

    return var_2;
}

_id_5F46( var_0, var_1 )
{
    maps\_anim::_id_1246( var_0, var_1, undefined, undefined, "generic" );
}

_id_5F47()
{
    animscripts\cover_behavior::_id_067F( "stand" );
    animscripts\cover_behavior::_id_067F( "left" );
    animscripts\cover_behavior::_id_067F( "right" );
    animscripts\cover_behavior::_id_067F( "crouch" );
}

_id_5F48( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) )
        var_0[0] = var_1;
    else
    {
        foreach ( var_3 in var_0 )
        {
            if ( isdefined( var_3 ) && var_3 == var_1 )
                return var_0;
        }

        var_0[var_0.size] = var_1;
    }

    return var_0;
}

_id_5F49( var_0, var_1 )
{
    var_0 = _id_5EDF( var_0, 0, var_1.size );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) )
            var_2++;

        if ( var_2 >= var_0 )
            return 1;
    }

    return 0;
}

_id_5F4A( var_0 )
{
    var_1 = 1;

    foreach ( var_3 in var_0 )
        var_1 *= common_scripts\utility::ter_op( isdefined( var_3 ) && isalive( var_3 ), 1, 0 );

    return var_1;
}

_id_5F4B( var_0, var_1 )
{
    var_0 = _id_5F0F( var_0, 0 );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) || !isalive( var_4 ) )
            var_2++;
    }

    return common_scripts\utility::ter_op( var_1.size == 0 || var_2 / var_1.size >= var_0, 1, 0 );
}

_id_5F4C( var_0, var_1 )
{
    var_0 = _id_5F0F( var_0, 0 );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) || !isalive( var_4 ) )
            var_2++;
    }

    return common_scripts\utility::ter_op( var_2 >= var_0, 1, 0 );
}

_id_5F4D( var_0 )
{
    var_0 = maps\_utility::_id_1361( var_0 );
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_0 = maps\_utility::_id_0B53( var_0 );
    return common_scripts\utility::ter_op( var_0.size > 0, var_0[0], undefined );
}

_id_5F4E( var_0 )
{
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_0 = maps\_utility::_id_0B53( var_0 );
    return common_scripts\utility::ter_op( var_0.size > 0, var_0[0], undefined );
}

_id_5F4F( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( self ) || !isdefined( var_0 ) )
        return common_scripts\utility::ter_op( isdefined( var_1 ) && !isdefined( var_2 ), var_1, var_2 );

    switch ( var_0 )
    {
        case "angles":
            var_2 = common_scripts\utility::ter_op( isdefined( self.angles ), self.angles, ( 0.0, 0.0, 0.0 ) );
            break;
        case "health":
            var_2 = self.health;
            break;
        case "magic_bullet_shield":
            var_2 = self._id_0D04;
            break;
        case "maxhealth":
            var_2 = self.maxhealth;
            break;
        case "origin":
            var_2 = self.origin;
            break;
        case "script_drone":
            var_2 = self._id_212C;
            break;
        case "script_group":
            var_2 = self._id_16A6;
            break;
        case "script_index":
            var_2 = self._id_16A5;
            break;
        case "script_linkname":
            var_2 = self.script_linkname;
            break;
        case "script_noteworthy":
            var_2 = self.script_noteworthy;
            break;
        case "script_parameters":
            var_2 = self._id_164F;
            break;
        case "script_specialops":
            var_2 = self._id_1693;
            break;
        case "script_team":
            var_2 = self.script_team;
            break;
        case "script_vehicleride":
            var_2 = self._id_250B;
            break;
        case "spawnflags":
            var_2 = self.spawnflags;
            break;
        case "speed":
            var_2 = self.speed;
            break;
        case "target":
            var_2 = self.target;
            break;
        case "targetname":
            var_2 = self.targetname;
            break;
        case "team":
            var_2 = self.team;
            break;
    }

    return common_scripts\utility::ter_op( isdefined( var_1 ) && !isdefined( var_2 ), var_1, var_2 );
}

_id_5F50( var_0, var_1 )
{
    if ( !isdefined( self ) || !isdefined( var_1 ) )
        return;

    switch ( var_1 )
    {
        case "angles":
            self.angles = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, ( 0.0, 0.0, 0.0 ) );
            break;
        case "ignoreall":
            self.ignoreall = var_0;
            break;
        case "ignoreme":
            self.ignoreme = var_0;
            break;
        case "magic_bullet_shield":
            self._id_0D04 = var_0;
            break;
        case "maxhealth":
            self.maxhealth = var_0;
            break;
        case "origin":
            self.origin = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, ( 0.0, 0.0, 0.0 ) );
            break;
        case "script_drone":
            self._id_212C = var_0;
            break;
        case "script_group":
            self._id_16A6 = var_0;
            break;
        case "script_index":
            self._id_16A5 = var_0;
            break;
        case "script_linkname":
            self.script_linkname = var_0;
            break;
        case "script_noteworthy":
            self.script_noteworthy = var_0;
            break;
        case "script_parameters":
            self._id_164F = var_0;
            break;
        case "script_specialops":
            self._id_1693 = var_0;
            break;
        case "script_team":
            self.script_team = var_0;
            break;
        case "script_vehicleride":
            self._id_250B = var_0;
            break;
        case "spawnflags":
            self.spawnflags = var_0;
            break;
        case "target":
            self.target = var_0;
            break;
        case "targetname":
            self.targetname = var_0;
            break;
        case "team":
            self.team = var_0;
            break;
    }
}

_id_5F51( var_0, var_1, var_2, var_3 )
{
    var_3 = common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 1 );
    var_4 = [];

    foreach ( var_6 in var_2 )
    {
        var_7 = var_6 _id_5F4F( var_1 );

        if ( isdefined( var_7 ) )
        {
            if ( var_3 && issubstr( var_7, var_0 ) )
            {
                var_4 = common_scripts\utility::add_to_array( var_4, var_6 );
                continue;
            }

            if ( var_7 == var_0 )
                var_4 = common_scripts\utility::add_to_array( var_4, var_6 );
        }
    }

    return var_4;
}

_id_5F52( var_0, var_1, var_2, var_3 )
{
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "targetname" );
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, "target" );
    var_3 = common_scripts\utility::ter_op( isdefined( var_3 ), var_3, "targetname" );
    var_4 = [];
    var_5 = maps\_utility::_id_283C( var_0, var_1 );
    var_6 = var_5;
    var_7 = undefined;

    if ( !isdefined( var_5 ) )
        return var_4;

    var_4[var_4.size] = var_5;

    while ( isdefined( var_6 ) )
    {
        var_7 = var_6;
        var_8 = var_6 _id_5F4F( var_2 );

        if ( isdefined( var_8 ) )
            var_6 = maps\_utility::_id_283C( var_8, var_3 );
        else
            var_6 = undefined;

        if ( isdefined( var_6 ) )
        {
            if ( _id_5EE1( var_4, var_6 ) )
                break;

            var_4[var_4.size] = var_6;
        }
    }

    return var_4;
}

_id_51FF( var_0, var_1 )
{
    return lengthsquared( ( var_0[0] - var_1[0], var_0[1] - var_1[1], 0 ) );
}

_id_5F53( var_0, var_1, var_2 )
{

}

_id_5F54( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    thread _id_5F55( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_5F55( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    if ( self != level )
        maps\_utility::_id_1654( var_0 );
    else
        common_scripts\utility::flag_wait( var_0 );

    if ( !isdefined( var_2 ) )
        thread [[ var_1 ]]();
    else if ( !isdefined( var_3 ) )
        thread [[ var_1 ]]( var_2 );
    else if ( !isdefined( var_4 ) )
        thread [[ var_1 ]]( var_2, var_3 );
    else if ( !isdefined( var_5 ) )
        thread [[ var_1 ]]( var_2, var_3, var_4 );
    else if ( !isdefined( var_6 ) )
        thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );
    else
        thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );
}

_id_5F56( var_0 )
{
    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_5F57( var_0, var_1, var_2 )
{
    var_0 = _id_5EDF( var_0, 0, 1 );
    return var_1.origin + var_0 * length( var_1.origin - var_2.origin ) * vectornormalize( var_1.origin - var_2.origin );
}

_id_5F58( var_0, var_1, var_2 )
{
    var_0 = _id_5EDF( var_0, 0, 1 );
    return var_1 + var_0 * length( var_2 - var_1 ) * vectornormalize( var_2 - var_1 );
}

_id_5EDE( var_0 )
{
    var_1 = _id_5EDF( var_0, 0, 1 );
    return common_scripts\utility::ter_op( randomint( 100 ) <= 100 * var_0, 1, 0 );
}

_id_5F59( var_0, var_1, var_2 )
{
    var_3 = sortbydistance( getaiarray( var_0 ), var_1 );
    var_3 = maps\_utility::_id_2672( var_3 );
    var_3 = common_scripts\utility::array_removeundefined( var_3 );
    var_2 = _id_5F0F( var_2, 0 );
    var_4 = [];

    foreach ( var_6 in var_3 )
    {
        if ( _id_5F16( var_6.origin, var_1, var_2 ) )
            var_4[var_4.size] = var_6;
    }

    return var_4;
}

_id_5F5A( var_0, var_1, var_2 )
{
    var_3 = sortbydistance( getaiarray( var_0 ), var_1 );
    var_3 = maps\_utility::_id_2672( var_3 );
    var_3 = common_scripts\utility::array_removeundefined( var_3 );
    var_2 = _id_5F0F( var_2, 0 );
    var_4 = [];

    foreach ( var_6 in var_3 )
    {
        if ( _id_51FF( var_6.origin, var_1 ) >= squared( var_2 ) )
            var_4[var_4.size] = var_6;
    }

    return var_4;
}

_id_5F5B( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, 0 );
    var_4 = _id_5F5A( var_0, var_1, var_2 );
    var_5 = [];

    foreach ( var_7 in var_4 )
    {
        if ( abs( var_7.origin[2] - var_1[2] ) <= -1 * var_3 / 2.0 )
            var_5[var_5.size] = var_7;
    }

    return var_5;
}

_id_5F5C( var_0 )
{
    return "" + var_0;
}

_id_5F5D( var_0, var_1 )
{
    var_1 = _id_5F5C( var_1 );
    var_2 = "";

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3] == var_1 )
            break;

        var_2 += var_0[var_3];
    }

    return var_2;
}

_id_5F5E( var_0, var_1, var_2, var_3 )
{
    self notify( "LISTEN_stop_move_to" );
    self endon( "LISTEN_stop_move_to" );
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, ( 0.0, 0.0, 0.0 ) );

    for ( var_1 = _id_5F0F( var_1, 0.05 ); isdefined( self ) && isdefined( var_0 ) && var_1 > 0; var_1 = _id_5F0E( var_1, 0.05, 0.05, 0 ) )
    {
        var_4 = undefined;

        if ( isdefined( var_3 ) )
            var_4 = var_0 gettagorigin( var_3 );

        var_4 = common_scripts\utility::ter_op( isdefined( var_4 ), var_4, var_0.origin );
        var_5 = var_4 + var_2 - self.origin;
        var_5 /= var_1 * 20;
        self moveto( self.origin + var_5, 0.05 );
        wait 0.05;
    }
}

_id_5F5F( var_0, var_1, var_2 )
{
    self notify( "LISTEN_stop_rotate_to" );
    self endon( "LISTEN_stop_rotate_to" );
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, ( 0.0, 0.0, 0.0 ) );

    for ( var_1 = _id_5F0F( var_1, 0.05 ); isdefined( self ) && isdefined( var_0 ) && var_1 > 0; var_1 = _id_5F0E( var_1, 0.05, 0.05, 0 ) )
    {
        var_3 = var_0.angles + var_2 - self.angles;
        var_3 /= var_1 * 20;
        self rotateto( self.angles + var_3, 0.05 );
        wait 0.05;
    }
}

_id_5F60( var_0, var_1, var_2 )
{
    self notify( "LISTEN_stop_look_at" );
    self endon( "LISTEN_stop_look_at" );

    for ( var_1 = _id_5F0F( var_1, 0.05 ); isdefined( self ) && isdefined( var_0 ) && var_1 > 0; var_1 = _id_5F0E( var_1, 0.05, 0.05, 0 ) )
    {
        var_3 = undefined;

        if ( isdefined( var_2 ) )
            var_3 = var_0 gettagorigin( var_2 );

        var_3 = common_scripts\utility::ter_op( isdefined( var_3 ), var_3, var_0.origin );
        var_4 = _id_5F37( vectortoangles( var_3 - self.origin ), 360 );
        var_5 = _id_5F37( self.angles, 360 );
        var_6 = [ 0, 0, 0 ];
        var_7 = common_scripts\utility::ter_op( var_4[0] - var_5[0] > 0, 1, -1 );
        var_6[0] = var_4[0] - var_5[0];
        var_6[0] = common_scripts\utility::ter_op( abs( var_6[0] ) > 180, -1 * var_7 * ( 360 - abs( var_6[0] ) ), var_7 * abs( var_6[0] ) );
        var_7 = common_scripts\utility::ter_op( var_4[1] - var_5[1] > 0, 1, -1 );
        var_6[1] = var_4[1] - var_5[1];
        var_6[1] = common_scripts\utility::ter_op( abs( var_6[1] ) > 180, -1 * var_7 * ( 360 - abs( var_6[1] ) ), var_7 * abs( var_6[1] ) );
        var_7 = common_scripts\utility::ter_op( var_4[2] - var_5[2] > 0, 1, -1 );
        var_6[2] = var_4[2] - var_5[2];
        var_6[2] = common_scripts\utility::ter_op( abs( var_6[2] ) > 180, -1 * var_7 * ( 360 - abs( var_6[2] ) ), var_7 * abs( var_6[2] ) );
        var_6 = ( var_6[0], var_6[1], var_6[2] );
        var_6 /= var_1 * 20;
        self rotateto( self.angles + var_6, 0.05 );
        wait 0.05;
    }
}

_id_5F61( var_0, var_1, var_2 )
{
    var_3 = var_0;

    foreach ( var_5 in var_0 )
    {
        if ( _id_5F0D( var_5 _id_5F4F( var_2 ), var_1 ) )
            var_3 = common_scripts\utility::array_remove( var_3, var_5 );
    }

    return var_3;
}

_id_5F62( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        if ( _id_5F0D( var_5 _id_5F4F( var_2 ), var_1 ) )
            var_3 = common_scripts\utility::add_to_array( var_3, var_5 );
    }

    return var_3;
}

_id_5F63( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        var_6 = var_5 _id_5F4F( var_2 );

        if ( isdefined( var_6 ) && common_scripts\utility::string_starts_with( var_6, var_1 ) )
            var_3 = common_scripts\utility::add_to_array( var_3, var_5 );
    }

    return var_3;
}

_id_5F64( var_0, var_1, var_2, var_3 )
{
    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    var_2 = _id_5F0F( var_2, 0 );

    while ( isdefined( var_0 ) && _id_5F17( var_0.origin, var_1, var_2 ) )
        wait 0.05;

    if ( self != level )
        maps\_utility::_id_13DC( var_3 );
    else
        common_scripts\utility::flag_set( var_3 );
}

_id_5F65( var_0, var_1, var_2, var_3 )
{
    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    var_2 = _id_5F0F( var_2, 0 );

    while ( _id_5F13( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        if ( self != level )
            maps\_utility::_id_13DC( var_3 );
        else
            common_scripts\utility::flag_set( var_3 );
    }
}

_id_5F66( var_0, var_1, var_2, var_3 )
{
    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    var_2 = _id_5F0F( var_2, 0 );

    while ( _id_5F18( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        if ( self != level )
            maps\_utility::_id_13DC( var_3 );
        else
            common_scripts\utility::flag_set( var_3 );
    }
}

_id_5F67( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_2 )
    {

    }

    var_1 = _id_5F0F( var_1, 0 );

    while ( _id_5F18( self, var_0, var_1 ) )
        wait 0.05;

    if ( isdefined( self ) && isdefined( var_0 ) )
    {
        foreach ( var_4 in var_2 )
            maps\_utility::_id_13DC( var_4 );

        var_0 delete();
    }
}

_id_5F68( var_0, var_1, var_2, var_3 )
{
    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    var_2 = _id_5F0F( var_2, 0 );

    while ( isalive( var_0 ) && _id_5F18( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( self != level )
        maps\_utility::_id_13DC( var_3 );
    else
        common_scripts\utility::flag_set( var_3 );
}

_id_5F69( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    if ( !isdefined( var_4 ) )
        _id_5F68( var_0, var_1, var_2, var_3 );
    else
    {
        for ( var_5 = 0; var_5 <= var_4 && isalive( var_0 ) && _id_5F18( var_0, var_1, var_2 ); var_5 += 0.05 )
            wait 0.05;

        if ( var_5 <= var_4 )
        {
            if ( self != level )
                maps\_utility::_id_13DC( var_3 );
            else
                common_scripts\utility::flag_set( var_3 );
        }
    }
}

_id_5F6A( var_0, var_1, var_2, var_3 )
{
    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    var_2 = _id_5F0F( var_2, 0 );

    while ( isalive( var_0 ) && _id_5F13( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( self != level )
        maps\_utility::_id_13DC( var_3 );
    else
        common_scripts\utility::flag_set( var_3 );
}

_id_5F6B( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    if ( !isdefined( var_4 ) )
        _id_5F6A( var_0, var_1, var_2, var_3 );
    else
    {
        for ( var_5 = 0; var_5 < var_4 && isalive( var_0 ) && _id_5F13( var_0, var_1, var_2 ); var_5 += 0.05 )
            wait 0.05;

        if ( var_5 <= var_4 )
        {
            if ( self != level )
                maps\_utility::_id_13DC( var_3 );
            else
                common_scripts\utility::flag_set( var_3 );
        }
    }
}

_id_5F6C( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( self != level )
        self endon( "death" );

    if ( self != level )
    {

    }
    else
    {

    }

    if ( !isdefined( var_4 ) )
        _id_5F68( var_0, var_1, var_2, var_3 );
    else
    {
        for ( var_5 = 0; var_5 < var_4 && isalive( var_0 ) && _id_5F18( var_0, var_1, var_2 ); var_5 += 0.05 )
            wait 0.05;

        if ( self != level )
            maps\_utility::_id_13DC( var_3 );
        else
            common_scripts\utility::flag_set( var_3 );
    }
}

_id_5F6D( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( isalive( var_0 ) && _id_5F18( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( isalive( var_0 ) )
        var_0 notify( var_3 );
}

_id_5F6E( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( isalive( var_0 ) && _id_5F13( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( isalive( var_0 ) )
        var_0 notify( var_3 );
}

_id_5F6F( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( _id_5F13( var_0, var_1, var_2 ) )
        wait 0.05;

    if ( isdefined( var_0 ) )
        var_0 notify( var_3 );
}

_id_5F70( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_2 = _id_5F0F( var_2, 0 );
    _id_5F74( var_0, var_1, var_2 );
    self thread [[ var_3 ]]();
}

_id_5F71( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_2 = _id_5F0F( var_2, 0 );
    var_4 = _id_5F0F( var_4, 0 );

    if ( var_4 == 0 )
        _id_5F70( var_0, var_1, var_2, var_3 );
    else
    {
        _id_5F75( var_0, var_1, var_2, var_4 );
        self thread [[ var_3 ]]();
    }
}

_id_5F72( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( isalive( var_0 ) && _id_5F18( var_0, var_1, var_2 ) )
        wait 0.05;
}

_id_5F73( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( !isdefined( var_3 ) )
        _id_5F72( var_0, var_1, var_2 );
    else
    {
        for ( var_4 = 0; var_4 < var_3 && isalive( var_0 ) && _id_5F18( var_0, var_1, var_2 ); var_4 += 0.05 )
            wait 0.05;
    }
}

_id_5F74( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( _id_5F13( var_0, var_1, var_2 ) )
        wait 0.05;
}

_id_5F75( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, 0 );

    if ( var_3 == 0 )
        _id_5F74( var_0, var_1, var_2 );
    else
    {
        for ( var_4 = 0; var_4 < var_3 && _id_5F13( var_0, var_1, var_2 ); var_4 += 0.05 )
            wait 0.05;
    }
}

_id_5F76( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( _id_5F18( var_0, var_1, var_2 ) )
        wait 0.05;
}

_id_5F77( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( !isdefined( var_3 ) )
        _id_5F76( var_0, var_1, var_2 );
    else
    {
        for ( var_4 = 0; var_4 <= var_3 && _id_5F18( var_0, var_1, var_2 ); var_4 += 0.05 )
            wait 0.05;
    }
}

_id_5F78( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( isdefined( var_0 ) && _id_5F14( var_0.origin, var_1, var_2, var_3 ) )
        wait 0.05;
}

_id_5F79( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );

    while ( isdefined( var_0 ) && _id_5F17( var_0.origin, var_1, var_2 ) )
        wait 0.05;
}

_id_5F7A( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( !isdefined( var_3 ) )
        _id_5F79( var_0, var_1, var_2 );
    else
    {
        for ( var_4 = 0; var_4 < var_3 && isdefined( var_0 ) && _id_5F17( var_0.origin, var_1, var_2 ); var_4 += 0.05 )
            wait 0.05;
    }
}

_id_5F7B( var_0, var_1, var_2 )
{
    _id_5F7D( var_0, var_1 );

    if ( common_scripts\utility::flag_exist( var_2 ) )
        common_scripts\utility::flag_set( var_2 );
}

_id_5F7C( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        _id_5F7B( var_0, var_1, var_2 );
    else
        _id_5F7E( var_0, var_1, var_3 );

    if ( common_scripts\utility::flag_exist( var_2 ) )
        common_scripts\utility::flag_set( var_2 );
}

_id_5F7D( var_0, var_1 )
{
    var_2 = "FLAG_ent_" + var_1;

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) )
        {
            if ( var_4 maps\_utility::_id_133C( var_2 ) )
                var_4 maps\_utility::_id_13DE( var_2 );
            else
                var_4 maps\_utility::_id_1402( var_2 );

            var_4 thread _id_5F83( var_1, var_2 );
        }
    }

    var_6 = 0;
    var_7 = var_0.size;

    while ( var_6 < var_7 )
    {
        foreach ( var_4 in var_0 )
        {
            if ( isdefined( var_4 ) && var_4 maps\_utility::_id_133C( var_2 ) && var_4 maps\_utility::_id_1008( var_2 ) )
            {
                var_6++;
                var_4 notify( "LISTEN_kill_ent_monitor_" + var_1 + "_" + var_2 + "_thread" );
                var_4 maps\_utility::_id_13DE( var_2 );
                continue;
            }

            if ( !isdefined( var_4 ) )
                var_6++;
        }

        var_0 = maps\_utility::_id_1361( var_0 );
        var_0 = common_scripts\utility::array_removeundefined( var_0 );
        wait 0.05;
    }

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) )
        {
            if ( var_4 maps\_utility::_id_133C( var_2 ) )
                var_4 maps\_utility::_id_13DE( var_2 );

            var_4 notify( "LISTEN_kill_ent_monitor_" + var_1 + "_" + var_2 + "_thread" );
        }
    }
}

_id_5F7E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        _id_5F7D( var_0, var_1 );
    else
    {
        var_3 = "FLAG_ent_" + var_1;

        foreach ( var_5 in var_0 )
        {
            if ( isdefined( var_5 ) && isalive( var_5 ) )
            {
                if ( var_5 maps\_utility::_id_133C( var_3 ) )
                    var_5 maps\_utility::_id_13DE( var_3 );
                else
                    var_5 maps\_utility::_id_1402( var_3 );

                var_5 thread _id_5F83( var_1, var_3 );
            }
        }

        var_7 = 0;
        var_8 = 0;
        var_9 = var_0.size;

        while ( var_7 < var_9 && var_8 < var_2 )
        {
            foreach ( var_5 in var_0 )
            {
                if ( isdefined( var_5 ) && var_5 maps\_utility::_id_133C( var_3 ) && var_5 maps\_utility::_id_1008( var_3 ) )
                {
                    var_7++;
                    var_5 notify( "LISTEN_kill_ent_monitor_" + var_1 + "_" + var_3 + "_thread" );
                    var_5 maps\_utility::_id_13DE( var_3 );
                    continue;
                }

                if ( !isdefined( var_5 ) )
                    var_7++;
            }

            var_0 = maps\_utility::_id_1361( var_0 );
            var_0 = common_scripts\utility::array_removeundefined( var_0 );
            var_8 += 0.05;
            wait 0.05;
        }

        foreach ( var_5 in var_0 )
        {
            if ( isdefined( var_5 ) && isalive( var_5 ) )
            {
                if ( var_5 maps\_utility::_id_133C( var_3 ) )
                    var_5 maps\_utility::_id_13DE( var_3 );

                var_5 notify( "LISTEN_kill_ent_monitor_" + var_1 + "_" + var_3 + "_thread" );
            }
        }
    }
}

_id_5F7F( var_0, var_1, var_2, var_3 )
{
    var_0 = _id_5EDF( var_0, 0, var_1.size, 1 );
    _id_5F81( var_0, var_1, var_2 );

    if ( common_scripts\utility::flag_exist( var_3 ) )
        common_scripts\utility::flag_set( var_3 );
}

_id_5F80( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 = _id_5EDF( var_0, 0, var_1.size, 1 );

    if ( !isdefined( var_4 ) )
        _id_5F7F( var_0, var_1, var_2, var_3 );
    else
        _id_5F82( var_0, var_1, var_2, var_4 );

    if ( common_scripts\utility::flag_exist( var_3 ) )
        common_scripts\utility::flag_set( var_3 );
}

_id_5F81( var_0, var_1, var_2 )
{
    var_0 = _id_5EDF( var_0, 0, var_1.size, 1 );
    var_3 = "FLAG_ent_" + var_2;

    foreach ( var_5 in var_1 )
    {
        if ( isdefined( var_5 ) && isalive( var_5 ) )
        {
            if ( var_5 maps\_utility::_id_133C( var_3 ) )
                var_5 maps\_utility::_id_13DE( var_3 );
            else
                var_5 maps\_utility::_id_1402( var_3 );

            var_5 thread _id_5F83( var_2, var_3 );
        }
    }

    var_7 = 0;

    while ( var_7 < var_0 )
    {
        foreach ( var_5 in var_1 )
        {
            if ( isdefined( var_5 ) && var_5 maps\_utility::_id_133C( var_3 ) && var_5 maps\_utility::_id_1008( var_3 ) )
            {
                var_7++;
                var_5 notify( "LISTEN_kill_ent_monitor_" + var_2 + "_" + var_3 + "_thread" );
                var_5 maps\_utility::_id_13DE( var_3 );
                continue;
            }

            if ( !isdefined( var_5 ) )
                var_7++;
        }

        var_1 = maps\_utility::_id_1361( var_1 );
        var_1 = common_scripts\utility::array_removeundefined( var_1 );
        wait 0.05;
    }

    foreach ( var_5 in var_1 )
    {
        if ( isdefined( var_5 ) && isalive( var_5 ) )
        {
            if ( var_5 maps\_utility::_id_133C( var_3 ) )
                var_5 maps\_utility::_id_13DE( var_3 );

            var_5 notify( "LISTEN_kill_ent_monitor_" + var_2 + "_" + var_3 + "_thread" );
        }
    }
}

_id_5F82( var_0, var_1, var_2, var_3 )
{
    var_0 = _id_5EDF( var_0, 0, var_1.size, 1 );

    if ( !isdefined( var_3 ) )
        _id_5F81( var_0, var_1, var_2 );
    else
    {
        var_4 = "FLAG_ent_" + var_2;

        foreach ( var_6 in var_1 )
        {
            if ( isdefined( var_6 ) && isalive( var_6 ) )
            {
                if ( var_6 maps\_utility::_id_133C( var_4 ) )
                    var_6 maps\_utility::_id_13DE( var_4 );
                else
                    var_6 maps\_utility::_id_1402( var_4 );

                var_6 thread _id_5F83( var_2, var_4 );
            }
        }

        var_8 = 0;
        var_9 = 0;

        while ( var_8 < var_0 || var_9 < var_3 )
        {
            foreach ( var_6 in var_1 )
            {
                if ( isdefined( var_6 ) && var_6 maps\_utility::_id_133C( var_4 ) && var_6 maps\_utility::_id_1008( var_4 ) )
                {
                    var_8++;
                    var_6 notify( "LISTEN_kill_ent_monitor_" + var_2 + "_" + var_4 + "_thread" );
                    var_6 maps\_utility::_id_13DE( var_4 );
                    continue;
                }

                if ( !isdefined( var_6 ) )
                    var_8++;
            }

            var_1 = maps\_utility::_id_1361( var_1 );
            var_1 = common_scripts\utility::array_removeundefined( var_1 );
            var_9 += 0.05;
            wait 0.05;
        }

        foreach ( var_6 in var_1 )
        {
            if ( isdefined( var_6 ) && isalive( var_6 ) )
            {
                if ( var_6 maps\_utility::_id_133C( var_4 ) )
                    var_6 maps\_utility::_id_13DE( var_4 );

                var_6 notify( "LISTEN_kill_ent_monitor_" + var_2 + "_" + var_4 + "_thread" );
            }
        }
    }
}

_id_5F83( var_0, var_1 )
{
    self endon( "LISTEN_kill_ent_monitor_" + var_0 + "_" + var_1 + "_thread" );
    common_scripts\utility::waittill_any( var_0, "death" );

    if ( isdefined( self ) && maps\_utility::_id_133C( var_1 ) )
        maps\_utility::_id_13DC( var_1 );
}

_id_5F84( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_5EE6 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        var_1._id_5EE6[var_4] = 0;
        thread _id_5F85( var_1, var_4, var_3 );
    }

    var_5 = 0;

    while ( !var_5 )
    {
        for ( var_4 = 0; var_4 < var_1._id_5EE6.size && var_1._id_5EE6[var_4]; var_4++ )
        {

        }

        if ( var_4 == var_1._id_5EE6.size )
            var_5 = 1;

        wait 0.05;
    }
}

_id_5F85( var_0, var_1, var_2 )
{
    common_scripts\utility::waittill_any( var_2, "death" );
    var_0._id_5EE6[var_1] = 1;
}

_id_5F86( var_0, var_1, var_2, var_3 )
{
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "any" );
    var_1 = common_scripts\utility::ter_op( tolower( var_1 ) == "any", "any", "and" );
    thread _id_5F87( var_0, var_1, var_2, var_3 );
}

_id_5F87( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_5F05( var_0, "death" );

    if ( !var_4 )
        self endon( "death" );

    switch ( var_1 )
    {
        case "all":
            _id_5F84( var_0 );
            break;
        case "any":
            _id_5EE5( var_0 );
            break;
    }

    if ( !isdefined( var_3 ) )
        thread [[ var_2 ]]();
    else
    {
        switch ( var_3.size )
        {
            case 0:
                thread [[ var_2 ]]();
                break;
            case 1:
                thread [[ var_2 ]]( var_3[0] );
                break;
            case 2:
                thread [[ var_2 ]]( var_3[0], var_3[1] );
                break;
            case 3:
                thread [[ var_2 ]]( var_3[0], var_3[1], var_3[2] );
                break;
            case 4:
                thread [[ var_2 ]]( var_3[0], var_3[1], var_3[2], var_3[3] );
                break;
            case 5:
                thread [[ var_2 ]]( var_3[0], var_3[1], var_3[2], var_3[3], var_3[4] );
                break;
            case 6:
                thread [[ var_2 ]]( var_3[0], var_3[1], var_3[2], var_3[3], var_3[4], var_3[5] );
                break;
            case 7:
                thread [[ var_2 ]]( var_3[0], var_3[1], var_3[2], var_3[3], var_3[4], var_3[5], var_3[6] );
                break;
        }
    }
}

_id_5F88( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = maps\_utility::_id_283C( var_0, var_1 );
    var_3 waittill( "trigger", var_4 );
    common_scripts\utility::flag_set( var_2 );
}

_id_5F89( var_0, var_1 )
{
    if ( self != level )
    {
        common_scripts\utility::waittill_any( var_0, "death" );
        maps\_utility::_id_13DC( var_1 );
    }
    else
    {
        level waittill( var_0 );
        common_scripts\utility::flag_set( var_1 );
    }
}

_id_5F8A( var_0, var_1 )
{
    _id_5F84( var_0 );

    if ( self != level )
    {
        foreach ( var_3 in var_1 )
            maps\_utility::_id_13DC( var_3 );
    }
    else
    {
        foreach ( var_3 in var_1 )
            common_scripts\utility::flag_set( var_3 );
    }
}

_id_5F8B( var_0, var_1, var_2, var_3 )
{
    var_3 = _id_5F0F( var_3, 0 );
    var_4 = _id_5F59( var_2, var_1, var_3 );

    foreach ( var_6 in var_4 )
    {
        if ( var_6 maps\_utility::_id_133C( var_0 ) )
            var_6 maps\_utility::_id_13DC( var_0 );
    }
}

_id_5F8C( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( !isdefined( var_3 ) )
        return _id_5F90( var_0, var_1, var_2 );

    var_4 = [];
    var_5 = 0;

    for (;;)
    {
        var_6 = maps\_utility::_id_283C( var_0 + var_2 + var_3, var_1 );

        if ( isdefined( var_6 ) )
            var_4[var_5] = var_6;
        else
            break;

        var_2++;
        var_5++;
    }

    return var_4;
}

_id_5F8D( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );

    if ( !isdefined( var_3 ) )
        return _id_5F91( var_0, var_1, var_2 );

    var_4 = [];

    for (;;)
    {
        var_5 = maps\_utility::_id_283C( var_0 + var_2 + var_3, var_1 );

        if ( isdefined( var_5 ) )
            var_4[var_2] = var_5;
        else
            break;

        var_2++;
    }

    return var_4;
}

_id_5F8E( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, 0 );
    var_3 = common_scripts\utility::ter_op( var_2 < var_3, var_3, var_2 );

    if ( !isdefined( var_4 ) )
        return _id_5F92( var_0, var_1, var_2, var_3 );

    var_5 = [];
    var_6 = 0;

    for ( var_7 = var_2; var_6 <= var_3 - var_2; var_6++ )
    {
        var_8 = maps\_utility::_id_283C( var_0 + var_7 + var_4, var_1 );

        if ( isdefined( var_8 ) )
            var_5[var_6] = var_8;
        else
            break;

        var_7++;
    }

    return var_5;
}

_id_5F8F( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, var_2 );

    if ( !isdefined( var_4 ) )
        return _id_5F92( var_0, var_1, var_2, var_3 );

    var_5 = [];

    for ( var_6 = var_2; var_6 <= var_3; var_6++ )
    {
        var_7 = maps\_utility::_id_283C( var_0 + var_6 + var_4, var_1 );

        if ( isdefined( var_7 ) )
        {
            var_5[var_6] = var_7;
            continue;
        }

        break;
    }

    return var_5;
}

_id_5F90( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = [];
    var_4 = 0;

    for (;;)
    {
        var_5 = maps\_utility::_id_283C( var_0 + var_2, var_1 );

        if ( isdefined( var_5 ) )
            var_3[var_4] = var_5;
        else
            break;

        var_2++;
        var_4++;
    }

    return var_3;
}

_id_5F91( var_0, var_1, var_2 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = [];

    for (;;)
    {
        var_4 = maps\_utility::_id_283C( var_0 + var_2, var_1 );

        if ( isdefined( var_4 ) )
            var_3[var_2] = var_4;
        else
            break;

        var_2++;
    }

    return var_3;
}

_id_5F92( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, var_2 );
    var_4 = [];
    var_5 = 0;

    for ( var_6 = var_2; var_5 <= var_3 - var_2; var_5++ )
    {
        var_7 = maps\_utility::_id_283C( var_0 + var_6, var_1 );

        if ( isdefined( var_7 ) )
            var_4[var_5] = var_7;
        else
            break;

        var_6++;
    }

    return var_4;
}

_id_5F93( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, var_2 );
    var_4 = [];
    var_5 = 0;

    for ( var_6 = var_2; var_6 <= var_3; var_6++ )
    {
        var_7 = maps\_utility::_id_283C( var_0 + var_6, var_1 );

        if ( isdefined( var_7 ) )
        {
            var_4[var_6] = var_7;
            continue;
        }

        break;
    }

    return var_4;
}

_id_5F94( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        var_2 = common_scripts\utility::getstructarray( var_0, var_1 );

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        return [];

    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5._id_16A5 ) )
            var_3[var_5._id_16A5] = var_5;
    }

    return var_3;
}

_id_5F95( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_5F90( var_0, var_1, var_2 );

    if ( !isdefined( var_7 ) )
        return;

    foreach ( var_9 in var_7 )
    {
        if ( !isdefined( var_9 ) )
            continue;

        var_10 = var_9 _id_5F4F( var_1 );

        if ( !isdefined( var_10 ) )
            continue;

        var_9 thread maps\_utility::add_spawn_function( var_3, var_10, var_1, var_4, var_5, var_6 );
    }
}

_id_5F96( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_5F90( var_0, var_1, var_2 );

    if ( !isdefined( var_7 ) )
        return;

    foreach ( var_9 in var_7 )
    {
        if ( !isdefined( var_9 ) )
            continue;

        var_9 thread maps\_utility::add_spawn_function( var_3, var_0, var_1, var_4, var_5, var_6 );
    }
}

_id_5F97( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = _id_5F90( var_0, var_1, var_2 );

    if ( !isdefined( var_9 ) )
        return;

    foreach ( var_11 in var_9 )
    {
        if ( !isdefined( var_11 ) )
            continue;

        var_11 thread maps\_utility::add_spawn_function( var_3, var_4, var_5, var_6, var_7, var_8 );
    }
}

_id_5F98( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = _id_5F8C( var_0, var_1, var_2, var_3 );

    if ( !isdefined( var_8 ) )
        return;

    foreach ( var_10 in var_8 )
    {
        if ( !isdefined( var_10 ) )
            continue;

        var_11 = var_10 _id_5F4F( var_1 );

        if ( !isdefined( var_11 ) )
            continue;

        var_10 thread maps\_utility::add_spawn_function( var_4, var_11, var_1, var_5, var_6, var_7 );
    }
}

_id_5F99( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = _id_5F8C( var_0, var_1, var_2, var_3 );

    if ( !isdefined( var_10 ) )
        return;

    foreach ( var_12 in var_10 )
    {
        if ( !isdefined( var_12 ) )
            continue;

        var_12 thread maps\_utility::add_spawn_function( var_4, var_5, var_6, var_7, var_8, var_9 );
    }
}
#using_animtree("generic_human");

_id_5F9A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = %root;

    switch ( var_1 )
    {
        case "root":
            break;
        case "body":
            var_5 = "body";
            break;
        default:
    }

    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, 0.05 );
    var_4 = _id_5F0F( var_4, 0 );
    self setanimknoball( var_0, var_5, var_2, var_3, var_4 );
}
#using_animtree("player");

_id_5F9B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = %root;

    switch ( var_1 )
    {
        case "root":
            break;
        case "body":
            var_5 = "body";
            break;
        default:
    }

    var_2 = _id_5F0F( var_2, 0 );
    var_3 = _id_5F0F( var_3, 0.05 );
    var_4 = _id_5F0F( var_4, 0 );
    self setanimknoball( var_0, var_5, var_2, var_3, var_4 );
}

_id_5F9C( var_0, var_1, var_2 )
{
    var_1 = _id_5F0F( var_1, 0 );
    var_0 _id_5F9B( var_0 maps\_utility::_id_1281( var_2 ), "root", 1.0, 0, 0 );
    wait 0.05;
    var_3 = getanimlength( var_0 maps\_utility::_id_1281( var_2 ) );
    var_0 setanimtime( var_0 maps\_utility::_id_1281( var_2 ), clamp( var_1 / var_3, 0, 1 ) );
}

_id_5F9D( var_0, var_1, var_2, var_3 )
{
    var_2 = _id_5F0F( var_2, 0 );
    var_4 = var_0.origin;
    var_5 = var_0.angles;
    var_6 = var_0._id_1032;
    var_0 stopanimscripted();
    var_0 notify( "death" );
    var_0 delete();
    wait 0.05;
    var_1.count = 1;
    var_1.origin = var_4;
    var_1.angles = var_5;
    var_0 = var_1 maps\_utility::_id_166F( 1 );
    wait 0.05;
    var_0._id_1032 = var_6;
    var_0.pushable = 0;
    var_0 notify( "killanimscript" );
    var_0 clearanim( var_0._id_0C56, 0 );
    var_0 setanim( var_0 maps\_utility::_id_1281( var_3 ), 1.0, 0, 0 );
    wait 0.05;
    var_7 = getanimlength( var_0 maps\_utility::_id_1281( var_3 ) );
    var_0 setanimtime( var_0 maps\_utility::_id_1281( var_3 ), clamp( var_2 / var_7, 0, 1 ) );
}
