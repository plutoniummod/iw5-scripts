// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::flag_init( "player_on_minigun" );
    common_scripts\utility::flag_init( "player_off_minigun" );
    common_scripts\utility::flag_init( "disable_overheat" );
    common_scripts\utility::flag_init( "minigun_lesson_learned" );
    precachestring( &"SCRIPT_PLATFORM_MINIGUN_SPIN_HINT" );
    precachestring( &"SCRIPT_PLATFORM_MINIGUN_FIRE_HINT" );
    precacheshader( "white" );
    precacheshader( "black" );
    precacheshader( "hud_temperature_gauge" );
    precacherumble( "minigun_rumble" );
    precacheshader( "popmenu_bg" );
    level._id_416D = 1;
    level._id_416E = 114;
    level._id_454C = 15;
    level._effect["_minigun_overheat_haze"] = loadfx( "distortion/abrams_exhaust" );
    level._effect["_minigun_overheat_smoke"] = loadfx( "distortion/armored_car_overheat" );
    _id_454D();
}
#using_animtree("vehicles");

_id_454D()
{
    level._id_0C59["minigun"]["spin"] = %bh_minigun_spin_loop;
    level._id_1245["minigun"] = #animtree;
    level._id_1F90["minigun"] = "weapon_minigun";
}

_id_454E()
{
    self._id_1032 = "minigun";
    maps\_utility::_id_2629();
    thread _id_4558();

    for (;;)
    {
        for (;;)
        {
            if ( _id_4550() )
                break;

            wait 0.05;
        }

        common_scripts\utility::flag_clear( "player_off_minigun" );
        common_scripts\utility::flag_set( "player_on_minigun" );

        for (;;)
        {
            if ( !_id_4550() )
                break;

            wait 0.05;
        }

        common_scripts\utility::flag_clear( "player_on_minigun" );
        common_scripts\utility::flag_set( "player_off_minigun" );
        wait 0.05;
        common_scripts\utility::stop_loop_sound_on_entity( "minigun_heli_gatling_fire" );
        self notify( "stop soundminigun_heli_gatling_fire" );
        self._id_454F = 0;
        level notify( "stopMinigunSound" );
        break;
    }
}

_id_4550()
{
    self endon( "death" );
    var_0 = undefined;

    if ( !isdefined( self ) )
        return 0;

    if ( issubstr( self.classname, "script_vehicle" ) )
    {
        var_0 = self getvehicleowner();

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
            return 1;
        else
            return 0;
    }
    else if ( isdefined( self getturretowner() ) )
        return 1;
    else
        return 0;
}

_id_4551()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 750;
    var_2 = var_1 - var_0;
    self._id_4553 = spawn( "script_origin", self._id_4552.origin );
    self._id_4553 linkto( self._id_4552 );

    while ( common_scripts\utility::flag( "player_on_minigun" ) )
    {
        wait 0.05;

        if ( self.momentum <= 0 || !common_scripts\utility::flag( "player_on_minigun" ) )
            continue;

        self._id_4553.origin = self._id_4552 geteye() + ( 0, 0, var_1 - var_2 * self.momentum );
        self._id_4553 playrumbleonentity( "minigun_rumble" );
    }

    self._id_4553 delete();
}

_id_4554()
{
    self endon( "death" );

    if ( !issubstr( self.classname, "script_vehicle" ) )
        return;

    level endon( "player_off_minigun" );
    self._id_454F = 0;

    while ( common_scripts\utility::flag( "player_on_minigun" ) )
    {
        wait 0.05;

        if ( self._id_4552 attackbuttonpressed() && self._id_4555 == 1 )
        {
            thread _id_4556();
            _id_4557();
        }

        if ( self._id_454F == 1 )
        {
            self notify( "stop soundminigun_heli_gatling_fire" );
            self._id_454F = 0;
        }
    }
}

_id_4556()
{
    level endon( "player_off_minigun" );
    level endon( "player_off_blackhawk_gun" );
    self notify( "playing_fire_loop_sound" );
    self endon( "playing_fire_loop_sound" );
    self._id_454F = 1;
    thread maps\_utility::_id_258E( "minigun_heli_gatling_fire", "tag_flash" );
}

_id_4557()
{
    while ( self._id_4552 attackbuttonpressed() && self._id_4555 == 1 )
        wait 0.05;
}

_id_28BC()
{
    self endon( "death" );

    if ( !issubstr( self.classname, "script_vehicle" ) )
        return;

    level endon( "player_off_minigun" );

    while ( common_scripts\utility::flag( "player_on_minigun" ) )
    {
        self waittill( "turret_fire" );

        if ( self._id_4555 == 0 )
            continue;

        self fireweapon();
        earthquake( 0.25, 0.13, self gettagorigin( "tag_turret" ), 200 );
        wait 0.01;
    }
}

_id_4558()
{
    level endon( "player_off_minigun" );
    common_scripts\utility::flag_wait( "player_on_minigun" );

    if ( level.console )
        var_0 = 6;
    else
        var_0 = 10;

    var_1 = 4;
    var_2 = 7;
    var_3 = 0.02;
    var_4 = 0.02;
    var_5 = 0.35;
    var_6 = 0;
    self._id_4555 = 0;
    var_7 = 1 / var_0 * 20;
    var_8 = 1 / var_1 * 20;
    level.inuse = 0;
    var_9 = 0;
    self.momentum = 0;
    var_10 = 0;
    var_11 = 1;
    var_12 = 0;
    var_13 = 0;
    var_14 = undefined;
    var_15 = 0;
    var_16 = 0;
    var_17 = undefined;
    var_18 = 0;
    level._id_4559 = 0;
    level._id_455A = 0;
    var_19 = 0;
    thread _id_28BC();
    thread _id_4554();

    for (;;)
    {
        level._id_455A++;

        if ( common_scripts\utility::flag( "player_on_minigun" ) )
        {
            if ( !level.inuse )
            {
                if ( self._id_4552 adsbuttonpressed() || self._id_4552 attackbuttonpressed() )
                {
                    level.inuse = 1;
                    thread _id_455D();
                }
            }
            else if ( !self._id_4552 attackbuttonpressed() && !self._id_4552 adsbuttonpressed() )
            {
                level.inuse = 0;
                thread _id_455F();
            }
            else if ( self._id_4552 attackbuttonpressed() && var_15 )
            {
                level.inuse = 0;
                thread _id_455F();
            }

            if ( !var_13 )
            {
                if ( self._id_4552 attackbuttonpressed() && !var_15 && var_12 )
                {
                    var_13 = 1;
                    var_17 = gettime();
                }
                else if ( self._id_4552 attackbuttonpressed() && var_15 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
            else
            {
                if ( !self._id_4552 attackbuttonpressed() )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }

                if ( self._id_4552 attackbuttonpressed() && !var_12 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
        }
        else
        {
            if ( var_13 || level.inuse == 1 )
                thread _id_455F();

            var_13 = 0;
            level.inuse = 0;
        }

        if ( level.inuse )
        {
            var_9 += var_3;
            self.momentum = var_9;
        }
        else
        {
            var_9 -= var_4;
            self.momentum = var_9;
        }

        if ( var_9 > var_11 )
        {
            var_9 = var_11;
            self.momentum = var_9;
        }

        if ( var_9 < 0 )
        {
            var_9 = 0;
            self.momentum = var_9;
            self notify( "done" );
        }

        var_12 = 1;
        _id_455C();
        self setanim( maps\_utility::_id_1281( "spin" ), 1, 0.2, var_9 );
        wait 0.05;
    }
}

_id_455B()
{
    self._id_4555 = 0;

    if ( !issubstr( self.classname, "script_vehicle" ) )
        self turretfiredisable();
}

_id_455C()
{
    self._id_4555 = 1;

    if ( !issubstr( self.classname, "script_vehicle" ) )
        self turretfireenable();
}

_id_455D()
{
    level endon( "player_off_minigun" );
    level endon( "player_off_blackhawk_gun" );
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self.momentum < 0.25 )
    {
        self playsound( "minigun_heli_gatling_spinup1" );
        wait 0.6;
        self playsound( "minigun_heli_gatling_spinup2" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self.momentum < 0.5 )
    {
        self playsound( "minigun_heli_gatling_spinup2" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self.momentum < 0.75 )
    {
        self playsound( "minigun_heli_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self.momentum < 1 )
    {
        self playsound( "minigun_heli_gatling_spinup4" );
        wait 0.5;
    }

    thread _id_455E();
}

_id_455E()
{
    level endon( "player_off_minigun" );
    level endon( "player_off_blackhawk_gun" );
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    for (;;)
    {
        self playsound( "minigun_heli_gatling_spin" );
        wait 2.5;
    }
}

_id_455F()
{
    level endon( "player_off_minigun" );
    level endon( "player_off_blackhawk_gun" );
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self.momentum > 0.75 )
    {
        self stopsounds();
        self playsound( "minigun_heli_gatling_spindown4" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spindown3" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self.momentum > 0.5 )
    {
        self playsound( "minigun_heli_gatling_spindown3" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self.momentum > 0.25 )
    {
        self playsound( "minigun_heli_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_heli_gatling_spindown1" );
        wait 0.65;
    }
    else
    {
        self playsound( "minigun_heli_gatling_spindown1" );
        wait 0.65;
    }
}

_id_4560()
{
    level._id_4561 = maps\_hud_util::createfontstring( "default", 1.5 );
    level._id_4561 maps\_hud_util::setpoint( "TOPLEFT", undefined, 0, 50 );
    level._id_4561 settext( &"SCRIPT_PLATFORM_MINIGUN_SPIN_HINT" );
    level._id_4561.sort = 1;
    level._id_4561.alpha = 0;
    level._id_4562 = maps\_hud_util::createfontstring( "default", 1.5 );
    level._id_4562 maps\_hud_util::setpoint( "TOPRIGHT", undefined, 0, 50 );
    level._id_4562 settext( &"SCRIPT_PLATFORM_MINIGUN_FIRE_HINT" );
    level._id_4562.sort = 1;
    level._id_4562.alpha = 0;
    level._id_4563 = maps\_hud_util::createicon( "popmenu_bg", 200, 23 );
    level._id_4563.hidewheninmenu = 1;
    level._id_4563 maps\_hud_util::setpoint( "TOPLEFT", undefined, -80, 47 );
    level._id_4563.alpha = 0;
    level._id_4564 = maps\_hud_util::createicon( "popmenu_bg", 150, 23 );
    level._id_4564.hidewheninmenu = 1;
    level._id_4564 maps\_hud_util::setpoint( "TOPRIGHT", undefined, 60, 47 );
    level._id_4564.alpha = 0;
    level._id_4562 fadeovertime( 0.5 );
    level._id_4562.alpha = 0.8;
    level._id_4561 fadeovertime( 0.5 );
    level._id_4561.alpha = 0.8;
    level._id_4563 fadeovertime( 0.5 );
    level._id_4563.alpha = 0.8;
    level._id_4564 fadeovertime( 0.5 );
    level._id_4564.alpha = 0.8;
}

_id_4565()
{
    level._id_4562 fadeovertime( 0.5 );
    level._id_4562.alpha = 0;
    level._id_4561 fadeovertime( 0.5 );
    level._id_4561.alpha = 0;
    level._id_4563 fadeovertime( 0.5 );
    level._id_4563.alpha = 0;
    level._id_4564 fadeovertime( 0.5 );
    level._id_4564.alpha = 0;
    level._id_4562 maps\_hud_util::destroyelem();
    level._id_4561 maps\_hud_util::destroyelem();
    level._id_4563 maps\_hud_util::destroyelem();
    level._id_4564 maps\_hud_util::destroyelem();
}
