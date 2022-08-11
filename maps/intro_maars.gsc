// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6F5F()
{
    level._id_4BF9 = 1.25;
    precacheshader( "ugv_vertical_meter_left" );
    precacheshader( "ugv_vertical_meter_right" );
    precacheshader( "ugv_crosshair" );
    precacheshader( "ugv_ammo_counter" );
    precacheshader( "ugv_screen_overlay" );
    precacheshader( "ugv_vignette_overlay_top_left" );
    precacheshader( "ugv_vignette_overlay_top_right" );
    precacheshader( "ugv_vignette_overlay_bottom_right" );
    precacheshader( "ugv_vignette_overlay_bottom_left" );
    precacheshader( "hud_weaponbar_line" );
    precacheshader( "uav_vehicle_target" );
    precacheshader( "veh_hud_friendly" );
    precacheshader( "overlay_static" );
    precacheshader( "hud_fofbox_hostile" );
    precacheshader( "veh_hud_target" );
    precacheshader( "ugv_missile_warning" );
    level._id_6F60 = "m203_india";
    precacheitem( level._id_6F60 );
    level._id_6F61 = 24;
    level._id_6F62 = 0;
    setsaveddvar( "thermalBlurFactorNoScope", 50 );
    common_scripts\utility::flag_init( "maars_interface_enabled" );
    common_scripts\utility::flag_init( "maars_thermal_on" );
    common_scripts\utility::flag_init( "maars_fail_on_death" );
    common_scripts\utility::flag_init( "maars_death" );
    common_scripts\utility::flag_init( "maars_end_loading" );
    common_scripts\utility::flag_init( "maars_loaded" );
    common_scripts\utility::flag_init( "maars_interface_boot_complete" );
}

_id_6F63()
{
    self show();
    self.mgturret[0] show();
}

_id_6F64()
{
    self hide();
    self.mgturret[0] hide();
}

_id_6F65( var_0, var_1 )
{
    level.player endon( "death" );

    if ( !isalive( level.player ) )
        return;

    self._id_6F66 = level.player.origin;
    self._id_6F67 = level.player getplayerangles();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player disableweapons();
    level.player freezecontrols( 1 );
    self.mgturret[0] turretfiredisable();
    _id_6F69( var_1 );
    level._id_1B22 = 1;
    var_2 = ( var_0.origin[0], var_0.origin[1], var_0.origin[2] + 2 );
    self vehicle_teleport( var_2, var_0.angles );
    var_0 hide();
    _id_6F63();
    _id_6F7B();
    _id_6F6D();
    self.mgturret[0] maketurretsolid();
    self.mgturret[0] setcandamage( 1 );
    self.mgturret[0]._id_1032 = "ugv_turret";
    self.mgturret[0] maps\_anim::_id_1244();
    self.mgturret[0] thread _id_6F76();
    self.mgturret[0] thread _id_6F68();
    self.mgturret[0] dontcastshadows();
    maps\_audio::aud_send_msg( "maars_player_control_start", self );
    level.player setplayerangles( self.angles );
    level.player enabledeathshield( 1 );
    level.player thread _id_6F71();
    level.player thread _id_6F77();
    thread _id_6F80();
    thread _id_6F9A();
    level.player._id_1718 = 1;
    common_scripts\utility::flag_set( "maars_end_loading" );
    common_scripts\utility::flag_wait( "maars_loaded" );
    thread maps\intro_fx::_id_6EFA( self.mgturret[0] );
    level.player thread _id_6FC4( ::_id_6F8C, 0, 15 );
    level.player thread _id_6FC4( ::_id_6F8D, 30, 15 );
    level._id_1FE7 = ::_id_6FC7;
    wait 0.5;
    level.player playerlinkto( self.mgturret[0], "tag_gunner", 0, 180, 180, 180, 45, 0 );
    level.player playerlinkedturretanglesenable();
    level.player freezecontrols( 0 );
    level.player enableweapons();
    self.mgturret[0] turretfireenable();
    thread _id_6F84();
    thread _id_6F70();
    maps\_audio::aud_send_msg( "mus_ugv_start", self );
    maps\_audio::aud_send_msg( "maars_ugv_start", self );
    level notify( "maars_mounted" );
}

_id_6F68()
{
    level endon( "dismount_maars" );

    for (;;)
    {
        var_0 = randomfloatrange( 0.2, 1 );
        self setplayerspread( var_0 );
        wait 0.05;
    }
}

_id_6F69( var_0 )
{
    var_1 = 1.5;
    var_2 = 0.6;
    var_3 = 0.25;
    var_4 = var_3 + 0.1;
    var_5 = var_1 + var_2 + var_3 + var_4;
    common_scripts\utility::flag_set( "fx_maars_hud_up" );
    thread maps\intro_utility::_id_6ECD( var_0.origin, var_0.angles, 2, var_5, 1, 0, 0, 0, 0 );
    wait(var_1);
    level._id_6F6A = common_scripts\utility::spawn_tag_origin();
    var_6 = level._id_6F6B.mgturret[0];
    level._id_6F6A linkto( var_6, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 180.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "light_hdr_maars_intro_hud" ), level._id_6F6A, "tag_origin" );
    wait(var_2);
    maps\intro_utility::_id_5F32( var_3 );
    wait(var_4);
    level.player thread _id_6F85();
}

_id_6F6C( var_0 )
{
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    maps\_utility::_id_13E2( var_1.origin, var_1.angles, 1, 1, 0, 0, 0, 0 );
    wait 1;
}

_id_6F6D()
{
    level.player drivevehicleandcontrolturret( self );
    self.mgturret[0] useby( level.player );
    self.mgturret[0] makeunusable();
    level.player disableturretdismount();
    level.player playerlinkto( self.mgturret[0], "tag_gunner", 0, 0, 0, 0, 0, 0 );
    level.player freezecontrols( 1 );
}

_id_6F6E( var_0, var_1 )
{
    level.player notify( "end_monitor_player_damage" );
    level.player freezecontrols( 1 );
    thread maps\intro_utility::_id_5F32( 0.2 );
    wait 0.2;
    level._id_1B22 = 0;
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 show();
    _id_6F64();
    level.player freezecontrols( 0 );
    level.player disableweapons();
    _id_6F6F();
    thread _id_6F7F();
    thread _id_6F6C( var_1 );
    level.player painvisionoff();
    level.player maps\_utility::_id_13DE( "player_has_red_flashing_overlay" );
    level.player.health = level.player.maxhealth;
    level notify( "dismount_maars" );
    level.player thread _id_6FAC();
    level.player enabledeathshield( 0 );
    thread _id_6F83();
    level.player._id_1718 = undefined;
    level._id_1FE7 = undefined;
    level.player freezecontrols( 1 );
    thread maps\intro_utility::_id_6EC1( 1 );
    wait 0.5;
    level.player freezecontrols( 0 );
    level.player enableweapons();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
}

_id_6F6F()
{
    if ( level.player islinked() )
        level.player unlink();

    if ( level.player isusingturret() )
    {
        self.mgturret[0] useby( level.player );
        level.player drivevehicleandcontrolturretoff( self );
    }
}

_id_6F70()
{
    level endon( "dismount_maars" );

    for (;;)
    {
        self waittill( "touch", var_0 );

        if ( self.veh_speed > 1 )
        {
            if ( isdefined( var_0 ) && isalive( var_0 ) && ( isai( var_0 ) || isdefined( var_0._id_212C ) && var_0._id_212C ) )
            {
                if ( isdefined( var_0.team ) && var_0.team != "allies" )
                    var_0 dodamage( 99999, self.origin, level.player, self );
            }
        }
    }
}

_id_6F71()
{
    level.player endon( "end_monitor_player_damage" );
    level.player._id_6F72 = 0;
    var_0 = 1;

    switch ( level.gameskill )
    {
        case 2:
            var_0 = 1.5;
            break;
        case 3:
            var_0 = 1.5;
            break;
        default:
            var_0 = 1;
            break;
    }

    level._id_6F73 = 600 * var_0;
    level._id_6F74 = 600 * var_0;

    for (;;)
    {
        level.player waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
        level._id_6F75 = 1;

        if ( !level.player._id_6F72 )
            level._id_6F73 -= var_1;
    }
}

_id_6F76()
{
    level endon( "dismount_maars" );
    self.maxhealth = 20000;

    for (;;)
    {
        self.health = self.maxhealth;
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        var_10 = var_3;

        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_1.team ) && var_1.team == level.player.team )
                continue;

            var_11 = distance( self.origin, var_1.origin );
            var_10 = var_3 + var_2 * var_11 * -1;
        }

        level.player dodamage( var_0 * 0.25, var_10, var_1 );
    }
}

_id_6F77()
{
    level.player endon( "end_monitor_player_damage" );
    var_0 = 1;
    var_1 = 0;
    var_2 = 3;
    var_3 = 0.2;
    var_4 = 0;
    var_5 = 0;
    var_6 = 1;
    var_7 = 0;
    var_8 = 0;
    var_9 = 0;
    level.player._id_6F78 = gettime();

    for (;;)
    {
        wait 0.05;
        waittillframeend;

        if ( level._id_6F73 == level._id_6F74 )
        {
            var_6 = 1;
            var_5 = 0;
            var_4 = 0;
            continue;
        }

        var_10 = var_4;
        var_11 = level._id_6F73 / level._id_6F74;

        if ( var_11 <= var_3 && var_2 > 1 )
        {
            var_4 = 1;

            if ( !var_10 )
            {
                var_8 = gettime();
                var_5 = 1;
            }
        }

        if ( level._id_6F75 )
        {
            var_8 = gettime();
            level._id_6F75 = 0;
        }

        if ( level._id_6F73 / level._id_6F74 >= var_0 )
        {
            if ( gettime() - var_8 < self._id_20F2.playerhealth_regularregendelay )
                continue;

            if ( var_4 )
            {
                var_9 = var_11;

                if ( gettime() > var_8 + self._id_20F2._id_22F9 )
                    var_9 += self._id_20F2._id_22FB;
            }
            else
                var_9 = 1;

            if ( var_9 > 1.0 )
                var_9 = 1.0;

            if ( var_9 <= 0 )
                return;

            level._id_6F73 = var_9 * level._id_6F74;
            var_0 = level._id_6F73 / level._id_6F74;
            continue;
        }

        var_0 = var_6;

        if ( level._id_6F73 <= 1 )
            level._id_6F73 = 2 / level._id_6F74;

        var_0 = level._id_6F73 / level._id_6F74;
        self notify( "hit_again" );
        var_8 = gettime();

        if ( level.player._id_6F72 )
            continue;
        else
        {
            level.player._id_6F72 = 1;

            if ( level.player._id_6F78 < gettime() )
                level.player._id_6F78 = gettime() + level.player.deathinvulnerabletime + 1000;
        }

        level notify( "ugv_becoming_invulnerable" );
        var_12 = 0;

        if ( var_5 )
        {
            var_7 = 4;
            var_5 = 0;
            var_12 = 1;
        }
        else if ( var_4 )
        {
            var_7 = self._id_20F2._id_22F6;
            var_12 = 1;
        }
        else
            var_7 = self._id_20F2._id_22F4;

        var_6 = self.health / self.maxhealth;
        thread _id_6F79( var_7, var_12 );
    }
}

_id_6F79( var_0, var_1 )
{
    if ( var_0 > 0 )
    {
        level.player._id_6F7A = gettime() + var_0 * 1000;
        wait(var_0);
    }

    if ( var_1 )
    {
        if ( level._id_6F73 < 1 )
        {
            if ( common_scripts\utility::flag( "maars_fail_on_death" ) )
            {
                common_scripts\utility::flag_set( "maars_death" );
                level.player freezecontrols( 1 );
                wait 1;
                thread maps\intro_utility::_id_5F32( 0.2 );
                thread _id_6FAD( 0.2, 0 );
                wait 0.2;
                var_2 = maps\_hud_util::createserverclientfontstring( "default", 2 );
                var_2.x = 0;
                var_2.y = -40;
                var_2.alignx = "center";
                var_2.aligny = "middle";
                var_2.horzalign = "center";
                var_2.vertalign = "middle";
                var_2 settext( &"INTRO_UGV_DEATH_QUOTE" );
                var_2.color = ( 1.0, 1.0, 1.0 );
                var_2.sort = 5;
                setdvar( "ui_deadquote", &"INTRO_UGV_DEATH_QUOTE" );
                maps\_utility::_id_1826();
            }
        }
    }

    maps\_gameskill::_id_22FF();
    level.player._id_6F72 = 0;
}

_id_6F7B()
{
    var_0 = getent( "yuri_drone_spawner", "targetname" );
    level._id_6F7C = var_0 maps\_utility::_id_166F( 1 );
    level._id_6F7C maps\_utility::_id_218C();
    level._id_6F7C._id_1032 = "yuri";
    level._id_6F7C.origin = level.player.origin;
    level._id_6F7C.angles = level.player.angles;
    level._id_6F7C thread _id_6F7D();
    level._id_6F7C thread _id_6F7E();
    var_1 = common_scripts\utility::getstruct( "maars_control_maars_intro_player_drone", "targetname" );
    var_1 thread maps\_anim::_id_124E( level._id_6F7C, "control_ugv" );
}

_id_6F7D()
{
    self endon( "death" );
    var_0 = self.health;
    self.damageshield = 1;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_2 == level.player )
            var_0 -= var_1;

        if ( var_0 < 0 )
        {
            self.damageshield = 0;
            self.health = 1;
            self notify( "damage", var_1, var_2, var_3, var_4, var_5 );
            break;
        }
    }
}

_id_6F7E()
{
    self endon( "end_detect_drone_death" );
    self waittill( "death" );
    setdvar( "ui_deadquote", &"INTRO_UGV_YURI_DEATH_QUOTE" );
    maps\_utility::_id_1826();
}

_id_6F7F()
{
    level._id_6F7C notify( "end_detect_drone_death" );
    level._id_6F7C delete();
}

_id_6F80()
{
    level._id_6F81 = level.player._id_20F2.playerhealth_regularregendelay;
    level.player._id_20F2.playerhealth_regularregendelay = 4000;
    level._id_6F82 = level.player._id_20F2._id_22F9;
    level.player._id_20F2._id_22F9 = 5000;
}

_id_6F83()
{
    level.player._id_20F2.playerhealth_regularregendelay = level._id_6F81;
    level.player._id_20F2._id_22F9 = level._id_6F82;
}

_id_6F84()
{
    self endon( "death" );
    level endon( "dismount_maars" );
    var_0 = 0.5;
    var_1 = 300;

    for (;;)
    {
        var_2 = self vehicle_getvelocity();

        if ( length( var_2 ) > 0.1 )
        {
            var_2 = vectornormalize( var_2 );
            badplace_arc( self.unique_id + "arc", var_0, self.origin, 256, var_1, var_2, 17, 17, "axis", "team3" );
        }

        badplace_cylinder( self.unique_id + "cyl", var_0, self.origin, 128, var_1, "axis", "team3" );
        wait(var_0 + 0.05);
    }
}

_id_6F85()
{
    _id_6FA3();
    self._id_6EFB = [];
    self._id_6EFB["static_goggles"] = _id_6FA5();
    maps\intro_utility::_id_6EC1( 0.25 );
    _id_6F87();
    var_0 = maps\_hud_util::createserverclientfontstring( "default", 2 );
    var_0 maps\_hud_util::setpoint( "CENTER", undefined, 0, 45 );
    var_0 settext( "SISTEMA ZAGRUZKI" );
    var_0 thread _id_6F96();
    var_1 = "";
    thread _id_6F86( var_1 );
    var_2 = maps\_hud_util::createclientprogressbar( self, 80, "white", "black", 300, 10 );
    var_2 _id_6F97();
    var_0 maps\_hud_util::destroyelem();
    var_2 maps\_hud_util::destroyelem();
    thread _id_6F8B();
    self._id_6EFB["damage_overlay"] = _id_4E43( "overlay_static", 10, 0 );
    self._id_6EFB["incoming_missile"] = _id_6FA9();
    wait 0.5;
    self._id_6EFB["vert_meter_right"] = _id_6FA6();
    self._id_6EFB["vert_meter_left"] = _id_6FA7();
    wait 0.5;
    self._id_6EFB["cross_hair"] = _id_4803();
    wait 0.5;
    self._id_6EFB["m203_ammo"] = _id_6FA8();
    common_scripts\utility::flag_wait( "maars_end_loading" );
    thread _id_6FA4();
    common_scripts\utility::flag_set( "maars_loaded" );
}

_id_6F86( var_0 )
{
    wait 0.5;
    common_scripts\utility::flag_set( "maars_control_boot_up_fading" );
    stopfxontag( common_scripts\utility::getfx( "light_hdr_maars_intro_hud" ), level._id_6F6A, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "light_hdr_maars_intro_hud_endlines" ), level._id_6F6A, "tag_origin" );
    wait 1.5;
    level._id_6F6A delete();
    wait 3;
    common_scripts\utility::flag_clear( "fx_maars_hud_up" );
}

_id_6F87()
{
    level._id_1D94 = 0.05;
    level._id_6F88 = 0;
    level._id_6F89 = 12;
    level._id_6F8A = 340;
    var_0 = 1.2;
    var_1 = ( 1.0, 1.0, 1.0 );
    var_2 = 80;
    var_3 = maps\_hud_util::createserverclientfontstring( "small", var_0 );
    var_3 maps\_hud_util::setpoint( "CENTER", undefined, -60, 120 );
    var_3 settext( "Nazhmite F2, Chtoby vojti SETUP. F12 Dlja setevoj zagruzki. ESC dlja Menju zagruzki            0 0B" );
    var_4 = [];
    var_4[var_4.size] = "InfinityHammer BIOS 4.0 Reliz 6.0";
    var_4[var_4.size] = "Avtorskoe pravo 1985-2006 InifityHammer Ltd.";
    var_4[var_4.size] = "Vse Prava Zawiweny";
    var_4[var_4.size] = "Avtorskoe Pravo 2000-2008 GRware, Inc.";
    var_4[var_4.size] = "GRware BIOS Stroit' 256";
    var_4[var_4.size] = " ";
    var_4[var_4.size] = "ATAPI CD-ROM: GRware Virtual'nyj IDE CDROM Drive";
    var_4[var_4.size] = "Mysh' inicializiruetsja";
    var_4[var_4.size] = "... ";
    var_4[var_4.size] = ".. ";
    var_4[var_4.size] = ". ";
    _id_6F8E( var_4, var_0, var_1, 80 );
    wait 0.1;
    _id_6F91();
    var_3 destroy();
    level._id_6F88 = 0.05;
    var_5 = [];
    var_5[var_5.size] = "GRware BIOS(C)2001 Russian Megawatts, Inc.";
    var_5[var_5.size] = "BIOS Data: 08/19/2006 06:01:09 Versija: 8.00.02";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "Nazhmite DEL dlja zapuska Programmy Ustanovki";
    var_5[var_5.size] = "Kontrol' NVRAM...";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "511MB OK";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Master ... IDE Hard Disk";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Slave ... Ne obnaruzheno";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Sec Master ... CD-ROM";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Slave ... Ne obnaruzheno";
    var_5[var_5.size] = "Pri Master: 1. 1 SHGCorpHD";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "GRware BIOS(C)2001 Russian Megawatts, Inc.";
    var_5[var_5.size] = "BIOS Data: 08/19/2006 06:01:09 Versija: 8.00.02";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "Nazhmite DEL dlja zapuska Programmy Ustanovki";
    var_5[var_5.size] = "Kontrol' NVRAM...";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "511MB OK";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Master ... IDE Hard Disk";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Slave ... Ne obnaruzheno";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "GRware BIOS(C)2001 Russian Megawatts, Inc.";
    var_5[var_5.size] = "BIOS Data: 08/19/2006 06:01:09 Versija: 8.00.02";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "Nazhmite DEL dlja zapuska Programmy Ustanovki";
    var_5[var_5.size] = "Kontrol' NVRAM...";
    var_5[var_5.size] = " ";
    var_5[var_5.size] = "511MB OK";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Master ... IDE Hard Disk";
    var_5[var_5.size] = "Avtomaticheskoe obnaruzhenie Pri Slave ... Ne obnaruzheno";
    _id_6F8E( var_5, var_0, var_1, var_2 );
    wait 0.1;
    _id_6F91();
}

_id_6F8B()
{
    level._id_1D94 = 0.07;
    level._id_6F88 = 0.05;
    level._id_6F89 = 16;
    level._id_6F8A = 240;
    var_0 = 1.6;
    var_1 = ( 0.8, 1.0, 0.8 );
    var_2 = 130;
    var_3 = [];
    var_3[var_3.size] = "PROVERKA SISTEMY...";
    var_3[var_3.size] = "ONLINE 2506.62";
    var_3[var_3.size] = "BOEPRIPASY CK_456_MAX_COM";
    var_3[var_3.size] = "OPS_KONTROL_ONLINE";
    var_3[var_3.size] = "REG89300491_PYY3";
    var_3[var_3.size] = "RWD_08200619";
    var_3[var_3.size] = " ";
    var_3[var_3.size] = "----------------";
    var_3[var_3.size] = " ";
    var_3[var_3.size] = "3160 AIMHUD_POD_Y36";
    var_3[var_3.size] = " ";
    var_3[var_3.size] = "BOOT(P) GWR549_NPW";
    var_3[var_3.size] = " ";
    var_3[var_3.size] = "UGV_M3_3804";
    _id_6F8E( var_3, var_0, var_1, var_2 );
    wait 2;
    _id_6F91();
}

_id_6F8C()
{
    var_0 = undefined;

    if ( level.xenon )
        var_0 = "ugv_zoom_360";
    else
        var_0 = "ugv_zoom";

    var_1 = maps\intro_utility::_id_6EBF( var_0 );

    if ( isdefined( var_1 ) )
        return var_1._id_27BB;
    else
        return "";
}

_id_6F8D()
{
    var_0 = undefined;

    if ( level.xenon )
        var_0 = "ugv_grenade";
    else
        var_0 = "ugv_grenade";

    var_1 = maps\intro_utility::_id_6EBF( var_0 );

    if ( isdefined( var_1 ) )
        return var_1._id_27BB;
    else
        return "";
}

_id_6F8E( var_0, var_1, var_2, var_3 )
{
    var_4 = getarraykeys( var_0 );
    level._id_6F8F = [];
    level._id_6F90 = 0;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_6 = var_4[var_5];
        level._id_6F90++;
        level._id_6F8F[level._id_6F8F.size] = _id_6F92( var_0[var_6], var_1, var_2, var_3 );
        var_7 = _id_6F94();

        if ( var_7 > level._id_6F8A )
        {
            _id_6F93();
            level._id_6F90--;
        }

        wait(level._id_1D94);
    }
}

_id_6F91()
{
    while ( level._id_6F8F.size > 0 )
    {
        _id_6F93();
        wait(level._id_6F88);
    }
}

_id_6F92( var_0, var_1, var_2, var_3 )
{
    level notify( "new_introscreen_element" );
    var_4 = _id_6F94();
    var_5 = newhudelem();
    var_5.x = var_3;
    var_5.y = var_4;
    var_5.alignx = "left";
    var_5.aligny = "top";
    var_5.horzalign = "left";
    var_5.vertalign = "top";
    var_5.sort = 5;
    var_5.foreground = 1;
    var_5 settext( var_0 );
    var_5.alpha = 1;
    var_5.hidewheninmenu = 1;
    var_5.fontscale = var_1;
    var_5.color = var_2;
    var_5.font = "small";
    return var_5;
}

_id_6F93()
{
    for ( var_0 = 0; var_0 < level._id_6F8F.size; var_0++ )
    {
        if ( var_0 == 0 )
            level._id_6F8F[var_0] destroy();

        if ( isdefined( level._id_6F8F[var_0 + 1] ) )
        {
            level._id_6F8F[var_0] = level._id_6F8F[var_0 + 1];
            level._id_6F8F[var_0].y -= level._id_6F89;
        }
    }

    level._id_6F8F[level._id_6F8F.size - 1] = undefined;
}

_id_6F94()
{
    return level._id_6F90 * level._id_6F89 + 30;
}

_id_1DA3( var_0 )
{
    wait(level._id_1D94);
    var_0 notify( "destroying" );
    level._id_6F90 = undefined;
    var_1 = 0.5;
    var_0 fadeovertime( var_1 );
    var_0.alpha = 0;
    wait(var_1);
    var_0 notify( "destroy" );
    var_0 destroy();
}

_id_6F95( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 550;
    var_1.y = 60;
    var_1.sort = 5;
    var_1.alignx = "right";
    var_1.aligny = "top";
    var_1 setshader( var_0, 128, 128 );
    return var_1;
}

_id_6F96()
{
    level endon( "maars_loading_bar_complete" );

    while ( isdefined( self ) )
    {
        if ( isdefined( self ) )
        {
            self fadeovertime( 0.3 );
            self.alpha = 1;
            wait 0.5;
        }

        if ( isdefined( self ) )
        {
            self fadeovertime( 0.3 );
            self.alpha = 0.2;
            wait 0.6;
        }
    }
}

_id_6F97()
{
    var_0 = 30;
    var_1 = 0;

    while ( var_1 < var_0 && isdefined( self ) )
    {
        maps\_hud_util::updatebar( var_1 / var_0 );
        var_1++;
        wait 0.05;
    }

    level notify( "maars_loading_bar_complete" );
}

_id_6F98()
{
    self endon( "death" );
    level endon( "maars_view_disabled" );
    var_0 = 0.2;
    var_1 = 51.5029;
    var_2 = 0.000250787;

    for (;;)
    {
        if ( common_scripts\utility::flag( "maars_interface_enabled" ) )
        {

        }

        wait(var_0);
    }
}

_id_6F99( var_0 )
{
    var_1 = self getplayerangles();
    var_2 = var_1[0];
    var_3 = angleclamp180( var_1[1] );
    _id_6FAB( "arrow_left", int( var_2 ) );
    _id_6FAB( "arrow_up", int( var_3 ) );
    var_4 = self._id_6EFB["vert_meter_left"];
    var_5 = self._id_6EFB["arrow_left"];
    var_2 = clamp( var_2, var_4._id_4E38, var_4._id_4E37 );
    var_6 = abs( var_2 / var_4._id_298F );
    var_7 = var_4._id_4E39 * var_6;
    var_8 = var_7 - var_4._id_4E39 * 0.5;
    var_9 = var_4.y + var_8;
    var_5 moveovertime( 0.2 );
    var_5.y = var_9;
    var_5._id_44DF moveovertime( var_0 );
    var_5._id_44DF.y = var_9;
    var_10 = self._id_6EFB["vert_meter_right"];
    var_11 = self._id_6EFB["arrow_up"];
    var_6 = var_3 / var_10._id_298F;
    var_7 = var_10._id_4E39 * var_6;
    var_12 = var_10.x + var_7;
    var_11 moveovertime( 0.2 );
    var_11.x = var_12;
    var_11._id_44DF moveovertime( var_0 );
    var_11._id_44DF.x = var_12;
}

_id_4E3A( var_0 )
{
    if ( var_0 == 0 )
        return 0;

    return var_0 / 12;
}

_id_4E3B( var_0 )
{
    return var_0 * 0.0254;
}

_id_4E3C( var_0 )
{
    return var_0 * 0.000539957;
}

_id_4E3D( var_0, var_1 )
{
    var_0 = int( var_0 * var_1 ) / var_1;
    return var_0;
}

_id_6F9A()
{
    self endon( "start_ugv_death" );
    var_0 = 0;
    var_1 = level._id_6F61;
    var_2 = 2;
    var_3 = 0.45;
    var_4 = gettime();
    var_5 = gettime();
    self._id_6F9B = level._id_6F61;
    var_6 = self.mgturret[0] maps\_utility::_id_1281( "ugv_fire_grenade" );
    self.mgturret[0] setanim( var_6, 1, 0, 0 );
    level waittill( "maars_mounted" );

    for (;;)
    {
        if ( level.player fragbuttonpressed() && var_5 < gettime() && var_0 < var_1 && !level.player attackbuttonpressed() )
        {
            var_7 = level.player geteye();
            var_8 = level.player getplayerangles();
            var_9 = anglestoforward( var_8 );
            var_10 = anglestoright( var_8 );
            var_11 = var_7 + var_9 * 12 * 2000;
            var_12 = self.mgturret[0] gettagorigin( "tag_flash2" );
            self.mgturret[0] setanimrestart( var_6, 1, 0, 1 );
            var_13 = magicbullet( level._id_6F60, var_12 + var_9 * 32, var_11, level.player );
            playfxontag( common_scripts\utility::getfx( "maars_grenade_muzzleflash" ), self.mgturret[0], "tag_flash2" );
            maps\_audio::aud_send_msg( "maars_grenade_fired", var_13 );
            level.player playrumbleonentity( "damage_light" );
            level.player._id_6EFB["m203_ammo"][var_0].alpha = 0;
            level.player._id_6EFB["m203_ammo"]["current"] setvalue( level._id_6F61 - var_0 - 1 );
            thread _id_6F9C( var_0 );
            var_0++;
            var_4 = gettime() + var_2 * 1000;
            var_5 = gettime() + var_3 * 1000;
            continue;
        }

        if ( level.player fragbuttonpressed() && var_0 >= var_1 )
        {
            maps\_utility::_id_27BB( &"WEAPON_NO_AMMO", 1 );
            continue;
        }

        wait 0.05;
    }
}

_id_6F9C( var_0 )
{
    self._id_6F9B = level._id_6F61 - var_0;

    if ( self._id_6F9B <= 7 )
    {
        var_1 = self._id_6F9B + 3;
        self.mgturret[0] hidepart( "ammo" + var_1 );
    }
}

_id_4E20()
{
    var_0 = 128;
    var_1 = 4000;
    var_2 = level.player getplayerangles();
    var_3 = anglestoforward( var_2 );
    var_4 = level.player geteye();
    var_4 += var_3 * var_0;
    var_5 = var_4 + var_3 * var_1;
    var_6 = bullettrace( var_4, var_5, 0, level.player );
    var_7 = [];
    var_7["normal"] = ( 0.0, 0.0, 1.0 );
    var_7["pos"] = var_5;

    if ( var_6["fraction"] < 1 )
        var_7["pos"] = var_6["position"];

    return var_7;
}

_id_6F9D()
{
    self endon( "maars_player_damage_disable" );
    var_0 = self._id_6EFB["damage_overlay"];
    var_1 = 0.0;
    var_2 = 0.25;
    var_3 = 0.05;
    var_4 = 0;

    while ( isalive( self ) && !common_scripts\utility::flag( "maars_death" ) )
    {
        var_5 = 1.0 - level._id_6F73 / level._id_6F74;
        var_6 = var_5 * var_5 * 0.75;
        var_6 = clamp( var_6, 0, 1 );

        if ( var_6 < var_1 )
        {
            var_7 = 0.1;

            if ( var_6 > 0.15 )
                var_7 = 1;

            var_1 -= var_7 * var_3;
            var_1 = clamp( var_1, 0, 1 );
        }
        else if ( var_6 > var_1 )
        {
            var_8 = var_4 * 1.5;
            var_9 = 3.0 - var_8 * 2.0;
            level.player digitaldistortsetparams( var_8, var_9 );
            wait(var_3 * 2);
            var_1 = var_6;
        }

        var_10 = var_1;

        if ( var_10 > var_2 )
            var_10 = var_2;

        if ( var_10 > 0.35 )
            var_4 = 0.45;
        else if ( var_10 > 0.2 )
            var_4 = 0.2;
        else if ( var_10 > 0.1 )
            var_4 = 0.1;
        else
            var_4 = 0;

        level.player digitaldistortsetparams( var_4, 3.0 - var_4 * 2.0 );
        maps\_audio::aud_send_msg( "maars_damage_intensity", var_10 );
        wait(var_3);
    }

    level.player digitaldistortsetparams( 0.76, 1.48 );
    maps\_audio::aud_send_msg( "digital_distort_death" );
}

_id_6F9E()
{
    level.player notify( "noHealthOverlay" );
    level._id_2342 = 1;
    level.player maps\_utility::_id_13DE( "near_death_vision_enabled" );
    level.player maps\_utility::_id_13DC( "player_no_auto_blur" );
    level.player thread _id_6F9D();
    var_0 = ::_id_6FA0;
    var_1 = ::_id_6FA1;
    level.player._id_232B = [];
    level.player._id_232B["MOD_GRENADE"] = var_0;
    level.player._id_232B["MOD_GRENADE_SPLASH"] = var_0;
    level.player._id_232B["MOD_PROJECTILE"] = var_0;
    level.player._id_232B["MOD_PROJECTILE_SPLASH"] = var_0;
    level.player._id_232B["MOD_EXPLOSIVE"] = var_0;
    level.player._id_232B["MOD_PISTOL_BULLET"] = var_1;
    level.player._id_232B["MOD_RIFLE_BULLET"] = var_1;
    level.player._id_232B["MOD_EXPLOSIVE_BULLET"] = var_1;
}

_id_6F9F()
{
    level.player._id_232B = undefined;
    level._id_2342 = undefined;
    level.player maps\_utility::_id_13DC( "near_death_vision_enabled" );
    level.player maps\_utility::_id_13DE( "player_no_auto_blur" );
    level.player thread maps\_gameskill::_id_2334();
    level.player notify( "maars_player_damage_disable" );
}

_id_6FA0( var_0 )
{
    maps\_audio::aud_send_msg( "maars_takes_explosive_dmg" );
}

_id_6FA1( var_0 )
{
    maps\_audio::aud_send_msg( "maars_takes_bullet_dmg" );
}

_id_6FA2()
{
    setsaveddvar( "compassHideSansObjectivePointer", 0 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "actionSlotsHide", "0" );
}

_id_6FA3()
{
    setsaveddvar( "compassHideSansObjectivePointer", 1 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
}

_id_6FA4()
{
    self._id_6EFB["vert_meter_left"]._id_4E39 = 192;
    self._id_6EFB["vert_meter_left"]._id_4E38 = 10;
    self._id_6EFB["vert_meter_left"]._id_4E37 = 90;
    self._id_6EFB["vert_meter_left"]._id_298F = self._id_6EFB["vert_meter_left"]._id_4E37 - self._id_6EFB["vert_meter_left"]._id_4E38;
    self._id_6EFB["vert_meter_right"]._id_4E39 = 192;
    self._id_6EFB["vert_meter_right"]._id_4E38 = 10;
    self._id_6EFB["vert_meter_right"]._id_4E37 = 90;
    self._id_6EFB["vert_meter_right"]._id_298F = self._id_6EFB["vert_meter_right"]._id_4E37 - self._id_6EFB["vert_meter_right"]._id_4E38;
    common_scripts\utility::flag_set( "maars_interface_enabled" );
    thread _id_6FBF();
    thread _id_6F9E();
}

_id_4E43( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3.sort = var_1;
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = var_2;
    var_3 setshader( var_0, 640, 480 );
    return var_3;
}

_id_6FA5()
{
    var_0 = [];
    var_1 = newhudelem();
    var_1.x = -64;
    var_1.y = -36;
    var_1.sort = 5;
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1.horzalign = "left";
    var_1.vertalign = "top";
    var_1 setshader( "ugv_vignette_overlay_top_left", 256, 256 );
    var_0[0] = var_1;
    var_2 = newhudelem();
    var_2.x = 64;
    var_2.y = -36;
    var_2.sort = 5;
    var_2.alignx = "right";
    var_2.aligny = "top";
    var_2.horzalign = "right";
    var_2.vertalign = "top";
    var_2 setshader( "ugv_vignette_overlay_top_right", 256, 256 );
    var_0[1] = var_2;
    var_3 = newhudelem();
    var_3.x = 64;
    var_3.y = 36;
    var_3.sort = 5;
    var_3.alignx = "right";
    var_3.aligny = "bottom";
    var_3.horzalign = "right";
    var_3.vertalign = "bottom";
    var_3 setshader( "ugv_vignette_overlay_bottom_right", 256, 256 );
    var_0[2] = var_3;
    var_4 = newhudelem();
    var_4.x = -64;
    var_4.y = 36;
    var_4.sort = 5;
    var_4.alignx = "left";
    var_4.aligny = "bottom";
    var_4.horzalign = "left";
    var_4.vertalign = "bottom";
    var_4 setshader( "ugv_vignette_overlay_bottom_left", 256, 256 );
    var_0[3] = var_4;
    return var_0;
}

_id_6FA6()
{
    var_0 = newhudelem();
    var_0.x = 550;
    var_0.y = 240;
    var_0.sort = 5;
    var_0.alignx = "left";
    var_0.aligny = "middle";
    var_0 setshader( "ugv_vertical_meter_right", 32, 192 );
    return var_0;
}

_id_6FA7()
{
    var_0 = newhudelem();
    var_0.x = 90;
    var_0.y = 240;
    var_0.sort = 5;
    var_0.alignx = "right";
    var_0.aligny = "middle";
    var_0 setshader( "ugv_vertical_meter_left", 32, 192 );
    return var_0;
}

_id_4803()
{
    var_0 = newhudelem();
    var_0.x = 320;
    var_0.y = 240;
    var_0.sort = 5;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0 setshader( "ugv_crosshair", 128, 128 );
    return var_0;
}

_id_6FA8()
{
    var_0 = [];
    var_1 = 385;
    var_2 = 395;

    for ( var_3 = 0; var_3 < level._id_6F61; var_3++ )
    {
        var_4 = newhudelem();
        var_4.x = var_1;
        var_4.y = var_2;
        var_4.sort = 5;
        var_4.alignx = "center";
        var_4.aligny = "bottom";
        var_4 setshader( "ugv_ammo_counter", 6, 14 );
        var_0[var_3] = var_4;
        var_1 += 6;
        wait 0.05;
    }

    var_5 = ( 1.0, 1.0, 1.0 );
    var_0["text"] = maps\_hud_util::createserverclientfontstring( "hudsmall", 1 );
    var_0["text"] maps\_hud_util::setpoint( "CENTER", undefined, 210, 130 );
    var_0["text"] settext( &"INTRO_UGV_GRENADE" );
    var_0["text"].color = var_5;
    var_0["text"].sort = 5;
    var_0["current"] = maps\_hud_util::createserverclientfontstring( "hudsmall", 1.4 );
    var_0["current"] maps\_hud_util::setpoint( "CENTER", undefined, 240, 147 );
    var_0["current"] setvalue( level._id_6F61 );
    var_0["current"].color = var_5;
    var_0["current"].sort = 5;
    var_6 = newhudelem();
    var_6.x = 380;
    var_6.y = 420;
    var_6.sort = 5;
    var_6.alignx = "center";
    var_6.aligny = "bottom";
    var_6 setshader( "hud_weaponbar_line", 392, 84 );
    var_0["hudline"] = var_6;
    return var_0;
}

_id_6FA9()
{
    var_0 = newhudelem();
    var_0.x = 320;
    var_0.y = 350;
    var_0.sort = 0;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0 setshader( "ugv_missile_warning", 256, 64 );
    var_0.alpha = 0;
    return var_0;
}

_id_6FAA( var_0, var_1 )
{
    self._id_6EFB["lower_right"][var_0]._id_44DF setvalue( var_1 );
}

_id_6FAB( var_0, var_1 )
{
    self._id_6EFB[var_0]._id_44DF setvalue( var_1 );
}

_id_4E48()
{
    var_0 = [];
    var_0["nar"] = [ "NAR", "none" ];
    var_0["white"] = [ "WHT", "none" ];
    var_0["rate"] = [ "RATE", "none" ];
    var_0["angle"] = [ "ANGLE", "none" ];
    var_0["numbers"] = [ "NUM", "none" ];
    var_0["temp"] = [ "TEMP", "none" ];
    return _id_4E4B( var_0, 10, 80, "left" );
}

_id_4E49()
{
    var_0 = [];
    var_0["acft"] = [ "ACFT", "none" ];
    var_0["long"] = [ "N", "none" ];
    var_0["lat"] = [ "W", "none" ];
    var_0["angle"] = [ "HAT", "none" ];
    return _id_4E4B( var_0, 510, 80, "left" );
}

_id_4E4A()
{
    var_0 = [];
    var_0["long"] = [ &"N", "none" ];
    var_0["lat"] = [ &"W", "none" ];
    var_1 = _id_4E4B( var_0, 500, 335, "left" );
    var_0 = [];
    var_0["brg"] = [ "BRG", "" ];
    var_0["rng_m"] = [ "RNG", "" ];
    var_0["rng_nm"] = [ "RNG", "" ];
    var_0["elv"] = [ "ELV", "" ];
    var_2 = _id_4E4B( var_0, 510, 360, "right" );

    foreach ( var_5, var_4 in var_2 )
        var_1[var_5] = var_4;

    return var_1;
}

_id_4E4B( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_5 = 10 * level._id_4BF9;

    foreach ( var_9, var_7 in var_0 )
    {
        var_8 = newhudelem();
        var_8.x = var_1;
        var_8.y = var_2;
        var_8.alignx = var_3;
        var_8.aligny = "middle";
        var_8.sort = 5;
        var_8.color = ( 1.0, 1.0, 1.0 );
        var_8.fontscale = level._id_4BF9;
        var_8 settext( var_7[0] );

        if ( isdefined( var_7[1] ) )
        {
            if ( !_id_4E4C( var_7[1], "none" ) )
                var_8 _id_4E4D( var_7[1] );
        }
        else
            var_8 _id_4E4D();

        var_4[var_9] = var_8;
        var_2 += var_5;
    }

    return var_4;
}

_id_4E4C( var_0, var_1 )
{
    if ( isstring( var_0 ) )
    {
        if ( var_0 == var_1 )
            return 1;
    }

    return 0;
}

_id_4E4D( var_0 )
{
    var_1 = 75;

    if ( isdefined( var_0 ) && !_id_4E4C( var_0, "" ) )
    {
        var_2 = newhudelem();
        var_2.x = self.x + var_1;
        var_2.y = self.y;
        var_2.alignx = "right";
        var_2.aligny = "middle";
        var_2.fontscale = level._id_4BF9;
        var_2 settext( var_0 );
        self._id_44E0 = var_2;
        var_3 = 1;

        if ( var_0 == "UAV_NM" )
            var_3 = 2;

        var_1 -= 10 * var_3;
    }

    var_4 = newhudelem();
    var_4.x = self.x + var_1;
    var_4.y = self.y;
    var_4.alignx = "right";
    var_4.aligny = "middle";
    var_4.fontscale = level._id_4BF9;
    var_4 setvalue( 0 );
    self._id_44DF = var_4;
}

_id_4E4E( var_0 )
{
    if ( var_0 == "up" )
    {
        var_1 = "uav_arrow_up";
        var_2 = self._id_6EFB["vert_meter_right"];
        var_3 = 320;
        var_4 = var_2.y + 10;
        var_5 = "center";
        var_6 = "top";
    }
    else
    {
        var_1 = "uav_arrow_left";
        var_2 = self._id_6EFB["vert_meter_left"];
        var_3 = var_2.x + 10;
        var_4 = 240;
        var_5 = "left";
        var_6 = "middle";
    }

    var_7 = newhudelem();
    var_7.x = var_3;
    var_7.y = var_4;
    var_7.alignx = var_5;
    var_7.aligny = var_6;
    var_7 setshader( var_1, 16, 16 );
    var_7 _id_4E4F( var_0 );
    return var_7;
}

_id_4E4F( var_0 )
{
    if ( var_0 == "up" )
    {
        var_1 = self.x;
        var_2 = self.y + 16;
        var_3 = "center";
        var_4 = "top";
    }
    else
    {
        var_1 = self.x + 16;
        var_2 = self.y;
        var_3 = "left";
        var_4 = "middle";
    }

    var_5 = newhudelem();
    var_5.x = var_1;
    var_5.y = var_2;
    var_5.alignx = var_3;
    var_5.aligny = var_4;
    var_5 setvalue( 0 );
    self._id_44DF = var_5;
}

_id_0363()
{
    var_0 = [];
    var_0[0] = "vert_meter_right";
    var_0[1] = "vert_meter_left";
    var_0[2] = "cross_hair";
    var_0[3] = "m203_ammo";

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( self._id_6EFB[var_2] ) )
        {
            if ( isarray( self._id_6EFB[var_2] ) )
            {
                foreach ( var_4 in self._id_6EFB[var_2] )
                    _id_6FAE( var_4 );

                self._id_6EFB[var_2] = undefined;
                continue;
            }

            _id_6FAE( self._id_6EFB[var_2] );
        }
    }
}

_id_6FAC()
{
    common_scripts\utility::flag_clear( "maars_interface_enabled" );
    level notify( "maars_view_disabled" );
    _id_6FC0();
    _id_6FA2();

    if ( isdefined( self._id_6EFB ) )
    {
        foreach ( var_1 in self._id_6EFB )
        {
            if ( isdefined( var_1 ) )
            {
                if ( isarray( var_1 ) )
                {
                    foreach ( var_3 in var_1 )
                        _id_6FAE( var_3 );

                    var_1 = undefined;
                    continue;
                }

                _id_6FAE( var_1 );
            }
        }
    }

    _id_6FAF();
    _id_6F9F();
    level.player digitaldistortsetparams( 0, 1 );
}

_id_6FAD( var_0, var_1 )
{
    if ( isdefined( self._id_6EFB ) )
    {
        foreach ( var_3 in self._id_6EFB )
        {
            if ( isdefined( var_3 ) )
            {
                if ( isarray( var_3 ) )
                {
                    foreach ( var_5 in var_3 )
                    {
                        var_5 fadeovertime( var_0 );
                        var_5.alpha = var_1;
                    }

                    var_3 = undefined;
                    continue;
                }

                var_3 fadeovertime( var_0 );
                var_3.alpha = var_1;
            }
        }
    }
}

_id_6FAE( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_44DF ) )
        var_0._id_44DF destroy();

    if ( isdefined( var_0._id_44E0 ) )
        var_0._id_44E0 destroy();

    var_0 destroy();
}

_id_6FAF()
{
    self enableoffhandweapons();
    self freezecontrols( 0 );
}

_id_6FB0()
{
    maps\_load::_id_1FB1();
    self thermalvisionon();
    self visionsetthermalforplayer( "berlin_a10", 0.25 );
}

_id_6FB1()
{
    maps\_load::_id_1FB3();
    self thermalvisionoff();
}

_id_6FB2()
{
    thread _id_6FB3();
    level waittill( "maars_view_disabled" );

    if ( common_scripts\utility::flag( "maars_thermal_on" ) )
    {
        common_scripts\utility::flag_clear( "maars_thermal_on" );
        _id_6FB1();
    }
}

_id_6FB3()
{
    level endon( "maars_view_disabled" );
    var_0 = maps\intro_utility::_id_6EBB( "toggle_view" );
    thread _id_6FB4( var_0 );

    for (;;)
    {
        level.player waittill( var_0 );

        if ( common_scripts\utility::flag( "maars_thermal_on" ) )
        {
            common_scripts\utility::flag_clear( "maars_thermal_on" );
            thread _id_6FB1();
        }
        else
        {
            common_scripts\utility::flag_set( "maars_thermal_on" );
            thread _id_6FB0();
        }

        wait 0.1;
    }
}

_id_6FB4( var_0 )
{
    level.player endon( var_0 );
    common_scripts\utility::flag_wait( "maars_control_smoke_hint" );
    wait 0.5;
    thread maps\intro_utility::_id_6EBC( "toggle_view", 10, 1, var_0 );
}

_id_6FB5()
{
    var_0 = 10;
    var_1 = undefined;

    if ( level.xenon )
        var_1 = "ugv_grenade";
    else
        var_1 = "ugv_grenade";

    var_2 = maps\intro_utility::_id_6EBB( var_1 );
    level.player endon( var_2 );
    wait 0.5;
    thread maps\intro_utility::_id_6EBC( var_1, var_0, 1, var_2 );
    wait(var_0);
    level.player notify( var_2 );
}

_id_6FB6( var_0 )
{
    level.player waittill( var_0 );
}

_id_6FB7()
{
    var_0 = 10;
    var_1 = undefined;

    if ( level.xenon )
        var_1 = "ugv_zoom_360";
    else
        var_1 = "ugv_zoom";

    var_2 = maps\intro_utility::_id_6EBB( var_1 );
    level.player endon( var_2 );
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    wait 0.5;
    thread maps\intro_utility::_id_6EBC( var_1, var_0, 1, var_2 );
    wait(var_0);
    level.player notify( var_2 );
}

_id_6FB8( var_0, var_1, var_2 )
{
    self endon( "death" );
    self notify( "stop_maars_target_tracking" );
    self endon( "stop_maars_target_tracking" );
    var_3 = 0.94;
    var_4 = 0.1;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    for (;;)
    {
        var_5 = var_0.origin + ( 0.0, 0.0, 60.0 );

        if ( isdefined( var_2 ) )
        {
            var_6 = anglestoforward( var_0.angles );
            var_5 = var_0.origin + var_6 * var_2;
        }

        var_7 = self.target_ent.origin * var_3 + var_5 * ( 1.0 - var_3 );
        self.target_ent moveto( var_7, var_4 );
        wait(var_4);
    }
}

_id_4E56( var_0 )
{

}

_id_6FB9( var_0 )
{
    if ( !isdefined( level._id_6FBA ) )
        level._id_6FBA = [];

    level._id_6FBA[self.unique_id] = self;

    if ( isdefined( var_0 ) )
    {
        var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_1 setmodel( var_0 );
        var_1 notsolid();
        var_1 hide();
        var_1 linkto( self, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        level._id_6FBA[self.unique_id]._id_6FBB = var_1;
    }

    thread _id_6FBD();
}

_id_6FBC()
{
    level notify( "stop_draw_maars_targets" );

    foreach ( var_1 in level._id_6FBA )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _id_6FBE();
    }

    level._id_6FBA = undefined;
}

_id_6FBD()
{
    var_0 = self.unique_id;
    self waittill( "death" );
    _id_6FBE( var_0 );

    if ( isdefined( self._id_6FBB ) )
        self._id_6FBB delete();
}

_id_6FBE( var_0 )
{
    if ( isdefined( self ) && isdefined( self._id_3C3D ) )
    {
        self._id_3C3D = undefined;

        if ( isdefined( self._id_6FBB ) )
            target_remove( self._id_6FBB );
        else
            target_remove( self );
    }

    if ( isdefined( level._id_6FBA ) )
    {
        if ( !isdefined( var_0 ) )
            var_0 = self.unique_id;

        level._id_6FBA[var_0] = undefined;
    }
}

_id_6FBF()
{
    level endon( "stop_draw_maars_targets" );

    if ( !isdefined( level._id_6FBA ) )
        level._id_6FBA = [];

    var_0 = 4;
    var_1 = 0;
    var_2 = 0.05;

    for (;;)
    {
        foreach ( var_4 in level._id_6FBA )
        {
            if ( !isdefined( var_4 ) )
                continue;

            var_4 _id_3C3C( level.player );
            var_1++;

            if ( var_1 >= var_0 )
            {
                var_1 = 0;
                wait(var_2);
            }
        }

        wait 0.05;
    }
}

_id_3C3C( var_0 )
{
    if ( isdefined( self._id_3C3D ) && self._id_3C3D )
        return;

    self._id_3C3D = 1;
    var_1 = self;

    if ( isdefined( self._id_6FBB ) )
        var_1 = self._id_6FBB;

    target_set( var_1, ( 0.0, 0.0, 0.0 ) );

    if ( isai( self ) )
    {
        if ( self.team == "axis" )
        {
            target_setscaledrendermode( var_1, 1 );
            target_setshader( var_1, "hud_fofbox_hostile" );
        }
        else
        {
            target_setscaledrendermode( var_1, 1 );
            target_setshader( var_1, "veh_hud_friendly" );
        }
    }
    else if ( isplayer( self ) )
        target_setshader( var_1, "hud_fofbox_self_sp" );
    else if ( self.code_classname == "script_vehicle" )
    {
        target_setscaledrendermode( var_1, 1 );

        if ( self.script_team == "axis" )
            target_setshader( var_1, "veh_hud_target" );
        else
            target_setshader( var_1, "veh_hud_friendly" );
    }
    else
    {
        target_setscaledrendermode( var_1, 1 );
        target_setshader( var_1, "veh_hud_friendly" );
    }

    target_showtoplayer( var_1, var_0 );
}

_id_6FC0()
{
    level notify( "stop_draw_maars_targets" );

    foreach ( var_1 in level._id_6FBA )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _id_6FC1();
    }
}

_id_6FC1()
{
    if ( isdefined( self._id_3C3D ) )
    {
        self._id_3C3D = undefined;

        if ( isdefined( self._id_6FBB ) )
            target_remove( self._id_6FBB );
        else
            target_remove( self );
    }
}

_id_6FC2()
{
    if ( level._id_6F62 == 0 && isdefined( level.player._id_6EFB["incoming_missile"] ) )
    {
        level._id_6F62 = 1;
        level.player thread common_scripts\utility::play_loop_sound_on_entity( "heli_missile_warning" );
        thread _id_6FC3();
        wait 2;
        level.player thread common_scripts\utility::stop_loop_sound_on_entity( "heli_missile_warning" );
        level._id_6F62 = 0;
    }
}

_id_6FC3()
{
    level endon( "dismount_maars" );

    for ( var_0 = 0; var_0 < 3; var_0++ )
    {
        level.player._id_6EFB["incoming_missile"] fadeovertime( 0.25 );
        level.player._id_6EFB["incoming_missile"].alpha = 1;
        wait 0.25;
        level.player._id_6EFB["incoming_missile"] fadeovertime( 0.25 );
        level.player._id_6EFB["incoming_missile"].alpha = 0;
        wait 0.25;
    }
}

_id_6FC4( var_0, var_1, var_2 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );

    if ( isdefined( level._id_6F7C ) )
    {
        if ( !isalive( level._id_6F7C ) )
            return;

        level._id_6F7C endon( "death" );
    }

    var_3 = 1.0;
    var_4 = 0.75;
    var_5 = 0.95;
    var_6 = 0.4;
    var_7 = maps\_hud_util::createserverclientfontstring( "default", 2 );
    thread maps\_utility_code::_id_13DF( var_7 );
    thread _id_6FC6( var_7 );
    level endon( "friendlyfire_mission_fail" );
    var_7.alpha = 0.9;
    var_7.x = 0;
    var_7.y = -88 + var_1;
    var_7.alignx = "center";
    var_7.aligny = "middle";
    var_7.horzalign = "center";
    var_7.vertalign = "middle";
    var_7.foreground = 0;
    var_7.hidewhendead = 1;
    var_7.hidewheninmenu = 1;
    var_7 thread _id_6FC5( var_0 );
    var_7.alpha = 0;
    var_7 fadeovertime( var_3 );
    var_7.alpha = var_5;
    wait(var_3);

    for ( var_8 = 0; var_8 < 1; var_8++ )
    {
        var_7 fadeovertime( var_4 );
        var_7.alpha = var_6;
        wait(var_4);
        var_7 fadeovertime( var_4 );
        var_7.alpha = var_5;
        wait(var_4);
    }

    wait(var_2);
    var_7 notify( "destroying" );
    var_7 destroy();
}

_id_6FC5( var_0 )
{
    self endon( "death" );
    self endon( "destroying" );

    for (;;)
    {
        var_1 = [[ var_0 ]]();
        self settext( var_1 );
        wait 0.05;
    }
}

_id_6FC6( var_0 )
{
    var_0 endon( "destroying" );
    level waittill( "missionfailed" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 destroy();
}

_id_13D6( var_0 )
{
    wait(var_0);
    self._id_13D7 = 1;
}

_id_6FC7( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = undefined;

    if ( isdefined( var_2.code_classname ) && var_2.code_classname == "script_vehicle" )
    {
        var_8 = var_2 getvehicleowner();

        if ( isdefined( var_8 ) && isplayer( var_8 ) )
        {
            if ( var_5 == "MOD_CRUSH" )
            {
                var_7 = &"INTRO_UGV_KILLTEAM_DEATH_QUOTE";
                level thread _id_6FC8( var_7 );
                return;
            }
        }
    }

    if ( isdefined( level._id_1FE9 ) && level._id_1FE9 )
    {
        level thread _id_6FC8( var_7 );
        return;
    }

    if ( level.friendlyfiredisabledfordestructible == 1 )
        return;

    if ( level.friendlyfiredisabled == 1 )
        return;

    if ( level.player._id_1FE1 <= level.friendlyfire["min_participation"] )
        level thread _id_6FC8( var_7 );
}

_id_6FC8( var_0 )
{
    if ( getdvar( "friendlyfire_dev_disabled" ) == "1" )
        return;

    level.player endon( "death" );
    level endon( "mine death" );
    level notify( "mission failed" );
    level notify( "friendlyfire_mission_fail" );
    waittillframeend;

    if ( isdefined( level._id_16C9 ) && level._id_16C9 )
        return;

    setsaveddvar( "hud_missionFailed", 1 );

    if ( isdefined( level.player._id_1EF4 ) )
        return;

    if ( isdefined( var_0 ) )
        setdvar( "ui_deadquote", var_0 );
    else
        setdvar( "ui_deadquote", &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );

    reconspatialevent( level.player.origin, "script_friendlyfire: civilian %d", 0 );
    maps\_utility::_id_1826();
}
