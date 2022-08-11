// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6BEB()
{
    common_scripts\utility::flag_init( "obj_first_follow_price" );
    common_scripts\utility::flag_init( "obj_take_overwatch_position" );
    common_scripts\utility::flag_init( "obj_move_through_shanty_given" );
    common_scripts\utility::flag_init( "obj_go_loud_given" );
    common_scripts\utility::flag_init( "obj_follow_price_advance_given" );
    common_scripts\utility::flag_init( "obj_follow_price_advance_complete" );
    common_scripts\utility::flag_init( "obj_capture_mortar" );
    common_scripts\utility::flag_init( "obj_breach_warlord_room" );
    common_scripts\utility::flag_init( "obj_breach_warlord_room_started" );
    common_scripts\utility::flag_init( "obj_commandeer_technical_given" );
    common_scripts\utility::flag_init( "obj_commandeer_technical_done" );
    wait 1;
    waittillframeend;
    var_0 = [];
    var_0[var_0.size] = [ "obj_follow_price", &"WARLORD_OBJ_FOLLOW_PRICE", ::_id_6BEC, 0 ];
    var_0[var_0.size] = [ "obj_overwatch", &"WARLORD_OBJ_COVER_PRICE_AND_SOAP", ::_id_6BED ];
    var_0[var_0.size] = [ "obj_move_shanty", &"WARLORD_OBJ_MOVE_THROUGH_SHANTY", ::_id_6BEF ];
    var_0[var_0.size] = [ "obj_commandeer", &"WARLORD_OBJ_COMMANDEER_TECHNICAL", ::_id_6BF0 ];
    var_0[var_0.size] = [ "obj_evade_mortar", &"WARLORD_OBJ_EVADE_MORTAR_FIRE", ::_id_6BF2 ];
    var_0[var_0.size] = [ "obj_cover_price", &"WARLORD_OBJ_COVER_PRICE", ::_id_6BF3 ];
    var_0[var_0.size] = [ "obj_enter_compound", &"WARLORD_OBJ_ENTER_COMPOUND", ::_id_6BFA ];
    var_0[var_0.size] = [ "obj_capture_warlord", &"WARLORD_OBJ_CAPTURE_WARLORD", ::_id_6BFB ];
    var_1 = [];
    var_1["default"] = "obj_follow_price";
    var_1["start_stealth_intro"] = "obj_follow_price";
    var_1["start_log_encounter"] = "obj_follow_price";
    var_1["start_burn_encounter"] = "obj_follow_price";
    var_1["start_river_big_moment"] = "obj_follow_price";
    var_1["start_infiltration"] = "obj_overwatch";
    var_1["start_advance"] = "obj_move_shanty";
    var_1["start_technical"] = "obj_move_shanty";
    var_1["start_mortar_run"] = "obj_evade_mortar";
    var_1["start_player_mortar"] = "obj_cover_price";
    var_1["start_assault"] = "obj_enter_compound";
    var_1["start_super_technical"] = "obj_enter_compound";
    var_1["start_confrontation"] = "obj_capture_warlord";
    var_1["start_protect"] = "obj_enter_compound";
    var_2 = 1;
    var_3 = 1;

    foreach ( var_5 in var_0 )
    {
        var_3 = var_3 && var_1[level._id_1F19] != var_5[0];

        if ( isdefined( var_5[3] ) )
            var_2 = var_5[3];

        _id_6BFC( var_2, var_5[1], var_5[2], var_3 );
        var_2++;
    }
}

_id_6BEC( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_first_follow_price" );
    wait 1;
    objective_add( var_0, "current", var_1 );
    objective_onentity( var_0, level._id_4877 );
    common_scripts\utility::flag_wait( "obj_take_overwatch_position" );
    maps\_utility::_id_2727( var_0 );
}

_id_6BED( var_0, var_1 )
{
    objective_add( var_0, "current", var_1, ( 4419.0, 3274.0, 33.0 ) );
    _id_6BEE( var_0 );

    if ( common_scripts\utility::flag( "inf_stealth_spotted" ) )
        objective_delete( var_0 );
    else
        maps\_utility::_id_2727( var_0 );
}

_id_6BEE( var_0 )
{
    level endon( "infiltration_over" );
    var_1 = getent( "trig_tower_1", "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::flag_wait_any( "throat_stab", "sleeping_guy_dead" );
    objective_onentity( var_0, level._id_54E0 );
    objective_setpointertextoverride( var_0, &"WARLORD_OBJ_POINTER_PROTECT" );
    level waittill( "infiltration_over" );
}

_id_6BEF( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_move_through_shanty_given" );
    objective_add( var_0, "current" );

    if ( common_scripts\utility::flag( "inf_stealth_spotted" ) )
    {
        objective_string( var_0, &"WARLORD_OBJ_MOVE_THROUGH_SHANTY" );
        objective_position( var_0, ( 7366.0, 3255.0, 141.0 ) );
        common_scripts\utility::flag_wait( "obj_go_loud_given" );
    }
    else
    {
        objective_string( var_0, var_1 );
        objective_position( var_0, ( 7366.0, 3255.0, 141.0 ) );
        common_scripts\utility::flag_wait( "obj_go_loud_given" );
        objective_string( var_0, &"WARLORD_OBJ_MOVE_THROUGH_SHANTY" );
    }

    objective_position( var_0, ( 5942.0, 4548.0, 144.0 ) );
    common_scripts\utility::flag_wait( "obj_follow_price_advance_given" );
    objective_onentity( var_0, level._id_4877 );
    common_scripts\utility::flag_wait( "obj_follow_price_advance_complete" );
    maps\_utility::_id_2727( var_0 );
}

_id_6BF0( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_commandeer_technical_given" );

    if ( !isdefined( level._id_6BF1 ) )
    {
        var_2 = getent( "player_technical", "targetname" );
        var_2 waittill( "spawned" );
    }

    objective_add( var_0, "current", var_1 );
    objective_onentity( var_0, level._id_6BF1, ( 0.0, 0.0, -40.0 ) );
    common_scripts\utility::flag_wait( "obj_commandeer_technical_done" );
    maps\_utility::_id_2727( var_0 );
    level waittill( "turret_finished" );
}

_id_6BF2( var_0, var_1 )
{
    objective_add( var_0, "current", var_1 );
    objective_onentity( var_0, level._id_4877 );
    var_2 = getent( "trig_mortar_roof_collapse", "targetname" );
    var_2 waittill( "trigger" );
    objective_position( var_0, ( 7866.0, 6658.0, 480.0 ) );
    var_2 = getent( "trig_mortar_soap_teleport", "targetname" );
    var_2 waittill( "trigger" );
    objective_onentity( var_0, level._id_4877 );
    common_scripts\utility::flag_wait( "obj_capture_mortar" );
    maps\_utility::_id_2727( var_0 );
}

_id_6BF3( var_0, var_1 )
{
    objective_add( var_0, "current", var_1 );
    var_2 = getent( "player_mortar", "targetname" );
    var_3 = getent( "mortar_obj_1", "targetname" );
    var_4 = getent( "mortar_obj_2", "targetname" );
    var_5 = getent( "mortar_obj_3", "targetname" );
    objective_position( var_0, var_3.origin );
    common_scripts\utility::flag_wait( "flag_mortar_obj_2" );
    objective_position( var_0, var_4.origin );
    common_scripts\utility::flag_wait( "flag_mortar_obj_3" );
    objective_position( var_0, var_5.origin );
    common_scripts\utility::flag_wait( "flag_mortar_obj_mortar" );
    objective_onentity( var_0, var_2 );
    objective_setpointertextoverride( var_0, &"WARLORD_OBJ_POINTER_CAPTURE" );
    _id_6BF4( var_0 );
    maps\_utility::_id_2727( var_0 );
}

_id_6BF4( var_0 )
{
    level endon( "mortar_finished" );
    level waittill( "mortar_equipped" );
    objective_setpointertextoverride( var_0, &"WARLORD_OBJ_POINTER_TARGET" );

    if ( !isdefined( level._id_6BF5 ) )
        level waittill( "mortar_technical_1_spawned" );

    thread _id_6BF9( var_0, 0, level._id_6BF5, "mortar_technical_1_dead", "mortar_technical_1_riders_dead", "    Destroy Technical #1", 0.5 );

    if ( !isdefined( level._id_6BF6 ) )
        level waittill( "mortar_truck_1_spawned" );

    thread _id_6BF9( var_0, 1, level._id_6BF6, "mortar_pickup_1_dead", "mortar_pickup_1_riders_dead", "    Destroy Truck #1", 2 );

    if ( !isdefined( level._id_6BF7 ) )
        level waittill( "mortar_technical_2_spawned" );

    thread _id_6BF9( var_0, 2, level._id_6BF7, "mortar_technical_2_dead", "mortar_technical_2_riders_dead", "    Destroy Technical #2", 3 );

    if ( !isdefined( level._id_6BF8 ) )
    {
        level waittill( "spawning_mortar_wave" );
        wait 5;
    }

    var_1 = 0;
    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2 thread _id_4E95();
    objective_additionalentity( var_0, 3, var_2 );

    for (;;)
    {
        if ( isdefined( level._id_6BF8 ) && level._id_6BF8.size > 0 )
        {
            var_3 = ( 0.0, 0.0, 0.0 );
            var_4 = 0;

            foreach ( var_6 in level._id_6BF8 )
            {
                if ( isdefined( var_6 ) && isalive( var_6 ) )
                {
                    var_3 += var_6.origin;
                    var_4++;
                }
            }

            if ( var_4 > 0 )
            {
                var_3 /= var_4;

                if ( var_1 )
                    var_2 moveto( var_3, 0.2 );
                else
                {
                    var_1 = 1;
                    var_2.origin = var_3;
                }
            }
        }

        wait 0.2;
    }
}

_id_6BF9( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    level endon( "mortar_finished" );

    if ( isdefined( var_6 ) )
        wait(var_6);

    if ( isalive( var_2 ) )
    {
        objective_additionalentity( var_0, var_1, var_2 );
        common_scripts\utility::flag_wait_either( var_3, var_4 );
        objective_additionalposition( var_0, var_1, ( 0.0, 0.0, 0.0 ) );
    }
}

_id_4E95()
{
    level waittill( "mortar_finished" );
    self delete();
}

_id_6BFA( var_0, var_1 )
{
    objective_add( var_0, "current", var_1 );
    objective_onentity( var_0, level._id_4877 );
    var_2 = getent( "trig_enter_compound", "targetname" );

    if ( isdefined( var_2 ) )
    {
        var_2 waittill( "trigger" );
        objective_position( var_0, ( 3692.0, 8638.0, 997.0 ) );
    }

    common_scripts\utility::flag_wait( "compound_church_doors" );
    objective_onentity( var_0, level._id_4877 );
    common_scripts\utility::flag_wait( "church_breach_complete" );
    maps\_utility::_id_2727( var_0 );
}

_id_6BFB( var_0, var_1 )
{
    objective_add( var_0, "current", var_1 );
    objective_onentity( var_0, level._id_4877 );
    common_scripts\utility::flag_wait( "obj_breach_warlord_room" );
    objective_position( var_0, ( 3227.0, 8672.0, 997.0 ) );
    common_scripts\utility::flag_wait( "obj_breach_warlord_room_started" );
    common_scripts\utility::flag_wait( "warlord_protect" );
    maps\_utility::_id_2727( var_0 );
}

_id_6BFC( var_0, var_1, var_2, var_3 )
{
    if ( !var_3 )
    {
        if ( isdefined( var_2 ) )
            [[ var_2 ]]( var_0, var_1 );
    }
    else
    {
        objective_add( var_0, "invisible", var_1 );
        objective_state_nomessage( var_0, "done" );
    }
}
