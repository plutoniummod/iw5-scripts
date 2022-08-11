// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

start()
{
    common_scripts\utility::flag_set( "start_stealth_guard_patroll" );
    common_scripts\utility::flag_set( "ruins_done" );
    maps\_vehicle::_id_2A98( "courtyard_stealth_btr1" );
    maps\_vehicle::_id_2A98( "courtyard_stealth_btr2" );
    maps\_utility::_id_272C( "courtyard_stealth_guys", 1 );
    maps\_utility::_id_272C( "courtyard_activity_guys", 1 );
    maps\castle_code::_id_8094( "start_courtyard_stealth", maps\castle_code::_id_8093 );
    maps\_shg_common::move_player_to_start( "start_courtyard_stealth" );
    common_scripts\utility::flag_set( "player_approaches_overlook" );
    common_scripts\utility::flag_set( "stadium_lights_on" );
    common_scripts\utility::flag_set( "courtyard_activity_done" );
    getent( "startvista", "targetname" ) hide();
    maps\castle_courtyard_activity::_id_8095();
}

_id_8096()
{
    maps\_vehicle::_id_2A98( "courtyard_stealth_btr1" );
    maps\_vehicle::_id_2A98( "courtyard_stealth_btr2" );
    maps\_utility::_id_272C( "courtyard_stealth_guys", 1 );
    maps\_utility::_id_272C( "courtyard_activity_guys", 1 );
    common_scripts\utility::flag_set( "stealth_move_to_crawl_truck" );
    common_scripts\utility::flag_set( "stealth_price_crawl_under_truck" );
    common_scripts\utility::flag_set( "stealth_player_under_truck" );
    common_scripts\utility::flag_set( "stadium_lights_on" );
    common_scripts\utility::flag_set( "courtyard_activity_done" );
    common_scripts\utility::flag_set( "ruins_done" );
    var_0 = getentarray( "road_patrollers", "script_noteworthy" );
    maps\_utility::_id_135B( var_0 );
    maps\castle_code::_id_8094( "start_platform_crawl", maps\castle_code::_id_8093 );
    maps\_shg_common::move_player_to_start( "start_platform_crawl" );
    var_1 = maps\castle_code::_id_8097( "ai_motorpool_melee", "script_noteworthy" );
    var_1 common_scripts\utility::delaycall( 0.05, ::delete );
    common_scripts\utility::flag_set( "player_approaches_overlook" );
    common_scripts\utility::flag_set( "stealth_player_in_motorpool" );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
    getent( "startvista", "targetname" ) hide();
    maps\castle_courtyard_activity::_id_8095();
}

_id_64AB()
{
    maps\_utility::_id_27CA( "courtyard_stealth_guys", ::_id_8098 );
    maps\_utility::_id_27CA( "courtyard_activity_guys", ::_id_8099 );
    maps\_utility::_id_27CA( "courtyard_stealth_btr1", ::_id_809A );
    maps\_utility::_id_27CA( "courtyard_stealth_btr2", ::_id_809C );
}

_id_8098()
{
    thread _id_0264();
    maps\_utility::_id_282D( self, "courtyard_stealth" );
}

_id_0264()
{
    if ( level._id_1F19 != "platform_crawl" && ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "road_patrollers" ) )
    {
        if ( !isdefined( level._id_0265 ) )
        {
            level._id_0265 = self;
            level._id_0265._id_1032 = "road_patroller_1";
            thread _id_0267();
        }
        else
        {
            level._id_0266 = self;
            level._id_0266._id_1032 = "road_patroller_2";
            thread _id_0267();
            thread _id_0268();
        }
    }
}

_id_0267()
{
    common_scripts\utility::waittill_either( "damage", "death" );
    level notify( "stop_road_patrollers_conv" );

    if ( isdefined( self ) )
        self stopsounds();
}

_id_0268()
{
    level endon( "_stealth_spotted" );
    level endon( "stop_road_patrollers_conv" );
    common_scripts\utility::flag_wait( "start_road_patrollers_conv" );
    level._id_0265 maps\_utility::_id_168C( "castle_ru3_crazy" );
    wait 0.5;
    level._id_0266 maps\_utility::_id_168C( "castle_ru4_andtellhimwhat" );
    wait 0.5;
    level._id_0265 maps\_utility::_id_168C( "castle_ru3_thetruth" );
    wait 0.5;
    level._id_0266 maps\_utility::_id_168C( "castle_ru4_submitsreport" );
    wait 0.5;
    level._id_0265 maps\_utility::_id_168C( "castle_ru3_betterthat" );
    wait 0.5;
    level._id_0266 maps\_utility::_id_168C( "castle_ru4_notanymore" );
    wait 0.5;
    level._id_0265 maps\_utility::_id_168C( "castle_ru3_gettingbetter" );
    wait 0.5;
    level._id_0266 maps\_utility::_id_168C( "castle_ru4_thanks" );
    wait 0.5;
    level._id_0265 maps\_utility::_id_168C( "castle_ru3_justfalloff" );
}

_id_8099()
{
    maps\_utility::_id_282D( self, "courtyard_stealth" );
}

_id_809A()
{
    level._id_809B = self;
    level._id_809B maps\_vehicle::_id_2A3D();
    maps\_utility::_id_282D( self, "courtyard_stealth" );
    self waittill( "damage" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_809C()
{
    level._id_809D = self;
    level._id_809D maps\_vehicle::_id_2A3D();
    maps\_utility::_id_282D( self, "courtyard_stealth" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "objective_motorpool_melee" );
    common_scripts\utility::flag_init( "objective_motorpool_melee_complete" );
    common_scripts\utility::flag_init( "objective_bomb_plant" );
    common_scripts\utility::flag_init( "platform_bomb_planted" );
    common_scripts\utility::flag_init( "Price_Plant_bomb_instead" );
    common_scripts\utility::flag_init( "motorpool_melee_guards_leave" );
    common_scripts\utility::flag_init( "price_under_truck" );
    common_scripts\utility::flag_init( "price_plants_truckc4" );
    common_scripts\utility::flag_init( "price_ready_to_catch" );
    common_scripts\utility::flag_init( "animating_stealth_catch" );
    common_scripts\utility::flag_init( "price_kill_melee_guard" );
    common_scripts\utility::flag_init( "animating_stealth_melee" );
    common_scripts\utility::flag_init( "platform_flashlight_passed" );
    common_scripts\utility::flag_init( "guard_jumped_down" );
    common_scripts\utility::flag_init( "price_run_up_security_office" );
    common_scripts\utility::flag_init( "move_price_up_to_bomb_plant" );
    common_scripts\utility::flag_init( "platform_guy_away" );
    common_scripts\utility::flag_init( "player_planted_bomb" );
    common_scripts\utility::flag_init( "platform_light_on" );
    common_scripts\utility::flag_init( "start_platform_guards_conv" );
    common_scripts\utility::flag_init( "start_road_patrollers_conv" );
    common_scripts\utility::flag_init( "safe_prone_area" );
    common_scripts\utility::flag_init( "safe_crouch_area" );
    common_scripts\utility::flag_init( "player_in_backcrawl" );
    common_scripts\utility::flag_init( "player_approaches_exit1" );
    common_scripts\utility::flag_init( "price_say_go" );
    common_scripts\utility::flag_init( "price_say_some_timing" );
    common_scripts\utility::flag_init( "price_say_your_turn" );
    common_scripts\utility::flag_init( "price_say_wait_for_flashlight" );
    common_scripts\utility::flag_init( "player_going_first" );
}

main()
{
    _id_80A5();
    level._id_4877._id_80D8 = 0;
    level thread _id_80E4();
    thread _id_80A6();
    level thread _id_80EA();
    common_scripts\utility::flag_wait( "courtyard_activity_done" );
    maps\_utility::_id_265A( "axis" );
    thread _id_80FF();
    level._id_809E = getent( "platform_bomb", "targetname" );
    level._id_809E hide();
    level._id_809F = getent( "price_truck_bomb", "targetname" );
    level._id_809F delete();
    level thread _id_80FC();
    level thread _id_80FE();
    maps\castle_code::_id_80A0( 5 );
    maps\castle_code::_id_80A1( 3, 10 );
    maps\castle_code::_id_80A2( 3, 6 );
    maps\_utility::_id_265A( "allies" );
    maps\castle_code::_id_5296( ::_id_80D4 );
    common_scripts\utility::flag_wait( "stealth_player_in_motorpool" );
    maps\castle_code::_id_80A3( "courtyard_stealth" );
    level._id_80A4 thread _id_80F5();
    common_scripts\utility::flag_wait( "stealth_move_to_crawl_truck" );
    level thread _id_80C1();
    level thread _id_80F0( "truck_hint", "stealth_player_under_truck" );
    level thread _id_80F0( "platform_hint", "player_under_platform" );
    level thread _id_80F7();
    _id_80B2();
    _id_80C0();
    level waittill( "price_say_security_office" );
    common_scripts\utility::flag_wait( "price_run_up_security_office" );
    maps\_utility::_id_265B( "axis" );
    level thread _id_80F9();
}

_id_80A5()
{

}

_id_80A6()
{
    level endon( "courtyard_stealth_cleanup" );
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_80A7();

    var_4 = 0;
    var_5 = 3;
    var_6 = maps\_utility::_id_229D();

    switch ( var_6 )
    {
        case "medium":
            var_5 = 2;
            break;
        case "hard":
            var_5 = 1;
            break;
        case "fu":
            var_5 = 0;
            break;
    }

    while ( var_4 <= var_5 )
    {
        level waittill( "truck_shot" );
        var_4++;

        if ( !common_scripts\utility::flag( "stealth_player_in_motorpool" ) )
            break;
    }

    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_80A7()
{
    level endon( "courtyard_stealth_cleanup" );
    self waittill( "damage" );
    level notify( "truck_shot" );
}

_id_80A8()
{
    self endon( "death" );
    self endon( "stealth_enemy_endon_alert" );
    self endon( "bulletwhizby" );
    self endon( "flashbang" );
    self endon( "grenade danger" );
    self endon( "explode" );
    level endon( "_stealth_spotted" );
    thread maps\castle_code::_id_80A9();
    self._id_1032 = self.script_noteworthy;
    maps\castle_code::_id_80AA( self, "truckguard_idle" );
}

_id_80AB()
{
    self endon( "death" );
    self endon( "stealth_enemy_endon_alert" );
    self endon( "bulletwhizby" );
    self endon( "flashbang" );
    self endon( "grenade danger" );
    self endon( "explode" );
    level endon( "_stealth_spotted" );
    self._id_1032 = self.script_noteworthy;
    thread maps\castle_code::_id_80AC();
    thread _id_80AE();

    if ( isdefined( self._id_1032 ) )
        self._id_0EC6 = 1;

    wait(randomfloat( 0.5 ));
    thread maps\_patrol::_id_204E( self.target );
    self waittill( "reached_path_end" );
    thread maps\_anim::_id_124E( self, "pairguards_idle" );
    common_scripts\utility::flag_wait( "price_under_truck" );
    maps\castle_code::_id_80AD();
    var_0 = undefined;

    switch ( self.script_noteworthy )
    {
        case "activity_group2_guard1":
            var_0 = "motorpool_patrol_path1";
            break;
        case "activity_group2_guard2":
            var_0 = "motorpool_patrol_path2";
            break;
    }

    if ( isdefined( var_0 ) )
        thread maps\_patrol::_id_204E( var_0 );
}

_id_80AE()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    self waittill( "enemy" );

    if ( self.script_noteworthy == "activity_group2_guard2" )
    {
        wait 1.5;

        if ( isalive( self ) && !common_scripts\utility::flag( "price_under_truck" ) )
        {
            level._id_4877 maps\_utility::delaythread( 1, maps\_utility::_id_168C, "castle_pri_dobetter" );
            level._id_4877 shoot();
            maps\_utility::_id_2749();
        }
    }
}

_id_80AF()
{
    level endon( "_stealth_spotted" );
    var_0 = maps\castle_code::_id_7A41( "anim_align_road" );
    var_1 = maps\castle_code::_id_8097( "activity_group2_guard3", "script_noteworthy" );
    var_0 thread maps\castle_code::_id_80AA( var_1, "truckguard_idle" );
    var_2 = maps\castle_code::_id_8097( "activity_group2_guard1", "script_noteworthy" );
    var_3 = maps\castle_code::_id_8097( "activity_group2_guard2", "script_noteworthy" );
    var_3 thread _id_80B0( "motorpool_patrol_path2" );
    var_2 thread _id_80B0( "motorpool_patrol_path1" );
    var_4 = getent( "player_detection_trigger", "targetname" );
    var_5 = -161;
    var_6 = -16;

    for (;;)
    {
        if ( isalive( var_2 ) || isalive( var_2 ) )
        {
            wait 0.05;
            continue;
        }

        for (;;)
        {
            var_4 waittill( "trigger" );

            if ( level.player.angles[1] > var_5 && level.player.angles[1] < var_6 )
            {
                common_scripts\utility::flag_set( "move_price_up_to_bomb_plant" );
                common_scripts\utility::flag_set( "stealth_move_to_crawl_truck" );
                common_scripts\utility::flag_set( "price_say_go" );
                common_scripts\utility::flag_set( "stealth_price_crawl_under_truck" );
                common_scripts\utility::flag_set( "stealth_player_under_truck" );
                return;
            }

            wait 0.05;
        }
    }
}

_id_80B0( var_0 )
{
    self endon( "death" );
    self endon( "awareness_alert_level" );
    self endon( "bulletwhizby" );
    var_1 = maps\castle_code::_id_7A41( "anim_align_road" );
    var_1 maps\castle_code::_id_80B1( self, "pairguards_intro" );
    var_1 thread maps\castle_code::_id_80AA( self, "pairguards_idle" );
    common_scripts\utility::flag_wait( "stealth_price_crawl_under_truck" );
    maps\castle_code::_id_80AD();
    thread maps\_patrol::_id_204E( var_0 );
}

_id_80B2()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "price_kill_guard" );
    level endon( "_stealth_spotted" );
    var_0 = maps\castle_code::_id_8097( "ai_motorpool_melee", "script_noteworthy" );
    var_0._id_80B3 = 0;
    level._id_80B4 = var_0;
    var_0 thread _id_80B9();
    var_0 endon( "death" );
    common_scripts\utility::flag_wait( "objective_motorpool_melee" );
    level thread maps\castle_code::_id_80B5();
    var_0 thread _id_80BA();
    var_0 _id_80BB();
    level.player allowmelee( 1 );

    if ( common_scripts\utility::flag( "animating_stealth_melee" ) )
        var_0 thread _id_80BD();

    level thread maps\castle_code::_id_606E();
}

_id_80B6()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    level endon( "animating_stealth_melee" );
    level endon( "animating_stealth_catch" );
    var_0 = maps\castle_code::_id_7A41( "anim_align_road" );
    wait 20;
    level waittill( "sprint_go" );
    level notify( "price_kill_guard" );
    self.maxhealth = 10000;
    self.health = 10000;
    maps\_utility::_id_1057();
    self.allowdeath = 0;
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_lostyouredge" );
    level._id_80B7 _id_80BF();
    level thread maps\_utility::_id_27BD();
    level._id_4877._id_80B8 = 1;
    var_0 thread maps\_anim::_id_1246( level._id_4877, "price_shoot_guard" );
    level._id_4877 waittill( "start_melee_guard_anim" );
    var_0 maps\_anim::_id_1246( self, "price_shoot_melee" );
    self.allowdeath = 1;
    _id_80BE( self );
    level._id_4877._id_80B8 = 0;
    common_scripts\utility::flag_set( "price_kill_melee_guard" );
    common_scripts\utility::flag_set( "objective_motorpool_melee_complete" );
}

_id_80B9()
{
    level._id_80B7 = self;
    self._id_1032 = "melee_victim";
    maps\_utility::_id_2611();
    var_0 = spawn( "script_origin", self.origin );
    self linkto( var_0 );
    common_scripts\utility::waittill_any_ents( self, "death", level, "_stealth_spotted" );

    if ( isalive( self ) && !common_scripts\utility::flag( "animating_stealth_catch" ) )
    {
        self unlink();

        if ( isdefined( self._id_0D04 ) && self._id_0D04 )
            maps\_utility::_id_1902();
    }

    var_0 delete();
}

_id_80BA()
{
    self endon( "death" );
    level endon( "animating_stealth_catch" );
    level endon( "_stealth_spotted" );
    level endon( "price_kill_guard" );
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( _id_80BC( self ) )
        {
            level.player allowmelee( 0 );

            if ( !var_0 )
                var_0 = 1;

            if ( level.player meleebuttonpressed() )
            {
                level.player allowmelee( 1 );
                var_0 = 0;
                common_scripts\utility::flag_set( "animating_stealth_melee" );
                return;
            }
        }
        else
        {
            level.player allowmelee( 1 );

            if ( var_0 )
                var_0 = 0;

            if ( !isalive( self ) )
                return;
        }
    }
}

_id_80BB()
{
    self endon( "death" );
    level endon( "animating_stealth_melee" );
    level endon( "_stealth_spotted" );
    level endon( "price_kill_guard" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    self._id_80B3 = 1;

    if ( self.alertlevel != "noncombat" )
        common_scripts\utility::flag_set( "animating_stealth_catch" );
    else if ( var_4 == "MOD_MELEE" )
        common_scripts\utility::flag_set( "animating_stealth_melee" );
    else if ( common_scripts\utility::flag( "price_ready_to_catch" ) )
        common_scripts\utility::flag_set( "animating_stealth_catch" );
    else
    {
        maps\_utility::_id_1902();
        maps\_utility::_id_2749();
    }
}

_id_80BC( var_0 )
{
    var_1 = 0;

    if ( isalive( var_0 ) && level.player getstance() != "prone" && var_0.alertlevel == "noncombat" )
    {
        var_2 = distancesquared( var_0.origin, level.player.origin );

        if ( var_2 < 16900 )
        {
            var_3 = maps\_utility::_id_1FBD( var_0 gettagorigin( "J_Neck" ), 0.7, 1 );
            var_4 = vectordot( anglestoforward( var_0.angles ), anglestoforward( level.player getplayerangles() ) );
            var_5 = var_4 > 0.5;
            var_1 = var_3 && var_5;
        }
    }

    return var_1;
}

_id_80BD()
{
    common_scripts\utility::flag_wait( "animating_stealth_melee" );
    maps\_audio::aud_send_msg( "player_stealth_kill" );
    self.team = "neutral";
    self.allowdeath = 0;
    maps\_utility::_id_0A23( 1 );
    maps\_utility::_id_2612( 1 );
    _id_80BF();
    level.player.ignoreme = 1;
    level.player setstance( "stand" );
    level.player freezecontrols( 1 );
    wait 0.05;
    var_0 = maps\castle_code::_id_7A41( "anim_align_road" );
    var_0 thread maps\castle_code::_id_7A47( "stealth_melee", maps\_utility::_id_2766( self, level._id_4877 ), 1, 0.25 );
    level.player._id_7A48 attach( "weapon_parabolic_knife", "TAG_WEAPON_RIGHT", 1 );
    wait 1;
    playfxontag( common_scripts\utility::getfx( "knife_attack_throat_fx" ), level.player._id_7A48, "tag_knife_fx" );
    playfxontag( common_scripts\utility::getfx( "knife_attack_throat_fx2" ), self, "J_Neck" );
    level._id_4877 waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_clear( "animating_stealth_melee" );
    level.player freezecontrols( 0 );
    level.player.ignoreme = 0;
    _id_80BE( self );
    common_scripts\utility::flag_set( "objective_motorpool_melee_complete" );
}

_id_80BE( var_0 )
{
    if ( isdefined( var_0._id_0D04 ) && var_0._id_0D04 )
        var_0 maps\_utility::_id_1902();

    var_0.a._id_0D55 = 1;
    var_0 maps\_utility::_id_26F6( 1 );
    var_0 maps\_utility::_id_2749();
}

_id_80BF()
{
    self.ignoreall = 1;
}

_id_80C0()
{
    level thread _id_80C4();
}

_id_80C1()
{
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    for ( var_0 = 1; var_0 <= 5; var_0++ )
    {
        if ( var_0 == 3 )
            continue;

        var_1 = maps\castle_code::_id_8097( "activity_group3_guard" + var_0, "script_noteworthy" );
        var_1._id_1032 = "platformguard" + var_0;
        var_1 thread _id_80CD();
        var_1._id_0EC6 = 1;

        if ( isdefined( var_1._id_1032 ) && var_1._id_1032 == "platformguard1" )
        {
            level._id_0269 = var_1;
            thread _id_026B();
        }

        if ( isdefined( var_1._id_1032 ) && var_1._id_1032 == "platformguard2" )
        {
            level._id_026A = var_1;
            thread _id_026B();
        }
    }

    var_1 = getent( "platform_flashlight_guy", "targetname" ) maps\_utility::_id_166F( 1 );

    if ( maps\_utility::_id_13AF( var_1 ) )
    {

    }

    var_1 thread _id_80D0();
    level._id_80C2 = var_1;
    thread _id_026C();
}

_id_026B()
{
    common_scripts\utility::waittill_either( "damage", "death" );
    level notify( "stop_ruins_patrol_conv" );
}

_id_026C()
{
    level endon( "_stealth_spotted" );
    level endon( "stop_platform_guards_conv" );
    common_scripts\utility::flag_wait( "start_platform_guards_conv" );
    level._id_0269 maps\_utility::_id_168C( "castle_ru3_lookbusy" );
    wait 0.5;
    level._id_026A maps\_utility::_id_168C( "castle_ru4_nothingtodo" );
    wait 0.5;
    level._id_0269 maps\_utility::_id_168C( "castle_ru3_someaction" );
    wait 0.5;
    level._id_026A maps\_utility::_id_168C( "castle_ru4_dieofboredom" );
}

_id_80C3()
{
    self endon( "death" );

    for (;;)
    {
        self waittillmatch( "crawl", "rumble" );
        level.player playrumbleonentity( "damage_light" );
    }
}

_id_80C4()
{
    level endon( "courtyard_stealth_cleanup" );
    level endon( "_stealth_spotted" );
    level endon( "price_plant_bomb_instead" );
    var_0 = getent( "trig_platform_bomb", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_0 thread _id_80C6();
    common_scripts\utility::flag_wait( "objective_bomb_plant" );
    var_1 = maps\castle_code::_id_7A41( "backward_crawl" );
    var_1 thread _id_80DB();
    var_0 childthread _id_80C5();
    level._id_809E show();
    var_0 waittill( "trigger" );
    var_0 delete();
    level thread _id_80C7();
}

_id_80C5()
{
    self endon( "trigger" );

    for (;;)
    {
        var_0 = vectornormalize( level._id_809E.origin - level.player.origin );
        var_1 = anglestoforward( level.player getplayerangles() );
        var_2 = vectornormalize( ( var_0[0], var_0[1], 0 ) );
        var_3 = vectornormalize( ( var_1[0], var_1[1], 0 ) );
        var_4 = vectordot( var_2, var_3 );
        var_5 = vectordot( var_0, var_1 );
        var_6 = 0.75;
        var_7 = 0.95;
        var_8 = distance( level._id_809E.origin, level.player.origin );

        if ( var_8 < 50 )
        {
            var_6 = 0.6;
            var_7 = 0.75;
        }

        if ( var_5 > var_6 && var_4 > var_7 )
            common_scripts\utility::trigger_on();
        else
            common_scripts\utility::trigger_off();

        wait 0.2;
    }
}

_id_80C6()
{
    level endon( "courtyard_stealth_cleanup" );
    level common_scripts\utility::waittill_any( "_stealth_spotted", "price_plant_bomb_instead" );

    if ( isdefined( self ) )
        common_scripts\utility::trigger_off();

    level._id_809E hide();
}

_id_80C7()
{
    common_scripts\utility::flag_set( "player_planted_bomb" );
    level endon( "courtyard_stealth_cleanup" );
    level endon( "price_plant_bomb_instead" );
    level.player freezecontrols( 1 );
    level.player disableweapons();
    var_0 = maps\_utility::_id_1287( "player_rig", level.player.origin - ( 0.0, 0.0, 5.0 ) );
    var_0.angles = level.player.angles;
    var_0 thread maps\_anim::_id_1246( var_0, "bomb_plant" );
    thread _id_80C9( var_0 );
    common_scripts\utility::flag_set( "platform_bomb_planted" );
    level notify( "platform_bomb_planted" );
    maps\_audio::aud_send_msg( "player_plant_c4_platform" );
    var_0 attach( "weapon_c4", "tag_weapon", 1 );
    level._id_809E delete();
    var_0 waittillmatch( "single anim", "end" );
    level.player freezecontrols( 0 );
    level.player enableweapons();
    var_0 delete();
    level.player playersetgroundreferenceent( undefined );
    level._id_80C8 delete();
}

_id_80C9( var_0 )
{
    level._id_80C8 = spawn( "script_origin", level.player.origin );
    level._id_80C8.angles = var_0 gettagangles( "tag_weapon_left" );
    var_1 = 90 - level.player getplayerangles()[1];
    level._id_80C8 linkto( var_0, "tag_weapon_left", ( 0.0, 0.0, 0.0 ), ( 0, var_1, 0 ) );
    var_2 = level.player getplayerangles();

    if ( var_2[0] < 0 )
    {
        var_3 = 0;

        while ( !var_3 )
        {
            wait 0.05;
            var_2 = level.player getplayerangles();
            var_4 = min( abs( level._id_80C8.angles[0] ), abs( level._id_80C8.angles[0] - 360 ) );
            var_5 = min( abs( level._id_80C8.angles[2] ), abs( level._id_80C8.angles[2] - 360 ) );
            var_6 = var_4 + var_5;
            var_7 = var_2[0] * -1;

            if ( var_7 - var_6 < 0 )
                var_3 = 1;
        }
    }

    level.player setplayerangles( ( 0, var_2[1], var_2[2] ) );
    level.player playersetgroundreferenceent( level._id_80C8 );
}

_id_80CA( var_0 )
{
    var_1 = var_0 gettagorigin( "tag_weapon" );
    var_2 = ( var_1[0], var_1[1], 44 );
    level._id_809E = spawn( "script_model", var_2 );
    level._id_809E.angles = var_0 gettagangles( "tag_weapon" );
    level._id_809E setmodel( "weapon_c4" );
    level._id_809E hide();
    wait 1;
    level._id_809E show();
}

_id_80CB( var_0 )
{
    level._id_4877 attach( "weapon_c4", "tag_weapon_left", 1 );
}

_id_80CC( var_0 )
{
    level._id_809F = spawn( "script_model", level._id_4877 gettagorigin( "tag_weapon_left" ) );
    level._id_809F.angles = level._id_4877 gettagangles( "tag_weapon_left" );
    level._id_809F setmodel( "weapon_c4" );
    level._id_4877 detach( "weapon_c4", "tag_weapon_left" );
}

_id_80CD()
{
    level endon( "_stealth_spotted" );
    var_0 = maps\castle_code::_id_7A41( "backward_crawl" );
    self endon( "death" );
    self endon( "awareness_alert_level" );
    self endon( "bulletwhizby" );
    thread maps\castle_code::_id_80A9();
    thread _id_0225();
    var_0 thread maps\castle_code::_id_80AA( self, "platform_idle" );
    common_scripts\utility::flag_wait( "player_in_backcrawl" );
    thread _id_80CE( var_0 );
}

_id_0225()
{
    self waittill( "awareness_alert_level" );
    level._id_4877.ignoreme = 0;
    wait 1;
    level notify( "_stealth_spotted" );
}

_id_80CE( var_0 )
{
    self endon( "death" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        self endon( "awareness_alert_level" );
        self endon( "bulletwhizby" );
        var_0 maps\castle_code::_id_80B1( self, "platform_walk" );
        var_0 thread maps\castle_code::_id_80AA( self, "platform_idle_end" );

        if ( self._id_1032 == "platformguard1" )
        {
            var_1 = maps\_utility::_id_1287( "cigarette" );
            thread _id_80CF( var_1 );
            maps\_utility::_id_282D( var_1, "courtyard_stealth" );
            var_0 thread maps\_anim::_id_124E( var_1, "platform_idle_end" );
            common_scripts\utility::flag_wait( "platform_bomb_planted" );
            var_0 notify( "stop_loop" );
            var_0 thread maps\_anim::_id_1246( var_1, "jump_down" );
            var_0 thread maps\castle_code::_id_80B1( self, "jump_down" );
            wait 0.5;
            maps\_audio::aud_send_msg( "guard_jumps_down", self );
            playfxontag( level._effect["cigarette_off"], var_1, "tag_origin" );
            var_1 hide();
            common_scripts\utility::flag_set( "platform_guy_away" );
            self waittillmatch( "single anim", "end" );
            thread maps\_patrol::_id_204E( "platform_jump_down_guy_patrol_node" );
        }
    }
}

_id_80CF( var_0 )
{
    level endon( "courtyard_stealth_cleanup" );
    common_scripts\utility::waittill_any( "death", "_stealth_spotted" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_80D0()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    thread _id_80D1();
    self._id_1032 = "platformguard3";
    var_0 = maps\castle_code::_id_7A41( "backward_crawl" );
    self endon( "awareness_alert_level" );
    self endon( "bulletwhizby" );
    maps\_utility::_id_282D( self, "courtyard_stealth" );
    thread maps\castle_code::_id_80A9();
    var_0 thread maps\castle_code::_id_80AA( self, "platform_idle" );
    common_scripts\utility::flag_wait( "start_flashlight_guard" );
    var_0 thread maps\castle_code::_id_80B1( self, "platform_walk" );
    wait 14;
    common_scripts\utility::flag_set( "platform_flashlight_passed" );
    var_0 waittill( "platform_walk" );
    var_0 thread maps\castle_code::_id_80AA( self, "platform_idle_end" );
}

_id_80D1()
{
    self endon( "death" );
    maps\castle_code::_id_77E6( 1 );
    common_scripts\utility::flag_wait( "player_in_backcrawl" );
    wait 2;
    thread _id_014D();
    thread _id_80F5( "tag_flash", 0.97 );
}

_id_014D()
{
    while ( !common_scripts\utility::flag( "platform_bomb_planted" ) )
    {
        common_scripts\utility::flag_wait( "platform_light_on" );
        maps\castle_code::_id_77E6( 0, "flashlight_ai_grate" );
        common_scripts\utility::flag_waitopen( "platform_light_on" );
        maps\castle_code::_id_77E6( 1 );
    }
}

_id_80D2()
{
    if ( isdefined( self.enemy ) )
        maps\_stealth_shared_utilities::_id_41EC( self.enemy, 0 );

    self clearenemy();
    maps\_stealth_threat_enemy::_id_4264( "reset" );
}

_id_80D3()
{
    level endon( "_stealth_spotted" );
    wait 3.5;
    maps\_utility::_id_168C( "castle_pri_hold2" );
    wait 1;
    maps\_utility::_id_168C( "castle_pri_whatyoukill" );
}

_id_80D4()
{
    level endon( "_stealth_spotted" );
    var_0 = maps\castle_code::_id_7A41( "anim_align_road" );

    if ( level._id_1F19 != "platform_crawl" )
    {
        thread _id_80E0();
        common_scripts\utility::flag_wait( "courtyard_activity_done" );
        var_0 maps\_anim::_id_1246( self, "move_to_stealth" );
        var_0 thread _id_80FB( self, "stealth_intro_wait" );
        common_scripts\utility::flag_wait( "stealth_player_in_motorpool" );
        thread _id_80D3();
        _id_80DA( var_0, "stealth_intro", "stealth_idle" );
        common_scripts\utility::flag_wait( "stealth_move_to_crawl_truck" );
        common_scripts\utility::flag_set( "price_say_go" );
        _id_80DA( var_0, "move_to_crawltruck", "crawltruck_idle" );
        common_scripts\utility::flag_wait( "stealth_price_crawl_under_truck" );
        common_scripts\utility::flag_set( "price_under_truck" );
        self._id_80B8 = 1;
        self._id_10EF = 1;
        self._id_80D8 = 1;
        self allowedstances( "prone" );
        self.a._id_0D55 = 1;
        self.allowpain = 0;
        self._id_0EC3 = 1;
        _id_80DA( var_0, "crawltruck_crawl", "crawltruck_under_idle" );
        common_scripts\utility::flag_wait( "stealth_player_under_truck" );
        var_0 notify( "stop_loop" );
        self._id_80D5 = 0;
        maps\_audio::aud_send_msg( "price_sets_c4" );
        common_scripts\utility::flag_set( "price_plants_truckc4" );
        var_0 maps\_anim::_id_1246( self, "place_charge" );
        var_0 thread _id_80FB( self, "crawltruck_under_idle" );
        maps\castle_code::_id_80A3( "under_truck" );
        common_scripts\utility::flag_wait( "motorpool_melee_lookat" );
        var_0 notify( "stop_loop" );
        self._id_80D5 = 0;
        maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "motorpool_melee_guards_leave" );
        var_0 thread maps\_anim::_id_1246( self, "crawltruck_to_run" );
        wait 5;
        self allowedstances( "stand", "crouch", "prone" );
        self.a._id_0D55 = 0;
        self._id_10EF = undefined;
        self.allowpain = 1;
        self._id_0EC3 = undefined;
        self._id_80B8 = 0;
        self._id_80D8 = 0;
        self waittillmatch( "single anim", "end" );
        common_scripts\utility::flag_set( "objective_motorpool_melee" );
        var_0 thread _id_80DE();

        if ( !common_scripts\utility::flag( "objective_motorpool_melee_complete" ) )
        {
            var_0 thread _id_80DC();
            level._id_80B4 thread _id_80B6();
        }

        common_scripts\utility::flag_wait( "objective_motorpool_melee_complete" );
        var_0 notify( "stop_loop" );
        common_scripts\utility::flag_set( "price_say_some_timing" );
        maps\castle_code::_id_80A3( "melee" );
        var_0 thread _id_80FB( self, "road_sprint_wait_loop" );

        for (;;)
        {
            if ( level._id_80D6 == 0 )
            {
                wait 0.5;
                continue;
            }

            break;
        }

        wait 1;
        var_0 notify( "stop_loop" );
        self._id_80D5 = 0;
        self._id_80D7 = 1;
        thread maps\_utility::_id_168C( "castle_pri_now2" );
        var_0 maps\_anim::_id_1246( self, "road_sprint" );
        common_scripts\utility::flag_set( "price_say_your_turn" );

        if ( !common_scripts\utility::flag( "player_across_road" ) )
            var_0 thread _id_80FB( self, "road_sprint_end_loop" );
    }

    var_1 = gettime();
    common_scripts\utility::flag_wait( "player_across_road" );
    var_2 = gettime();

    if ( var_2 - var_1 > 10000 )
        thread maps\_utility::_id_168C( "castle_pri_screwthisup2" );

    maps\castle_code::_id_80A3( "player_across_road" );
    var_0 notify( "stop_loop" );
    self._id_80D5 = 0;
    thread _id_80E1();
    var_0 maps\_anim::_id_1248( self, "road_sprint_exit" );
    var_0 = maps\castle_code::_id_7A41( "backward_crawl" );
    var_0 maps\_anim::_id_124B( self, "start_into_idle" );
    var_0 maps\_anim::_id_1246( self, "start_into_idle" );
    var_0 thread _id_80FB( self, "wait_before_backcrawl" );
    common_scripts\utility::flag_wait( "player_approaches_backcrawl" );
    var_0 notify( "stop_loop" );
    self._id_80D5 = 0;
    var_0 maps\_anim::_id_1246( self, "move_to_backcrawl" );
    self._id_80B8 = 1;
    self._id_10EF = 1;
    self._id_80D8 = 1;
    self allowedstances( "prone" );
    self.a._id_0D55 = 1;
    self.allowpain = 0;
    self._id_0EC3 = 1;
    self.ignoreall = 1;
    var_0 maps\_anim::_id_1246( self, "get_into_backcrawl" );
    var_0 maps\_anim::_id_1246( self, "backcrawl_gap" );
    common_scripts\utility::flag_set( "price_say_wait_for_flashlight" );
    var_0 thread _id_80FB( self, "backcrawl_gap_idle" );

    if ( !common_scripts\utility::flag( "platform_flashlight_passed" ) && isalive( level._id_80C2 ) )
        common_scripts\utility::waittill_any_ents( level, "platform_flashlight_passed", level._id_80C2, "death" );

    var_0 notify( "stop_loop" );
    self._id_80D5 = 0;
    var_0 maps\_anim::_id_1246( self, "backcrawl_bomb" );
    var_0 maps\_anim::_id_1246( self, "backcrawl" );
    var_0 thread _id_80FB( self, "backcrawl_idle" );
    common_scripts\utility::flag_wait( "platform_bomb_planted" );
    thread _id_80D9();

    if ( !common_scripts\utility::flag( "player_planted_bomb" ) )
    {
        self.a._id_0D26 = "prone";
        var_0 notify( "stop_loop" );
        self._id_80D5 = 0;
        var_0 thread _id_80FB( self, "backcrawl_idle" );
    }

    common_scripts\utility::flag_wait( "platform_guy_away" );
    var_0 notify( "stop_loop" );
    self._id_80D5 = 0;
    maps\_utility::delaythread( 7.5, maps\_utility::_id_168C, "castle_pri_cleargo" );
    var_0 maps\_anim::_id_1246( self, "backcrawl_exit1" );
    self._id_80D5 = 0;
    self allowedstances( "stand", "crouch", "prone" );
    self.a._id_0D55 = 0;
    self._id_10EF = undefined;
    self.allowpain = 1;
    self._id_0EC3 = undefined;
    self._id_80B8 = 0;
    self._id_80D8 = 0;
    var_0 thread _id_80FB( self, "backcrawl_exit_wait1" );
    common_scripts\utility::flag_wait( "player_approaches_exit1" );
    var_0 notify( "stop_loop" );
    thread maps\_utility::_id_168C( "castle_pri_weregood3" );
    var_0 maps\_anim::_id_1246( self, "backcrawl_exit2" );
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "player_approaches_exit" );
    maps\_utility::_id_2703( "spawn_security_office", "targetname", level.player );
    level notify( "price_say_security_office" );
    maps\castle_code::_id_80A3( "security_office" );
}

_id_80D9()
{
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    var_1 = getent( "security_front_door", "targetname" );
    var_1._id_1032 = "door";
    var_1 maps\_utility::_id_2629();
    var_0 maps\_anim::_id_11CF( var_1, "security_office_entry" );
}

_id_80DA( var_0, var_1, var_2 )
{
    if ( common_scripts\utility::flag( "move_price_up_to_bomb_plant" ) )
        return;

    level endon( "move_price_up_to_bomb_plant" );
    var_0 notify( "stop_loop" );
    self._id_80D5 = 0;
    var_0 maps\_anim::_id_1246( self, var_1 );
    var_0 thread _id_80FB( self, var_2 );
}

_id_80DB()
{
    level endon( "platform_bomb_planted" );
    wait 20;
    level notify( "price_plant_bomb_instead" );
    level._id_4877 maps\_utility::_id_168C( "castle_pri_nevermind2" );
    common_scripts\utility::flag_set( "Price_Plant_bomb_instead" );
    level._id_809E delete();
    maps\_anim::_id_1246( level._id_4877, "bomb_plant_platform" );
    common_scripts\utility::flag_set( "platform_bomb_planted" );
}

_id_80DC()
{
    if ( common_scripts\utility::flag( "animating_stealth_melee" ) )
        return;

    common_scripts\utility::flag_set( "price_ready_to_catch" );
    common_scripts\utility::flag_wait( "animating_stealth_catch" );
    common_scripts\utility::waitframe();

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level._id_80B7 dropweapon( level._id_80B7.weapon, "right", 1 );
    level._id_80B7 maps\_utility::_id_24F5();
    level endon( "_stealth_spotted" );
    level endon( "animating_stealth_melee" );
    thread _id_80DD();
    level._id_80B7.allowdeath = 0;
    level._id_80B7 maps\_utility::_id_0A23( 1 );
    level._id_80B7 maps\_utility::_id_2612( 1 );
    level._id_80B7 _id_80BF();
    maps\_audio::aud_send_msg( "price_drag_body" );
    level thread maps\_utility::_id_27BD();
    self notify( "stop_loop" );
    thread maps\_anim::_id_1246( level._id_4877, "stealth_catch" );
    level._id_80B7.team = "neutral";
    maps\_anim::_id_1246( level._id_80B7, "stealth_catch" );
    level._id_80B7.allowdeath = 1;
    _id_80BE( level._id_80B7 );
    level._id_4877 waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_set( "objective_motorpool_melee_complete" );
}

_id_80DD()
{
    common_scripts\utility::flag_wait_any( "_stealth_spotted", "objective_motorpool_melee_complete" );

    if ( !common_scripts\utility::flag( "objective_motorpool_melee_complete" ) )
    {
        _id_80BE( level._id_80B7 );
        level._id_80B7 maps\castle_code::_id_80AD();
        level._id_80B7 startragdoll();
    }
}

_id_80DE()
{
    level endon( "animating_stealth_melee" );
    level endon( "animating_stealth_catch" );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_takehimout" );
    maps\_anim::_id_1246( level._id_4877, "indicate_guard" );
    thread _id_80FB( level._id_4877, "melee_idle" );
}

_id_80DF()
{
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "motorpool_melee_lookat" );
    maps\_utility::_id_168C( "castle_pri_wait" );
}

_id_80E0()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    level endon( "stealth_not_following_price1" );
    common_scripts\utility::flag_wait( "stealth_player_in_motorpool" );
    thread _id_80DF();
    common_scripts\utility::flag_wait( "price_say_go" );
    wait 1.0;

    if ( !common_scripts\utility::flag( "stealth_price_crawl_under_truck" ) )
        thread maps\_utility::_id_168C( "castle_pri_go2" );

    common_scripts\utility::flag_wait( "price_under_truck" );

    if ( !common_scripts\utility::flag( "stealth_player_under_truck" ) )
        thread maps\_utility::_id_168C( "castle_pri_undertrucks2" );

    common_scripts\utility::flag_wait( "price_plants_truckc4" );
    maps\_utility::_id_168C( "castle_pri_plantc4" );
    maps\_utility::_id_168C( "castle_pri_burnthisplace" );
    common_scripts\utility::flag_wait( "objective_motorpool_melee_complete" );
    common_scripts\utility::flag_wait( "price_say_some_timing" );
    maps\_utility::_id_168C( "castle_pri_waitforit" );
    level waittill( "sprint_go" );

    for (;;)
    {
        if ( !isdefined( self._id_80D7 ) )
        {
            wait 0.05;
            continue;
        }

        break;
    }

    wait 0.7;
}

_id_80E1()
{
    self endon( "death" );
    level endon( "stealth_not_following_price2" );
    level endon( "_stealth_spotted" );
    maps\_utility::_id_168C( "castle_pri_overhere" );
    thread _id_80E3();

    if ( !common_scripts\utility::flag( "platform_flashlight_passed" ) && isalive( level._id_80C2 ) )
    {
        common_scripts\utility::waittill_any_ents( level, "platform_flashlight_passed", level._id_80C2, "death" );
        maps\_utility::_id_168C( "castle_pri_weregood2" );
    }

    common_scripts\utility::flag_wait( "price_say_wait_for_flashlight" );
    common_scripts\utility::flag_set( "objective_bomb_plant" );
    wait 1;
    maps\_utility::_id_168C( "castle_pri_c4platform" );
    var_0 = [ "castle_pri_plantthec4", "castle_pri_daft" ];
    maps\castle_code::_id_80E2( var_0, "platform_bomb_planted", 15, 0, 0 );
    common_scripts\utility::flag_wait( "platform_bomb_planted" );
    wait 4;
    thread maps\_utility::_id_168C( "castle_pri_easy" );
    level waittill( "price_say_security_office" );
    maps\_utility::_id_168C( "castle_pri_securityoffice2" );
}

_id_80E3()
{
    level endon( "platform_flashlight_passed" );
    common_scripts\utility::flag_wait_any( "price_say_wait_for_flashlight", "player_approaches_gap", "price_says_wait" );
    common_scripts\utility::flag_wait( "start_flashlight_guard" );

    if ( isalive( level._id_80C2 ) )
        maps\_utility::_id_168C( "castle_pri_stopdontmove" );
}

_id_80E4()
{
    level endon( "courtyard_stealth_cleanup" );
    level notify( "ruins_break_stealth_stop" );
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait( "ruins_done" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    maps\_utility::_id_265B( "axis" );
    level._id_4877 thread _id_80E6();

    if ( !isdefined( level._id_4877._id_0D04 ) && level._id_4877._id_80D8 )
        level._id_4877.allowdeath = 0;

    var_0 = [ level._id_4877, level.player ];
    var_1 = getentarray( "melee_sight_block", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 delete();

    var_5 = getaispeciesarray( "axis", "all" );

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( var_7 ) || !isdefined( var_7.finished_spawning ) )
            continue;

        if ( isdefined( var_7.script_noteworthy ) && var_7.script_noteworthy == "ai_motorpool_melee" )
        {
            if ( isdefined( var_7._id_0BA3 ) && var_7._id_0BA3 > 0 )
                continue;
        }

        var_7 maps\_utility::_id_2612( 0 );
        var_7 maps\_utility::_id_26F4( 512 );
        var_7 getenemyinfo( level._id_4877 );
        var_7 getenemyinfo( level.player );
        var_8 = 0;

        foreach ( var_10 in var_0 )
        {
            if ( var_7 cansee( var_10 ) )
            {
                var_7 setgoalentity( var_10 );
                var_8 = 1;
                break;
            }
        }

        if ( !var_8 )
            var_7 setgoalentity( var_0[randomint( var_0.size )] );
    }

    _id_80E9();
    objective_delete( maps\_utility::_id_2816( "motorpool_melee" ) );
    objective_delete( maps\_utility::_id_2816( "platform_bomb_plant" ) );

    if ( isdefined( level._id_809B ) )
        level._id_809B thread _id_80E7();

    common_scripts\utility::array_call( getentarray( "platform_nosight", "targetname" ), ::delete );
    wait 0.05;
    level thread maps\_utility::_id_27BD();
    level._id_4877 stopsounds();
    wait 1.0;

    if ( isalive( level._id_4877 ) )
    {
        level._id_4877 thread maps\_utility::_id_168C( "castle_pri_spotted" );
        level._id_4877.allowdeath = 1;

        if ( isdefined( level._id_4877._id_0D04 ) && !level._id_4877._id_80D8 )
            level._id_4877 maps\_utility::_id_1902();

        level._id_4877 thread maps\castle_code::_id_80E5();

        if ( isdefined( level._id_4877._id_80B8 ) )
        {
            while ( level._id_4877._id_80B8 == 1 )
                wait 0.05;
        }

        if ( isdefined( level._id_4877 ) )
        {
            level._id_4877 maps\_utility::_id_2612( 0 );
            level._id_4877 maps\_utility::_id_1414();
            level._id_4877.goalradius = 512;
        }
    }
}

_id_80E6()
{
    var_0 = undefined;
    level._id_4877 waittill( "death", var_1 );
    level._id_4877 stopsounds();

    if ( isplayer( var_1 ) )
        var_0 = &"SCRIPT_MISSIONFAIL_KILLTEAM_BRITISH";
    else
        var_0 = &"CASTLE_YOUR_ACTIONS_GOT_PRICE";

    wait 2;
    setdvar( "ui_deadquote", var_0 );
    maps\_utility::_id_1826();
}

_id_80E7()
{
    self endon( "death" );
    thread _id_80E8( level.player );

    for (;;)
    {
        self waittill( "turret_on_target" );
        self fireweapon();
        wait(randomfloatrange( 0.2, 0.3 ));
    }
}

_id_80E8( var_0 )
{
    self endon( "death" );
    self notify( "castle_spotlight_track_ent" );
    self endon( "castle_spotlight_track_ent" );
    var_1 = spawn( "script_origin", var_0.origin );
    self setturrettargetent( var_1 );
    var_2 = 600;

    for (;;)
    {
        var_3 = distance( var_0.origin, var_1.origin );
        var_4 = common_scripts\utility::randomvector( 1 );
        var_5 = randomfloatrange( -16, 16 );
        var_4 += ( 0, 0, var_5 );
        var_6 = var_3 / var_2;
        var_7 = randomfloatrange( 0.5, 1.0 );

        if ( var_6 < var_7 )
            var_6 = var_7;

        var_8 = var_0.origin + var_4;
        var_1 moveto( var_8, var_6, var_6 * 0.4, var_6 * 0.4 );
        wait(var_6);
    }
}

_id_80E9()
{
    var_0 = getentarray( "alarm_lights", "targetname" );

    foreach ( var_2 in var_0 )
        playfxontag( level._effect["fx_lights_strobe_red"], var_2, "tag_origin" );
}

_id_80EA()
{
    var_0 = common_scripts\utility::getstruct( "road_spotlight_target_across_road", "targetname" );
    var_1 = common_scripts\utility::getstruct( "road_spotlight_target_motorpool", "targetname" );
    var_2 = common_scripts\utility::getstruct( "road_spotlight_target_motorpool_postmelee", "targetname" );
    level._id_80D6 = 0;
    var_3 = getent( "road_spotlight", "targetname" );
    level._id_80A4 = var_3;
    var_3 setmodel( "ctl_spotlight_modern_3x_on" );
    var_3 thread _id_80EE();
    var_3 thread _id_80EC();
    var_3 endon( "death" );
    var_3._id_80EB = spawn( "script_origin", var_1.origin );
    var_3 thread _id_80F3( var_3._id_80EB );
    var_3._id_80EB moveto( var_1.origin, 0.1, 0, 0 );

    while ( !common_scripts\utility::flag( "ruins_done" ) || common_scripts\utility::flag( "ruins_done" ) && !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level._id_80D6 = 1;
        level notify( "sprint_go" );
        var_3._id_80EB moveto( var_0.origin, 3.5, 0.5, 3 );
        var_3._id_80EB waittill( "movedone" );
        var_3 waittill( "spotlight_on_target" );
        wait 2.5;
        level._id_80D6 = 0;
        wait 2.5;

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            break;

        if ( common_scripts\utility::flag( "animating_stealth_catch" ) || common_scripts\utility::flag( "animating_stealth_melee" ) || common_scripts\utility::flag( "objective_motorpool_melee_complete" ) )
            var_3._id_80EB moveto( var_2.origin, 3.5, 0.5, 3 );
        else
            var_3._id_80EB moveto( var_1.origin, 3.5, 0.5, 3 );

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            break;

        var_3._id_80EB waittill( "movedone" );

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            break;

        var_3 waittill( "spotlight_on_target" );

        if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            break;

        wait 3.0;

        if ( common_scripts\utility::flag( "price_plants_truckc4" ) && !common_scripts\utility::flag( "objective_motorpool_melee_complete" ) )
            common_scripts\utility::flag_wait_any( "price_ready_to_catch", "_stealth_spotted" );
    }

    var_3 thread _id_80F3( level.player );
}

_id_80EC()
{
    level endon( "courtyard_stealth_cleanup" );
    maps\_utility::_id_262C( self.target );
    self notify( "death" );
    self._id_80ED = 1;
    common_scripts\utility::flag_set( "_stealth_spotted" );
    playfxontag( common_scripts\utility::getfx( "spotlight_destroy" ), self, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "spotlight_modern_rain" ), self, "tag_light" );
    self setmodel( "ctl_spotlight_modern_3x_destroyed" );
}

_id_80EE()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "stadium_lights_on" );
    playfxontag( common_scripts\utility::getfx( "spotlight_modern_rain" ), self, "tag_light" );
    common_scripts\utility::flag_wait( "player_in_backcrawl" );
    level notify( "disable_spotlight_for_crawl" );
    stopfxontag( common_scripts\utility::getfx( "spotlight_modern_rain" ), self, "tag_light" );
    self setmodel( "ctl_spotlight_modern_3x" );
    common_scripts\utility::flag_wait( "player_approaches_exit1" );
    playfxontag( common_scripts\utility::getfx( "spotlight_modern_rain" ), self, "tag_light" );
    self setmodel( "ctl_spotlight_modern_3x_on" );
    thread _id_80F3( self._id_80EB );
}

_id_80EF()
{

}

_id_80F0( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        level endon( var_1 );
        level thread _id_80F2( var_1 );
    }

    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait( var_0 );

        while ( common_scripts\utility::flag( var_0 ) )
        {
            if ( maps\_utility::_id_229D() == "easy" )
            {
                var_2 = level.player getstance() == "prone";

                if ( var_2 )
                {
                    level thread maps\_utility::_id_27BD();
                    return;
                }
                else if ( !var_3 )
                {
                    level thread maps\castle_code::_id_80F1( &"CASTLE_HINT_PRONE", 95 );
                    var_3 = 1;
                }

                wait 0.05;
                continue;
            }

            wait 0.5;
        }

        if ( var_3 )
        {
            level thread maps\_utility::_id_27BD();
            var_3 = 0;
        }
    }
}

_id_80F2( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    level thread maps\_utility::_id_27BD();
}

_id_80F3( var_0 )
{
    self endon( "death" );
    level endon( "courtyard_stealth_cleanup" );
    level endon( "disable_spotlight_for_crawl" );
    self notify( "castle_spotlight_track_ent" );
    self endon( "castle_spotlight_track_ent" );
    self setmode( "manual" );
    var_1 = spawn( "script_origin", var_0.origin );
    self settargetentity( var_1 );
    var_2 = 300;
    var_3 = 0;
    var_4 = 0;

    for (;;)
    {
        var_5 = var_0.origin;

        if ( var_3 <= 0.5 || var_4 )
        {
            var_6 = distance( var_0.origin, var_1.origin );
            var_7 = common_scripts\utility::randomvector( 1 );
            var_8 = randomfloatrange( -16, 16 );
            var_7 += ( 0, 0, var_8 );
            var_9 = var_6 / var_2;
            var_10 = randomfloatrange( 0.5, 0.8 );

            if ( var_9 < var_10 )
                var_9 = var_10;

            var_11 = var_0.origin + var_7;

            if ( isdefined( level._id_80F4 ) )
                var_11 = level._id_80F4;

            var_1 moveto( var_11, var_9, var_9 * 0.4, var_9 * 0.4 );
            wait(var_9);

            while ( distance( var_5, var_0.origin ) > 10 )
            {
                var_5 = var_0.origin;
                var_1 moveto( var_0.origin, 0.25, 0, 0 );
                wait 0.25;
            }
        }
        else
        {
            var_1.origin = var_0.origin;
            common_scripts\utility::waitframe();
        }

        var_3 = distance( var_5, var_0.origin );
        self notify( "spotlight_on_target" );
    }
}

_id_80F5( var_0, var_1 )
{
    self endon( "death" );
    var_2 = common_scripts\utility::getstruct( "road_spotlight_target_motorpool", "targetname" );

    while ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        if ( common_scripts\utility::flag( "safe_prone_area" ) && level.player getstance() == "prone" )
        {
            wait 0.05;
            continue;
        }

        if ( common_scripts\utility::flag( "safe_crouch_area" ) && level.player getstance() == "crouch" )
        {
            wait 0.05;
            continue;
        }

        if ( common_scripts\utility::flag( "player_in_backcrawl" ) && !common_scripts\utility::flag( "player_approaches_exit1" ) && !isai( 1 ) )
        {
            wait 0.05;
            continue;
        }

        var_3 = level.player geteye();

        if ( _id_80F6( var_3, var_0, var_1 ) )
            common_scripts\utility::flag_set( "_stealth_spotted" );
        else
        {
            var_4 = getcorpsearray();

            foreach ( var_6 in var_4 )
            {
                var_7 = var_6.origin;

                if ( _id_80F6( var_7, var_0, var_1 ) )
                    common_scripts\utility::flag_set( "_stealth_spotted" );
            }
        }

        if ( isdefined( level._id_80B4 ) && level._id_80B4._id_80B3 == 1 )
        {
            var_7 = level._id_80B4.origin + ( 0.0, 0.0, 30.0 );

            if ( _id_80F6( var_7, var_0, var_1 ) )
                common_scripts\utility::flag_set( "_stealth_spotted" );
        }

        wait 0.05;
    }

    self notify( "awareness_alert_level", "warning" );
}

_id_80F6( var_0, var_1, var_2 )
{
    var_3 = "tag_light";

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    var_4 = self gettagorigin( var_3 );
    var_5 = self gettagangles( var_3 );
    var_6 = var_0 - var_4;
    var_7 = vectordot( vectornormalize( var_6 ), anglestoforward( var_5 ) );

    if ( !isdefined( var_2 ) )
        var_2 = 0.988;

    var_8 = sighttracepassed( var_4, var_0, 0, self );

    if ( var_8 && var_7 > var_2 )
        return 1;
    else
        return 0;
}

_id_80F7()
{
    level endon( "enter_security_office" );
    common_scripts\utility::flag_wait( "stealth_not_following_price1" );
    maps\castle_code::_id_80F8( -5 );
    common_scripts\utility::flag_set( "stealth_move_to_crawl_truck" );
    common_scripts\utility::flag_set( "stealth_price_crawl_under_truck" );
    common_scripts\utility::flag_set( "stealth_player_under_truck" );
    common_scripts\utility::flag_set( "motorpool_melee_lookat" );
    common_scripts\utility::flag_wait( "price_ready_to_catch" );
    common_scripts\utility::flag_set( "animating_stealth_catch" );
    common_scripts\utility::flag_set( "player_across_road" );
    common_scripts\utility::flag_wait( "stealth_not_following_price2" );
    maps\castle_code::_id_80F8( -5 );
    common_scripts\utility::flag_set( "player_approaches_backcrawl" );
    common_scripts\utility::flag_set( "player_in_backcrawl" );
    common_scripts\utility::flag_set( "start_flashlight_guard" );
    common_scripts\utility::flag_set( "player_approaches_gap" );
    common_scripts\utility::flag_set( "platform_flashlight_passed" );
    common_scripts\utility::flag_wait( "price_say_wait_for_flashlight" );
    common_scripts\utility::flag_set( "objective_bomb_plant" );
    common_scripts\utility::flag_set( "platform_bomb_planted" );
    common_scripts\utility::flag_set( "player_approaches_backcrawl_end" );
    common_scripts\utility::flag_set( "player_approaches_exit1" );
    common_scripts\utility::flag_set( "player_approaches_exit" );
}

_id_80F9()
{
    maps\_utility::_id_282D( spawn( "script_origin", ( 0.0, 0.0, 0.0 ) ), "courtyard_stealth" );
    common_scripts\utility::flag_wait( "security_office_closed" );
    level notify( "courtyard_stealth_cleanup" );
    maps\castle_code::_id_80FA();
    maps\_utility::_id_282E( "courtyard_stealth" );
    maps\_stealth_utility::_id_4342();
    var_0 = getent( "road_spotlight", "targetname" );
    stopfxontag( common_scripts\utility::getfx( "spotlight_modern_rain" ), var_0, "tag_light" );
    var_0 setmodel( "ctl_spotlight_modern_3x" );
    var_1 = getentarray( "alarm_lights", "targetname" );
    maps\_utility::_id_135B( var_1 );
    var_2 = getentarray( "courtyard_stealth_cleanup", "script_noteworthy" );
    maps\_utility::_id_135B( var_2 );
    maps\_utility::_id_261A( 501 );
    maps\_utility::_id_261A( 502 );
    maps\_utility::_id_261A( 503 );
    maps\_utility::_id_261A( 504 );
    maps\_utility::_id_261A( 505 );
    maps\_utility::_id_261A( 506 );
    maps\_utility::_id_261A( 520 );
}

_id_80FB( var_0, var_1 )
{
    var_2 = self;
    var_0._id_80D5 = 1;
    var_0 stopanimscripted();
    var_2 thread maps\_anim::_id_124E( var_0, var_1 );
}

_id_80FC()
{
    level endon( "courtyard_stealth_cleanup" );
    level endon( "_stealth_spotted" );
    var_0 = getentarray( "stinger_emplacement", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread maps\castle_code::_id_80FD();
}

_id_80FE()
{
    var_0 = getent( "I_go_first_dialog_trigger", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "player_going_first" );
}

_id_80FF()
{
    var_0 = getent( "platform_mantle", "targetname" );
    var_0 maps\_utility::_id_27C5();
    common_scripts\utility::flag_wait( "price_run_up_security_office" );
    var_0 maps\_utility::_id_27C6();
}
