// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread maps\_utility::_id_2822( "beach_area", 1 );
    var_0 = getvehiclenode( "veh_node_minigun_sniper_death", "script_noteworthy" );
    var_0 maps\_utility_code::_id_144C();
    var_1 = level._id_7E04;
    var_2 = var_1.mgturret[1];
    var_2 notify( "stop_mg42_target_drones" );
    var_2 setmode( "sentry" );
    var_1 maps\_vehicle::_id_29C3( "minigunner_stop", 5, 5 );
    var_1 maps\hamburg_tank_ai::_id_7DBC();
    var_3 = common_scripts\utility::getstruct( "struct_minigun_death_target", "targetname" );
    var_4 = var_3 common_scripts\utility::spawn_tag_origin();
    var_1 thread maps\hamburg_code::_id_7E8E( var_4 );
    var_2 thread _id_7EC8( var_4 );
    var_5 = var_2 getturretowner();
    var_5.ignoreme = 1;
    var_6 = getent( "minigun_volume_ai_checker", "targetname" );
    var_6 thread _id_7EC9();
    var_6 maps\_utility::_id_27E4();
    var_7 = getent( "special_place_in_my_heart", "script_noteworthy" );
    var_7 notify( "trigger" );
    var_1 setturrettargetvec( var_1 common_scripts\utility::tag_project( "tag_body", 100000 ) + ( 0.0, 0.0, 55.0 ) );
    var_4 delete();
    _id_7ECB();
    level notify( "stop_encourage_enemy_ai_death_in_volume" );
    maps\_utility::_id_26BB( "axis", ::_id_7ECA );
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_holdup" );
    var_5 thread _id_7EC6( var_4 );
    var_1 maps\_vehicle::_id_2B1C( "minigunner_stop" );
    common_scripts\utility::flag_wait( "snipey_mc_sniperton_sniped" );
    wait 0.5;
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_sniper" );
    maps\hamburg_code::_id_7E96( "hamburg_rhg_cartershit" );
    wait 0.1;
    maps\_utility::_id_11F4( "tank_rh1_wherearetargets" );
    wait 0.2;
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_hititnow" );
    var_8 = common_scripts\utility::getstruct( "snipey_mc_sniperton", "targetname" );
    var_1 setturrettargetvec( var_8.origin );
    wait 1;
    var_1 waittill( "turret_on_target" );
    wait 1;
    var_1 fireweapon();
    common_scripts\utility::exploder( "tank_blows_up_sniper" );
    wait 1;
}

_id_7EC6( var_0 )
{
    var_1 = var_0.origin;

    if ( isdefined( level._id_7E04.mgturret[1] ) )
    {
        custom_anim_wait_or_timeout( 4850 );
        level._id_7E04.mgturret[1] setmode( "manual" );
        level._id_7E04.mgturret[1] notify( "stop_sentry_target_drones" );
        level._id_7E04.mgturret[1] stopfiring();
    }

    maps\hamburg_code::_id_7E96( "tank_ctr_parkinggarage" );
    thread maps\hamburg_code::_id_7E96( "tank_ctr_takeitslow" );
    wait 2.6;
    _id_7EC7( var_1 );
}

custom_anim_wait_or_timeout( var_0 )
{
    var_1 = gettime() + var_0;
    self endon( "death" );

    if ( !isdefined( self._id_4887 ) )
        return;

    while ( self._id_4887 && gettime() < var_1 )
        wait 0.05;
}

_id_7EC7( var_0 )
{
    var_1 = self gettagorigin( "TAG_EYE" );
    var_2 = self gettagangles( "TAG_EYE" );
    playfx( common_scripts\utility::getfx( "brains" ), var_1, anglestoforward( var_2 ) * -2 );
    thread common_scripts\utility::play_sound_in_space( "hamburg_minigun_sniped", var_0 );
    maps\_utility::_id_1902();
    self kill();

    if ( isdefined( level._id_7E04.mgturret[1] ) )
    {
        level._id_7E04.mgturret[1] setmode( "manual" );
        level._id_7E04.mgturret[1] notify( "stop_sentry_target_drones" );
    }

    common_scripts\utility::flag_set( "snipey_mc_sniperton_sniped" );
}

_id_7EC8( var_0 )
{
    var_0 endon( "death" );

    for (;;)
        animscripts\hummer_turret\common::_id_48B3( var_0, 3, 5 );
}

_id_7EC9()
{
    level endon( "stop_encourage_enemy_ai_death_in_volume" );
    maps\_utility::_id_1A5A( "axis", ::_id_7ECA, 1 );

    for (;;)
    {
        var_0 = maps\_utility::_id_2789( "axis" );

        foreach ( var_2 in var_0 )
        {
            var_2 allowedstances( "stand" );
            var_2.attackeraccuracy = 20000;
            var_2 maps\_utility::delaythread( randomfloatrange( 6, 12 ), ::_id_7ECA );
        }

        if ( var_0.size )
            maps\_utility::_id_2635( var_0 );

        wait 0.05;
    }
}

_id_7ECA( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self endon( "death" );
        wait(randomfloatrange( 4, 6 ));
    }

    self.diequietly = 1;
    self kill();
}

_id_7ECB()
{
    var_0 = maps\_utility::_id_283B( "minigunner_regroup", "targetname" );
    objective_position( maps\_utility::_id_2816( "scout_for_tanks" ), ( 0.0, 0.0, 0.0 ) );
    var_1 = getent( "mount_tank_trigger", "targetname" );
    objective_add( maps\_utility::_id_2816( "minigunner_regroup" ), "current", &"HAMBURG_REGROUP", var_1 getcentroid() );
    var_2 = spawn( "trigger_radius", var_1.origin + ( 0.0, 0.0, -200.0 ), 0, 400, 400 );
    var_2 thread _id_7ECC();
    var_2 waittill( "trigger" );
    objective_position( maps\_utility::_id_2816( "scout_for_tanks" ), var_1 getcentroid() );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "minigunner_regroup" ) );
}

_id_7ECC()
{
    self endon( "trigger" );

    for (;;)
    {
        wait(randomfloatrange( 3, 6 ));
        level._id_45C0 maps\_utility::_id_11F4( "hamburg_snd_regroup" );
    }
}
