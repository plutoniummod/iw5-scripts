// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["team_ammo_refill"] = ::tryuseteamammorefill;
}

tryuseteamammorefill( var_0 )
{
    var_1 = giveteamammorefill();

    if ( var_1 )
        maps\mp\_matchdata::logkillstreakevent( "team_ammo_refill", self.origin );

    return var_1;
}

giveteamammorefill()
{
    if ( level.teambased )
    {
        foreach ( var_1 in level.players )
        {
            if ( var_1.team == self.team )
                var_1 refillammo( 1 );
        }
    }
    else
        refillammo( 1 );

    level thread maps\mp\_utility::teamplayercardsplash( "used_team_ammo_refill", self );
    return 1;
}

refillammo( var_0 )
{
    var_1 = self getweaponslistall();

    if ( var_0 )
    {
        if ( maps\mp\_utility::_hasperk( "specialty_tacticalinsertion" ) && self getammocount( "flare_mp" ) < 1 )
            maps\mp\_utility::giveperk( "specialty_tacticalinsertion", 0 );

        if ( maps\mp\_utility::_hasperk( "specialty_scrambler" ) && self getammocount( "scrambler_mp" ) < 1 )
            maps\mp\_utility::giveperk( "specialty_scrambler", 0 );

        if ( maps\mp\_utility::_hasperk( "specialty_portable_radar" ) && self getammocount( "portable_radar_mp" ) < 1 )
            maps\mp\_utility::giveperk( "specialty_portable_radar", 0 );
    }

    foreach ( var_3 in var_1 )
    {
        if ( issubstr( var_3, "grenade" ) || getsubstr( var_3, 0, 2 ) == "gl" )
        {
            if ( !var_0 || self getammocount( var_3 ) >= 1 )
                continue;
        }

        self givemaxammo( var_3 );
    }

    self playlocalsound( "ammo_crate_use" );
}
