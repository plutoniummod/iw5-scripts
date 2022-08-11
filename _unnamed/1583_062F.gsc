// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "weapon_c4";

    if ( !isdefined( var_2 ) )
        var_2 = "weapon_c4_obj";

    if ( !isdefined( var_0 ) )
        level._id_4619 = "c4";
    else
        level._id_4619 = var_0;

    precachemodel( var_1 );
    precachemodel( var_2 );
    precacheitem( level._id_4619 );
    level._effect["c4_explosion"] = loadfx( "explosions/grenadeExp_metal" );
}

_id_461A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_4 ) )
        var_4 = "weapon_c4";

    if ( !isdefined( var_5 ) )
        var_5 = "weapon_c4_obj";

    if ( isdefined( var_0 ) )
        var_6 = self gettagorigin( var_0 );
    else if ( isdefined( var_3 ) )
        var_6 = var_3;
    else
    {

    }

    var_7 = spawn( "script_model", var_6 + var_1 );
    var_7 setmodel( var_5 );

    if ( isdefined( var_0 ) )
        var_7 linkto( self, var_0, var_1, var_2 );
    else
        var_7.angles = self.angles;

    var_7.trigger = _id_4627();

    if ( isdefined( level._id_461B ) )
        var_7.trigger sethintstring( level._id_461B );
    else
        var_7.trigger sethintstring( &"SCRIPT_PLATFORM_HINT_PLANTEXPLOSIVES" );

    if ( isdefined( var_0 ) )
    {
        var_7.trigger linkto( self, var_0, var_1, var_2 );
        var_7.trigger._id_461C = 1;
    }
    else
        var_7.trigger.origin = var_7.origin;

    var_7 thread _id_461E( self, var_4 );

    if ( !isdefined( self._id_461D ) )
        var_7 thread _id_4620( self );

    var_7 thread _id_4623( self );
    return var_7;
}

_id_1C1D()
{
    self endon( "death" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "c4_light_blink" ), self, "tag_fx" );
}

_id_461E( var_0, var_1 )
{
    var_0 endon( "clear_c4" );

    if ( !isdefined( var_1 ) )
        var_1 = "weapon_c4";

    if ( !isdefined( var_0._id_461D ) )
        var_0 endon( "c4_planted" );

    if ( !isdefined( var_0._id_461F ) )
        var_0._id_461F = 0;

    var_0._id_461F++;
    self.trigger usetriggerrequirelookat();
    self.trigger waittill( "trigger", var_2 );
    level notify( "c4_in_place", self );
    self.trigger unlink();
    self.trigger _id_4628();
    self playsound( "c4_bounce_default" );
    self setmodel( var_1 );
    thread _id_1C1D();
    var_0._id_461F--;

    if ( !isdefined( var_0._id_461D ) || !var_0._id_461F )
        var_2 _id_4626();

    thread _id_4621( var_0, var_2 );
    var_0 notify( "c4_planted", self );
}

_id_4620( var_0 )
{
    var_0 endon( "clear_c4" );
    self.trigger endon( "trigger" );
    var_0 waittill( "c4_planted", var_1 );
    self.trigger unlink();
    self.trigger _id_4628();
    self delete();
}

_id_4621( var_0, var_1 )
{
    var_0 endon( "clear_c4" );
    var_1 waittill( "detonate" );
    playfx( level._effect["c4_explosion"], self.origin );
    var_2 = spawn( "script_origin", self.origin );

    if ( isdefined( level._id_4622 ) )
        var_2 playsound( "detpack_explo_main", "sound_done" );

    self radiusdamage( self.origin, 256, 200, 50 );
    earthquake( 0.4, 1, self.origin, 1000 );

    if ( isdefined( self ) )
        self delete();

    var_1 thread _id_4624();
    var_0 notify( "c4_detonation" );
    var_2 waittill( "sound_done" );
    var_2 delete();
}

_id_4623( var_0 )
{
    var_0 endon( "c4_detonation" );
    var_0 waittill( "clear_c4" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.trigger.inuse ) && self.trigger.inuse )
        self.trigger _id_4628();

    if ( isdefined( self ) )
        self delete();

    level.player thread _id_4624();
}

_id_4624()
{
    level endon( "c4_in_place" );
    wait 1;
    var_0 = 0;

    if ( level._id_4619 == self getcurrentweapon() && isdefined( self._id_4625 ) )
    {
        if ( self._id_4625 == "none" )
        {
            var_0 = 1;
            self switchtoweapon( self getweaponslistprimaries()[0] );
        }
        else if ( self hasweapon( self._id_4625 ) && self._id_4625 != level._id_4619 )
            self switchtoweapon( self._id_4625 );
        else
            self switchtoweapon( self getweaponslistprimaries()[0] );
    }

    self._id_4625 = undefined;

    if ( 0 != self getammocount( level._id_4619 ) )
        return;

    self waittill( "weapon_change" );
    self takeweapon( level._id_4619 );
}

_id_4626()
{
    var_0 = undefined;

    if ( !isdefined( self._id_4625 ) )
        self._id_4625 = self getcurrentweapon();

    var_1 = self getweaponslistall();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] != level._id_4619 )
            continue;

        var_0 = var_1[var_2];
    }

    if ( !isdefined( var_0 ) )
    {
        self giveweapon( level._id_4619 );
        self setweaponammoclip( level._id_4619, 0 );
        self setactionslot( 2, "weapon", level._id_4619 );
    }

    self switchtoweapon( level._id_4619 );
}

_id_4627()
{
    var_0 = getentarray( "generic_use_trigger", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].inuse ) && var_0[var_1].inuse )
            continue;

        if ( !isdefined( var_0[var_1].inuse ) )
            var_0[var_1] enablelinkto();

        var_0[var_1].inuse = 1;
        var_0[var_1]._id_25FB = var_0[var_1].origin;
        return var_0[var_1];
    }
}

_id_4628()
{
    if ( isdefined( self._id_461C ) )
        self unlink();

    self._id_461C = undefined;
    self.origin = self._id_25FB;
    self.inuse = 0;
}
