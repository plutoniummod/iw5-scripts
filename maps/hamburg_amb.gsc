// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_audio::_id_173F();
    maps\_audio::_id_16F4();
    maps\_audio::_id_1735( "default" );
    maps\_audio::_id_156E( "default" );
    _id_4ED3();
    _id_4ED4();
    _id_4ED6();
    thread maps\_utility::_id_194E( "hamburg_chopper_ridein" );
}

_id_4ED3()
{

}

_id_4ED4()
{
    level._id_16F5._id_7D89 = spawn( "script_origin", ( -432.0, 18275.0, -30.0 ) );
    level._id_16F5._id_7D8A = 0;
    level._id_16F5._id_7D8B = 0;
}

_id_4ED6()
{
    maps\_audio::_id_174C( ::_id_7D8C );
}

_id_7D8C( var_0, var_1 )
{
    var_2 = 1;

    switch ( var_0 )
    {
        case "exit_tank":
            var_3 = spawn( "script_origin", level.player.origin );
            var_3 maps\_audio::_id_170B( "hamb_tank_foley" );
            wait 1.9;
            var_3 playsound( "hamb_tank_foley", "sounddone" );
            var_3 waittill( "sounddone" );
            var_3 maps\_audio::_id_170F( "hamb_tank_foley" );
            wait 1;
            var_3 delete();
            break;
        case "humvee_pull_up":
            var_4 = var_1;
            var_4 maps\_audio::_id_170B( "hamb_humvee_drive_up" );
            wait 5;
            var_4 playsound( "hamb_humvee_drive_up" );
            var_4 playloopsound( "hamb_humvee_loop" );
            wait 7;
            var_4 maps\_audio::_id_170F( "hamb_humvee_drive_up" );
            break;
        case "street_chopper_fly_by":
            var_5 = var_1[0];
            var_6 = var_1[1];
            thread _id_7D8D( "hamb_hind", var_5 );
            thread _id_7D8D( "hamb_osprey", var_6 );
            break;
        case "tank_smash_through_wall":
            thread _id_7D8E( ( -6106.0, 17999.0, 11.0 ) );
            wait 0.5;
            thread _id_7D8F();
            break;
        case "f15_missile":
            var_1 waittill( "death" );

            if ( isdefined( var_1 ) )
                common_scripts\utility::play_sound_in_space( "hamb_f15_missile", var_1.origin );

            break;
        case "convoy_victim_1st_car":
            thread _id_7D90();
            break;
        case "convoy_victim_2nd_car":
            thread _id_7D91();
            break;
        case "play_car_horn":
            level._id_16F5._id_7D89 playloopsound( "hamb_car_horn_loop" );
            break;
        case "stop_car_horn":
            wait 1;
            level._id_16F5._id_7D89 stoploopsound();
            wait 1;
            level._id_16F5._id_7D89 delete();
            break;
        case "breach_free_hostage":
            thread _id_7D92();
            break;
        case "end_osprey":
            var_3 = getent( "nest_osprey_kill", "targetname" );
            var_7 = spawn( "script_origin", var_3.origin );
            var_7 playloopsound( "hamb_osprey" );
            var_7 moveto( ( -239.0, 20238.0, 615.0 ), 5 );
            break;
        default:
            maps\_audio::_id_177E( "hamburg_aud_msg_handler() unhandled message: " + var_0 );
            var_2 = 0;
            break;
    }

    return var_2;
}

_id_7D8D( var_0, var_1 )
{
    var_2 = spawn( "script_origin", var_1.origin );
    var_2 linkto( var_1 );
    var_2 playloopsound( var_0 );
    wait 6;
    maps\_audio::_id_15F3( var_2, 2 );
}

_id_7D8E( var_0 )
{
    thread common_scripts\utility::play_sound_in_space( "hamb_tank_thru_wall_blast", var_0 );
    thread common_scripts\utility::play_sound_in_space( "hamb_tank_thru_wall_debris", var_0 );
}

_id_7D8F()
{
    var_0 = spawn( "script_origin", ( -6106.0, 17999.0, -81.0 ) );
    var_0 playloopsound( "hamb_tank_one_shot" );
    var_0 moveto( ( -6271.0, 18420.0, -81.0 ), 1.5 );
    wait 5;
    maps\_audio::_id_15F3( var_0, 3 );
}

_id_7D90()
{
    if ( level._id_16F5._id_7D8A == 0 )
    {
        level._id_16F5._id_7D8A = 1;
        var_0 = spawn( "script_origin", ( -414.0, 18345.0, -42.0 ) );
        wait 4.25;
        var_0 playsound( "hamb_convoy_victim_01" );
        var_0 waittill( "sounddone" );
        var_0 delete();
    }
}

_id_7D91()
{
    if ( level._id_16F5._id_7D8B == 0 )
    {
        level._id_16F5._id_7D8B = 1;
        var_0 = spawn( "script_origin", ( -520.0, 17964.0, -43.0 ) );
        wait 8.3;
        var_0 playsound( "hamb_convoy_victim_02" );
        var_0 waittill( "sounddone" );
        var_0 delete();
    }
}

_id_7D92()
{
    level._id_7D93 = spawn( "script_origin", level._id_45C0.origin );
    wait 2;
    level._id_7D93 playsound( "hamb_free_hostage", "sounddone" );
    level._id_7D93 linkto( level._id_45C0 );
    thread maps\_audio::_id_1783( level._id_7D93 );
}
