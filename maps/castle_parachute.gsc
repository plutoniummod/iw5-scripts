// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5872()
{
    maps\_shg_common::move_player_to_start( "start_approach" );
    maps\castle_code::_id_8094( "start_approach", undefined, 1 );
    maps\castle_code::_id_8100( "startvista", 1 );
}

main()
{
    level._id_813A = 300;
    _id_80A5();
    maps\castle_parachute_sim::_id_7059();
    maps\castle_parachute_sim::_id_807D();
    level thread maps\castle_ruins::_id_8129();
    level.player thread maps\castle_parachute_sim::_id_8061();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player thread _id_813C();
    level.player thread _id_8140();
    level.player._id_8060["disable_input"] = 1;
    maps\castle_code::_id_5296( ::_id_813E, 1 );
    maps\_utility::vision_set_fog_changes( "castle_intro", 0 );
    maps\_audio::aud_send_msg( "map_start" );
    wait 4.75;
    level.player nightvisiongogglesforceon();
    level._id_813B = level._id_4877;
    maps\castle_code::_id_5296( ::_id_8149 );
    common_scripts\utility::flag_wait( "player_landed" );
    common_scripts\utility::flag_set( "start_water_splash_fx" );
    maps\castle_code::_id_80A3( "ruins_start" );
    maps\castle_code::_id_8100( "startvista", 1 );
    wait 0.5;
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "too_low" );
    common_scripts\utility::flag_init( "too_high" );
    common_scripts\utility::flag_init( "intro_done" );
    common_scripts\utility::flag_init( "parachute_cliff_drop" );
    common_scripts\utility::flag_init( "objective_landing" );
    common_scripts\utility::flag_init( "player_landing" );
    common_scripts\utility::flag_init( "player_landed" );
}

_id_80A5()
{
    maps\_utility::_id_265A( "allies" );
    var_0 = getent( "parachute_ground_ruins", "targetname" );
    var_0 hide();
}

_id_813C()
{
    var_0 = common_scripts\utility::getfx( "wind_rush_chute" );
    playfxontag( var_0, self._id_7A48, "tag_camera" );
}

_id_813D()
{
    var_0 = common_scripts\utility::getfx( "wind_rush_chute" );
    stopfxontag( var_0, self._id_7A48, "tag_camera" );
}

_id_813E()
{
    maps\castle_parachute_sim::_id_8065( self.target );
    thread maps\castle_parachute_sim::_id_808E();
}
#using_animtree("generic_human");

_id_681E()
{
    thread _id_813F();
    self setflaggedanimknoball( "intro", maps\_utility::_id_1281( "intro" ), %root, 1, 0, 1 );
    self waittillmatch( "intro", "end" );
}
#using_animtree("vehicles");

_id_813F()
{
    self._id_8063 setflaggedanimknoball( "intro", self._id_8063 maps\_utility::_id_1281( "intro" ), %root, 1, 0, 1 );
    self waittillmatch( "intro", "end" );
}

_id_8140()
{
    level._id_8141 = 805;
    level._id_8142 = 1000;
    level._id_8143 = 10;
    level._id_8144 = 10;
    self._id_8060["max_speed"] = 800;
    self._id_8060["min_speed"] = 800;
    self._id_8060["disable_flare"] = 0;
    self._id_8060["disable_fall"] = 0;
    maps\_utility::delaythread( 6, common_scripts\utility::exploder, 301 );

    if ( !common_scripts\utility::flag( "parachute_cliff_drop" ) )
    {
        self._id_8060["max_fall_speed"] = 120;
        self._id_8060["gravity"] = 100;

        while ( !common_scripts\utility::flag( "player_landing" ) )
        {
            earthquake( 0.1, 0.05, self.origin, 100 );
            wait 0.05;
        }

        if ( common_scripts\utility::flag( "player_landing" ) )
            return;

        common_scripts\utility::flag_wait( "parachute_cliff_drop" );
        self._id_8060["max_speed"] = 900;
        self._id_8060["min_speed"] = 900;
        self._id_8060["max_fall_speed"] = 500;
        self._id_8060["gravity"] = 500;
        var_0 = common_scripts\utility::getstruct( "start_fire_pockets", "targetname" );
        self._id_8060["max_speed"] = 800;
        self._id_8060["min_speed"] = 800;
        common_scripts\utility::flag_set( "objective_landing" );
        common_scripts\utility::flag_set( "parachute_cliff_drop" );
    }

    self._id_8060["gravity"] = 20;
    self._id_8060["max_fall_speed"] = 20;
    wait 4;
    level._id_8143 = 100;
    thread _id_8145();
    self._id_8062["goal_pos"] = common_scripts\utility::getstruct( "parachute_steer", "targetname" ).origin;
    wait 5;
    level._id_8141 = 700;
    level._id_8142 = 750;
    wait 3.25;
    self._id_8062["goal_pos"] = undefined;
    common_scripts\utility::flag_wait( "reached_fire_pockets" );
    self._id_8060["max_speed"] = 900;
    self._id_8060["min_speed"] = 900;
    self._id_8060["gravity"] = 0;
    self._id_8060["max_fall_speed"] = 0;
    common_scripts\utility::flag_wait( "approaching_landing" );
    level._id_8144 = 60;
    level._id_8143 = 100;
}

_id_8145()
{
    if ( level._id_1F19 != "intro" )
        return;

    var_0 = 3000;
    level endon( "missionfailed" );

    while ( !common_scripts\utility::flag( "player_landing" ) )
    {
        var_1 = distance2d( self.origin, level._id_4877.origin );

        if ( var_1 > var_0 )
        {
            self._id_8060["gravity"] = 200;
            self._id_8060["max_fall_speed"] = 400;
            wait 5;
            setdvar( "ui_deadquote", &"CASTLE_FAILED_TO_FOLLOW" );
            level thread maps\_utility::_id_1826();
            break;
        }

        wait 0.05;
    }
}

_id_8146()
{
    var_0 = 9000;
    var_1 = bullettrace( self.origin, self.origin + ( 0.0, 0.0, -9000.0 ), 0, undefined, 1 );

    if ( isdefined( var_1["position"] ) )
        var_0 = distance( var_1["position"], self.origin );

    return var_0;
}

_id_8147()
{
    level.player._id_8060["disable_fall"] = 1;
    level.player._id_8062["ai_controlled"] = 1;
    level.player._id_8062["goal_velocity"] = length( level.player._id_8062["velocity"] );
    level.player notify( "end_parachute_crash_watcher" );
    var_0 = getstartorigin( self.origin, self.angles, level._id_0C59[level.player._id_8063._id_1032]["landing"] );
    level.player._id_8062["goal_pos"] = var_0;
    level.player waittill( "goal" );
}

_id_8148()
{
    self notify( "end_parachute" );
    self notify( "end_parachute_sim" );
    self notify( "end_parachute_crash_watcher" );
    level._id_4877 maps\castle_parachute_sim::_id_806A();
    maps\castle_parachute_sim::_id_806F();
}

_id_8149()
{
    if ( isdefined( level._id_813B ) )
    {
        self._id_8063 = level._id_813B._id_8063;
        level._id_813B delete();
    }

    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_2709( self.primaryweapon, "none" );
    level.player thread _id_814D();
    self._id_8063._id_1032 = "price_parachute";
    playfxontag( common_scripts\utility::getfx( "price_smokewall_push" ), self, "tag_origin" );
    var_0 = maps\castle_code::_id_7A41( "landing" );
    var_0 maps\_anim::_id_11DD( maps\_utility::_id_2766( self, self._id_8063 ), "landing" );
    self._id_8063 delete();
    maps\_utility::_id_2709( level._id_4877.primaryweapon, "right" );
    thread _id_814A();
}

_id_814A()
{
    common_scripts\utility::flag_wait( "player_landed" );
    wait 1.5;

    if ( isalive( level._id_814B ) )
    {
        level._id_814B maps\_utility::_id_2612( 0 );
        level._id_814B.health = 1;
        magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level._id_814B gettagorigin( "TAG_EYE" ) );
        wait 0.3;

        if ( isalive( level._id_814B ) )
            level._id_814B kill();
    }

    maps\_utility::_id_2612( 0 );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_keepup" );
    wait 2;
    level.player thread maps\_utility::_id_1823( "disable_nvg", 7 );
}

_id_814C( var_0 )
{
    var_0 maps\_utility::_id_2709( var_0._id_20A3, "right" );
}

_id_814D()
{
    common_scripts\utility::flag_set( "player_landing" );
    var_0 = maps\castle_code::_id_7A41( "landing", 1 );
    _id_8148();
    _id_813D();
    self._id_7A48 unlink();
    self playrumbleonentity( "damage_heavy" );
    self._id_814E = maps\_utility::_id_1287( "player_rig" );
    self playerlinktoabsolute( self._id_814E, "tag_player" );
    var_0 thread maps\_anim::_id_1246( self._id_814E, "landing" );
    var_0 thread maps\_anim::_id_1246( self._id_8063, "landing" );
    var_1 = maps\_utility::_id_272F( "landing_guard1", 1 );
    var_1._id_1032 = "landing_guard1";
    var_1 thread maps\_anim::_id_11CF( var_1, "landing" );
    level._id_814B = maps\_utility::_id_272F( "landing_guard2", 1 );
    level._id_814B.ignoreall = 1;
    level._id_814B thread maps\_patrol::_id_204E( self.target );
    level._id_814B._id_1032 = "landing_guard2";
    wait 0.5;
    self._id_814E waittillmatch( "single anim", "start_guard_1" );
    var_1 thread maps\_anim::_id_1246( var_1, "landing" );
    var_1 maps\_utility::_id_2612( 1 );
    var_1.allowdeath = 1;
    self._id_814E waittillmatch( "single anim", "guard_death" );
    thread _id_8150();
    wait 2;
    var_1 animscripts\shared::_id_0D73();
    level._id_814B animscripts\shared::_id_0D73();
    self._id_814E waittillmatch( "single anim", "end" );
    var_1 startragdoll();
    var_1 maps\_utility::_id_2749();
    level._id_814B setgoalpos( level._id_814B.origin );
    self._id_8063 delete();
    self unlink();
    self._id_814E delete();
    var_2 = getent( "parachute_ground_ruins", "targetname" );
    var_2 show();
    self allowcrouch( 1 );
    self allowprone( 1 );
    self enableweapons();
    self showviewmodel();
    self setstance( "crouch" );
    self freezecontrols( 0 );
    setsaveddvar( "cg_drawCrosshair", 1 );
    thread _id_8155();
    thread _id_8151();
    common_scripts\utility::flag_set( "player_landed" );
}

_id_814F()
{
    var_0 = getnode( "landing_guard_flee_dest", "targetname" );
    level._id_814B maps\_anim::_id_1247( level._id_814B, "react_to_parachute" );
    level._id_814B notify( "end_patrol" );
    level._id_814B maps\_utility::_id_2712();
    level._id_814B maps\_utility::_id_2724( 50 );
    level._id_814B setgoalnode( var_0 );
    level._id_814B.allowdeath = 1;
}

_id_8150()
{
    level._id_814B notify( "end_patrol" );
    level._id_814B maps\_utility::_id_24F5();
    level._id_814B.health = 1;
    level._id_814B.ignoreexplosionevents = 1;
    level._id_814B.ignoreme = 1;
    level._id_814B.ignoreall = 1;
    level._id_814B.ignorerandombulletdamage = 1;
    level._id_814B.grenadeawareness = 0;
    level._id_814B._id_0D16 = 1;
    level._id_814B._id_0EC6 = 1;
    level._id_814B.a._id_0D55 = 1;
    level._id_814B maps\_utility::_id_261D( 165, 4, level._id_0C59["crawl_death_2"] );
    level._id_814B dodamage( 1, level._id_814B.origin + ( 16.0, 0.0, 16.0 ) );
}

_id_8151()
{
    level endon( "player_landed" );
    var_0 = self getplayerangles();

    for (;;)
    {
        var_1 = self getplayerangles();

        if ( vectordot( var_0, var_1 ) < 0.8 )
        {
            common_scripts\utility::flag_set( "player_landed" );
            return;
        }

        common_scripts\utility::waitframe();
    }
}

_id_8152( var_0 )
{
    common_scripts\utility::exploder( 302 );
    common_scripts\utility::exploder( 5800 );
    level.player playrumbleonentity( "damage_heavy" );
    wait 0.05;
    level.player playrumbleonentity( "damage_heavy" );
    wait 0.05;
    level.player playrumbleonentity( "damage_heavy" );
    wait 0.05;
    level.player playrumbleonentity( "damage_heavy" );
    wait 1;
    level.player playrumbleonentity( "damage_heavy" );
}

_id_8153( var_0 )
{
    level.player playrumbleonentity( "damage_light" );
    wait 0.5;
    level.player playrumbleonentity( "damage_light" );
}

_id_8154()
{
    var_0 = getstartorigin( self.origin, self.angles, level.player._id_7A48 maps\_utility::_id_1281( "landing" ) );
    var_1 = getstartangles( self.origin, self.angles, level.player._id_7A48 maps\_utility::_id_1281( "landing" ) );
    var_2 = self.origin - var_0;
    var_3 = length( var_2 );
    var_4 = ( angleclamp180( level.player._id_7A48.angles[0] - var_1[0] ), angleclamp180( level.player._id_7A48.angles[1] - var_1[1] ), angleclamp180( level.player._id_7A48.angles[2] - var_1[2] ) );
    var_5 = vectortoangles( var_2 );
    var_6 = anglestoforward( var_5 + var_4 );
    self.origin = level.player._id_7A48.origin + var_6 * var_3;
    self.angles += var_4;
}

_id_8155()
{
    self setactionslot( 1, "" );
    level.player notifyonplayercommand( "fake_nvg", "+actionslot 1" );
    level.player waittill( "fake_nvg" );
    maps\_audio::aud_send_msg( "turn_off_fake_nvg" );
    level.player._id_522E = undefined;
    var_0 = level.player getcurrentweapon();
    level.player forceviewmodelanimation( var_0, "nvg_up" );
    wait 0.5;
    level.player nightvisiongogglesforceoff();
    self setactionslot( 1, "nightvision" );
}
