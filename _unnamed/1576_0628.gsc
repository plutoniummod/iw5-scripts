// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3E4B()
{
    _id_3E55();
    thread _id_3E4C();
    thread _id_3E4E();
    thread _id_3E4F();
    thread _id_3E50();
    thread _id_3E51();
    thread _id_3E53();
}

_id_3E4C()
{
    level endon( "special_op_terminated" );
    var_0 = [];

    for (;;)
    {
        level waittill( "wave_started", var_1 );
        var_2 = level common_scripts\utility::waittill_any_timeout( 1.5, "wave_ended" );

        if ( var_2 == "wave_ended" )
            continue;

        if ( var_1 == 1 )
        {
            if ( maps\_utility::_id_12C1() )
                maps\_utility::_id_11F4( "so_hq_mission_intro" );
            else
                maps\_utility::_id_11F4( "so_hq_mission_intro_sp" );

            continue;
        }

        var_3 = _id_3E4D( var_1, var_0 );

        if ( isdefined( var_3 ) && var_3 != "" )
        {
            if ( !isdefined( var_0[var_3] ) )
                var_0[var_3] = 1;
            else
                var_0[var_3]++;
        }
        else
            var_3 = _id_061C::_id_3E03( var_1 );

        if ( isdefined( var_3 ) && var_3 != "" )
        {
            if ( isdefined( level._id_11BB["so_hq_enemy_intel_" + var_3] ) )
                maps\_utility::_id_11F4( "so_hq_enemy_intel_" + var_3 );
        }
    }
}

_id_3E4D( var_0, var_1 )
{
    var_2 = _id_061C::_id_3E05( var_0 );

    if ( !isdefined( var_2 ) || !var_2.size )
        return undefined;

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_1[var_4] ) )
            var_1[var_4] = 0;
    }

    var_6 = "";
    var_7 = 0;

    foreach ( var_10, var_9 in var_1 )
    {
        if ( maps\_utility::_id_0AD1( var_2, var_10 ) && ( var_6 == "" || var_9 < var_7 ) )
        {
            var_6 = var_10;
            var_7 = var_9;
        }
    }

    return var_6;
}

_id_3E4E()
{
    level endon( "special_op_terminated" );

    for (;;)
    {
        var_0 = 0;
        level waittill( "boss_spawning", var_1 );
        var_2 = _id_061C::_id_3E08( var_1 );
        var_3 = _id_061C::_id_3E09( var_1 );

        if ( isdefined( var_3 ) && var_3.size )
        {
            if ( var_3.size == 1 )
            {
                if ( isdefined( level._id_11BB["so_hq_boss_intel_" + var_3[0]] ) )
                {
                    maps\_utility::_id_11F4( "so_hq_boss_intel_" + var_3[0] );
                    var_0 = 1;
                }
            }
            else if ( isdefined( level._id_11BB["so_hq_boss_intel_" + var_3[0] + "_many"] ) )
            {
                maps\_utility::_id_11F4( "so_hq_boss_intel_" + var_3[0] + "_many" );
                var_0 = 1;
            }
        }

        if ( isdefined( var_2 ) && var_2.size )
        {
            if ( var_0 )
            {
                var_4 = level common_scripts\utility::waittill_any_timeout( 1.5, "wave_ended" );

                if ( var_4 == "wave_ended" )
                    continue;
            }

            if ( var_2.size == 1 )
            {
                if ( isdefined( level._id_11BB["so_hq_boss_intel_" + var_2[0]] ) )
                    maps\_utility::_id_11F4( "so_hq_boss_intel_" + var_2[0] );

                continue;
            }

            if ( isdefined( level._id_11BB["so_hq_enemy_intel_boss_transport_many"] ) )
                maps\_utility::_id_11F4( "so_hq_enemy_intel_boss_transport_many" );
        }
    }
}

_id_3E4F()
{
    level endon( "special_op_terminated" );

    for (;;)
    {
        level waittill( "wave_ended", var_0 );
        var_1 = level common_scripts\utility::waittill_any_timeout( 1.5, "wave_started" );

        if ( var_1 == "wave_started" )
            continue;

        var_2 = "";

        if ( isdefined( level._id_3D55 ) )
        {
            if ( isdefined( level._id_3D55["weapon"] ) && level._id_3D55["weapon"] == var_0 )
                var_2 = "weapon";
            else if ( isdefined( level._id_3D55["equipment"] ) && level._id_3D55["equipment"] == var_0 )
                var_2 = "equipment";
            else if ( isdefined( level._id_3D55["airsupport"] ) && level._id_3D55["airsupport"] == var_0 )
                var_2 = "airsupport";
        }

        if ( var_2 != "" && isdefined( level._id_11BB["so_hq_armory_open_" + var_2] ) )
        {
            maps\_utility::_id_11F4( "so_hq_armory_open_" + var_2 );
            continue;
        }

        maps\_utility::_id_11F4( "so_hq_wave_over_flavor" );
    }
}

_id_3E50()
{
    level endon( "special_op_terminated" );

    for (;;)
    {
        level waittill( "so_airsupport_incoming", var_0 );

        if ( isdefined( level._id_11BB["so_hq_as_" + var_0] ) )
            maps\_utility::_id_11F4( "so_hq_as_" + var_0 );
    }
}

_id_3E51()
{
    level endon( "special_op_terminated" );

    for (;;)
    {
        var_0 = level common_scripts\utility::waittill_any_return( "ai_claymore_planted", "ai_chembomb_planted" );

        if ( var_0 == "ai_claymore_planted" )
        {
            if ( isdefined( level._id_11BB["so_hq_enemy_update_claymore"] ) )
                maps\_utility::_id_11F4( "so_hq_enemy_update_claymore" );
        }
        else if ( var_0 == "ai_chembomb_planted" )
        {

        }

        level waittill( "wave_ended" );
    }
}

_id_3E52( var_0 )
{
    if ( var_0 != "" && isdefined( level._id_11BB["so_hq_armory_stocked_" + var_0] ) )
        maps\_utility::_id_11F4( "so_hq_armory_stocked_" + var_0 );
}

_id_3E53()
{
    level endon( "special_op_terminated" );
    var_0 = "";

    for (;;)
    {
        var_1 = level common_scripts\utility::waittill_any_return( "a_sentry_died", "a_sentry_is_underattack", "wave_ended" );

        if ( var_1 == "wave_ended" )
            var_0 = "";
        else if ( var_1 == "a_sentry_is_underattack" && var_0 != "a_sentry_is_underattack" )
            thread _id_00D7();
        else if ( var_1 == "a_sentry_died" )
            thread _id_00D6();

        var_0 = var_1;
    }
}

_id_00D6()
{
    if ( isdefined( level._id_11BB["so_hq_sentry_down"] ) )
        maps\_utility::_id_11F4( "so_hq_sentry_down" );
}

_id_00D7()
{
    if ( isdefined( level._id_11BB["so_hq_sentry_underattack"] ) )
        maps\_utility::_id_11F4( "so_hq_sentry_underattack" );
}

_id_3E54()
{
    level endon( "special_op_terminated" );

    for (;;)
    {
        level waittill( "so_player_down" );

        if ( isdefined( level._id_11BB["so_hq_player_down"] ) )
            maps\_utility::_id_11F4( "so_hq_player_down" );
    }
}

_id_3E55()
{
    level._id_11BB["so_hq_mission_intro"] = "so_hq_mission_intro";
    level._id_11BB["so_hq_mission_intro_sp"] = "so_hq_mission_intro_sp";
    level._id_11BB["so_hq_enemy_intel_easy"] = "so_hq_enemy_intel_generic";
    level._id_11BB["so_hq_enemy_intel_regular"] = "so_hq_enemy_intel_generic";
    level._id_11BB["so_hq_enemy_intel_hardened"] = "so_hq_enemy_intel_generic";
    level._id_11BB["so_hq_enemy_intel_veteran"] = "so_hq_enemy_intel_generic";
    level._id_11BB["so_hq_enemy_intel_elite"] = "so_hq_enemy_intel_generic";
    level._id_11BB["so_hq_enemy_intel_claymore"] = "so_hq_enemy_intel_generic";
    level._id_11BB["so_hq_enemy_intel_martyrdom"] = "so_hq_enemy_intel_martyrdom";
    level._id_11BB["so_hq_enemy_intel_chemical"] = "so_hq_enemy_intel_chemical";
    level._id_11BB["so_hq_enemy_intel_dog_splode"] = "so_hq_enemy_intel_dog_splode";
    level._id_11BB["so_hq_enemy_intel_dog_reg"] = "so_hq_enemy_intel_dog_reg";
    level._id_11BB["so_hq_armory_open_weapon"] = "so_hq_armory_open_weapon";
    level._id_11BB["so_hq_armory_open_equipment"] = "so_hq_armory_open_equipment";
    level._id_11BB["so_hq_armory_open_airsupport"] = "so_hq_armory_open_airstrike";
    level._id_11BB["so_hq_armory_stocked_all"] = "so_hq_armory_stocked_all";
    level._id_11BB["so_hq_armory_stocked_equipment"] = "so_hq_armory_stocked_equipment";
    level._id_11BB["so_hq_wave_over_flavor"] = "so_hq_wave_over_flavor";
    level._id_11BB["so_hq_enemy_update_claymore"] = "so_hq_enemy_update_claymore";
    level._id_11BB["so_hq_sentry_down"] = "so_hq_sentry_down";
    level._id_11BB["so_hq_sentry_underattack"] = "so_hq_sentry_underattack";
    level._id_11BB["so_hq_player_down"] = "so_hq_player_down";
    level._id_11BB["so_hq_boss_intel_jug_regular"] = "so_hq_enemy_intel_boss_transport";
    level._id_11BB["so_hq_boss_intel_jug_riotshield"] = "so_hq_enemy_intel_boss_transport";
    level._id_11BB["so_hq_boss_intel_jug_explosive"] = "so_hq_enemy_intel_boss_transport";
    level._id_11BB["so_hq_boss_intel_jug_headshot"] = "so_hq_enemy_intel_boss_transport";
    level._id_11BB["so_hq_boss_intel_jug_minigun"] = "so_hq_enemy_intel_boss_transport";
    level._id_11BB["so_hq_enemy_intel_boss_transport_many"] = "so_hq_enemy_intel_boss_transport_many";
    level._id_11BB["so_hq_boss_intel_chopper"] = "so_hq_boss_intel_chopper";
    level._id_11BB["so_hq_boss_intel_chopper_many"] = "so_hq_boss_intel_chopper_many";
    level._id_11BB["so_hq_as_friendly_support_delta"] = "so_hq_airsupport_ally_delta";
    level._id_11BB["so_hq_as_friendly_support_riotshield"] = "so_hq_airsupport_ally_riotshield";
    level._id_11BB["so_hq_uav_busy"] = "so_hq_uav_busy";
}
