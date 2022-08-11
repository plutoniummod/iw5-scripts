// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshellshock( "frag_grenade_mp" );
    precacheshellshock( "damage_mp" );
    precacherumble( "artillery_rumble" );
    precacherumble( "grenade_rumble" );
    precachemenu( "dirt_effect_center" );
    precachemenu( "dirt_effect_left" );
    precachemenu( "dirt_effect_right" );
    precachemenu( "blood_effect_center" );
    precachemenu( "blood_effect_left" );
    precachemenu( "blood_effect_right" );
}

shellshockondamage( var_0, var_1 )
{
    if ( maps\mp\_flashgrenades::isflashbanged() )
        return;

    if ( var_0 == "MOD_EXPLOSIVE" || var_0 == "MOD_GRENADE" || var_0 == "MOD_GRENADE_SPLASH" || var_0 == "MOD_PROJECTILE" || var_0 == "MOD_PROJECTILE_SPLASH" )
    {
        if ( var_1 > 10 )
        {
            if ( isdefined( self.shellshockreduction ) && self.shellshockreduction )
                self shellshock( "frag_grenade_mp", self.shellshockreduction );
            else
                self shellshock( "frag_grenade_mp", 0.5 );
        }
    }
}

endondeath()
{
    self waittill( "death" );
    waittillframeend;
    self notify( "end_explode" );
}

grenade_earthquake()
{
    thread endondeath();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.5, 0.75, var_0, 800 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 maps\mp\_utility::isusingremote() )
            continue;

        if ( distance( var_0, var_2.origin ) > 600 )
            continue;

        if ( var_2 damageconetrace( var_0 ) )
            var_2 thread dirteffect( var_0 );
    }
}

dirteffect( var_0 )
{
    self endon( "disconnect" );
    var_1 = vectornormalize( anglestoforward( self.angles ) );
    var_2 = vectornormalize( anglestoright( self.angles ) );
    var_3 = vectornormalize( var_0 - self.origin );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );
    var_6 = [];

    if ( var_4 > 0 && var_4 > 0.5 && self getcurrentweapon() != "riotshield_mp" )
        var_6[var_6.size] = "dirt_effect_center";

    if ( abs( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            var_6[var_6.size] = "dirt_effect_right";
        else
            var_6[var_6.size] = "dirt_effect_left";
    }

    foreach ( var_8 in var_6 )
        self openmenu( var_8 );

    if ( isalive( self ) )
        common_scripts\utility::waittill_notify_or_timeout( "death", 2.0 );

    foreach ( var_8 in var_6 )
        self closemenu( var_8 );
}

bloodeffect( var_0 )
{
    self endon( "disconnect" );
    var_1 = vectornormalize( anglestoforward( self.angles ) );
    var_2 = vectornormalize( anglestoright( self.angles ) );
    var_3 = vectornormalize( var_0 - self.origin );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );
    var_6 = [];

    if ( var_4 > 0 && var_4 > 0.5 )
        var_6[var_6.size] = "blood_effect_center";

    if ( abs( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            var_6[var_6.size] = "blood_effect_right";
        else
            var_6[var_6.size] = "blood_effect_left";
    }

    foreach ( var_8 in var_6 )
        self openmenu( var_8 );

    if ( isalive( self ) )
        common_scripts\utility::waittill_notify_or_timeout( "death", 7.0 );

    foreach ( var_8 in var_6 )
        self closemenu( var_8 );
}

c4_earthquake()
{
    thread endondeath();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.4, 0.75, var_0, 512 );
}

barrel_earthquake()
{
    playrumbleonposition( "grenade_rumble", self.origin );
    earthquake( 0.4, 0.5, self.origin, 512 );
}

artillery_earthquake()
{
    playrumbleonposition( "artillery_rumble", self.origin );
    earthquake( 0.7, 0.5, self.origin, 800 );
}
