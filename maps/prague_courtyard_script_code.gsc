// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_783A()
{
    var_0 = maps\_vehicle::_id_2881( "courtyard_heli_flyby_two" );
    var_0.health = 50000;
    common_scripts\utility::flag_wait( "courtyard_chopper_fly" );
    var_0 = maps\_vehicle::_id_2881( "courtyard_heli_flyby" );
    common_scripts\utility::flag_wait( "courtyard_puzzle" );
    maps\_utility::_id_1428( "prague_tension_4" );
}

_id_783B()
{
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    level endon( "kill_sniper_nag_lines" );
    level.player.ignoreme = 1;
    level._id_45C0.ignoreme = 1;
    common_scripts\utility::flag_wait_either( "can_shoot_player_courtyard", "courtyard_player_moving_too_fast" );
    level.player.ignoreme = 0;
    level._id_45C0.ignoreme = 0;
    level notify( "player_gonna_die" );
    maps\_utility::_id_26C2( "prague_stop_5" );
    maps\_utility::_id_1926();
    thread maps\_utility::_id_11F4( "prague_spotted_2" );
    common_scripts\utility::waitframe();
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::_id_140C();
        var_2 maps\_stealth_utility::_id_4344();
        common_scripts\utility::waitframe();

        if ( isdefined( var_2 ) )
        {
            var_2.ignoreme = 0;
            var_2.ignoreall = 0;
            var_2.favoriteenemy = level.player;
            var_2 getenemyinfo( level.player );
            var_2 setgoalentity( level.player );
        }
    }

    wait 2;
    level.player dodamage( 70, level.player.origin + anglestoright( level.player.angles ) );
    wait 2;
    level.player dodamage( 70, level.player.origin - anglestoright( level.player.angles ) );
    wait 1;
    level.player dodamage( 70, level.player.origin + anglestoforward( level.player.angles ) );
    level.player kill();
}

aishootplayer( var_0, var_1 )
{
    self notify( "aiShootPlayer" );
    self endon( "aiShootPlayer" );
    self endon( "helicopter_removed" );
    self endon( "leaving" );
    var_0 endon( "death" );
    var_2 = 6;
    var_3 = 2;

    for (;;)
    {
        var_2--;
        self fireweapon( "tag_flash", var_0 );
        wait 0.15;

        if ( var_2 <= 0 )
        {
            var_3--;
            var_2 = 6;

            if ( distancesquared( var_0.origin, var_1 ) > 500000 || var_3 <= 0 || !isalive( var_0 ) )
            {
                self notify( "abandon_target" );
                return;
            }

            wait 1;
        }
    }
}

targetdeathwaiter( var_0 )
{
    self endon( "abandon_target" );
    var_0 waittill( "death" );
    self notify( "target_killed" );
}

_id_783C()
{
    common_scripts\utility::flag_wait_any( "courtyard_combat_start", "_stealth_spotted" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::_id_140C();
        var_2 maps\_stealth_utility::_id_4344();
        var_2 addaieventlistener( "gunshot_teammate" );
        var_2 addaieventlistener( "gunshot_teammate" );
        var_2 addaieventlistener( "gunshot" );
        var_2 addaieventlistener( "grenade danger" );
        var_2 addaieventlistener( "bulletwhizby" );
        var_2 addaieventlistener( "projectile_impact" );
    }
}

_id_783D()
{
    level endon( "_stealth_spotted" );
    level endon( "courtyard_combat_start" );
    level endon( "can_shoot_player_courtyard" );
    level._id_45C0.ignoreall = 1;
    common_scripts\utility::flag_wait( "sandman_climb_dumpster" );

    if ( !common_scripts\utility::flag( "courtyard_sandman_killed_dude" ) )
    {
        wait 1.0;
        thread maps\_utility::_id_11F4( "prague_mct_stayclose" );
    }

    common_scripts\utility::flag_wait( "courtyard_sandman_killed_dude" );
    common_scripts\utility::flag_set( "courtyard_puzzle" );
    var_0 = common_scripts\utility::get_target_ent( "sandman_cp_stop" );
    var_0 maps\_anim::_id_11C4( level._id_45C0, "cornerL_idle" );
    var_0 thread maps\_anim::_id_11C8( level._id_45C0, "cornerL_idle" );
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    maps\_utility::_id_272F( "roof_stealth_one" );
    maps\_utility::_id_272F( "roof_stealth_two" );
    maps\_utility::_id_272C( "roof_stealth_epic" );
    var_0 notify( "stop_loop" );
    maps\_utility::_id_26C2( "prague_stop_5" );
    level._id_45C0 thread maps\_utility::_id_168C( "prague_mct_holdup" );
    level._id_45C0 animscripts\shared::_id_0C9B( level._id_45C0.primaryweapon, "right" );
    var_0 maps\_anim::_id_11C1( level._id_45C0, "signal_stop_coverL" );
    level._id_45C0 thread maps\_utility::_id_168C( "prague_mct_20plus" );
    var_0 thread maps\_anim::_id_11C1( level._id_45C0, "signal_enemy_coverL" );
    level._id_45C0 maps\_utility::_id_109E();
    level._id_45C0 allowedstances( "crouch", "prone" );
    var_0 notify( "stop_loop" );
    level._id_45C0 setgoalnode( common_scripts\utility::get_target_ent( "sandman_cp_look" ) );
    childthread _id_783E();
    thread _id_0081();
    thread _id_0082();
    level._id_45C0 waittill( "goal" );
    level._id_45C0 allowedstances( "crouch", "prone", "stand" );
}

_id_783E()
{
    level endon( "courtyard_combat_start" );
    level endon( "_stealth_spotted" );
    wait 2.7;
    maps\_utility::_id_11F4( "prague_pri_soapposition" );
    wait 0.4;
    maps\_utility::_id_11F4( "prague_mct_rallypoint" );
    wait 0.2;
    maps\_utility::_id_11F4( "prague_pri_fromwest" );
    wait 0.2;
    maps\_utility::_id_11F4( "prague_mct_roger" );
    var_0 = maps\_utility::_id_272C( "courtyard_roof_dying_quick_kill" );
    wait 0.4;
    thread _id_784F();
    thread _id_784A();
}

_id_0080()
{
    level endon( "roof_start_to_stand" );
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "can_shoot_player_courtyard" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
    common_scripts\utility::flag_set( "courtyard_combat_start" );
    common_scripts\utility::flag_set( "roof_start_to_stand" );
}

_id_0081()
{
    level endon( "roof_start_to_stand" );
    common_scripts\utility::flag_wait( "kill_sniper_nag_lines" );
    thread _id_0080();
    wait 1.3;
    level._id_45C0 maps\_utility::_id_168C( "prague_mct_lightswitch" );
    level._id_45C0 maps\_utility::_id_168C( "prague_mct_onesdown" );
    maps\_utility::_id_11F4( "prague_pri_dontworry" );
    thread _id_059F::_id_43F8( _id_0367::_id_5239, _id_0367::_id_5238 );
    level.attacker._id_1032 = "price";
    common_scripts\utility::flag_set( "roof_start_to_stand" );
}

_id_0082()
{
    common_scripts\utility::flag_wait( "roof_start_to_stand" );
    wait 6;
    common_scripts\utility::flag_set( "sniper_shot" );

    if ( isalive( level.victim ) )
        level.victim kill();
}

_id_783F()
{
    common_scripts\utility::flag_wait_either( "roof_start_to_stand", "fire_flare" );
    level.player.ignoreme = 0;
    level._id_45C0.ignoreme = 0;
    wait 1;
    maps\_utility::_id_1428( "prague_battle_three", 0.0 );
}

_id_7840()
{
    level endon( "kill_sniper_nag_lines" );
    level endon( "player_gonna_die" );

    for (;;)
    {
        if ( !common_scripts\utility::flag( "soap_over_the_fence" ) && common_scripts\utility::flag( "pre_courtyard_ally_clean_up" ) )
        {
            thread maps\_utility::_id_11F4( "prague_stop_5" );
            break;
        }

        wait 0.05;
    }
}

_id_7842()
{
    common_scripts\utility::flag_wait_any( "courtyard_combat_start", "_stealth_spotted" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
    wait 3;
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        var_2 notify( "stop_corpse_search" );
        var_2 maps\_stealth_utility::_id_4344();
        var_2 maps\_utility::_id_140C();
        var_2 notify( "end_patrol" );
    }

    common_scripts\utility::waitframe();
    common_scripts\utility::flag_clear( "_stealth_spotted" );
    common_scripts\utility::waitframe();
    level._id_45C0.goalradius = 75;
    level._id_45C0 setgoalnode( common_scripts\utility::get_target_ent( "sandman_courtyard_look_and_fight" ) );
    level._id_45C0.ignoreall = 0;
    level._id_45C0 maps\_utility::_id_13A4( "r" );
    level._id_45C0 maps\_utility::_id_2686();
    level._id_45C0.ignoreme = 0;
}

_id_7843()
{
    level endon( "courtyard_combat_start" );
    level endon( "_stealth_spotted" );
    var_0 = common_scripts\utility::get_target_ent( "courtyard_takedown" );
    level.victim = maps\_utility::_id_272F( "courtyard_takedown_guy" );
    level.victim maps\_utility::_id_260D();
    level._id_45C0.ignoreme = 1;
    level.victim.ignoreall = 1;
    level.victim endon( "death" );
    common_scripts\utility::waitframe();
    level.victim maps\_utility::_id_1057();
    level.victim.health = 1;
    level.victim.dropweapon = 0;
    level.victim removeaieventlistener( "gunshot" );
    level.victim removeaieventlistener( "gunshot_teammate" );
    level.victim removeaieventlistener( "bulletwhizby" );
    level.victim removeaieventlistener( "projectile_impact" );
    level.victim maps\_utility::_id_280D();
    level.victim._id_1032 = "enemy";
    level.victim.goalradius = 2;
    level.victim.ignoreme = 1;
    level.victim thread maps\_utility::_id_2834( "courtyard_sandman_killed_dude" );
    common_scripts\utility::flag_wait( "sandman_climb_dumpster" );
    var_0 maps\_anim::_id_124A( level._id_45C0, "new_ally_kill" );
    var_0 thread _id_7875( level.victim, level._id_45C0 );
    level._id_45C0 animscripts\shared::_id_0C9B( level._id_45C0.primaryweapon, "left" );
    var_0 thread maps\_anim::_id_11DD( [ level._id_45C0, level.victim ], "new_ally_kill" );
    thread _id_7845();
    wait 3.0;
    thread maps\_utility::_id_11F4( "prague_mct_goodnight" );
    wait 10;
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        var_3 addaieventlistener( "bulletwhizby" );
        var_3 addaieventlistener( "projectile_impact" );
    }
}

_id_7844()
{
    common_scripts\utility::flag_wait( "courtyard_player_moving_too_fast" );
    common_scripts\utility::flag_set( "sandman_start_first_take_down" );
}

_id_7845()
{
    var_0 = getent( "courtyard_player_moving_too_fast_trigger", "targetname" );
    var_0 delete();
}

_id_7846( var_0 )
{
    level._id_7847++;

    if ( level._id_7847 == 0 )
        level.victim maps\_utility::_id_0D04();
}

_id_7848( var_0 )
{
    playfxontag( level._effect["m4m203_silencer_flash"], var_0, "TAG_WEAPON_RIGHT" );
    playfxontag( level._effect["pistol_shell_eject"], var_0, "TAG_WEAPON_RIGHT" );
    level._id_7849 = 0;
    level._id_7849++;
    level.victim.team = "neutral";

    if ( level._id_7849 == 0 )
    {
        playfxontag( level._effect["bodyshot1"], level.victim, "J_eyeball_ri" );
        wait 0.1;
        playfxontag( level._effect["bodyshot2"], level.victim, "J_Head_end" );
    }
    else if ( level._id_7849 == 1 )
    {
        playfxontag( level._effect["bodyshot1"], level.victim, "tag_inhand" );
        wait 0.1;
        playfxontag( level._effect["bodyshot2"], level.victim, "J_SpineLower" );
    }
}

_id_784A()
{
    level._id_784B = maps\_utility::_id_2640( "rooftop_takedown_guy_laser", "script_noteworthy" );
    level._id_784B.goalradius = 30;
    level._id_784B.goalheight = 20;
    common_scripts\utility::waitframe();
    level._id_784B thread _id_7856();
    level._id_784B._id_1032 = "enemy";
    level._id_784B.ignoreme = 1;
    level._id_784B.ignoreall = 1;
    self._id_0FC6 = 1;
    var_0 = common_scripts\utility::get_target_ent( "guy_laser_node" );
    level._id_784B setgoalpos( var_0.origin );
    level._id_784B waittill( "goal" );
    level._id_784B thread _id_7851();
    level._id_784B allowedstances( "crouch" );
    common_scripts\utility::waitframe();
    level._id_784B laserforceon();
    level._id_784B thread _id_784D();
}

_id_784C()
{
    self endon( "death" );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_1 = anglestoforward( self.angles );
    var_1 *= 256;
    var_0.origin = self.origin + var_1 + ( -20.0, 0.0, -150.0 );
    self setentitytarget( var_0 );
}

_id_784D()
{
    self endon( "death" );
    self.ignoreall = 0;
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_2 = anglestoforward( self.angles );
    var_2 *= 256;
    var_0.origin = self.origin + var_2 + ( -20.0, 0.0, -150.0 );
    maps\_utility::_id_27CC();
    common_scripts\utility::waitframe();
    self laserforceon();
    var_3 = getdvarfloat( "laserflarepct" );
    var_4 = getdvarfloat( "laserradius" );
    var_5 = getdvarfloat( "laserlightradius" );
    common_scripts\utility::waitframe();
    setsaveddvar( "laserflarepct", "0.2" );
    setsaveddvar( "laserradius", "4" );
    setsaveddvar( "laserlightradius", "7" );
    thread _id_784E( var_0 );
    var_6 = 200;
    common_scripts\utility::flag_wait( "kill_sniper_nag_lines" );
    setsaveddvar( "laserflarepct", var_3 );
    setsaveddvar( "laserradius", var_4 );
    setsaveddvar( "laserlightradius", var_5 );
    common_scripts\utility::waitframe();
    var_7 = self gettagorigin( "tag_eye" );
    var_8 = self gettagangles( "tag_eye" );
    magicbullet( level._id_45C0.weapon, var_7 - var_8, var_7 );
}

_id_784E( var_0 )
{
    self endon( "death" );
    wait 0.5;
    var_1 = anglestoforward( self.angles );
    var_1 *= 256;
    var_0.origin = self.origin + var_1 + ( -20.0, 0.0, -150.0 );

    for (;;)
    {
        self setentitytarget( var_0 );
        wait 0.1;
    }
}

_id_784F()
{
    wait 0.4;
    level endon( "_stealth_spotted" );
    level._id_7850 = maps\_utility::_id_2640( "rooftop_takedown_guy", "script_noteworthy" );
    level._id_7850 endon( "death" );
    level._id_7850.health = 10;
    level._id_7850.goalradius = 10;
    level._id_7850.goalheight = 10;
    level._id_7850 maps\_utility::_id_109B();
    var_0 = common_scripts\utility::get_target_ent( "rooftop_takedown" );
    common_scripts\utility::waitframe();
    level._id_7850 thread _id_7855();
    level._id_7850._id_1032 = "enemy";
    level._id_7850.ignoreall = 1;
    self._id_0FC6 = 1.3;
    var_0 = common_scripts\utility::get_target_ent( "rooftop_takedown" );
    var_0 maps\_anim::_id_124A( level._id_7850, "rooftop_kill" );
    var_0 thread maps\_anim::_id_124E( level._id_7850, "rooftop_kill_idle" );
    level._id_7850 attach( "weapon_binocular", "tag_weapon_right" );
    wait 1.3;
    level._id_45C0 thread maps\_utility::_id_168C( "prague_mct_scout" );
    thread _id_7854();

    if ( isalive( level._id_7850 ) )
        level thread _id_785E();

    level._id_7850 maps\_utility::_id_274F( 0.1, 0.1 );

    for (;;)
    {
        if ( level.player maps\_utility::_id_167C() && level.player adsbuttonpressed() )
        {
            level._id_7850 maps\_utility::_id_2750( 0.6, 0.9 );
            common_scripts\utility::flag_set( "kill_sniper_nag_lines" );
            common_scripts\utility::flag_clear( "sandman_announce_spotted" );
            level notify( "stop_stealth_busted_music" );
            maps\_utility::_id_1926();
            thread maps\_utility::_id_26B3( "prague_mct_wait" );
            maps\_utility::_id_1427( 5 );
            var_0 = common_scripts\utility::get_target_ent( "rooftop_takedown" );
            level.attacker = maps\_utility::_id_272F( "rooftop_stealth_attack_guy" );
            level.attacker thread maps\_utility::_id_2611();
            maps\_utility::_id_13AF();
            level.attacker._id_0D0D = 1;
            level._id_7850 thread _id_524A::_id_51F7( var_0 );
            level.attacker thread _id_524A::_id_51F7( var_0 );
            level.attacker._id_1032 = "delta";
            level.attacker.ignoreall = 1;
            level.attacker.ignoreme = 1;
            var_0 notify( "stop_loop" );
            level.attacker maps\_utility::_id_24F5();
            var_0 thread maps\_anim::_id_11DD( [ level.attacker, level._id_7850 ], "rooftop_kill" );
            level.attacker allowedstances( "crouch" );
            wait 3;
            level.attacker maps\_utility::_id_257D();
            wait 2;
            level._id_7850.a._id_0D55 = 1;
            level._id_7850.allowpain = 1;
            level._id_7850.allowdeath = 1;
            level.attacker.goalheight = 10;
            level.attacker setgoalpos( level.attacker.origin );
            level.attacker.goalradius = 10;
            var_0 = common_scripts\utility::get_target_ent( "rooftop_takedown" );
            level.attacker setgoalpos( var_0.origin );
            level.attacker _id_784C();
            common_scripts\utility::flag_wait( "roof_all_standing" );
            common_scripts\utility::flag_set( "courtyard_air_drop" );
            wait 3;
            level._id_7850.goalradius = 10;
            level._id_7850 allowedstances( "stand" );
            level._id_7850.ignoreall = 0;
            level._id_7850.ignoreme = 0;
            common_scripts\utility::flag_wait( "fire_flare" );
            wait 6;
            level.attacker.ignoreall = 0;
            level.attacker.ignoreme = 0;
            break;
        }

        wait 0.05;
    }
}

_id_7851()
{
    level endon( "_stealth_spotted" );
    level endon( "courtyard_combat_start" );
    common_scripts\utility::flag_set( "turn_on_laser_moment" );
}

_id_7852( var_0 )
{
    var_0 endon( "death" );
    wait 3;
    var_1 = getnode( "teleport_node", "targetname" );
    common_scripts\utility::waitframe();
    level._id_7850 maps\_utility::_id_27A1( var_1 );
    level._id_7850 hide();
}

_id_7853( var_0 )
{
    playfxontag( level._effect["flesh_hit_head_fatal_exit_exaggerated"], level._id_7850, "TAG_WEAPON_CHEST" );
    wait 0.4;
    playfxontag( level._effect["bodyshot2"], level._id_7850, "J_SpineLower" );
}

_id_7854()
{
    level endon( "kill_sniper_nag_lines" );
    wait 4;

    while ( isalive( level._id_7850 ) )
    {
        var_0 = randomintrange( 0, 3 );

        switch ( var_0 )
        {
            case 0:
                thread maps\_utility::_id_11F4( "prague_mct_sniperyuri" );
                wait 4;
            case 1:
                thread maps\_utility::_id_11F4( "prague_mct_takehimdown" );
                wait 4;
            case 2:
                wait 4;
        }

        wait 0.005;
    }
}

_id_7855()
{
    self endon( "death" );
    common_scripts\utility::flag_wait_any( "_stealth_spotted", "courtyard_combat_start" );
    self dodamage( self.health + 300, self.origin );
}

_id_7856()
{
    self waittill( "death" );
}

_id_7857()
{
    self endon( "_stealth_spotted" );
    self hide();
    thread _id_7859();
    self.accuracy = 0.001;
    maps\_utility::_id_27CC();
    self.health = 5;
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.goalradius = 10;
    self endon( "death" );
    thread _id_7879();
    wait 2;
    self endon( "death" );
    self._id_1032 = "generic";
    thread maps\_anim::_id_11C8( self, "prone_idle", "stop_loop" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_two" || self.script_noteworthy == "roof_stealth_one" )
        common_scripts\utility::flag_wait( "roof_start_to_stand" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_epic" )
        common_scripts\utility::flag_wait( "roof_start_to_stand" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_two_kamarov" )
    {
        thread maps\_utility::_id_2611();
        common_scripts\utility::flag_wait( "kill_sniper_nag_lines" );
    }

    self show();
    self._id_0FC6 = 0.5;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_epic" )
        thread _id_785A();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_epic" )
        wait(randomfloatrange( 0.1, 0.7 ));

    var_0 = 0;
    var_0 = randomintrange( 0, 1 );
    self notify( "stop_loop" );

    if ( var_0 == 0 )
        thread maps\_anim::_id_1246( self, "prone_2_stand" );
    else
        thread maps\_anim::_id_1246( self, "prone_to_stand_two" );

    self allowedstances( "stand" );
    var_0 = 0;
    var_0 = randomintrange( 0, 10 );
    var_1 = 0;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_two_kamarov" )
    {
        self allowedstances( "crouch" );
        common_scripts\utility::flag_wait( "roof_start_to_stand" );
        self allowedstances( "stand" );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_two" )
    {
        self._id_0D0D = 1;
        var_1 = 1;
        thread maps\_anim::_id_1246( self, "coup_guard2_jeerC" );
    }

    wait 2.5;

    if ( var_0 >= 5 && level._id_7858 <= 6 )
    {
        if ( var_1 == 1 )
        {

        }
        else if ( var_1 == 0 )
        {
            level._id_7858++;
            var_0 = 0;
            var_0 = randomfloatrange( 0, 1 );

            if ( var_0 == 0 )
                thread maps\_anim::_id_1246( self, "coup_guard2_jeerA" );
            else
                thread maps\_anim::_id_1246( self, "coup_guard2_jeerC" );
        }
    }
    else
        maps\_utility::delaythread( 3, ::_id_785B );

    common_scripts\utility::flag_wait( "roof_all_standing" );
    wait 2;
    wait(randomfloatrange( 1.3, 3.3 ));
    common_scripts\utility::flag_wait( "courtyard_combat_start" );
    wait 4.5;
    maps\_utility::_id_27CD();
    self.ignoreall = 0;
    self.ignoreme = 0;
    wait(randomintrange( 3, 5 ));

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_two_kamarov" )
    {
        thread maps\_utility::_id_1902();
        common_scripts\utility::flag_wait( "kill_sniper_nag_lines" );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_epic" )
        self dodamage( self.health + 300, self.origin );
}

_id_7859()
{
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    wait(randomintrange( 3, 5 ));

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_epic" )
        self dodamage( self.health + 300, self.origin );
}

_id_785A()
{
    wait 5;
    common_scripts\utility::flag_set( "roof_all_standing" );
}

_id_785B()
{
    self endon( "death" );
    var_0 = getaiarray( "axis" );
    self.ignoreall = 0;
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_2 = anglestoforward( self.angles );
    var_2 *= 256;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "roof_stealth_epic" )
        var_1.origin = self.origin + var_2 + ( 0.0, 0.0, -200.0 );
    else
        var_1.origin = self.origin + var_2 + ( 0.0, 0.0, -300.0 );

    var_1 linkto( self );
    maps\_utility::_id_27CC();
    self setentitytarget( var_1 );
    common_scripts\utility::flag_wait( "courtyard_combat_start" );
    wait 4.5;
    common_scripts\utility::waitframe();
    maps\_utility::_id_27CD();
    self clearentitytarget();
}

_id_785C()
{
    var_0 = 0;

    switch ( var_0 )
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
    }
}

_id_785D( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self orientmode( "face point", level.player geteye() );
        wait 0.05;
    }
}

_id_785E()
{

}

_id_785F( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "flashlight" ), level._id_7850, "TAG_FLASH" );
}

_id_7860()
{
    var_0 = getent( "detect_damage_clear_stealth", "targetname" );
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    var_0 common_scripts\utility::trigger_on();
    level endon( "kill_sniper_nag_lines" );
    var_0 waittill( "damage" );
    common_scripts\utility::flag_set( "can_shoot_player_courtyard" );
    common_scripts\utility::flag_set( "courtyard_combat_start" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
    common_scripts\utility::flag_set( "roof_start_to_stand" );
}

_id_7861()
{
    self.goalheight = 100;
    thread _id_786D();
    self endon( "death" );
    common_scripts\utility::flag_wait( "courtyard_combat_start" );
    self.goalradius = 475;
}

_id_7862()
{
    common_scripts\utility::flag_wait( "kill_sniper_nag_lines" );
    level endon( "start_apartments" );
    common_scripts\utility::flag_wait_any( "courtyard_combat_start", "_stealth_spotted", "fire_flare" );
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::get_target_ent( "courtyard_spawner_door_r" );
    var_2 = common_scripts\utility::get_target_ent( "courtyard_spawner_door_l" );
    var_3 = getent( "court_yard_backup_goal", "targetname" );
    var_4 = maps\_utility::_id_272C( "courtyard_backup" );
    var_4 = maps\_utility::_id_2641( "courtyard_backup", "script_noteworthy" );

    foreach ( var_6 in var_4 )
    {
        var_6 maps\_utility::_id_251E();
        var_6.health = 200;
        var_6 thread _id_786D();
        var_6.nododgemove = 1;
        var_6.ignoreme = 1;
        var_6.ignoresuppression = 1;
        var_6.ignoreall = 1;
        var_6.goalradius = 10;
        var_6 setgoalpos( var_3.origin );
    }

    wait 8;

    foreach ( var_6 in var_4 )
    {
        if ( isalive( var_6 ) )
        {
            var_6 maps\_utility::_id_2521();
            var_6.nododgemove = 0;
            var_6.ignoreme = 0;
            var_6.ignoresuppression = 0;
            var_6.ignoreall = 0;
            var_6.goalradius = 275;
            var_6 setgoalpos( var_3.origin );
        }
    }

    wait 1;
    thread _id_524A::_id_5213( var_2, var_1 );
    var_10 = getentarray( "courtyard_fight_good", "targetname" );
    maps\_spawner::_id_2135( var_10 );
    var_11 = getent( "rebel_cover_nodes_one", "targetname" );
    var_11 maps\_utility::_id_2703();
    var_12 = maps\prague_code::_id_53B5( "second_building_ai", "parameters" );

    foreach ( var_6 in var_12 )
    {
        if ( isalive( var_12 ) )
            var_12 dodamage( var_12.health + 300, var_12.origin );
    }

    var_15 = spawn( "script_origin", ( 11916.0, -13038.0, -62.0 ) );
    thread common_scripts\utility::play_sound_in_space( "walla_prague_courtyard_bottom_guys", var_15.origin );
    wait 8;
    var_15 delete();
}

_id_7863()
{
    level endon( "courtyard_combat_start" );
    var_0 = maps\_utility::_id_2640( "courtyard_sniper", "script_noteworthy" );
    var_0 common_scripts\utility::waittill_either( "death", "_stealth_spotted" );
    common_scripts\utility::flag_set( "sniper_shot" );
    common_scripts\utility::flag_set( "courtyard_air_drop" );
}

_id_7864()
{
    var_0 = maps\_vehicle::_id_2881( "plaza_cargo_heli" );
    var_1 = var_0 maps\_vehicle::_id_2A8D();
    var_1._id_1032 = "mi17";
    var_2 = common_scripts\utility::get_target_ent( "plaza_cargo_heli" );
    common_scripts\utility::waitframe();
    var_3 = common_scripts\utility::get_target_ent( "courtyard_airdrop_node" );
    var_4 = maps\_utility::_id_1287( "airdrop_rope" );
    var_5 = maps\_utility::_id_1287( "btr" );
    thread _id_7865( var_1, var_4, var_5 );
    var_6 = [ var_1, var_4, var_5 ];
    var_3 maps\_anim::_id_11BF( var_6, "airdrop_idle" );
    thread _id_7868( var_1, var_5, var_4, var_0 );
    var_3 thread maps\_anim::_id_11DD( var_6, "airdrop_idle" );
    common_scripts\utility::flag_wait( "courtyard_air_drop" );
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    var_3 notify( "stop_loop" );
    var_3 thread maps\_anim::_id_11DD( var_6, "prague_drop_btr" );
    var_7 = common_scripts\utility::get_target_ent( "courtyard_btr_blocker" );
    var_8 = common_scripts\utility::get_target_ent( "courtyard_btr_blocker_player" );
    wait 7.5;
    var_7 solid();
    var_8 solid();
    var_7 disconnectpaths();
}

_id_7865( var_0, var_1, var_2 )
{
    var_0 playloopsound( "mi17_idle_high" );
    common_scripts\utility::flag_wait( "courtyard_air_drop" );
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    wait 5;
    var_0 stoploopsound( "mi17_idle_high" );
    var_0 playsound( "mi17_helicopter_hit" );
    var_0 playloopsound( "mi17_helicopter_dying_loop" );
    wait 7;
    var_0 stoploopsound( "mi17_helicopter_dying_loop" );
    var_0 playsound( "mi17_helicopter_crash" );
}

_id_7866( var_0 )
{
    var_0 playsound( "mi17_helicopter_hit" );
    playfxontag( common_scripts\utility::getfx( "tank_impact_exaggerated_2" ), var_0, "tag_wheel_middle_right" );
    radiusdamage( var_0 gettagorigin( "tag_wheel_middle_right" ), 512, 500, 500 );
    wait 2;
    radiusdamage( var_0 gettagorigin( "tag_wheel_middle_right" ), 75, 500, 500 );
}

_id_7867()
{
    common_scripts\utility::flag_wait( "courtyard_combat_start" );
    self notify( "stop_loop" );
}

_id_7868( var_0, var_1, var_2, var_3 )
{
    level endon( "player_gonna_die" );
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    level common_scripts\utility::waittill_any( "sniper_shot", "_stealth_spotted", "courtyard_combat_start" );
    level notify( "stop_stealth_busted_music" );
    wait 1.3;
    thread _id_524A::_id_520A( "plaza_smoke" );
    common_scripts\utility::flag_set( "fire_flare" );
    maps\_utility::_id_2797( 100 );
    var_4 = spawn( "script_origin", ( 12006.0, -12280.0, 708.0 ) );
    thread common_scripts\utility::play_sound_in_space( "walla_prague_courtyard_attack_left", var_4.origin );
    var_5 = spawn( "script_origin", ( 12896.0, -12284.0, 708.0 ) );
    thread common_scripts\utility::play_sound_in_space( "walla_prague_courtyard_attack_right", var_5.origin );
    level._id_45C0 maps\_utility::_id_109E();
    common_scripts\utility::flag_clear( "sandman_announce_spotted" );
    common_scripts\utility::flag_set( "courtyard_air_drop" );
    thread _id_7870();
    wait 0.5;
    thread _id_7877();
    wait 3.0;
    var_6 = common_scripts\utility::getstruct( "build_fake_molotov_start", "targetname" );
    var_7 = common_scripts\utility::getstruct( "build_fake_molotov_end", "targetname" );
    var_6 thread _id_789D( var_6, var_7 );
    magicbullet( "rpg", ( 11667.6, -12511.1, 735.5 ), ( 12680.5, -12878.5, 376.0 ) );
    wait 0.7;
    magicbullet( "rpg", ( 11850.0, -13168.0, 212.0 ), ( 12680.5, -12878.5, 376.0 ) );
    wait 1.7;
    var_6 = spawn( "script_origin", ( 11979.0, -12259.0, 694.5 ) );
    var_7 = spawn( "script_origin", ( 12083.0, -13243.0, -82.5 ) );
    thread _id_789D( var_6, var_7 );
    var_8 = getaiarray( "axis" );

    foreach ( var_10 in var_8 )
        var_10.ignoreme = 0;

    magicbullet( "rpg_straight", ( 11619.1, -12293.9, 735.148 ), var_0.origin );
    wait 0.5;
    var_12 = common_scripts\utility::getstruct( "courtyard_btr_seconday_landing_two", "targetname" );
    var_13 = getent( "plaza_btr_spawner", "targetname" );
    var_13.origin = var_12.origin;
    var_13.angles = var_12.angles;
    common_scripts\utility::waitframe();
    playfx( level._effect["helicopter_explosion_mi17_woodland"], var_0.origin, ( 0.0, 0.0, -100.0 ) );
    wait 1.6;
    earthquake( 1, 0.4, level.player.origin, 400 );
    wait 2.8;
    wait 3;
    var_6 = spawn( "script_origin", ( 15008.0, -13036.0, 553.0 ) );
    var_7 = spawn( "script_origin", ( 15230.0, -12720.0, -72.0 ) );
    thread _id_789D( var_6, var_7 );
    var_4 delete();
    var_5 delete();
    wait 4;
    playfxontag( common_scripts\utility::getfx( "helicopter_explosion_mi17_woodland" ), var_0, "tag_origin" );
    var_0 delete();
    common_scripts\utility::waitframe();
    var_3 delete();
}

_id_7869()
{
    level endon( "player_gonna_die" );
    common_scripts\utility::flag_wait( "pre_courtyard_ally_clean_up" );
    common_scripts\utility::flag_wait( "courtyard_combat_start" );
    level._id_786A = maps\prague_code::_id_53B5( "courtyard_guys_jeremy", "parameters" );
    var_0 = getent( "turn_on_color_trigger", "targetname" );
    var_1 = getent( "courtyard_support_trigger", "targetname" );
    var_2 = 3;
    level thread _id_5DC4( var_2, "courtyard_retreat_one", var_0, var_1 );
    common_scripts\utility::flag_wait( "courtyard_retreat_one" );
    common_scripts\utility::flag_set( "courtyard_retreat_one" );
    createthreatbiasgroup( "player" );
    level.player setthreatbiasgroup( "player" );
    setthreatbias( "axis", "player", 10000 );
    var_3 = getent( "rebel_cover_nodes_two", "targetname" );
    var_3 maps\_utility::_id_2703();
    wait 5;
    level._id_786A = maps\prague_code::_id_53B5( "courtyard_guys_jeremy", "parameters" );
    level thread _id_786F( "courtyard_one_getaway_trigger" );
    var_0 = getent( "turn_on_color_trigger_two", "targetname" );
    var_1 = getent( "courtyard_support_trigger_two", "targetname" );
    var_2 = 4;
    level thread _id_5DC4( var_2, "retreat_two", var_0, var_1 );
    common_scripts\utility::flag_wait( "retreat_two" );
    common_scripts\utility::flag_set( "retreat_two" );
    maps\_utility::_id_1425( "retreat_two" );
    var_4 = getent( "rebel_cover_nodes_three", "targetname" );
    var_4 maps\_utility::_id_2703();
    wait 5;
    level._id_786A = maps\prague_code::_id_53B5( "courtyard_guys_jeremy", "parameters" );
    level thread _id_786F( "courtyard_two_getaway_trigger" );
    var_0 = getent( "turn_on_color_trigger_three", "targetname" );
    var_1 = getent( "courtyard_support_trigger_three", "targetname" );
    var_2 = 6;
    level thread _id_5DC4( var_2, "retreat_three", var_0, var_1 );
    common_scripts\utility::flag_wait( "retreat_three" );
    common_scripts\utility::flag_set( "retreat_three" );
    common_scripts\utility::flag_set( "fire_flare_two" );
    var_5 = spawn( "script_origin", ( 14142.0, -12533.0, -72.0 ) );
    radiusdamage( var_5.origin, 30, 5000, 100 );
    var_6 = spawn( "script_origin", ( 14388.0, -12492.0, -64.0 ) );
    radiusdamage( var_6.origin, 30, 5000, 100 );
    var_7 = maps\_vehicle::_id_2881( "plaza_btr_attack" );
    thread maps\_utility::_id_11F4( "prague_mct_truckcoming" );
    wait 5;
    radiusdamage( var_5.origin, 30, 5000, 100 );
    radiusdamage( var_6.origin, 30, 5000, 100 );
    level._id_786A = maps\prague_code::_id_53B5( "courtyard_guys_jeremy", "parameters" );
    level thread _id_786F( "courtyard_three_getaway_trigger" );
    var_0 = getent( "turn_on_color_trigger_four", "targetname" );
    var_2 = 4;
    level thread _id_5DC4( var_2, "plaza_btrs_show_up", var_0 );
    common_scripts\utility::flag_wait( "plaza_btrs_show_up" );
    var_8 = getent( "rebel_cover_nodes_five", "targetname" );
    var_8 maps\_utility::_id_2703();
    var_9 = getentarray( "courtyard_support_ai_three", "targetname" );
    maps\_spawner::_id_2135( var_9 );
    maps\_utility::_id_27CA( "courtyard_support_ai_three", ::_id_786B );
}

_id_786B()
{
    var_0 = getent( "courtyard_three_getaway_trigger", "targetname" );
    self.goalradius = 400;
    self.goalheight = 100;
    self setgoalpos( var_0.origin );
}

_id_786C()
{
    var_0 = getent( "turn_on_color_trigger", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    common_scripts\utility::waitframe();

    if ( !isdefined( var_0.realorigin ) )
        var_0.realorigin = var_0.origin;

    if ( var_0.origin == var_0.realorigin )
        var_0.origin += ( 0.0, 0.0, -10000.0 );

    common_scripts\utility::flag_wait( "kill_sniper_nag_lines" );
    maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_wait( "fire_flare" );
    wait 4;
    thread maps\_utility::_id_11F4( "prague_pri_gettochurch" );
    thread maps\_utility::_id_11F4( "prague_mct_letsgoyuri3" );
    wait 3;

    if ( isdefined( var_0.realorigin ) )
        var_0.origin = var_0.realorigin;

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    thread maps\_utility::_id_11F4( "prague_mct_tothestatue" );
    maps\_utility::_id_265B( "allies" );
    level._id_45C0 maps\_utility::_id_0D72( 1 );
    var_0 = getent( "turn_on_color_trigger_two", "targetname" );
    var_0 waittill( "trigger" );
    thread maps\_utility::_id_11F4( "prague_go_6" );
    var_0 = getent( "turn_on_color_trigger_three", "targetname" );
    var_0 waittill( "trigger" );
    thread maps\_utility::_id_11F4( "prague_go_6" );
    var_0 = getent( "turn_on_color_trigger_four", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "plaza_btrs_show_up" );
    wait 1;
    level._id_45C0 setgoalnode( common_scripts\utility::get_target_ent( "sandman_cover_car_slide" ) );
    level._id_45C0.goalradius = 20;
    level._id_45C0 maps\_utility::_id_123B();
}

_id_786D()
{
    createthreatbiasgroup( "player" );
    level.player setthreatbiasgroup( "player" );
    setthreatbias( "axis", "player", 10000 );
    level._id_5DC5++;
    self waittill( "death" );
    level._id_5DC5--;
}

_id_786E()
{
    createthreatbiasgroup( "player" );
    level.player setthreatbiasgroup( "player" );
    setthreatbias( "axis", "player", 10000 );
    wait 8;
    level._id_5DC5++;
    self waittill( "death" );
    level._id_5DC5--;
}

_id_5DC4( var_0, var_1, var_2, var_3 )
{
    while ( !common_scripts\utility::flag( var_1 ) )
    {
        if ( level._id_5DC5 < var_0 )
        {
            if ( isdefined( var_3 ) )
                var_3 maps\_utility::_id_2703();

            common_scripts\utility::flag_set( var_1 );

            if ( isdefined( var_2 ) )
                var_2 maps\_utility::_id_2703();

            break;
        }

        wait 0.05;
    }

    if ( isdefined( var_3 ) )
        var_3 maps\_utility::_id_2703();

    if ( isdefined( var_2 ) )
        var_2 maps\_utility::_id_2703();
}

_id_786F( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    level._id_786A = maps\_utility::_id_2672( level._id_786A );
    var_2 = sortbydistance( level._id_786A, var_1.origin );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3] ) && isalive( var_2[var_3] ) )
        {
            var_2[var_3].goalradius = 1024;
            var_2[var_3] setgoalpos( var_1.origin );
            wait(randomfloatrange( 1, 2 ));
        }
    }
}

_id_7870()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        var_2.ignoreme = 1;
        var_2.ignoreall = 1;
    }

    maps\_utility::_id_272F( "courtyard_ar_guy_build_one" );
    maps\_utility::_id_272F( "courtyard_rpg_guy_build_one" );
    maps\_utility::_id_272F( "courtyard_ar_guy_build_two" );
    maps\_utility::_id_272F( "courtyard_rpg_guy_build_two" );
    maps\_utility::_id_272F( "courtyard_rpg_guy_build_two_third" );
    var_4 = maps\_utility::_id_2641( "courtyard_apt_resistance", "script_noteworthy" );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_4[var_5].ignoreall = 1;
        var_4[var_5].ignoreme = 1;
        var_4[var_5].accuracy = 0.001;
        var_4[var_5] allowedstances( "stand" );
    }

    wait 4.5;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_4[var_5].ignoreall = 0;
        var_4[var_5].ignoreme = 0;
        var_4[var_5].accuracy = 0.001;
    }

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_2.ignoreme = 0;
            var_2.ignoreall = 0;
        }
    }

    common_scripts\utility::flag_wait( "rebels_two" );
    var_8 = spawn( "script_origin", ( 13855.0, -12163.0, 525.0 ) );
    var_9 = spawn( "script_origin", ( 14256.0, -12886.0, -72.0 ) );
    thread _id_789D( var_8, var_9 );
    wait 2;
    var_8 = spawn( "script_origin", ( 14271.0, -12139.0, 581.0 ) );
    var_9 = spawn( "script_origin", ( 14414.3, -12723.1, -85.2649 ) );
    thread _id_789D( var_8, var_9 );
    var_8 = spawn( "script_origin", ( 13507.0, -13149.0, 856.0 ) );
    var_9 = spawn( "script_origin", ( 14297.0, -12321.1, -28.0 ) );
    thread _id_789D( var_8, var_9 );
    wait 13;
    var_4 = maps\_utility::_id_2641( "courtyard_apt_resistance", "script_noteworthy" );
    var_10 = maps\_utility::_id_2640( "rooftop_takedown_guy", "targetname" );

    if ( isalive( var_10 ) )
        var_10 dodamage( var_10.health + 300, var_10.origin );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        var_4[var_5] dodamage( var_4[var_5].health + 300, var_4[var_5].origin );

    var_4 = maps\prague_code::_id_53B5( "rooftop_courtyard_apt_resistance", "parameters" );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        var_4[var_5] dodamage( var_4[var_5].health + 300, var_4[var_5].origin );

    common_scripts\utility::flag_wait( "retreat_three" );
    var_8 = spawn( "script_origin", ( 15008.0, -13036.0, 553.0 ) );
    var_9 = spawn( "script_origin", ( 15230.0, -12720.0, -72.0 ) );
    thread _id_789D( var_8, var_9 );
    level._id_45C0.ignoreme = 1;
}

_id_7871( var_0 )
{
    level endon( "courtyard_combat_start" );
    var_1 = maps\_utility::_id_2641( "plaza_btr_riders", "script_noteworthy" );
    wait 2.0;
    var_2 = common_scripts\utility::get_target_ent( "btr_enter_pos" );
    var_1 = sortbydistance( var_1, var_2.origin );

    foreach ( var_4 in var_1 )
    {
        wait(randomfloatrange( 0.2, 0.6 ));
        var_4 maps\_utility::_id_140C();
        var_4 notify( "end_patrol" );
        var_4 setgoalpos( var_2.origin );
        var_4 thread _id_524A::_id_5214();
    }

    for (;;)
    {
        var_6 = 1;

        foreach ( var_4 in var_1 )
        {
            if ( isdefined( var_4 ) )
            {
                var_6 = 0;
                break;
            }
        }

        if ( var_6 )
            break;

        wait 0.1;
    }

    wait 1.0;
    var_9 = common_scripts\utility::get_target_ent( "plaza_btr_exit_node" );
    var_9 = var_9 common_scripts\utility::get_target_ent();
    common_scripts\utility::flag_set( "courtyard_btr_left" );
    var_10 = common_scripts\utility::get_target_ent( "courtyard_btr_blocker" );
    var_10 notsolid();
    var_10 connectpaths();
    var_10 delete();
    var_10 = common_scripts\utility::get_target_ent( "courtyard_btr_blocker_player" );
    var_10 notsolid();
    var_11 = maps\_utility::_id_1FA3();
    var_0 delete();
    var_11 maps\_vehicle::_id_2B17( "running spotlight_turret" );
    var_11 endon( "death" );
    wait 2.0;

    while ( isdefined( var_9 ) )
    {
        var_11 vehicledriveto( var_9.origin, 15 );

        while ( distance2d( var_11.origin, var_9.origin ) > 32 )
            wait 0.1;

        if ( !isdefined( var_9.target ) )
            break;

        var_9 = var_9 common_scripts\utility::get_target_ent();
    }

    var_11 delete();
}

_id_7872()
{
    self.ignoreall = 1;
    self endon( "death" );
}

_id_7873()
{
    var_0 = common_scripts\utility::get_target_ent();
    thread _id_7874( self, var_0 );
    self endon( "death" );
    maps\_utility::_id_24F5();
    var_1 = "TAG_INHAND";
    self._id_5386 = spawn( "script_model", self.origin );
    var_2 = self._id_5386;
    var_2.owner = self;
    var_2.origin = self gettagorigin( var_1 );
    var_2.angles = self gettagangles( var_1 );
    var_2 setmodel( "com_flashlight_off" );
    var_2 linkto( self, var_1 );
    var_0 thread maps\_anim::_id_11C8( self, var_0.animation );
    playfxontag( common_scripts\utility::getfx( "flashlight" ), var_2, "TAG_LIGHT" );
    common_scripts\utility::flag_wait_any( "courtyard_combat_start", "_stealth_spotted" );
    var_2 delete();
}

_id_7874( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "end_reaction" );
    var_0 endon( "animation_killed_me" );
    var_0 addaieventlistener( "bulletwhizby" );
    var_0 addaieventlistener( "gunshot_teammate" );
    var_0 addaieventlistener( "projectile_impact" );
    var_0 common_scripts\utility::waittill_any( "damage", "_stealth_bad_event_listener", "enemy", "courtyard_combat_start", "_stealth_spotted" );
    common_scripts\utility::flag_set( "courtyard_combat_start", "roof_start_to_stand" );
    var_0 notify( "stop_loop" );
    var_0 stopanimscripted();
    var_0 maps\_utility::_id_257D();
    var_1 notify( "stop_loop" );
}

_id_7875( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "end_reaction" );
    var_0 endon( "animation_killed_me" );
    var_0 common_scripts\utility::waittill_any( "damage", "_stealth_bad_event_listener", "enemy", "courtyard_combat_start" );
    var_0 stopanimscripted();
    var_1 stopanimscripted();
    self notify( "stop_loop" );
}

_id_7876( var_0 )
{
    var_0 thread maps\prague_code::_id_52EE( self );
    wait 25;
    var_1 = var_0 getlightintensity();

    while ( var_1 > 0 )
    {
        var_1 -= 0.1;
        var_0 setlightintensity( var_1 );
        wait 0.05;
    }

    var_0 notify( "kill_light" );
    wait 0.05;
    var_0 setlightintensity( 0 );
}

_id_7877()
{
    var_0 = getentarray( "shutter_left_jeremy", "targetname" );
    var_1 = getentarray( "shutter_right_jeremy", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            wait(randomfloatrange( 0.1, 0.4 ));
            var_1[var_2] rotateyaw( 120, 0.5, 0.1, 0.2 );
            wait(randomfloatrange( 0.6, 0.7 ));
            var_0[var_2] rotateyaw( -120, 0.5, 0.1, 0.2 );
        }
    }
}

_id_7878()
{
    common_scripts\utility::flag_wait( "heli_support_courtyard" );
    var_0 = maps\_vehicle::_id_2881( "plaza_heli_support_two" );
    var_0 thread maps\prague_code::_id_5358();
    thread maps\_utility::_id_11F4( "prague_mct_helosinbound" );
    wait 4;
    var_1 = spawn( "script_origin", ( 14426.0, -12638.0, -64.0 ) );
    var_0 maps\prague_code::_id_535E( var_1 );

    while ( isalive( var_0 ) )
    {
        var_1 moveto( ( 14272.0, -12254.0, -72.0 ), 3.3 );
        wait 3.3;
        var_1 moveto( ( 14416.0, -12886.0, -72.0 ), 3.3 );
        wait 3.3;
    }
}

_id_7879()
{
    level endon( "start_apartments" );
    self endon( "death" );
    common_scripts\utility::flag_wait( "courtyard_combat_start" );
    level._id_789B = 0;

    for (;;)
    {
        level._id_789B = 0;
        maps\_utility::_id_2750( 1, 0.92 );

        if ( level.player maps\_utility::_id_167C() && level.player adsbuttonpressed() )
        {
            maps\_utility::_id_2750( 1 );
            level._id_789C++;

            if ( level._id_789C == 0 )
            {
                if ( level._id_789B == 0 )
                {
                    level._id_789B = 1;
                    thread maps\_utility::_id_26B3( "prague_mct_onourside" );
                    wait 5;
                }
            }

            if ( level._id_789C == 1 )
            {
                if ( level._id_789B == 0 )
                {
                    level._id_789B = 1;
                    thread maps\_utility::_id_26B3( "prague_mct_friendlies" );
                    wait 5;
                }
            }

            if ( level._id_789C == 2 )
                wait 5;

            if ( level._id_789C >= 3 )
                wait 5;
        }

        wait 0.05;
    }
}

_id_789D( var_0, var_1, var_2 )
{
    var_3 = magicgrenade( "molotov", var_0.origin, var_1.origin, 5 );

    if ( !isdefined( var_3 ) )
        return;

    var_3 waittill( "death" );

    if ( isdefined( var_1.script_exploder ) )
        common_scripts\utility::exploder( var_1.script_exploder );

    if ( isdefined( var_2 ) )
    {
        var_4 = vectortoangles( var_1.origin - var_0.origin );
        var_5 = var_3.origin;
        var_6 = spawn( "script_model", var_5 );
        var_6 setmodel( "tag_origin" );
        var_6.angles = ( 270.0, 180.0, 180.0 );
        var_7 = spawn( "script_model", var_5 );
        var_7 setmodel( "tag_origin" );
        var_7.angles = ( 0.0, 0.0, 0.0 );
        var_6 linkto( var_7 );
        var_7.angles = ( 0.0, 180.0, 0.0 ) + var_4;
        playfxontag( common_scripts\utility::getfx( "molotov_trail_F" ), var_6, "tag_origin" );

        for ( var_8 = 0; var_8 < 20; var_8++ )
        {
            var_9 = anglestoforward( var_4 );
            var_10 = var_5 + var_9 * ( var_8 * 10 ) + ( 0.0, 0.0, 4.0 );
            radiusdamage( var_10, 32, 100, 100 );
            wait 0.05;
        }
    }
}

_id_789E()
{
    level._id_5323 = "off";
    common_scripts\utility::flag_wait( "heli_support_courtyard" );
    level._id_5323 = "player";
    level._id_53BE = 20;
    level._id_53BF = 30;
    level notify( "play_loud_speaker" );
}

_id_789F()
{

}

_id_78A0()
{
    var_0 = common_scripts\utility::getstruct( "change_model", "script_noteworthy" );
    var_0 setmodel();
}
