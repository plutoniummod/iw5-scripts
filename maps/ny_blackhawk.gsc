// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4566( var_0 )
{
    if ( var_0 > 0 )
    {
        var_1 = self._id_4567;
        var_2 = [];
        var_2[0] = var_1;
        var_1 thread maps\_anim::_id_11D6( var_2, "rotor_spin" );
        var_3 = 0.1;
        var_4 = 20;
        var_5 = 0;
        var_6 = 0.05;
        var_7 = 0;
        var_8 = 0;

        for ( var_9 = level._id_0C59[var_1._id_1032]["rotor_spin"][0]; var_5 < var_0; var_3 = var_5 / var_0 * var_4 )
        {
            if ( !var_8 && var_5 >= var_7 )
            {
                var_8 = 1;
                self notify( "stop_kicking_up_dust" );
                thread maps\_vehicle::_id_2A9B();
            }

            var_1 setanimknob( var_9, 1.0, 0.2, var_3 );
            wait(var_6);
            var_5 += var_6;
        }

        var_1 stopanimscripted();
        var_1 setanimknob( var_9, 1, 0, 0 );
    }
    else
    {

    }

    self._id_4567 hide();
    self showpart( self._id_4568 );
}

_id_4569()
{
    wait 0.05;
    var_0 = [];
    var_0[0] = level._id_4483;
    level._id_4483 maps\_anim::_id_11DD( var_0, "open_door_idle", undefined, undefined, "ny_harbor_hind" );
}

_id_456A()
{
    level._id_4483 maps\_anim::_id_1246( level._id_4483, "landing_gear_retract" );
    level._id_4483 maps\_anim::_id_1246( level._id_4483, "landing_gear_retract_idle" );
}

_id_456B( var_0 )
{
    if ( !isdefined( level._id_456C ) )
        return;

    if ( var_0 )
    {
        self._id_456D hide();
        self.mgturret[0] show();
    }
    else
    {
        self._id_456D show();
        self.mgturret[0] hide();
    }
}

_id_456E()
{
    if ( isdefined( level._id_456C ) )
    {
        _id_4587( level._id_456F );
        level._id_456F.player unlink();
        level._id_456F.player notify( "unlink" );
    }
    else
    {
        self useby( self._id_4552 );
        self._id_4552 unlink();
    }

    level notify( "player_off_hind_gun" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowsprint( 1 );
    level.player allowjump( 1 );
    thread _id_4595( 0 );
}

_id_4570( var_0 )
{
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player allowjump( 0 );

    if ( isdefined( level._id_456C ) )
    {
        var_1 = level._id_4483.mgturret[0];
        level._id_456F = level._id_4483 _id_4572( var_1, level.player, "tag_player_doorgun", undefined, 75, 75, 35, 45, "viewhands_player_delta_shg" );
        level._id_4483 thread _id_4586( level._id_456F );
        level._id_4483 _id_456B( 1 );
    }
    else
        thread _id_459A( 0 );

    level._id_4571 = 1;
}

_id_4572( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = spawnstruct();
    var_9._id_4573 = var_4;
    var_9._id_4574 = var_5;
    var_9._id_4575 = var_6;
    var_9._id_4576 = var_7;
    var_9._id_4577 = 1;
    var_9._id_4578 = var_3;
    var_9._id_4579 = var_8;
    var_9._id_457A = var_2;
    var_9.vehicle = self;

    if ( isdefined( var_0 ) )
    {
        var_0._id_1032 = "hind_turret";
        var_0.health = 99999;
        var_0._id_457B = 0;

        if ( isdefined( var_9._id_4573 ) )
            _id_458B( var_9._id_4573, var_9._id_4574, var_9._id_4575, var_9._id_4576, 0 );
        else
            var_1 playerlinktodelta( self, var_2, 1 );
    }

    var_9._id_0A50 = var_0;
    var_9.player = var_1;
    var_9._id_457C = level._id_1F90["player_rig"];
    var_9._id_457D = "mortar_technical_hit";

    if ( isdefined( var_0 ) )
        var_9._id_457E = var_0.model;

    var_9._id_457F = "weapon_blackhawk_minigun_viewmodel";
    return var_9;
}

_id_4580( var_0 )
{
    self endon( "death" );
    level endon( var_0 );

    if ( !issubstr( self.classname, "script_vehicle" ) )
        return;

    var_1 = 0;
    level endon( "player_off_hindgun" );

    while ( common_scripts\utility::flag( "player_on_hindgun" ) )
    {
        self waittill( "turret_fire" );
        self fireweapon();
        var_1 -= 1;

        if ( var_1 <= 0 )
        {
            _id_4582();
            var_1 = 4;
        }

        earthquake( 0.1, 0.13, self gettagorigin( "tag_turret" ), 200 );
        wait 0.05;
    }
}

_id_4581()
{
    self endon( "death" );

    for ( var_0 = 0; var_0 < 3; var_0++ )
    {
        var_1 = anglestoforward( level.player getplayerangles() );
        var_2 = self gettagorigin( "TAG_FLASH" ) + var_1 * 200;
        var_3 = level.player getplayerangles();
        playfx( common_scripts\utility::getfx( "minigun_projectile" ), var_2, var_1, ( 0.0, 0.0, 1.0 ) );
        wait 0.05;
    }
}

_id_4582()
{
    var_0 = self gettagorigin( "TAG_FLASH" );
    var_1 = level.player geteye();
    var_2 = anglestoforward( level.player getplayerangles() );
    var_3 = var_1 + 12000 * var_2;
    var_4 = var_1 + 60 * var_2;
    var_5 = bullettrace( var_4, var_3, 0 );
    var_6 = var_5["position"];
    thread _id_4581();
}

_id_4583( var_0 )
{
    self endon( "death" );
    level endon( var_0 );
    var_1 = 0;
    var_2 = 1;
    level endon( "player_off_hindgun" );

    while ( common_scripts\utility::flag( "player_on_hindgun" ) )
    {
        self waittill( "missile_fire" );
        var_1 -= 1;

        if ( var_1 <= 0 )
        {
            _id_4582();
            var_1 = var_2;
        }
    }
}

_id_4584( var_0 )
{
    self endon( "death" );
    level endon( var_0 );
    level endon( "player_off_hindgun" );
    var_1 = common_scripts\utility::getfx( "minigun_shell_eject" );
    var_2 = "tag_brass";
    var_3 = 0.1;

    for (;;)
    {
        while ( level.player attackbuttonpressed() )
        {
            playfxontag( var_1, self, var_2 );
            wait(var_3);
        }

        wait 0.05;
    }
}

_id_4585( var_0 )
{
    level endon( var_0._id_457D );
    var_1 = level.player;
    var_1 allowprone( 0 );
    var_1 allowcrouch( 0 );
    var_1 disableweapons();

    if ( var_0._id_4577 )
        maps\_utility::_id_270A( var_1, "tag_player", 1, 1, var_0._id_4573, var_0._id_4574, var_0._id_4575, var_0._id_4576 );

    self useby( var_1 );
    common_scripts\utility::flag_set( "player_on_hindgun" );
    thread _id_4580( var_0._id_457D );
    self attach( var_0._id_457C, var_0._id_4578 );
    var_2 = 0;
    var_3 = 0;
}

_id_4586( var_0 )
{
    level endon( var_0._id_457D );
    var_0._id_0A50 maps\_utility::_id_2629();
    var_0._id_0A50._id_457B = 1;
    var_0._id_0A50 makeusable();
    var_0._id_0A50 setmode( "manual" );
    var_0._id_0A50 useby( var_0.player );
    var_0._id_0A50 setmodel( var_0._id_457F );
    var_0.player disableturretdismount();
    var_0._id_0A50 makeunusable();
    level.player playerlinkedturretanglesenable();
    common_scripts\utility::flag_set( "player_on_hindgun" );
    var_0._id_0A50 thread _id_4583( var_0._id_457D );
    var_1 = 0;
    var_2 = 0;
    thread _id_063C::_id_4540( var_0._id_0A50, var_0._id_4579 );
}

_id_4587( var_0 )
{
    level notify( var_0._id_457D );
    var_0._id_0A50._id_457B = 0;
    var_0._id_0A50 makeusable();
    var_0._id_0A50 setmode( "manual" );
    var_0.player enableturretdismount();
    var_0._id_0A50 useby( var_0.player );
    var_0._id_0A50 setmodel( var_0._id_457E );
    var_0._id_0A50 makeunusable();
    var_0._id_0A50 detach( var_0._id_457C, "tag_player" );
}

_id_4588( var_0, var_1, var_2, var_3 )
{
    self notify( "turret_anim_change" );
    self endon( "turret_anim_change" );
    var_4 = maps\_utility::_id_1281( var_0 );
    var_5 = maps\_utility::_id_1281( var_1 );
    var_6 = maps\_utility::_id_1281( var_2 );
    var_7 = maps\_utility::_id_1281( var_3 );
    self clearanim( self._id_4589, 0 );
    self clearanim( self._id_458A, 0 );
    self._id_4589 = var_4;
    self._id_458A = var_6;
    self setanim( var_6, 1, 0.1, 1 );
    self setflaggedanim( var_0, var_4, 1, 0.1, 1 );
    self waittillmatch( var_0, "end" );
    self clearanim( var_4, 0 );
    self clearanim( var_6, 0 );
    self._id_4589 = var_5;
    self._id_458A = var_7;
    self setanim( var_5, 1, 0.1, 1 );
    self setanim( var_7, 1, 0.1, 1 );
}

_id_458B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level.player;

    if ( !isdefined( var_5 ) || !isalive( var_5 ) )
        return;

    if ( !isdefined( var_5._id_458C ) || var_4 <= 0 )
    {
        var_5._id_458C = var_0;
        var_5._id_458D = var_1;
        var_5._id_458E = var_2;
        var_5._id_458F = var_3;
        var_5 playerlinktodelta( level._id_4483, "tag_player", 0.65, var_5._id_458C, var_5._id_458D, var_5._id_458E, var_5._id_458F );
    }
    else
        var_5 lerpviewangleclamp( var_4, 0, 0, var_0, var_1, var_2, var_3 );
}

_id_4590()
{
    wait 0.05;
    self notify( "stop_kicking_up_dust" );
}

_id_4591( var_0 )
{
    self._id_1032 = "ny_harbor_hind";

    if ( isdefined( level._id_456C ) )
    {
        var_1 = "tag_turret_npc";
        self._id_456D = spawn( "script_model", self gettagorigin( var_1 ) );
        self._id_456D setmodel( "weapon_blackhawk_minigun" );
        self._id_456D.angles = self gettagangles( var_1 );
        self._id_456D.origin = self gettagorigin( var_1 );
        self._id_456D linkto( self, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

        while ( !isdefined( self.mgturret ) )
            wait 0.05;

        self._id_456D._id_1032 = "ny_harbor_hind";
        self._id_456D maps\_anim::_id_1244();

        if ( !isdefined( level._id_4592 ) || level._id_4592 == 0 )
            _id_456B( 0 );
    }
}

_id_4593()
{
    if ( !isdefined( level._id_456C ) )
        return;

    self._id_456D unlink();
    self._id_456D.origin = self gettagorigin( "tag_doorgun" );
    self._id_456D linkto( self, "tag_doorgun" );
}

_id_4594()
{
    if ( !isdefined( level._id_456C ) )
        return;

    if ( isdefined( self._id_456D ) )
        self._id_456D hide();

    self.mgturret[0] hide();
}

_id_4595( var_0 )
{
    wait 0.05;

    if ( var_0 )
    {
        setsaveddvar( "ui_hidemap", 1 );
        setsaveddvar( "hud_showStance", "0" );
        setsaveddvar( "compass", "0" );
        setdvar( "old_compass", "0" );
        setsaveddvar( "ammoCounterHide", "1" );
    }
    else
    {
        setsaveddvar( "ui_hidemap", 0 );
        setsaveddvar( "hud_drawhud", "1" );
        setsaveddvar( "hud_showStance", "1" );
        setsaveddvar( "compass", "1" );
        setdvar( "old_compass", "1" );
        setsaveddvar( "ammoCounterHide", "0" );
    }
}

_id_4596()
{
    for ( var_0 = 0; var_0 < 40; var_0++ )
    {
        level._id_4483 maps\_vehicle::_id_2B18( "running" );
        wait 0.05;
    }
}

_id_4597( var_0 )
{
    if ( var_0 > 0 )
        wait(var_0);

    level._id_4483 hidepart( "tag_wing_r" );
    level thread _id_4596();
}

_id_4598()
{
    level._id_4599 waittillmatch( "single anim", "gunswap" );
    level._id_4483 _id_4593();
}

_id_459A( var_0 )
{
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    level._id_4483 setvehgoalpos( level._id_4483.origin, 1 );
    level._id_4483 _id_459B( var_0 );
    level._id_4571 = 1;
}

_id_459B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level.player;

    self._id_4552 = var_1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    thread _id_4595( var_2 );
    var_1 allowprone( 0 );
    var_1 allowcrouch( 0 );

    if ( !isdefined( var_0 ) )
    {
        var_1 disableweapons();
        maps\_utility::_id_270A( var_1, "tag_player", 1, 1, 30, 30, 30, 30 );
    }

    self useby( var_1 );
    var_3 = self gettagangles( "tag_player" );
    var_1 setplayerangles( var_3 + ( 0.0, 0.0, 0.0 ) );
    thread _id_063D::_id_454E();
}
