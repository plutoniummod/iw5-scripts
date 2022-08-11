// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6113()
{
    common_scripts\utility::flag_init( "player_dismounting_turret" );
    common_scripts\utility::flag_init( "player_on_dshk_turret" );
    _id_6114();
}
#using_animtree("vehicles");

_id_6114()
{
    level._id_1245["dshk_turret"] = #animtree;
    level._id_1245["turret_player_rig"] = #animtree;
    level._id_1F90["turret_player_rig"] = level._id_6115;
    level._id_0C59["turret_player_rig"]["turret_hands_geton"] = %dshk_player_dshk_geton;
    level._id_0C59["dshk_turret"]["turret_hands_getoff"] = %dshk_player_dshk_getoff;
    level._id_0C59["dshk_turret"]["turret_hands_idle"] = %dshk_player_dshk_idle;
    level._id_0C59["dshk_turret"]["turret_hands_fire"] = %dshk_player_dshk_fire;
    level._id_0C59["dshk_turret"]["turret_hands_idle2fire"] = %dshk_player_dshk_idle_to_fire;
    level._id_0C59["dshk_turret"]["turret_hands_fire2idle"] = %dshk_player_dshk_fire_to_idle;
    level._id_0C59["dshk_turret"]["turret_gun_geton"] = %dshk_geton;
    level._id_0C59["dshk_turret"]["turret_gun_getoff"] = %dshk_getoff;
    level._id_0C59["dshk_turret"]["turret_gun_idle"] = %dshk_idle;
    level._id_0C59["dshk_turret"]["turret_gun_fire"] = %dshk_fire;
    level._id_0C59["dshk_turret"]["turret_gun_idle2fire"] = %dshk_idle_to_fire;
    level._id_0C59["dshk_turret"]["turret_gun_fire2idle"] = %dshk_fire_to_idle;
}

_id_6116()
{
    var_0 = self;
    var_0 endon( "death" );
    var_0 makeunusable();
    var_0 setdefaultdroppitch( 0 );

    for (;;)
    {
        wait 1.5;
        var_1 = _id_570B( var_0.origin, var_0.angles, ( -32.0, 0.0, -48.0 ) );
        self._id_6117 = spawn( "trigger_radius", var_1, 0, 30, 128 );
        level.player _id_6118( self._id_6117 );
        thread _id_611E( self, level.player );
        self._id_6117 delete();
        level.player _id_611A();
        _id_611C();
    }
}

_id_6118( var_0 )
{
    var_0 endon( "death" );
    self._id_6119 = maps\_hud_util::createfontstring( "default", 1.5 );
    self._id_6119.alpha = 0.9;
    self._id_6119.x = 0;
    self._id_6119.y = 50;
    self._id_6119.alignx = "center";
    self._id_6119.aligny = "middle";
    self._id_6119.horzalign = "center";
    self._id_6119.vertalign = "middle";
    self._id_6119.foreground = 0;
    self._id_6119.hidewhendead = 1;
    self._id_6119.hidewheninmenu = 1;

    for (;;)
    {
        if ( self istouching( var_0 ) )
        {
            self._id_6119 settext( &"PLATFORM_HOLD_TO_USE" );

            if ( self usebuttonpressed() )
            {
                self._id_6119 destroy();
                return;
            }
        }
        else
            self._id_6119 settext( "" );

        wait 0.05;
    }
}

_id_611A()
{
    self._id_611B = maps\_hud_util::createfontstring( "default", 1.5 );
    self._id_611B.alpha = 0.9;
    self._id_611B.x = 0;
    self._id_611B.y = 50;
    self._id_611B.alignx = "center";
    self._id_611B.aligny = "middle";
    self._id_611B.horzalign = "center";
    self._id_611B.vertalign = "middle";
    self._id_611B.foreground = 0;
    self._id_611B.hidewhendead = 1;
    self._id_611B.hidewheninmenu = 1;
    self._id_611B settext( &"PLATFORM_HOLD_TO_DROP" );
    notifyoncommand( "turret_dismount", "+usereload" );
    notifyoncommand( "turret_dismount", "+activate" );
    self waittill( "turret_dismount" );
    self._id_611B destroy();
}

_id_611C()
{
    if ( !common_scripts\utility::flag( "player_dismounting_turret" ) )
    {
        common_scripts\utility::flag_set( "player_dismounting_turret" );
        level.player freezecontrols( 1 );
        self._id_1032 = "dshk_turret";
        self notify( "player_dismount" );
        maps\_anim::_id_1244();
        var_0 = self gettagangles( "tag_ground" );
        var_1 = getanimlength( %dshk_player_dshk_getoff );
        var_2 = maps\_utility::_id_1281( "turret_hands_getoff" );
        var_3 = maps\_utility::_id_1281( "turret_gun_getoff" );
        self clearanim( %root, 0 );
        self setanim( var_2, 1, 0, 1 );
        self setanim( var_3, 1, 0, 1 );
        wait(var_1);
        self detachall();
        self makeusable();
        self setturretdismountorg( self gettagorigin( "tag_ground" ) );
        level.player enableturretdismount();
        self useby( level.player );
        self makeunusable();
        var_4 = 0.15;
        level.player lerpfov( 65, var_4 );
        var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_5.origin = self gettagorigin( "tag_ground" );
        var_5.angles = var_0;
        level.player playerlinkto( var_5, "", 1, 0, 0, 0, 0, 0 );
        var_5 moveto( self._id_611D, var_4, var_4 * 0.25 );
        wait(var_4 + 0.1);
        var_5 delete();

        if ( isdefined( level.player._id_611B ) )
            level.player._id_611B destroy();

        if ( isdefined( level.player._id_6119 ) )
            level.player._id_6119 destroy();

        if ( isdefined( self._id_51F2 ) )
            self._id_51F2 delete();

        level.player enableweapons();
        level.player freezecontrols( 0 );
        common_scripts\utility::flag_clear( "player_on_dshk_turret" );
        common_scripts\utility::flag_clear( "player_dismounting_turret" );
    }
}

_id_611E( var_0, var_1 )
{
    common_scripts\utility::flag_set( "player_on_dshk_turret" );
    var_0 endon( "player_dismount" );
    var_0._id_1032 = "dshk_turret";
    var_0 maps\_anim::_id_1244();
    var_1 freezecontrols( 1 );
    var_1 disableweapons();
    level.player setstance( "stand" );
    self._id_611D = var_1.origin;
    var_0._id_51F2 = maps\_utility::_id_1287( "turret_player_rig" );
    var_0._id_51F2._id_1032 = "turret_player_rig";
    var_0._id_51F2 linkto( var_0, "tag_ground", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0._id_51F2 hide();
    var_0._id_51F2 common_scripts\utility::delaycall( 0.25, ::show );
    var_0 maps\_anim::_id_11CF( var_0._id_51F2, "turret_hands_geton", "tag_player" );
    maps\_anim::_id_11CF( var_0, "turret_gun_geton" );
    var_1 playerlinktoblend( var_0._id_51F2, "tag_origin", 0.3, 0.1, 0.1 );
    wait 0.2;
    var_2 = getanimlength( %dshk_player_dshk_geton );
    var_3 = var_0._id_51F2 maps\_utility::_id_1281( "turret_hands_geton" );
    var_4 = maps\_utility::_id_1281( "turret_gun_geton" );
    var_0 clearanim( %root, 0 );
    var_0 setanim( var_4, 1, 0, 1 );
    thread _id_248E( "geton_anim_finished", "time is up", var_2 );
    wait 0.1;
    var_0._id_51F2 setanim( var_3, 1, 0, 1 );
    var_5 = var_0 getanimtime( var_4 );
    var_0._id_51F2 setanimtime( var_3, var_5 );
    var_1 lerpfov( 55, 0.2 );
    self waittill( "geton_anim_finished" );
    var_1 playerlinktodelta( self, "tag_player", 0.35, 90, 90, 45, 30, 1 );
    var_0._id_51F2 delete();
    var_0._id_4579 = level._id_1F90["turret_player_rig"];
    var_0 attach( var_0._id_4579, "tag_ground" );
    thread _id_611F();
    var_0._id_457B = 1;
    var_0 makeusable();
    var_0 setmode( "manual" );
    var_1 unlink();
    var_0 useby( var_1 );
    var_0 makeunusable();
    var_1 disableturretdismount();
    var_6 = maps\_utility::_id_1281( "turret_hands_idle" );
    var_0 clearanim( var_3, 0.1 );
    var_0 setanim( var_6, 1, 0.1, 1 );
    var_0._id_4589 = var_6;
    var_7 = var_0 maps\_utility::_id_1281( "turret_gun_idle" );
    var_0 clearanim( var_4, 0.1 );
    var_0 setanim( var_7, 1, 0.1, 1 );
    var_0._id_458A = var_7;
    var_8 = 0;
    var_9 = 0;

    while ( common_scripts\utility::flag( "player_on_dshk_turret" ) )
    {
        var_8 = level.player attackbuttonpressed();

        if ( var_9 != var_8 )
        {
            if ( var_8 )
                var_0 thread _id_4588( "turret_hands_idle2fire", "turret_hands_fire", "turret_gun_idle2fire", "turret_gun_fire" );
            else
                var_0 thread _id_4588( "turret_hands_fire2idle", "turret_hands_idle", "turret_gun_fire2idle", "turret_gun_idle" );

            var_9 = var_8;
        }

        wait 0.05;
    }
}

_id_4588( var_0, var_1, var_2, var_3 )
{
    self notify( "turret_anim_change" );
    self endon( "turret_anim_change" );
    self endon( "player_dismount" );
    var_4 = maps\_utility::_id_1281( var_0 );
    var_5 = maps\_utility::_id_1281( var_1 );
    var_6 = maps\_utility::_id_1281( var_2 );
    var_7 = maps\_utility::_id_1281( var_3 );
    self clearanim( self._id_4589, 0 );
    self._id_4589 = var_4;
    self clearanim( self._id_458A, 0 );
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

_id_611F()
{
    level.player endon( "death" );
    level.player waittill( "death" );
    level.player unlink();
    level.player lerpfov( 65, 0.1 );
}

_id_6120( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_1 ) )
        level endon( var_1 );

    var_2 = common_scripts\utility::getfx( var_0 );
    var_3 = "tag_brass";
    var_4 = 0.1;
    common_scripts\utility::flag_wait( "player_on_dshk_turret" );

    while ( common_scripts\utility::flag( "player_on_dshk_turret" ) )
    {
        while ( level.player attackbuttonpressed() )
        {
            playfxontag( var_2, self, var_3 );
            wait(var_4);
        }

        wait 0.05;
    }
}

_id_248E( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( var_1 );
    wait(var_2);
    self notify( var_0 );
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
