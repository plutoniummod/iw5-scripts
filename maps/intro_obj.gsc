// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7159()
{
    common_scripts\utility::flag_init( "obj_take_position_on_balcony" );
    common_scripts\utility::flag_init( "obj_watch_courtyard" );
    common_scripts\utility::flag_init( "obj_exit_hotel" );
    common_scripts\utility::flag_init( "obj_get_to_helicopter" );
    common_scripts\utility::flag_init( "obj_destroy_ugv" );
    common_scripts\utility::flag_init( "obj_control_ugv" );
    common_scripts\utility::flag_init( "obj_clear_helicopter_area" );
    common_scripts\utility::flag_init( "obj_clear_helicopter_area_complete" );
    wait 1;
    waittillframeend;
    var_0 = [];
    var_0[var_0.size] = [ "obj_defend_courtyard", &"INTRO_OBJ_DEFEND_COURTYARD", ::_id_715B, 0 ];
    var_0[var_0.size] = [ "obj_help_soap", &"INTRO_OBJ_HELP_SOAP", ::_id_715C ];
    var_0[var_0.size] = [ "obj_exit_hotel", &"INTRO_OBJ_EXIT_HOTEL", ::_id_715D ];
    var_0[var_0.size] = [ "obj_weapons_cache", &"INTRO_OBJ_WEAPON_CACHE", ::_id_715E ];
    var_0[var_0.size] = [ "obj_control_ugv", &"INTRO_OBJ_CONTROL_UGV", ::_id_715F ];
    var_0[var_0.size] = [ "obj_clear_helicopter_area", &"INTRO_OBJ_CLEAR_HELICOPTER", ::_id_7160 ];
    var_0[var_0.size] = [ "obj_get_to_helicopter", &"INTRO_OBJ_HELICOPTER", ::_id_7161 ];
    var_1 = [];
    var_1["default"] = "obj_defend_courtyard";
    var_1["intro"] = "obj_defend_courtyard";
    var_1["intro transition"] = "obj_defend_courtyard";
    var_1["courtyard"] = "obj_defend_courtyard";
    var_1["escort"] = "obj_help_soap";
    var_1["regroup"] = "obj_weapons_cache";
    var_1["maars shed"] = "obj_weapons_cache";
    var_1["maars control"] = "obj_control_ugv";
    var_1["slide"] = "obj_get_to_helicopter";
    var_2 = 1;
    var_3 = 1;

    foreach ( var_5 in var_0 )
    {
        var_3 = var_3 && ( !isdefined( var_1[level._id_1F19] ) || var_1[level._id_1F19] != var_5[0] );

        if ( isdefined( var_5[3] ) )
            var_2 = var_5[3];

        _id_7162( var_2, var_5[1], var_5[2], var_3 );
        var_2++;
    }
}

_id_715A( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_take_position_on_balcony" );

    if ( !common_scripts\utility::flag( "courtyard_player_on_balcony" ) )
    {
        objective_add( var_0, "current", var_1 );
        var_2 = common_scripts\utility::getstruct( "courtyard_balcony_objective", "targetname" );

        if ( isdefined( var_2 ) )
            objective_position( var_0, var_2.origin );

        common_scripts\utility::flag_wait( "courtyard_player_on_balcony" );
        maps\_utility::_id_2727( var_0 );
    }
}

_id_715B( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_watch_courtyard" );
    objective_add( var_0, "current", var_1 );
    common_scripts\utility::flag_wait( "escort_doc_down_mi28_fire" );
    maps\_utility::_id_2727( var_0 );
}

_id_715C( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "escort_player_help_soap" );
    objective_add( var_0, "current", var_1 );
    var_2 = common_scripts\utility::getstruct( "escort_help_soap_obj", "targetname" );

    if ( isdefined( var_2 ) )
    {
        objective_position( var_0, var_2.origin );
        objective_setpointertextoverride( var_0, &"INTRO_HELP" );
    }

    common_scripts\utility::flag_wait( "escort_help_soap_complete" );
    maps\_utility::_id_2727( var_0 );
}

_id_715D( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_exit_hotel" );
    objective_add( var_0, "current", var_1 );
    var_2 = common_scripts\utility::getstruct( "breach_door_position", "targetname" );

    if ( isdefined( var_2 ) )
        objective_onentity( var_0, level._id_4877 );

    common_scripts\utility::flag_wait( "obj_exit_hotel_complete" );
    maps\_utility::_id_2727( var_0 );
}

_id_715E( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_control_ugv" );
    objective_add( var_0, "current", var_1 );
    var_2 = common_scripts\utility::getstruct( "regroup_objective_alley", "targetname" );

    if ( isdefined( var_2 ) )
        objective_position( var_0, var_2.origin );

    common_scripts\utility::flag_wait( "regroup_player_moving_down_alleyway" );
    var_2 = common_scripts\utility::getstruct( "obj_alley_gate", "targetname" );

    if ( isdefined( var_2 ) )
        objective_position( var_0, var_2.origin );

    common_scripts\utility::flag_wait( "regroup_player_at_gate" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "regroup_ending_follow_price" );
    objective_onentity( var_0, level._id_4877 );
    common_scripts\utility::flag_wait( "maars_control_start_intro" );
    var_2 = common_scripts\utility::getstruct( "obj_ugv_room", "targetname" );

    if ( isdefined( var_2 ) )
        objective_position( var_0, var_2.origin );

    maps\_utility::_id_2727( var_0 );
}

_id_715F( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "player_to_maars_control" );
    objective_add( var_0, "current", var_1 );
    var_2 = common_scripts\utility::getstruct( "obj_control_ugv", "targetname" );

    if ( isdefined( var_2 ) )
        objective_position( var_0, var_2.origin );

    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "maars_loaded" );
    maps\_utility::_id_2727( var_0 );
}

_id_7160( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_clear_helicopter_area" );
    objective_add( var_0, "current", var_1 );
    var_2 = common_scripts\utility::getstruct( "obj_get_to_helicopter", "targetname" );

    if ( isdefined( var_2 ) )
        objective_position( var_0, var_2.origin );

    common_scripts\utility::flag_wait( "maars_control_player_at_helicopter" );
    var_2 = common_scripts\utility::getstruct( "obj_protect_helicopter", "targetname" );

    if ( isdefined( var_2 ) )
    {
        objective_position( var_0, var_2.origin );
        objective_setpointertextoverride( var_0, &"INTRO_PROTECT" );
    }

    common_scripts\utility::flag_wait( "obj_clear_helicopter_area_complete" );
    maps\_utility::_id_2727( var_0 );
}

_id_7161( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "obj_clear_helicopter_area_complete" );
    objective_add( var_0, "current", var_1 );
    var_2 = common_scripts\utility::getstruct( "obj_get_to_helicopter", "targetname" );

    if ( isdefined( var_2 ) )
        objective_position( var_0, var_2.origin );

    common_scripts\utility::flag_wait( "building_slide_pickup" );
    maps\_utility::_id_2727( var_0 );
}

_id_7162( var_0, var_1, var_2, var_3 )
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
