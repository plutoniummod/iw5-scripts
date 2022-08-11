// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_47CE();
    _id_47CF();
    _id_47D0();
    _id_47D1();
}
#using_animtree("generic_human");

_id_47CE()
{
    level._id_0C59["lonestar"]["ny_manhattan_hind_finale"] = %ny_manhatten_hind_finale_guy1;
    level._id_0C59["truck"]["ny_manhattan_hind_finale"] = %ny_manhatten_hind_finale_guy2;
    level._id_0C59["reno"]["ny_manhattan_hind_finale"] = %ny_manhatten_hind_finale_guy3;
    level._id_0C59["lonestar"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_guy1_pt2;
    level._id_0C59["truck"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_guy2_pt2;
    level._id_0C59["reno"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_guy3_pt2;
}
#using_animtree("player");

_id_47CF()
{
    level._id_0C59["player_rig"]["ny_manhattan_hind_finale"] = %ny_manhatten_hind_finale_player;
    level._id_0C59["player_rig"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_player_pt2;
}
#using_animtree("vehicles");

_id_47D0()
{
    level._id_1245["hind"] = #animtree;
    level._id_0C59["hind"]["ny_manhattan_hind_finale"] = %ny_manhatten_hind_finale_hind;
    level._id_0C59["hind"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_hind_pt2;
    maps\_anim::_id_1264( "hind", "vfx_enemy_tail_hit", ::_id_47D2, "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1264( "hind", "vfx_enemy_tail_hit", ::_id_47D3, "ny_manhattan_hind_finale2" );
    level._id_1245["enemyhind"] = #animtree;
    level._id_0C59["enemyhind"]["ny_manhattan_hind_finale"] = %ny_manhatten_hind_finale_enemyhind;
    level._id_0C59["enemyhind"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_enemyhind_pt2;
    maps\_anim::_id_1264( "enemyhind", "vfx_enemy_tail_smk_trail", ::_id_47D5, "ny_manhattan_hind_finale2" );
    maps\_anim::_id_1264( "enemyhind", "vfx_enemy_building_hit", ::_id_47D7, "ny_manhattan_hind_finale2" );
    level._id_1245["hindturret"] = #animtree;
    level._id_0C59["hindturret"]["ny_manhattan_hind_finale2"] = %ny_manhatten_hind_finale_turret_pt2;
}
#using_animtree("script_model");

_id_47D1()
{
    level._id_1F90["chunks"] = "ny_building_chunks";
    level._id_1245["chunks"] = #animtree;
    level._id_0C59["chunks"]["ny_manhattan_hind_finale3"] = %ny_manhatten_hind_finale_exploding_parts;
    maps\_anim::_id_1264( "chunks", "vfx_smktrail_start", ::_id_47D6, "ny_manhattan_hind_finale3" );
}

_id_47D2( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "hind_finale_enemy_tail_hit_ny" ), var_0, "tag_doorgun" );
    playfxontag( common_scripts\utility::getfx( "hind_finale_player_beeper" ), var_0, "tag_light_cargo01" );
    playfxontag( common_scripts\utility::getfx( "hind_finale_player_damage_spark" ), var_0, "tag_light_cargo01" );
    wait 7.5;
    playfxontag( common_scripts\utility::getfx( "hind_finale_player_damage_spark" ), var_0, "tag_light_cargo01" );
}

_id_47D3( var_0 )
{
    var_1 = level._id_1436;
    var_2 = self gettagorigin( "tag_origin" );
    var_3 = level.player.origin;
    var_4 = length( var_2 - var_3 );
    var_5 = [];
    var_6 = [];
    var_5["nearStart"] = 60;
    var_5["nearEnd"] = 500;
    var_5["nearBlur"] = 10;
    var_5["farStart"] = 5500;
    var_5["farEnd"] = 8000;
    var_5["farBlur"] = 1;
    var_6 = var_5;
    var_7 = 100;
    maps\_utility::_id_27C0( var_1, var_5, 0.2 );
    wait 0.15;

    for ( var_8 = 0; var_8 < 58; var_8++ )
    {
        var_2 = self gettagorigin( "tag_origin" );
        var_3 = level.player.origin;
        var_4 = length( var_2 - var_3 );
        var_5["farStart"] = 5500;
        var_5["farEnd"] = 8000;
        maps\_utility::_id_27C0( var_6, var_5, 0.2 );
        var_6 = var_5;
        wait 0.2;
    }

    maps\_utility::_id_27C0( var_5, var_1, 1 );
    wait 3;
    var_1 = level._id_1436;
    var_2 = self gettagorigin( "tag_origin" );
    var_3 = level.player.origin;
    var_4 = length( var_2 - var_3 );
    var_5 = [];
    var_6 = [];
    var_5["nearStart"] = 0;
    var_5["nearEnd"] = 1;
    var_5["nearBlur"] = 10;
    var_5["farStart"] = 1500;
    var_5["farEnd"] = 8000;
    var_5["farBlur"] = 3.5;
    var_6 = var_5;
    var_7 = 100;
    maps\_utility::_id_27C0( var_1, var_5, 0.2 );
    wait 0.15;

    for ( var_8 = 0; var_8 < 40; var_8++ )
    {
        var_2 = self gettagorigin( "tag_origin" );
        var_3 = level.player.origin;
        var_4 = length( var_2 - var_3 );
        var_5["farStart"] = 1500;
        var_5["farEnd"] = 8000;
        maps\_utility::_id_27C0( var_6, var_5, 0.2 );
        var_6 = var_5;
        wait 0.5;
    }

    wait 1;
    var_9 = [];
    var_9["nearStart"] = 0.1;
    var_9["nearEnd"] = 0.2;
    var_9["nearBlur"] = 4.0;
    var_9["farStart"] = 5200;
    var_9["farEnd"] = 13500;
    var_9["farBlur"] = 1.65;
    maps\_utility::_id_27C0( var_5, var_9, 0.7 );
}

_id_47D4( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "hind_finale_player_smk_rotor_ny" ), var_0, "tag_origin" );
}

_id_47D5( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "hind_finale_enemy_tail_smk_trail_ny" ), var_0, "tag_light_tail" );
    level waittill( "enemyhind_hit_building_start" );
    stopfxontag( common_scripts\utility::getfx( "hind_finale_enemy_tail_smk_trail_ny" ), var_0, "tag_light_tail" );
}

_id_47D6( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "hind_finale_chunk_smk_trail_ny" ), var_0, "jnt_barrel" );
}

_id_47D7( var_0 )
{
    common_scripts\utility::exploder( 17 );
    level notify( "enemyhind_hit_building_start" );
    wait 0.15;
    common_scripts\utility::exploder( 18 );
    wait 0.3;
    common_scripts\utility::exploder( 19 );
    wait 0.9;
    common_scripts\utility::exploder( 20 );
    wait 19.0;
    common_scripts\utility::exploder( 21 );
    wait 6.1;
    wait 3.0;
    common_scripts\utility::exploder( 23 );
}
