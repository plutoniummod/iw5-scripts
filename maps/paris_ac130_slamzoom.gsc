// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_5872()
{
    _id_612D();
    _id_6122();
    level thread _id_5AAA();
    level thread _id_6121();
    level thread _id_61C1( "black", "intro_setup_complete", 2 );
    level thread _id_6124();
    level thread _id_6123();
    level thread _id_613D();
    level thread _id_612F();
    level thread _id_614A();
    level thread _id_6142();
    level thread _id_6144();
    level thread _id_614F();
    var_0 = getentarray( "intro_aa_fire", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_61EE, "intro_osprey_hit" );
    common_scripts\utility::flag_wait( "new_intro_complete" );
    level thread _id_6129();
    maps\_utility::_id_265A( "allies" );
    level._id_0C59["generic"]["run_reaction_180"] = %run_reaction_180;
    level._id_0C59["generic"]["run_turn_180"] = %run_turn_180;
    level._id_0C59["generic"]["corner_stand_explosion_B"] = %corner_standl_explosion_b;
    level._id_0C59["generic"]["intro_wave"] = %payback_escape_start_wave_soap;
    var_1 = common_scripts\utility::getstructarray( "intro_ambient_bombing_run", "targetname" );
    level thread _id_61D1( var_1, "intro_osprey_hit" );
}

_id_6121()
{
    level thread _id_6226( ( -6844.95, 49043.9, 4389.57 ), ( 271.964, 298.249, -104.603 ), "FX_c130_paratroop_aircaft", 8, "intro_osprey_hit", 1 );
}

_id_6122()
{
    level._id_11BB["ac130_snd_volksecure"] = "ac130_snd_volksecure";
    level._id_11BB["ac130_hqr_raptor24"] = "ac130_hqr_raptor24";
    level._id_11BB["ac130_snd_ourride"] = "ac130_snd_ourride";
    level._id_11BB["ac130_snd_getvolkletsgo"] = "ac130_snd_getvolkletsgo";
    level.scr_sound["sandman"]["ac130_snd_gottagonow"] = "ac130_snd_gottagonow";
    level.scr_sound["grinch"]["ac130_rno_move"] = "ac130_rno_move";
    level.scr_sound["volk"]["ac130_vlk_handsoffme"] = "ac130_vlk_handsoffme";
    level.scr_sound["grinch"]["ac130_rno_tryany"] = "ac130_rno_tryany";
    level.scr_sound["volk"]["ac130_vlk_fyou"] = "ac130_vlk_fyou";
    level.scr_sound["sandman"]["ac130_snd_letsgocmon"] = "ac130_snd_letsgocmon";
    level._id_11BB["ac130_osp_goingdown"] = "ac130_osp_goingdown";
    level._id_11BB["ac130_osp_brace"] = "ac130_osp_brace";
    level._id_11BB["ac130_snd_alternate"] = "ac130_snd_alternate";
    level._id_11BB["ac130_bl1_blueone"] = "ac130_bl1_blueone";
    level._id_11BB["ac130_gt6_longknife"] = "ac130_gt6_longknife";
}

_id_6123()
{
    _id_5EB6( 1 );
    var_0 = getent( "intro_slamzoom_start", "targetname" );
    level.player setplayerangles( var_0.angles );
    var_1 = spawn( "script_model", var_0.angles );
    var_1 setmodel( "tag_origin" );
    var_1.origin = level.player.origin;
    var_1 setmodel( "tag_origin" );
    var_1.angles = level.player.angles;
    level.player playerlinkto( var_1 );
    var_1 moveto( var_0.origin, 0.05 );
    var_1 rotateto( var_0.angles, 0.05 );
    var_1 waittill( "rotatedone" );
    level.player unlink();
    common_scripts\utility::flag_set( "new_intro_complete" );
}

_id_6124()
{
    var_0 = getvehiclenodearray( "intro_sonic_boom", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, _id_4960::_id_3E81 );
    var_1 = getentarray( "new_intro_opening_bomber", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6125 );
    var_2 = common_scripts\utility::getstruct( "intro_explosion", "targetname" );
    wait 2.3;

    while ( !common_scripts\utility::flag( "FLAG_intro_slamout_start" ) )
    {
        foreach ( var_4 in var_1 )
        {
            var_4.count = 1;
            var_4 maps\_vehicle::_id_1F9E();
            wait(randomintrange( 5, 8 ));
        }
    }

    foreach ( var_7 in var_1 )
        var_7 delete();
}

_id_6125()
{
    self waittill( "reached_end_node" );

    if ( isdefined( self ) )
        self delete();
}

_id_5AAA()
{
    maps\_utility::_id_194E( "paris_ac130_groundbegin_ext" );
    wait 0.5;
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_ourride" );
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_getvolkletsgo" );
    level._id_6126 maps\_utility::play_sound_on_entity( "ac130_rno_move" );
    level._id_6127 maps\_utility::play_sound_on_entity( "ac130_vlk_handsoffme" );
    level._id_6127 maps\_utility::play_sound_on_entity( "ac130_vlk_fyou" );
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_letsgocmon" );
    common_scripts\utility::flag_wait( "intro_setup_complete" );
    common_scripts\utility::flag_set( "intro_vo_complete" );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_event" );
    maps\_utility::_id_1425( "paris_ac130__start" );
    common_scripts\utility::flag_wait( "intro_osprey_hit" );
    maps\_utility::_id_11F4( "ac130_osp_goingdown" );
    maps\_utility::_id_11F4( "ac130_osp_brace" );
    wait 6;
    musicstop( 3 );
    maps\_utility::_id_11F4( "ac130_snd_alternate" );
}

_id_6128( var_0, var_1 )
{
    level.player visionsetnakedforplayer( "coup_sunblind", var_0 );
    common_scripts\utility::flag_wait( var_1 );
    level.player visionsetnakedforplayer( "paris_ac130", 0.2 );
}

_id_6129()
{
    var_0 = getentarray( "intro_enemy_choppers", "targetname" );
    common_scripts\utility::flag_wait( "intro_osprey_hit" );
    wait 2.5;

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_vehicle::_id_1F9E();
        wait 0.5;
        var_3 thread _id_612B( "FLAG_intro_slamout_start" );
    }
}

_id_612A( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_612B( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self kill();
}

_id_612C()
{
    var_0 = getent( "new_intro_smoke", "targetname" );
    var_1 = common_scripts\utility::getfx( "FX_signal_ac130" );
    var_2 = getent( "new_intro_smoke", "targetname" );
    var_3 = spawn( "script_model", var_2.origin );
    var_3.angles = var_2.angles;
    var_3 setmodel( "tag_origin" );
    common_scripts\utility::exploder( "smoke_signal_mellow" );
    wait 5.0;
    common_scripts\utility::flag_wait( "FLAG_fdr_enemy_vehicles_killed" );
    var_3 delete();
}

_id_612D()
{
    common_scripts\utility::flag_init( "new_intro_complete" );
    common_scripts\utility::flag_init( "intro_setup_complete" );
    common_scripts\utility::flag_init( "intro_top_area_clear" );
    common_scripts\utility::flag_init( "intro_vo_complete" );
    common_scripts\utility::flag_init( "intro_osprey_hit" );
    common_scripts\utility::flag_init( "slamzoom_building_hit" );
    common_scripts\utility::flag_init( "start_flyin" );
    common_scripts\utility::flag_init( "start_car_crash" );
    common_scripts\utility::flag_init( "new_player_drop" );
}

_id_612E( var_0 )
{
    var_1 = ( 76.0, -74.0, 25.0 );
    var_2 = ( 76.0, 74.0, 25.0 );
    var_3 = common_scripts\utility::getstruct( "jet_fx", "targetname" );
    var_4 = getvehiclenode( "missile_launch", "script_noteworthy" );
    var_5 = common_scripts\utility::getstruct( "intro_bomb_explosion_1", "targetname" );
    var_6 = common_scripts\utility::getstruct( "intro_bomb_explosion_2", "targetname" );
    var_7 = getent( "intro_opening_bomber", "targetname" );

    for ( var_8 = 0; var_8 < 2; var_8++ )
    {
        var_9 = maps\_vehicle::_id_2881( "intro_opening_bomber" );
        wait 0.1;
        var_9 thread _id_61F2();
        var_4 waittill( "trigger" );
        var_9 thread common_scripts\utility::play_sound_in_space( "veh_f15_sonic_boom" );
        var_7.count = 1;
        wait 1.3;
    }
}

_id_612F()
{
    level.player freezecontrols( 1 );
    _id_5F9E::_id_5F95( "delta_", "targetname", 0, maps\paris_ac130_code::_id_6130 );
    _id_5F9E::_id_5F97( "delta_", "targetname", 0, maps\paris_ac130_code::_id_6131, 1 );
    var_0 = _id_5F9E::_id_5F90( "delta_", "targetname", 0 );

    foreach ( var_4, var_2 in var_0 )
    {
        level._id_6132[var_4] = var_2 stalingradspawn();
        level._id_6132[var_4].ignoreall = 1;
        var_3 = maps\_utility::_id_13AF( level._id_6132[var_4] );
    }

    var_5 = getent( "makarov_number_2", "targetname" );
    var_5 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6130, "makarov_number_2", "targetname" );
    var_5 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6131, 0 );
    level._id_6127 = var_5 stalingradspawn();
    var_3 = maps\_utility::_id_13AF( level._id_6127 );
    level._id_6127 hidepart( "tag_weapon", "defaultweapon" );
    level._id_6127.ignoreall = 1;
    level._id_6127.ignoreme = 1;
    level._id_45C0 = level._id_6132[0];
    level._id_45C0.script_noteworthy = "san dman";
    level._id_6133 = level._id_6132[1];
    level._id_6133.script_noteworthy = "frost";
    level._id_6133.name = "";
    level._id_6134 = level._id_6132[2];
    level._id_6134.script_noteworthy = "hitman";
    level._id_6135 = level._id_6132[3];
    level._id_6135.script_noteworthy = "gator";
    level._id_6126 = level._id_6132[4];
    level._id_6126.script_noteworthy = "bishop";
    level._id_45C0 thread _id_6138();
    level._id_6135 thread _id_6139();
    wait 0.05;
    var_6 = level._id_6132;
    var_6[var_6.size] = level._id_6127;

    foreach ( var_8 in var_6 )
    {
        var_8 maps\paris_ac130_code::_id_6136();
        var_8 maps\_utility::_id_2724( 32.0 );
        var_8._id_20AF = 0.2;
        var_8 maps\_utility::_id_2712();
        var_8 maps\_utility::_id_13A4( "y" );
        var_8 maps\_utility::_id_2712();
    }

    level._id_6134 thread _id_613A();
    level._id_6133 hide();
    level._id_6133.ignoreme = 1;
    level._id_6133.ignoreall = 1;
    maps\paris_ac130::_id_6137();
    wait 0.1;
    level._id_45C0._id_1032 = "generic";
    thread _id_613B();
    level._id_6134 maps\_utility::_id_13A4( "y" );
    level._id_6126 maps\_utility::_id_13A4( "y" );
    common_scripts\utility::flag_set( "intro_setup_complete" );
    maps\_utility::_id_26BF( "intro_squad_pos1" );
    level.player freezecontrols( 0 );
    common_scripts\utility::flag_wait( "intro_osprey_hit" );
    maps\_utility::_id_26BF( "crash_retreat" );
    objective_position( maps\_utility::_id_2816( "OBJ_osprey" ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "FLAG_intro_slamout_start" );
    objective_state( maps\_utility::_id_2816( "OBJ_osprey" ), "done" );
}

_id_6138()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_start" );
    self._id_1032 = "generic";
    self.goalradius = 12;
    maps\_utility::_id_123B();
    var_0 = common_scripts\utility::getstruct( "run_turn_180", "targetname" );
    wait 0.5;
    var_0 maps\_anim::_id_124A( self, "run_turn_180" );
    var_0 thread maps\_anim::_id_1247( self, "run_turn_180" );
    wait 0.1;
    maps\_utility::_id_13A4( "y" );
    wait 3;
    self.ignoreme = 0;
}

_id_6139()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_start" );
    self.goalradius = 50;
    self._id_1032 = "generic";
    var_0 = common_scripts\utility::getstruct( "corner_stand_explosion_B", "targetname" );
    var_1 = getnode( "corner_explosion_node", "targetname" );
    common_scripts\utility::flag_wait( "intro_osprey_hit" );
    wait 6.5;
    var_0 maps\_anim::_id_124A( self, "corner_stand_explosion_B" );
    var_0 thread maps\_anim::_id_1246( self, "corner_stand_explosion_B" );
    wait 0.1;
    self setgoalnode( var_1 );
}

_id_613A()
{
    self endon( "death" );
    self._id_1032 = "generic";
    self.goalradius = 12;
    self.ignoreall = 1;
    maps\_utility::_id_123B();
    var_0 = common_scripts\utility::getstruct( "run_reaction_180", "targetname" );
    var_1 = common_scripts\utility::getstruct( "payback_escape_start_wave_soap", "targetname" );
    wait 1.5;
    var_1 maps\_anim::_id_124A( self, "intro_wave" );
    var_1 maps\_anim::_id_1247( self, "intro_wave" );
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_start" );
    var_0 maps\_anim::_id_124A( self, "run_reaction_180" );
    var_0 thread maps\_anim::_id_1247( self, "run_reaction_180" );
    wait 0.1;
    var_2 = getnode( "intro_attack_node", "targetname" );
    self.goalradius = 32;
    self setgoalnode( var_2 );
}

_id_613B()
{
    var_0 = common_scripts\utility::getstruct( "intro_hvt_arrive_hvt", "targetname" );
    var_1 = common_scripts\utility::getstruct( "intro_hvt_arrive_guard", "targetname" );
    var_2 = common_scripts\utility::getstruct( "intro_hvt_idle", "targetname" );
    level._id_6126._id_1032 = "guard";
    level._id_6126 maps\_utility::_id_219B();
    level._id_6127._id_1032 = "hvt";
    var_3 = [];
    var_3[0] = level._id_6126;
    var_3[1] = level._id_6127;
    common_scripts\utility::flag_wait( "intro_setup_complete" );
    wait 2;
    var_0 thread maps\_anim::_id_1246( level._id_6127, "intro_hvt_arrive_hvt" );
    var_1 maps\_anim::_id_1246( level._id_6126, "intro_hvt_arrive_guard" );
    level._id_6127 maps\_anim::_id_11D6( var_3, "intro_hvt_idle" );
}

_id_613C()
{
    return;
}

_id_613D()
{
    thread maps\_utility::_id_2634( "new_player_drop" );
    level thread _id_613E();
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "vehicle_v22_osprey" );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    var_0.targetname = "intro_osprey";
    var_1 = getent( "new_intro_crash_start_pos", "targetname" );
    var_0 thread _id_613F();
    var_0._id_4180 = getent( "osprey_clip", "targetname" );
    var_0._id_4180.angles = var_0.angles;
    var_0._id_4180.origin = var_0.origin;
    var_0._id_4180 linkto( var_0, "tag_body", ( 0.0, -80.0, 15.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 = getent( "intro_osprey_pilot", "targetname" );
    var_3 = var_2 spawndrone();
    var_3.script_noteworthy = "intro_osprey_pilot";
    var_3._id_1032 = "generic";
    var_3 useanimtree( level._id_1245["drone"] );
    var_4 = getent( "intro_osprey_copilot", "targetname" );
    var_5 = var_4 spawndrone();
    var_5.script_noteworthy = "intro_osprey_copilot";
    var_5._id_1032 = "generic";
    var_5 useanimtree( level._id_1245["drone"] );
    thread _id_612C();
    wait 0.5;
    var_3 thread _id_6140( var_1, "ANIM_paris_ac130_osprey_flyin_pilot", 0.7 );
    var_5 thread _id_6140( var_1, "ANIM_paris_ac130_osprey_flyin_copilot", 0.7 );
    var_0._id_1032 = "v22_osprey";
    var_0 maps\_anim::_id_1244();
    common_scripts\utility::flag_set( "start_flyin" );
    var_0 _id_6140( var_1, "ANIM_paris_ac130_osprey_flyin", 0.7 );
    objective_add( maps\_utility::_id_2816( "OBJ_osprey" ), "current", &"PARIS_AC130_OBJ_INTRO_GET_TO_OSPREY" );
    objective_position( maps\_utility::_id_2816( "OBJ_osprey" ), var_0.origin );
    objective_onentity( maps\_utility::_id_2816( "OBJ_osprey" ), var_0 );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_crash_ready" );
    var_0 playloopsound( "osprey_idle_high" );

    while ( !common_scripts\utility::flag( "new_player_drop" ) )
    {
        var_1 thread maps\_anim::_id_11C1( var_3, "ANIM_paris_ac130_osprey_idle_pilot" );
        var_1 thread maps\_anim::_id_11C1( var_5, "ANIM_paris_ac130_osprey_idle_copilot" );
        var_1 maps\_anim::_id_11DD( [ var_0 ], "ANIM_paris_ac130_osprey_idle" );
    }

    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_crash_start" );
    var_1 thread maps\_anim::_id_11C1( var_3, "ANIM_paris_ac130_osprey_idle_pilot" );
    var_1 thread maps\_anim::_id_11C1( var_5, "ANIM_paris_ac130_osprey_idle_copilot" );
    var_1 thread maps\_anim::_id_11DD( [ var_0 ], "ANIM_paris_ac130_osprey_idle" );
    wait 2;
    common_scripts\utility::flag_set( "start_car_crash" );
    maps\_utility::delaythread( 0.2, maps\_utility::_id_142B, "paris_ac130_osprey_crash_mx" );
    var_0 stoploopsound( "osprey_idle_high" );
    var_1 thread maps\_anim::_id_11DD( [ var_0 ], "ANIM_paris_ac130_osprey_crash_v2" );
    var_1 thread maps\_anim::_id_11C1( var_3, "ANIM_paris_ac130_osprey_crash_pilot" );
    var_1 thread maps\_anim::_id_11C1( var_5, "ANIM_paris_ac130_osprey_crash_copilot" );
    wait 9;
    level.player thread maps\_utility::vision_set_fog_changes( "paris_ac130_start_area_crash", 7 );
    common_scripts\utility::flag_wait( "FLAG_intro_slamout_start" );
    var_0 delete();
}

_id_613E()
{
    level endon( "new_player_drop" );
    var_0 = 11;
    wait(var_0);

    if ( !common_scripts\utility::flag( "new_player_drop" ) )
        maps\_utility::_id_26BF( "new_player_drop" );
}

_id_613F()
{
    level endon( "FLAG_intro_slamout_start" );
    var_0 = getent( "osprey_clip", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
        {
            level.player dodamage( 5000, level.player.origin );
            return;
        }

        wait 0.05;
    }
}

_id_6140( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( "start_flyin" );
    var_0 thread maps\_anim::_id_11DD( [ self ], var_1 );
    wait 0.05;
    maps\_anim::_id_1280( var_1, var_2 );
    var_0 waittill( var_1 );
    return;
}

_id_6141()
{
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_event" );
    common_scripts\utility::flag_wait( "FLAG_intro_slamout_start" );
    level notify( "LISTEN_end_intro_enemy_1_spawn" );
    wait 0.05;
    maps\_utility::_id_2839( "intro_enemy_spot", "targetname" );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
}

_id_6142()
{
    common_scripts\utility::flag_wait( "intro_vo_complete" );
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_start" );
    var_0 = getent( "intro_osprey", "targetname" );
    level thread _id_6143( var_0 );
    level thread _id_612E( var_0 );
}

_id_6143( var_0 )
{
    var_1 = ( 4531.8, 45880.1, 626.8 );
    var_2 = ( 4531.8, 45880.1, 318.05 );
    var_3 = var_0 gettagorigin( "j_blades_ri" );
    var_4 = ( 3319.4, 46460.1, 352.0 );
    var_5 = "hydra_ac130_rocket";
    magicbullet( var_5, var_2, var_3 );
    wait 0.9;
    magicbullet( var_5, var_1, var_4 );
    wait 0.8;
    playfx( common_scripts\utility::getfx( "intro_building_explosion" ), var_4 );
    playfx( common_scripts\utility::getfx( "debris_explosion_intro" ), var_4 );
    wait 7;
}

_id_6144()
{
    level.player endon( "death" );
    common_scripts\utility::flag_set( "FLAG_intro_player_knockout_started" );
    var_0 = maps\_utility::_id_283B( "intro_frost_downed_pos", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( "viewhands_player_delta" );
    var_1 hide();
    var_2 = spawn( "script_model", var_0.origin );
    var_2.angles = var_0.angles;
    var_2 setmodel( "viewlegs_generic" );
    var_2 hide();
    var_3 = spawn( "script_model", var_1.origin );
    var_3.angles = var_1 gettagangles( "tag_origin" );
    var_3 setmodel( "tag_origin" );
    var_3 linkto( var_1, "tag_camera" );
    var_4 = getent( "new_intro_crash_start_pos", "targetname" );
    var_1._id_1032 = "player_dragged";
    var_1 maps\_anim::_id_1244();
    var_2._id_1032 = "player_dragged";
    var_2 maps\_anim::_id_1244();
    var_5 = getentarray( "intro_car", "targetname" );
    var_6 = [];

    foreach ( var_9, var_8 in var_5 )
    {
        var_6[var_9] = spawn( "script_model", var_4.origin );
        var_6[var_9].angles = var_4 _id_5F9E::_id_5F4F( "angles" );
        var_6[var_9] setmodel( "tag_origin" );
        var_6[var_9]._id_1032 = "car";
        var_6[var_9] maps\_anim::_id_1244();
        var_4 maps\_anim::_id_11CF( var_6[var_9], "paris_ac130_osprey_crash_car_" + var_8._id_16A5 );
        var_8.origin = var_6[var_9].origin;
        var_8.angles = var_6[var_9] _id_5F9E::_id_5F4F( "angles" );
        var_8 linkto( var_6[var_9], "tag_origin" );
        var_8 thread _id_6145( var_4, var_6[var_9], "paris_ac130_osprey_crash_car_" + var_8._id_16A5 );
    }

    var_10 = getent( "intro_osprey_pilot", "script_noteworthy" );
    var_11 = getent( "intro_osprey_copilot", "script_noteworthy" );
    var_12 = getent( "intro_osprey_gunner", "script_noteworthy" );
    common_scripts\utility::flag_wait( "start_car_crash" );
    var_13 = getanimlength( var_1 maps\_utility::_id_1281( "ANIM_player_dragged_top" ) );
    var_14 = var_13 - 20;
    wait(var_14);
    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_crash_finished" );
    var_3 = spawn( "script_model", level.player.origin );
    var_3.angles = level.player getplayerangles();
    var_3 setmodel( "tag_origin" );
    level.player freezecontrols( 1 );
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player playerlinktoabsolute( var_3, "tag_origin" );
    level.player enableinvulnerability();
    level.player hideviewmodel();
    level.player takeallweapons();
    level.player.ignoreme = 1;
    var_15 = ( level.player.origin[0], level.player.origin[1], 12000 );
    var_16 = ( 90, 27.3719, level.player.angles[2] );
    var_3 movez( 12000, 1.8, 1.8 );
    var_3 thread common_scripts\utility::play_loop_sound_on_entity( "slamout_static" );
    thread _id_61B1( 0.2 );
    var_3 rotateto( var_16, 0.3, 0.3 );
    level.player visionsetnakedforplayer( "paris_ac130_enhanced", 2 );
    var_3 thread maps\_utility::play_sound_on_entity( "player_slamzoom_out" );
    wait 1.1;
    thread _id_61C0( "overlay_static", 0.3, 1 );
    wait 0.7;
    common_scripts\utility::flag_set( "FLAG_intro_slamout_start" );
    level.player freezecontrols( 0 );
    var_3 thread common_scripts\utility::stop_loop_sound_on_entity( "slamout_static" );
    var_1 delete();
    var_2 delete();
    var_3 delete();
    var_17 = getent( "intro_osprey_pilot", "targetname" );
    var_18 = getent( "intro_osprey_copilot", "targetname" );
    var_19 = getent( "intro_osprey_gunner", "targetname" );
    var_17 delete();
    var_10 delete();
    var_18 delete();
    var_11 delete();
    var_19 delete();

    foreach ( var_8 in var_5 )
        var_8 delete();

    foreach ( var_23 in var_6 )
        var_23 delete();
}

_id_6145( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( "start_car_crash" );
    var_0 thread maps\_anim::_id_11DD( [ var_1 ], var_2 );
}

_id_6146( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_entity( "scn_ac130_opening_osprey_bombed" );
    common_scripts\utility::flag_set( "intro_osprey_hit" );
    earthquake( 0.5, 0.4, level.player.origin, 200 );
}

_id_6147( var_0 )
{
    common_scripts\utility::exploder( "osprey_crash" );
    var_0 thread maps\_utility::play_sound_on_entity( "osprey_crash_hitground" );
    level.player playrumblelooponentity( "damage_light" );
    level.player common_scripts\utility::delaycall( 6, ::stoprumble, "damage_light" );
    earthquake( 0.2, 6, level.player.origin, 1000 );
    wait 3;
    earthquake( 0.3, 6, level.player.origin, 1000 );
    wait 3;
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 3, ::stoprumble, "damage_heavy" );
    earthquake( 0.4, 3, level.player.origin, 200 );
}

_id_6148( var_0 )
{
    level endon( "FLAG_intro_slamout_start" );

    for (;;)
    {
        var_1 = var_0 gettagorigin( "J_Blades_RI" );
        playfx( level._effect["FX_osprey_engine_smoke"], var_1 );
        wait 0.075;
    }
}

_id_6149( var_0 )
{
    level endon( "FLAG_intro_slamout_start" );

    for (;;)
    {
        var_1 = var_0 gettagorigin( "J_Blades_RI" );
        playfx( level._effect["FX_osprey_engine_fire"], var_1 );
        wait 0.1;
    }
}

_id_614A()
{
    var_0 = getentarray( "intro_back_guys", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_614B );
    common_scripts\utility::flag_wait( "intro_osprey_hit" );
    wait 4;
    var_1 = maps\_utility::_id_272B( var_0, 0.2 );
    wait 2;
    common_scripts\utility::flag_wait( "FLAG_intro_slamout_start" );
    wait 4;
    var_1 = common_scripts\utility::array_removeundefined( var_1 );
    maps\_utility::_id_135B( var_1 );
}

_id_614B( var_0 )
{
    self endon( "death" );
    self.goalradius = 32;

    if ( randomint( 100 ) > 30 )
        self.grenadeammo = 0;

    if ( isdefined( var_0 ) )
        self._id_20AF = var_0;
}

_id_614C()
{
    _id_6157();
    _id_0546::_id_4068();
    _id_6159();
    level._id_3E8A = "ac130_40mm_air_support_strobe_iw";
    level._id_0A7A = [];
    level._id_6132 = common_scripts\utility::array_remove( level._id_6132, level._id_6133 );
    level thread _id_616A();
    level thread _id_619B();
    level thread _id_6175();
    level thread _id_616B();
    level thread _id_6166();
    level thread _id_615A();
    level thread _id_6160();
    level thread _id_61CA();
    level thread _id_61C5();
    level thread _id_6179();
    level thread _id_6183();

    if ( level._id_1F19 == "start_bridge" )
        level thread _id_614F();

    level._id_614D thread _id_6174();
    level._id_614E thread _id_6174();
    level thread _id_6169();
    var_0 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_0, ::_id_6154 );
    var_1 = _id_570B( level._id_614E.origin, level._id_614E.angles, ( 8.0, 36.0, 66.0 ) );
    var_2 = spawn( "script_origin", var_1 );
    var_2.angles = level._id_614E.angles + ( 0.0, 328.0, 0.0 );
    var_2 linkto( level._id_614E );
    level._id_3EDA.clipdistance = 10000;
    var_3 = getvehiclenodearray( "sonic_boom_bridge", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, _id_4960::_id_3E81 );
    var_4 = getentarray( "ambient_bridge_jets", "targetname" );
    level thread _id_61F1( var_4 );
    var_5 = [];
    var_6 = getentarray( "bridge_tanks", "script_noteworthy" );

    foreach ( var_8 in var_6 )
    {
        var_9 = var_8 maps\_vehicle::_id_1F9E();
        wait 0.1;
        var_9 thermaldrawenable();
        var_5 = common_scripts\utility::add_to_array( var_5, var_9 );
    }

    common_scripts\utility::flag_set( "bridge_tanks_spawned" );
    var_11 = maps\_utility::_id_0AE9( level._id_45C0.origin, var_5 );
    var_11 thread _id_61B5();
    var_12 = getentarray( "bridge_trigs", "script_noteworthy" );

    foreach ( var_14 in var_12 )
        var_14 common_scripts\utility::trigger_off();

    level thread _id_6155();
    level thread _id_6153( var_2 );
    level thread _id_61D0();
    common_scripts\utility::flag_wait( "slamzoom_complete" );
    level._id_45C0 hide();
    level thread _id_6152();

    foreach ( var_14 in var_12 )
        var_14 common_scripts\utility::trigger_on();

    level thread _id_61B9();
    level thread _id_61B8();
    level thread _id_6225();
    var_18 = getent( "squad_pos5", "targetname" );
    var_19 = var_18._id_1341;
    var_20 = spawn( "trigger_radius", ( -20654.0, 10816.0, -12.0 ), 0, 771, 128 );
    var_20.targetname = "new_alamo_color_trig";
    var_20._id_1341 = var_19;
    var_20 thread maps\_colors::_id_1357( var_19, "allies" );
}

_id_614F()
{
    var_0 = [];
    var_0[var_0.size] = "prop_ac_prs_enm_barge_a_1";
    var_0[var_0.size] = "prop_ac_prs_enm_barge_a_2";
    var_0[var_0.size] = "prop_ac_prs_enm_missile_boat_a";
    var_0[var_0.size] = "prop_ac_prs_enm_maz_a";
    var_0[var_0.size] = "prop_ac_prs_enm_mi26_halo_a";
    var_0[var_0.size] = "prop_ac_prs_enm_s300v_a";
    var_0[var_0.size] = "prop_ac_prs_enm_mstas_a";
    level thread _id_6150( var_0 );
}

_id_6150( var_0 )
{
    var_1 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_3 in var_1 )
    {
        foreach ( var_5 in var_0 )
        {
            if ( isdefined( var_3.destructible_type ) )
            {
                if ( var_3.destructible_type == var_5 )
                {
                    var_3 thread _id_6151();
                    break;
                }
            }
        }
    }
}

_id_6151()
{
    level endon( "slamzoom_complete" );
    self thermaldrawenable();
    common_scripts\utility::waittill_any( "destroyed", "exploded" );

    if ( isdefined( self ) )
        self thermaldrawdisable();
}

_id_6152()
{
    level thread _id_6226( ( -8306.91, 6486.67, 595.178 ), ( 270.0, 0.0, 0.0 ), "FX_ambient_explosion_paris", 12, "player_on_board_littlebird" );
    level thread _id_6226( ( -11026.2, -66.8614, 599.15 ), ( 270.0, 0.0, 0.0 ), "FX_ambient_explosion_paris", 10, "player_on_board_littlebird" );
    level thread _id_6226( ( -14397.4, -3458.67, 795.26 ), ( 270.0, 0.0, 0.0 ), "FX_ambient_explosion_paris", 8, "player_on_board_littlebird" );
}

_id_6153( var_0 )
{
    wait 12;
    level maps\paris_ac130_pip::_id_60E5( var_0, undefined, undefined, 70 );
    wait 1;
    var_1 = _id_570B( level._id_614E.origin, level._id_614E.angles, ( 277.0, 0.0, 62.0 ) );
    var_2 = spawn( "script_model", var_1 );
    var_2.angles = level._id_614E.angles;
    var_2 linkto( level._id_614E );
    var_2 setmodel( "tag_origin" );
    wait 1.5;
    playfxontag( level._effect["FX_bm21_hurt_explosion"], var_2, "tag_origin" );
    level.player thread maps\_utility::play_sound_on_entity( "exp_ac130_40mm_dist" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_ac130_pip_crash" );
    wait 1.5;
    playfxontag( level._effect["FX_bm21_hurt_explosion"], var_2, "tag_origin" );
    level.player thread maps\_utility::play_sound_on_entity( "exp_ac130_40mm_dist" );
}

_id_6154()
{
    self._id_20AF = 0.3;
    common_scripts\utility::flag_wait( "squad_at_final_pos" );

    if ( isdefined( self ) )
        self._id_20AF = 0.7;
}

_id_6155()
{
    var_0 = maps\_utility::_id_2642( "bridge_tank2", "targetname" );
    var_0 waittill( "death" );
    common_scripts\utility::flag_set( "bridge_tank2_dead" );
}

_id_6156()
{
    self waittill( "trigger", var_0 );
}

_id_6157()
{
    common_scripts\utility::flag_init( "bridge_tanks_spawned" );
    common_scripts\utility::flag_init( "slamzoom_complete" );
    common_scripts\utility::flag_init( "player_shot_tank" );
    common_scripts\utility::flag_init( "humvee_at_bridge" );
    common_scripts\utility::flag_init( "humvee_crashed" );
    common_scripts\utility::flag_init( "squad_at_bridge" );
    common_scripts\utility::flag_init( "c130_start_attacking" );
    common_scripts\utility::flag_init( "jav_obj_started" );
    common_scripts\utility::flag_init( "2_tanks_left" );
    common_scripts\utility::flag_init( "1_tank_left" );
    common_scripts\utility::flag_init( "all_tanks_destroyed" );
    common_scripts\utility::flag_init( "player_has_javelin" );
    common_scripts\utility::flag_init( "player_past_bus" );
    common_scripts\utility::flag_init( "player_over_hump" );
    common_scripts\utility::flag_init( "player_at_second_bus" );
    common_scripts\utility::flag_init( "crash_chopper_unloading" );
    common_scripts\utility::flag_init( "chopper_crashed_on_bridge" );
    common_scripts\utility::flag_init( "squad_to_bridge_collapse" );
    common_scripts\utility::flag_init( "bridge_collapse_start" );
    common_scripts\utility::flag_init( "bridge_group1_clear" );
    common_scripts\utility::flag_init( "crash_jet_complete" );
    common_scripts\utility::flag_init( "squad_at_final_pos" );
    common_scripts\utility::flag_init( "tower_final_start" );
    common_scripts\utility::flag_init( "bombing_run" );
    common_scripts\utility::flag_init( "squad_at_skipto_pos" );
    common_scripts\utility::flag_init( "pickup_choppers_in" );
    common_scripts\utility::flag_init( "alamo_clear" );
    common_scripts\utility::flag_init( "little_bird_full" );
    common_scripts\utility::flag_init( "c130_clears_baddies" );
    common_scripts\utility::flag_init( "bridge_bombed" );
    common_scripts\utility::flag_init( "both_choppers_down" );
    common_scripts\utility::flag_init( "final_vehicles_in" );
    common_scripts\utility::flag_init( "bomb_run_vo_finished" );
    common_scripts\utility::flag_init( "spawn_pickup_choppers" );
    common_scripts\utility::flag_init( "attack_choppers_spawned" );
}

_id_6158()
{
    common_scripts\utility::flag_init( "pinned_anim_complete" );
    common_scripts\utility::flag_init( "squad_to_courtyard" );
    common_scripts\utility::flag_init( "player_at_bedroom" );
    common_scripts\utility::flag_init( "courtyard_dialogue_complete" );
    common_scripts\utility::flag_init( "player_went_to_bedroom" );
    common_scripts\utility::flag_init( "player_went_upstairs" );
    common_scripts\utility::flag_init( "player_shot_yellow_building" );
    common_scripts\utility::flag_init( "hvt_slamzoom_complete" );
    common_scripts\utility::flag_init( "hvt_tank_destroyed" );
    common_scripts\utility::flag_init( "player_has_sniper_rifle" );
    common_scripts\utility::flag_init( "end_sniper_kill_monitor" );
    common_scripts\utility::flag_init( "turret_guy_dead" );
    common_scripts\utility::flag_init( "end_turret_script_control" );
    common_scripts\utility::flag_init( "hvt_courtyard_clear" );
    common_scripts\utility::flag_init( "player_on_turret" );
    common_scripts\utility::flag_init( "player_has_orders" );
    common_scripts\utility::flag_init( "c130_shooting_tank" );
    common_scripts\utility::flag_init( "hvt_air_strobe_start" );
    common_scripts\utility::flag_init( "player_threw_strobe" );
    common_scripts\utility::flag_init( "hvt_squad_to_fountain" );
    common_scripts\utility::flag_init( "hvt_monument_clear" );
}

_id_6159()
{
    level._id_11BB["ac130_snd_stopstop"] = "ac130_snd_stopstopstop";
    level._id_11BB["ac130_snd_convoystalled"] = "ac130_snd_armoronbridge";
    level._id_11BB["ac130_fco_hitarmor"] = "ac130_fco_hitarmor";
    level._id_11BB["ac130_fco_engagetanks"] = "ac130_fco_engagetanks";
    level._id_11BB["ac130_fco_hittanksbig"] = "ac130_fco_hittanksbig";
    level._id_11BB["ac130_snd_getjavelin"] = "ac130_snd_getjavelin";
    level._id_11BB["ac130_snd_usejavelin"] = "ac130_snd_usejavelin";
    level._id_11BB["ac130_snd_hittanksnow"] = "ac130_snd_hittanksnow";
    level._id_11BB["ac130_snd_getotherone"] = "ac130_snd_getotherone";
    level._id_11BB["ac130_snd_takeoutother"] = "ac130_snd_takeoutother";
    level._id_11BB["ac130_snd_hitlasttank"] = "ac130_snd_hitlasttank";
    level._id_11BB["ac130_snd_finishtanks"] = "ac130_snd_finishtanks";
    level._id_11BB["ac130_trk_tanksaredown"] = "ac130_trk_tanksaredown";
    level._id_11BB["ac130_plt_giveyouroom"] = "ac130_plt_giveyouroom";
    level._id_11BB["ac130_hit_igothim"] = "ac130_hit_igothim";
    level._id_11BB["ac130_hit_getupvolk"] = "ac130_hit_getupvolk";
    level._id_11BB["ac130_fco_engagebuilding"] = "ac130_fco_engagebuilding";
    level._id_11BB["ac130_fco_balcony"] = "ac130_fco_balcony";
    level._id_11BB["ac130_snd_findcover"] = "ac130_snd_findcover";
    level._id_11BB["ac130_snd_talktome"] = "ac130_snd_talktome";
    level._id_11BB["ac130_snd_anytimenow"] = "ac130_snd_anytimenow";
    level._id_11BB["ac130_snd_getmgdown"] = "ac130_snd_getmgdown";
    level._id_11BB["ac130_snd_takeoutmg"] = "ac130_snd_takeoutmg";
    level._id_11BB["ac130_snd_wecanmoveup"] = "ac130_snd_wecanmoveup";
    level._id_11BB["ac130_snd_alrightletsgo"] = "ac130_snd_alrightletsgo";
    level._id_11BB["ac130_snd_volkcovered"] = "ac130_snd_volkcovered";
    level._id_11BB["ac130_rno_affirmative"] = "ac130_rno_affirmative";
    level._id_11BB["ac130_snd_acrosscourtyard"] = "ac130_snd_acrosscourtyard";
    level._id_11BB["ac130_plt_anotherway"] = "ac130_plt_rearm";
    level._id_11BB["ac130_snd_drawfire"] = "ac130_snd_drawfire";
    level._id_11BB["ac130_snd_readygogo"] = "ac130_snd_readygogo";
    level._id_11BB["ac130_rno_attention"] = "ac130_rno_attention";
    level._id_11BB["ac130_hit_noshot"] = "ac130_hit_noshot";
    level._id_11BB["ac130_hit_taghim"] = "ac130_hit_taghim";
    level._id_11BB["ac130_snd_strongpointmonument"] = "ac130_snd_strongpointmonument";
    level._id_11BB["ac130_rno_behindyou"] = "ac130_rno_behindyou";
    level._id_11BB["ac130_snd_grinchyoureup"] = "ac130_snd_grinchyoureup";
    level._id_11BB["ac130_rno_bossman"] = "ac130_rno_bossman";
    level._id_11BB["ac130_vlk_killyouall"] = "ac130_vlk_killyouall";
    level._id_11BB["ac130_vlk_getmekilled"] = "ac130_vlk_getmekilled";
    level._id_11BB["ac130_rno_nowhere"] = "ac130_rno_nowhere";
    level._id_11BB["ac130_plt_engaging"] = "ac130_plt_engaging";
    level._id_11BB["ac130_trk_convoy"] = "ac130_trk_convoy";
    level._id_11BB["ac130_plt_allclear"] = "ac130_plt_allclear";
    level._id_11BB["ac130_snd_tankat3"] = "ac130_snd_tankat3";
    level._id_11BB["ac130_trk_tank"] = "ac130_trk_tank";
    level._id_11BB["ac130_snd_talktomewarhammer"] = "ac130_snd_talktomewarhammer";
    level._id_11BB["ac130_plt_tenmikes"] = "ac130_plt_tenmikes";
    level._id_11BB["ac130_snd_rightinfront"] = "ac130_snd_rightinfront";
    level._id_11BB["ac130_snd_getsmokeontank"] = "ac130_snd_getsmokeontank";
    level._id_11BB["ac130_snd_putsmokeontank"] = "ac130_snd_putsmokeontank";
    level._id_11BB["ac130_snd_markonthattank"] = "ac130_snd_markonthattank";
    level._id_11BB["ac130_trk_throwitattank"] = "ac130_trk_throwitattank";
    level._id_11BB["ac130_plt_waitingonmark"] = "ac130_plt_waitingonmark";
    level._id_11BB["ac130_plt_gotyourmark"] = "ac130_plt_gotyourmark";
    level._id_11BB["ac130_plt_engagingtarget"] = "ac130_plt_engagingtarget";
    level._id_11BB["ac130_snd_haveyouback"] = "ac130_snd_haveyouback";
    level._id_11BB["ac130_hmv_enroute"] = "ac130_hmv_enroute";
    level._id_11BB["ac130_snd_intersection"] = "ac130_snd_intersection";
    level._id_11BB["ac130_plt_shotout"] = "ac130_plt_shotout";
    level._id_11BB["ac130_fco_baseoftower"] = "ac130_fco_baseoftower";
    level._id_11BB["ac130_gtr_worthit"] = "ac130_gtr_worthit";
    level._id_11BB["ac130_hit_takingabeating"] = "ac130_hit_takingabeating";
    level._id_11BB["ac130_hmv_enroute"] = "ac130_hmv_enroute";
    level._id_11BB["ac130_snd_fireonturret"] = "ac130_snd_fireonturret";
    level._id_11BB["ac130_snd_tankblocking"] = "ac130_snd_tankblocking";
    level._id_11BB["ac130_snd_letsgoletsgo2"] = "ac130_snd_letsgoletsgo2";
    level._id_11BB["ac130_snd_movemovecmon"] = "ac130_snd_movemovecmon";
    level._id_11BB["ac130_snd_onme2"] = "ac130_snd_onme2";
    level._id_11BB["ac130_snd_rpgfire2"] = "ac130_snd_rpgfire2";
    level._id_11BB["ac130_snd_firefromembassy"] = "ac130_snd_firefromembassy";
    level._id_11BB["ac130_plt_onepassonly"] = "ac130_plt_onepassonly";
    level._id_11BB["ac130_fco_okhitem"] = "ac130_fco_okhitem";
    level._id_11BB["ac130_fco_hitbuilding"] = "ac130_fco_hitbuilding";
    level._id_11BB["ac130_snd_getonboard"] = "ac130_snd_getonboard";
    level._id_11BB["ac130_snd_onthebird"] = "ac130_snd_onthebird";
    level._id_11BB["ac130_tvo_vehicledown"] = "ac130_tvo_vehicledown";
    level._id_11BB["ac130_fco_yepiseeem"] = "ac130_fco_yepiseeem";
    level._id_11BB["ac130_fco_humveehit"] = "ac130_fco_humveehit";
    level._id_11BB["ac130_plt_ordinance"] = "ac130_plt_ordinance";
    level._id_11BB["ac130_snd_thisisthelznow"] = "ac130_snd_thisisthelznow";
    level._id_11BB["ac130_plt_engagearmor"] = "ac130_plt_engagearmor";
    level._id_11BB["ac130_rno_cominthrough"] = "ac130_rno_cominthrough";
    level._id_11BB["ac130_rno_movinup"] = "ac130_rno_movinup";
    level._id_11BB["ac130_rno_worthit"] = "ac130_rno_worthit";
    level._id_11BB["ac130_snd_keepvolk"] = "ac130_snd_keepvolk";
    level._id_11BB["ac130_trk_gotchacovered"] = "ac130_trk_gotchacovered";
    level._id_11BB["ac130_snd_setsecurity"] = "ac130_snd_setsecurity";
    level._id_11BB["ac130_snd_blacklz"] = "ac130_snd_blacklz";
    level._id_11BB["ac130_snd_takecareofem"] = "ac130_snd_takecareofem";
    level._id_11BB["ac130_snd_strongpoint"] = "ac130_snd_strongpoint";
    level._id_11BB["ac130_snd_strobeson"] = "ac130_snd_strobeson";
    level._id_11BB["ac130_snd_markthetarget"] = "ac130_snd_markthetarget";
    level._id_11BB["ac130_plt_bingofuel"] = "ac130_plt_bingofuel";
    level._id_11BB["ac130_snd_gentlemen"] = "ac130_snd_gentlemen";
    level._id_11BB["ac130_rno_lastthatlong"] = "ac130_rno_lastthatlong";
    level._id_11BB["ac130_trk_tonofarmor"] = "ac130_trk_tonofarmor";
    level._id_11BB["ac130_rno_lastmag"] = "ac130_rno_lastmag";
    level._id_11BB["ac130_odn_whoswho"] = "ac130_odn_whoswho";
    level._id_11BB["ac130_snd_nothingleft"] = "ac130_snd_nothingleft";
    level._id_11BB["ac130_snd_deadcenter"] = "ac130_snd_deadcenter";
    level._id_11BB["ac130_odn_leveleverything"] = "ac130_odn_leveleverything";
    level._id_11BB["ac130_hqr_dowhatever"] = "ac130_hqr_dowhatever";
    level._id_11BB["ac130_vlk_dontwanttodie"] = "ac130_vlk_dontwanttodie";
    level._id_11BB["ac130_vlk_scream"] = "ac130_vlk_scream";
    level._id_11BB["ac130_vlk_tellyoueverything"] = "ac130_vlk_tellyoueverything";
    level._id_11BB["ac130_rno_dietoday"] = "ac130_rno_dietoday";
    level._id_11BB["ac130_o61_bombsaway"] = "ac130_o61_bombsaway";
    level._id_11BB["ac130_o62_bombsaway"] = "ac130_o62_bombsaway";
    level._id_11BB["ac130_hit_incoming"] = "ac130_hit_incoming";
    level._id_11BB["ac130_vnd_backtobase"] = "ac130_vnd_backtobase";
    level._id_11BB["ac130_snd_vandalready"] = "ac130_snd_vandalready";
    level._id_11BB["ac130_snd_gettingouttahere"] = "ac130_snd_gettingouttahere";
    level._id_11BB["ac130_vnd_ondeck"] = "ac130_vnd_ondeck";
    level._id_11BB["ac130_trk_whataboutvolk"] = "ac130_trk_whataboutvolk";
    level._id_11BB["ac130_rno_nextbird"] = "ac130_rno_nextbird";
    level._id_11BB["ac130_snd_alrightdoit"] = "ac130_snd_alrightdoit";
    level._id_11BB["ac130_snd_needhimalive"] = "ac130_snd_needhimalive";
    level._id_11BB["ac130_rno_niceride"] = "ac130_rno_niceride";
    level._id_11BB["ac130_apl_l3elim"] = "ac130_apl_l3elim";
    level._id_11BB["ac130_hqr_vulturestatus"] = "ac130_hqr_vulturestatus";
    level._id_11BB["ac130_hqr_phaseline"] = "ac130_hqr_phaseline";
    level._id_11BB["ac130_hqr_phaseline"] = "ac130_hqr_phaseline";
    level._id_11BB["ac130_apl_circletonorth"] = "ac130_apl_circletonorth";
    level._id_11BB["ac130_bl1_turningwest"] = "ac130_bl1_turningwest";
    level._id_11BB["ac130_gt6_longknife"] = "ac130_gt6_longknife";
    level._id_11BB["ac130_gt6_keepscreening"] = "ac130_gt6_keepscreening";
    level._id_11BB["ac130_apa_insight"] = "ac130_apa_insight";
    level._id_11BB["ac130_apl_takeoutguys"] = "ac130_apl_takeoutguys";
    level._id_11BB["ac130_apl_getaway"] = "ac130_apl_getaway";
    level._id_11BB["ac130_agn_solidbox"] = "ac130_agn_solidbox";
    level._id_11BB["ac130_apa_goodshot"] = "ac130_apa_goodshot";
    level._id_11BB["ac130_apl_suppressed"] = "ac130_apl_suppressed";
    level._id_11BB["ac130_apa_youreclear"] = "ac130_apa_youreclear";
    level._id_11BB["ac130_gtr_tower"] = "ac130_gtr_tower";
    level._id_11BB["ac130_hit_takingabeating"] = "ac130_hit_takingabeating";
    level._id_11BB["ac130_plt_adjustments"] = "ac130_plt_adjustments";
    level._id_11BB["ac130_plt_readyformark"] = "ac130_plt_readyformark";
    level._id_11BB["ac130_plt_readyfortargets"] = "ac130_plt_readyfortargets";
    level._id_11BB["ac130_plt_targetsahead"] = "ac130_plt_targetsahead";
    level._id_11BB["ac130_plt_engagingtarget"] = "ac130_plt_engagingtarget";
}

_id_615A()
{
    level thread _id_615B();
    common_scripts\utility::flag_wait( "slamzoom_complete" );
    common_scripts\utility::flag_set( "jav_obj_started" );
    wait 10;
    maps\_utility::_id_11F4( "ac130_plt_adjustments" );
    _id_615F( "player_has_javelin", undefined, "ac130_snd_usejavelin", "ac130_snd_getjavelin" );
    wait 2;
    _id_615F( "1_tank_left", undefined, "ac130_snd_usejavelin", "ac130_snd_hittanksnow" );
    wait 1;
    maps\_utility::_id_11F4( "ac130_snd_getotherone" );
    wait 3;
    level _id_615F( "all_tanks_destroyed", undefined, "ac130_snd_takeoutother", "ac130_snd_hitlasttank", "ac130_snd_finishtanks" );
    wait 1;
    maps\_utility::_id_11F4( "ac130_trk_tanksaredown" );
    common_scripts\utility::flag_wait( "alamo_clear" );
    maps\_utility::_id_11F4( "ac130_snd_blacklz" );
    common_scripts\utility::flag_wait( "attack_choppers_spawned" );
    wait 8;
    maps\_utility::_id_11F4( "ac130_snd_takecareofem" );
    common_scripts\utility::flag_wait( "both_choppers_down" );
    maps\_utility::_id_11F4( "ac130_plt_bingofuel" );
    maps\_utility::_id_11F4( "ac130_snd_gentlemen" );
    level._id_6126 maps\_utility::play_sound_on_entity( "ac130_rno_lastthatlong" );
    maps\_utility::_id_11F4( "ac130_trk_tonofarmor" );
    wait 2;
    maps\_utility::_id_11F4( "ac130_rno_lastmag" );
    wait 3;
    maps\_utility::_id_11F4( "ac130_odn_whoswho" );
    maps\_utility::_id_11F4( "ac130_snd_nothingleft" );
    wait 0.4;
    maps\_utility::_id_11F4( "ac130_snd_deadcenter" );
    wait 2;
    maps\_utility::_id_11F4( "ac130_odn_leveleverything" );
    wait 0.8;
    maps\_utility::_id_11F4( "ac130_hqr_dowhatever" );
    common_scripts\utility::flag_set( "bomb_run_vo_finished" );
    wait 4;
    level._id_6126 thread maps\_utility::play_sound_on_entity( "ac130_gtr_tower" );
    common_scripts\utility::flag_wait( "pickup_choppers_in" );
    wait 7;
    maps\_utility::_id_11F4( "ac130_vnd_backtobase" );
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_vandalready" );
    level._id_6134 maps\_utility::play_sound_on_entity( "ac130_trk_whataboutvolk" );
    level._id_6126 maps\_utility::play_sound_on_entity( "ac130_rno_nextbird" );
    wait 1;
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_alrightdoit" );
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_needhimalive" );
    level._id_6126 maps\_utility::play_sound_on_entity( "ac130_rno_niceride" );
}

_id_615B()
{
    level endon( "player_shot_tank" );
    common_scripts\utility::flag_wait( "humvee_at_bridge" );
    maps\_utility::_id_11F4( "ac130_snd_stopstop" );
    maps\_utility::_id_11F4( "ac130_tvo_vehicledown" );
    wait(randomfloatrange( 0.2, 0.5 ));
    maps\_utility::_id_11F4( "ac130_fco_yepiseeem" );
    maps\_utility::_id_11F4( "ac130_fco_humveehit" );
    maps\_utility::_id_11F4( "ac130_snd_convoystalled" );
    maps\_utility::_id_11F4( "ac130_plt_ordinance" );
    maps\_utility::_id_11F4( "ac130_snd_thisisthelznow" );
    maps\_utility::_id_11F4( "ac130_plt_engagearmor" );
    level _id_615F( "player_shot_tank", undefined, "ac130_fco_hitarmor", "ac130_fco_engagetanks", "ac130_fco_hittanksbig" );
}

_id_615C()
{
    if ( !isdefined( level._id_615D ) )
    {
        level._id_615D = [];
        level._id_615D[level._id_615D.size] = "ac130_snd_letsgoletsgo2";
        level._id_615D[level._id_615D.size] = "ac130_snd_onme2";
        level._id_615D[level._id_615D.size] = "ac130_snd_movemovecmon";
    }

    if ( !isdefined( level._id_615E ) )
        level._id_615E = [];

    var_0 = maps\_utility::_id_0B53( level._id_615D );
    var_1 = common_scripts\utility::random( var_0 );
    maps\_utility::_id_11F4( var_1, 4 );
    level._id_615E = common_scripts\utility::add_to_array( level._id_615E, var_1 );
    level._id_615D = common_scripts\utility::array_remove( level._id_615D, var_1 );

    if ( level._id_615D.size == 0 )
    {
        level._id_615D = level._id_615E;
        level._id_615E = [];
    }
}

_id_615F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( common_scripts\utility::flag( var_0 ) )
        return;

    level endon( var_0 );
    var_7 = [];
    var_7[0] = var_2;

    if ( isdefined( var_3 ) )
        var_7[1] = var_3;

    if ( isdefined( var_4 ) )
        var_7[2] = var_4;

    if ( isdefined( var_5 ) )
        var_7[3] = var_5;

    if ( isdefined( var_6 ) )
        var_7[4] = var_6;

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        foreach ( var_9 in var_7 )
        {
            maps\_utility::_id_11F4( var_9 );

            if ( isdefined( var_1 ) )
            {
                if ( randomint( 100 ) > 33 )
                {
                    if ( common_scripts\utility::cointoss() )
                        level.player playsound( "ac130_fco_getontanks" );
                    else
                        level.player playsound( "ac130_fco_enemyarmor" );
                }
            }

            wait(randomintrange( 13, 16 ));
        }
    }
}

_id_6160()
{
    maps\_utility::_id_262C( "squad_pos3" );
    common_scripts\utility::flag_set( "player_past_bus" );
}

_id_6161()
{
    maps\_utility::_id_262C( "player_stairs" );
    common_scripts\utility::flag_set( "player_went_upstairs" );

    if ( level._id_1F19 == "start_e3" )
        level.player notify( "stop_demo" );

    level thread _id_61FB();
    maps\_utility::_id_262C( "player_bedroom" );
    common_scripts\utility::flag_set( "player_at_bedroom" );
    level._id_6134 maps\_utility::play_sound_on_entity( "ac130_hit_taghim" );
}

_id_6162()
{
    var_0 = getvehiclenode( "explode", "script_noteworthy" );
    var_1 = getvehiclenode( "explode2", "script_noteworthy" );
    var_0 thread _id_6163( "FX_flak_large" );
    var_1 thread _id_6164();
    var_2 = getvehiclenodearray( "splash", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, ::_id_6163, "jet_crash_water_impact_ac130", 1, "rocket_explode_water_splash" );
    var_3 = maps\_utility::_id_26A2( "crash_jet" );
    var_4 = var_3 maps\_vehicle::_id_1F9E();
    wait 0.1;
    var_5 = playfxontag( level._effect["FX_jet_smoke_trail"], var_4, "tag_engine_left" );
    var_4 maps\_utility::delaythread( 2.2, maps\_utility::play_sound_on_entity, "scn_ac130_bridge_jet_crash_leadin" );
    level._id_6134 maps\_utility::delaythread( 3.5, maps\_utility::play_sound_on_entity, "ac130_hit_incoming" );
    var_4 waittill( "reached_end_node" );
    var_6 = var_4.origin;
    thread common_scripts\utility::play_sound_in_space( "scn_ac130_bridge_jet_crash_ground", var_6 );
    playfx( level._effect["jet_crash"], var_6 );
    var_4 delete();
    earthquake( 1, 1.4, level.player.origin, 100 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 2, ::stoprumble, "damage_heavy" );
    common_scripts\utility::exploder( "jet_crash_splash" );
    common_scripts\utility::flag_set( "crash_jet_complete" );
}

_id_6163( var_0, var_1, var_2 )
{
    self waittill( "trigger" );
    playfx( level._effect[var_0], self.origin );

    if ( isdefined( var_1 ) )
        thread common_scripts\utility::play_sound_in_space( var_2, self.origin );
}

_id_6164( var_0, var_1 )
{
    self waittill( "trigger", var_2 );
    playfx( level._effect["FX_flak_large"], self.origin );

    if ( isdefined( var_0 ) )
        thread common_scripts\utility::play_sound_in_space( var_1, self.origin );

    var_3 = anglestoforward( var_2.angles );
    var_4 = anglestoup( var_2.angles );
    playfx( level._effect["metal_eject_far"], var_2.origin, var_3, var_4 );
}

_id_6165( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        common_scripts\utility::flag_wait( var_1 );

    var_4 = self.targetname;
    thread maps\_anim::_id_1247( var_0, var_4 );
    wait 0.05;
    var_0 show();

    if ( isdefined( var_2 ) )
        var_0 maps\_anim::_id_1280( var_4, var_3 );
}

_id_6166()
{
    var_0 = common_scripts\utility::getstruct( "crash_fire", "targetname" );
    playfx( level._effect["FX_gaz_on_fire"], var_0.origin );
    common_scripts\utility::flag_wait( "slamzoom_complete" );
    var_1 = getentarray( "bridge_javelin", "targetname" );
    common_scripts\utility::array_thread( var_1, ::_id_6167 );
    var_2 = maps\_utility::_id_2643( "bridge_tanks", "script_noteworthy" );
    var_2 = maps\_utility::_id_1361( var_2 );
    common_scripts\utility::array_thread( var_2, ::_id_61BC );

    foreach ( var_4 in var_2 )
        var_4.mgturret[0] setmode( "manual" );

    var_6 = maps\_utility::_id_0AE9( level.player.origin, var_2 );

    if ( var_2.size == 2 )
    {
        common_scripts\utility::flag_set( "2_tanks_left" );
        objective_state( maps\_utility::_id_2816( "OBJ_destroy_tanks" ), "done" );
        objective_add( maps\_utility::_id_2816( "OBJ_shoot_tanks" ), "current", &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK_JAV_2" );
        objective_position( maps\_utility::_id_2816( "OBJ_shoot_tanks" ), var_1[0].origin );
        var_6 thread _id_61BA();
        var_6 thread _id_61B3();
        var_6 thread _id_6168();
        level waittill( "tank_death" );
    }

    common_scripts\utility::flag_set( "1_tank_left" );
    wait 0.5;
    objective_string( maps\_utility::_id_2816( "OBJ_shoot_tanks" ), &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK_JAV_1" );
    var_2 = common_scripts\utility::array_remove( var_2, var_6 );
    var_6 = maps\_utility::_id_0AE9( level.player.origin, var_2 );
    var_6 thread _id_61BA();
    var_6 thread _id_61B3();
    var_6 thread _id_6168();
    level waittill( "tank_death" );
    objective_string( maps\_utility::_id_2816( "OBJ_shoot_tanks" ), &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK_JAV_COMPLETED" );
    objective_state( maps\_utility::_id_2816( "OBJ_shoot_tanks" ), "done" );
    common_scripts\utility::flag_set( "all_tanks_destroyed" );
    wait 2;
    objective_add( maps\_utility::_id_2816( "OBJ_push_to_lz" ), "current", &"PARIS_AC130_OBJ_BRIDGE_PUSH_LZ" );
}

_id_6167()
{
    thread maps\_utility::_id_276E( "player_has_javelin" );
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "player_has_javelin" );
    objective_position( maps\_utility::_id_2816( "OBJ_shoot_tanks" ), ( 0.0, 0.0, 0.0 ) );
}

_id_6168()
{
    self endon( "death" );

    if ( !isdefined( self.mgturret[0] ) )
        return;

    self.mgturret[0] setmode( "manual" );
    var_0 = randomintrange( 15, 30 );
    var_1 = randomintrange( 15, 20 );

    while ( isalive( self ) )
    {
        var_2 = level.player getstance();

        if ( var_2 == "stand" )
        {
            var_3 = _id_570B( self.mgturret[0] gettagorigin( "tag_flash" ), self.mgturret[0] gettagangles( "tag_flash" ), ( 10.0, 0.0, 0.0 ) );
            var_4 = level.player.origin + ( var_0, var_0, var_0 );

            if ( !isdefined( var_4 ) )
                continue;

            for ( var_5 = 0; var_5 < var_1; var_5++ )
            {
                magicbullet( "dshk_turret_sp", var_3, var_4 );
                wait 0.14;
            }
        }
        else
        {
            var_6 = common_scripts\utility::random( level._id_6132 );
            var_3 = self.mgturret[0] gettagorigin( "tag_flash" );
            var_4 = var_6.origin + ( var_0, var_0, var_0 );

            if ( !isdefined( var_6.origin ) )
                continue;

            for ( var_5 = 0; var_5 < var_1; var_5++ )
            {
                magicbullet( "dshk_turret_sp", var_3, var_4 );
                wait 0.14;
            }
        }

        wait 1;
    }
}
#using_animtree("script_model");

_id_6169()
{
    level._id_1245["tower"] = #animtree;
    level._id_0C59["tower"]["des_1"] = %paris_ac130_tower_destruction_1;
    level._id_0C59["tower"]["des_2"] = %paris_ac130_tower_destruction_2;
    level._id_0C59["tower"]["des_3"] = %paris_ac130_tower_destruction_3;
    level._id_0C59["tower"]["des_finale"] = %paris_ac130_tower_destruction_finale;
    maps\_anim::_id_1267( "tower", "show_dest_4", "hide_3_show_4", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_5", "hide_4_show_5", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_6", "hide_5_show_6", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_7", "hide_6_show_7", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_8", "hide_7_show_8", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_9", "hide_8_show_9", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_10", "hide_9_show_10", "des_finale" );
    maps\_anim::_id_1267( "tower", "show_dest_11", "hide_10_show_11", "des_finale" );
    maps\_anim::_id_1267( "tower", "tower_fall_stall", "tower_fall_stall", "des_finale" );
    maps\_anim::_id_1267( "tower", "tower_impact_corner", "tower_collapse_dirt", "des_finale" );
    maps\_anim::_id_1267( "tower", "tower_impact_mid", "tower_collapse_dirt_mid", "des_finale" );
    maps\_anim::_id_1267( "tower", "tower_impact_fence", "tower_collapse_fence", "des_finale" );
    maps\_anim::_id_1267( "tower", "tower_impact_water", "tower_collapse_water", "des_finale" );
    maps\_anim::_id_1267( "tower", "tower_impact_gust", "tower_collapse_gust", "des_finale" );
    maps\_anim::_id_1265( "tower", "tower_fall_stall", "des_finale", "metal_eject", "TAG_TOP_FX2" );
    level thread _id_61E2();
}
#using_animtree("generic_human");

_id_616A()
{
    level._id_0C59["gator"]["humvee_crawl1"] = %paris_ac130_crawl_from_humvee_1;
    level._id_0C59["hitman"]["humvee_crawl2"] = %paris_ac130_crawl_from_humvee_2;
    level._id_0C59["snd"]["hummer_exit"] = %paris_ac130_run_around_humvee;
    level._id_0C59["snd"]["nade_toss"] = %cqb_stand_grenade_throw;
    maps\_anim::_id_1264( "snd", "grenade_throw", ::_id_6170, "nade_toss" );
}

_id_616B()
{
    common_scripts\utility::flag_wait( "squad_at_bridge" );
    maps\_utility::_id_26BF( "squad_pos_1" );
    maps\_utility::_id_265B( "allies" );
    level._id_45C0._id_1032 = "snd";
    level._id_6135._id_1032 = "gator";
    level._id_6134._id_1032 = "hitman";
    level thread _id_6187();
    var_0 = getentarray( "humvee_crawl_nodes", "script_noteworthy" );
    var_0[0] thread _id_6165( level._id_6134, "player_shot_tank", 1, 0.6 );
    var_0[1] thread _id_6165( level._id_6135, "player_shot_tank" );
    var_1 = getent( "hummer_exit", "targetname" );
    var_1 thread _id_6165( level._id_45C0, "notetrack_flag_sandman_start" );
    common_scripts\utility::flag_wait( "notetrack_flag_sandman_start" );
    wait 0.05;
    var_2 = getaiarray( "axis" );

    foreach ( var_4 in var_2 )
        var_4.grenadeammo = 0;

    common_scripts\utility::flag_wait( "bridge_group1_clear" );
    common_scripts\utility::flag_wait( "player_has_javelin" );
    var_6 = getent( "squad_pos2", "targetname" );

    if ( isdefined( var_6 ) )
    {
        maps\_utility::_id_26BF( "squad_pos2" );
        var_6 delete();
        wait(randomfloatrange( 1.5, 2.4 ));
    }

    common_scripts\utility::flag_wait( "all_tanks_destroyed" );
    level thread _id_615C();
    var_7 = getent( "axis_pos4_trig", "targetname" );

    if ( isdefined( var_7 ) )
        var_7 notify( "trigger" );

    wait 2;
    maps\_utility::_id_26BF( "squad_pos3" );
    thread _id_616C();
    level._id_3E8E = 30;
    level thread _id_61BE();
    maps\_utility::_id_25F1( "strobe_check", ::_id_616D, "can't save with air strobe active" );

    if ( isalive( level.player ) )
    {
        level.player thread _id_618F();
        wait 2;
        level.player thread _id_5134( 5 );
        level.player _id_0622::_id_3E90();
    }

    level common_scripts\utility::flag_wait_or_timeout( "bridge_squad_to_pos4", 40 );
    _id_616E();
    var_6 = getent( "squad_pos4", "targetname" );

    if ( isdefined( var_6 ) )
    {
        maps\_utility::_id_26BF( "squad_pos4" );
        var_6 delete();
        wait(randomfloatrange( 1.5, 2.4 ));
    }

    level thread _id_615C();
    level thread _id_6162();
    var_7 = getent( "axis_pos5_trig", "targetname" );

    if ( isdefined( var_7 ) )
        var_7 notify( "trigger" );

    wait 5;
    level common_scripts\utility::flag_wait_or_timeout( "alamo_clear", 45 );
    _id_616E();

    if ( !common_scripts\utility::flag( "flag_strobes_in_use" ) )
        level.player thread _id_5134( 5 );

    var_6 = getent( "new_alamo_color_trig", "targetname" );

    if ( isdefined( var_6 ) )
    {
        maps\_utility::_id_26BF( "new_alamo_color_trig" );
        wait(randomfloatrange( 1.5, 2.4 ));
    }

    level thread _id_616F();
    wait 2;
    var_8 = common_scripts\utility::getstruct( "player_distance_monitor", "targetname" );
    var_9 = distancesquared( var_8.origin, level.player.origin );

    while ( var_9 >= 250000 )
    {
        var_9 = distancesquared( var_8.origin, level.player.origin );
        wait 0.5;
    }

    common_scripts\utility::flag_set( "squad_at_final_pos" );
    thread _id_616C();
    var_2 = getaiarray( "axis" );

    foreach ( var_11 in var_2 )
        var_11.grenadeammo = 0;

    wait 1;
    objective_state( maps\_utility::_id_2816( "OBJ_push_to_lz" ), "done" );
    objective_add( maps\_utility::_id_2816( "OBJ_defend_lz" ), "current", &"PARIS_AC130_OBJ_DEFEND_LZ" );
}

_id_616C()
{
    level notify( "attempting_bridge_autosave" );
    level endon( "attempting_bridge_autosave" );

    for (;;)
    {
        var_0 = level.player getcurrentweapon();

        if ( common_scripts\utility::flag( "flag_strobes_in_use" ) || var_0 == "air_support_strobe" )
        {
            wait 0.05;
            continue;
        }

        maps\_utility::_id_1425( "bridge_checkpoint" );
        return;
    }
}

_id_616D()
{
    return !common_scripts\utility::flag( "flag_strobes_in_use" ) || level.player getcurrentweapon() != "air_support_strobe";
}

_id_616E()
{
    for (;;)
    {
        if ( common_scripts\utility::flag( "flag_strobes_in_use" ) )
        {
            wait 0.5;
            continue;
        }

        return;
    }
}

_id_616F()
{
    var_0 = getent( "nade_toss", "targetname" );
    var_1 = common_scripts\utility::getstruct( "nade_land", "targetname" );
    level._id_45C0.grenadeammo = 0;
    level._id_45C0._id_1032 = "snd";
    level._id_45C0 maps\_utility::_id_123B();
    maps\_utility::_id_11F4( "ac130_snd_strongpoint" );
    var_0 maps\_anim::_id_124A( level._id_45C0, "nade_toss" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "nade_toss" );
    level._id_45C0 maps\_utility::_id_13A4( "r" );
    maps\_utility::_id_11F4( "ac130_snd_strobeson" );
    maps\_utility::_id_11F4( "ac130_snd_markthetarget" );
}

_id_6170( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "nade_land", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin );
    var_2.angles = var_1.angles;
    var_3 = anglestoforward( var_2.angles );
    var_4 = anglestoup( var_2.angles );
    var_5 = var_0 gettagorigin( "tag_inhand" );
    var_6 = var_0 gettagangles( "tag_inhand" );
    var_7 = spawn( "script_model", var_5 );
    var_7.angles = var_6;
    var_7 setmodel( "projectile_us_smoke_grenade" );
    var_8 = var_1.origin - var_0.origin;
    var_9 = vectortoangles( var_8 );
    var_10 = anglestoforward( var_9 );
    var_11 = var_10 * 20;
    var_7 physicslaunchserver( var_7.origin, var_11 );
    wait 1.5;
    var_12 = common_scripts\utility::getfx( "FX_smoke_signal_osprey" );
    playfx( var_12, var_7.origin, var_3, var_4 * -1 );
}

_id_6171()
{
    if ( isdefined( self ) )
    {
        maps\_utility::_id_1902();
        maps\_utility::_id_2749();
    }
}

_id_6172()
{
    self waittill( "jumpedout" );
    thread maps\_utility::_id_140C();
    self._id_1032 = "generic";
    wait 0.5;
    var_0 = getnode( "hvt_start", "targetname" );
    animscripts\shared::_id_23C8();
    maps\paris_ac130_code::_id_6173();
    wait 0.1;
    self._id_406B = var_0;
    self._id_406B thread maps\_anim::_id_11C8( self, "wounded_idle", "stop_wounded_idle" );
}

_id_6174()
{
    self waittill( "reached_end_node" );
    self hide();
    var_0 = thread maps\_vehicle::_id_2514();

    foreach ( var_2 in var_0 )
    {
        var_2 show();

        if ( var_2 == level._id_6127 )
        {
            var_2 thread _id_6172();
            continue;
        }
        else if ( var_2 == level._id_6133 )
        {
            var_2 thread _id_6171();
            continue;
        }

        var_2 maps\_utility::_id_13A4( "r" );
        var_2.ignoreall = 0;
        var_2.ignoreme = 0;
        level._id_0A7A = common_scripts\utility::add_to_array( level._id_0A7A, var_2 );
    }

    common_scripts\utility::flag_set( "squad_at_bridge" );
    wait 0.4;
    var_4 = getent( "hummer_exit", "targetname" );
    var_4 thermaldrawenable();
    common_scripts\utility::flag_wait( "player_shot_tank" );

    while ( self._id_0A39.size > 0 )
        wait 0.5;

    self delete();
}

_id_6175()
{
    level thread _id_6180();
    var_0 = getentarray( "bridge_enemies_bus", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_617B );
    var_0 = getentarray( "alamo_floods", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_617B );
    createthreatbiasgroup( "defend_enemies" );
    var_0 = getentarray( "rear_bridge_floods", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_617D );
    var_0 = getentarray( "chopper_fodder", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_617E );
    var_0 = getentarray( "area3_baddies", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_617C );
    maps\_utility::_id_26BF( "bridge_tank1_move" );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, ::_id_21D1 );
    var_1 = getaiarray( "team3" );
    common_scripts\utility::array_thread( var_1, ::_id_21D1 );
    wait 0.1;
    var_2 = getentarray( "bridge_ac130_enemies_bus", "targetname" );
    var_2 = maps\_utility::_id_272B( var_2, 1 );
    common_scripts\utility::flag_wait( "player_shot_tank" );
    maps\_utility::_id_26BF( "tank2_move" );
    var_3 = getentarray( "river_boats", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, ::_id_61BB );
    common_scripts\utility::array_thread( var_2, ::_id_21D1 );
    var_4 = getentarray( "bridge_group1", "targetname" );
    var_2 = maps\_utility::_id_272B( var_4, 1 );

    foreach ( var_6 in var_2 )
    {
        var_6.goalradius = 32;
        var_6._id_20AF = 1.5;
    }

    maps\_utility::_id_135B( var_4 );
    level thread _id_617F( var_2, "bridge_group1_clear", 3 );
    level thread _id_6178( var_2 );
    common_scripts\utility::flag_wait( "bridge_group1_clear" );
    var_0 = getentarray( "alamo_floods", "targetname" );
    maps\_spawner::_id_2135( var_0 );
    common_scripts\utility::flag_wait( "bridge_squad_to_pos3" );
    wait 6;
    var_8 = getentarray( "area3_baddies", "targetname" );
    var_9 = maps\_utility::_id_272B( var_8, 1 );
    wait 1;
    maps\_utility::_id_135B( var_8 );
    common_scripts\utility::flag_wait( "bridge_squad_to_pos4" );
    maps\_utility::_id_135B( var_0 );
    var_10 = getaiarray( "axis" );
    level thread _id_617F( var_10, "alamo_clear", 3 );
    common_scripts\utility::flag_wait_or_timeout( "alamo_clear", 20 );
    maps\_utility::_id_26BF( "bm21_spawner" );
    wait 0.5;
    var_11 = maps\_utility::_id_2643( "bridge_trucks", "script_noteworthy" );
    common_scripts\utility::array_thread( var_11, ::_id_61BB );
    wait 4;
    var_0 = getentarray( "rear_bridge_floods", "targetname" );
    maps\_spawner::_id_2135( var_0 );
    wait 1;
    createthreatbiasgroup( "defend_player" );
    level.player setthreatbiasgroup( "defend_player" );
    setthreatbias( "defend_player", "defend_enemies", 200000000 );
    var_12 = common_scripts\utility::getstructarray( "bridge_smoke", "targetname" );

    foreach ( var_14 in var_12 )
        playfx( level._effect["smoke_grenade"], var_14.origin );

    common_scripts\utility::flag_wait( "both_choppers_down" );
    _id_616E();
    level.player _id_0622::_id_3E8F();
    maps\_utility::_id_25F2( "strobe_check" );
    wait 3;
    level thread _id_618B();
    level thread _id_6176();
    wait 10;
    wait 6;
    common_scripts\utility::flag_wait( "bomb_run_vo_finished" );
    common_scripts\utility::flag_set( "bombing_run" );
    maps\_utility::_id_135B( var_0 );
    wait 21;
    maps\_utility::delaythread( 5, ::_id_61D3 );
    common_scripts\utility::flag_set( "spawn_pickup_choppers" );
    level thread _id_61DB();
    maps\_utility::_id_194E( "paris_ac130_groundbridge1_ext" );
    common_scripts\utility::flag_wait( "pickup_choppers_in" );
    wait 10;
    var_0 = getentarray( "chopper_fodder", "targetname" );
    maps\_spawner::_id_2135( var_0 );
}

_id_6176()
{
    var_0 = level.player getweaponslistprimaries();

    if ( maps\_utility::is_in_array( var_0, "javelin" ) )
    {
        while ( level.player _id_6177::_id_6108() )
            wait 0.5;

        level.player setweaponammoclip( "javelin", 0 );
        level.player setweaponammostock( "javelin", 0 );
    }
}

_id_6178( var_0 )
{
    common_scripts\utility::flag_wait( "bridge_group1_clear" );
    var_0 = maps\_utility::_id_2672( var_0 );

    if ( var_0.size != 0 )
    {
        var_1 = getent( "bus_trig", "targetname" );

        foreach ( var_3 in var_0 )
        {
            if ( var_3 istouching( var_1 ) )
                var_3 maps\_utility::_id_2749();
        }
    }
}

_id_6179()
{
    common_scripts\utility::flag_wait( "bridge_squad_to_pos3" );
    level._id_617A = "axis_pos4";
    wait 0.5;
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::getstructarray( level._id_617A, "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5ECA, var_1 );
    common_scripts\utility::flag_wait( "bridge_squad_to_pos4" );
    level._id_617A = "axis_pos5";
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::getstructarray( level._id_617A, "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5ECA, var_1 );
    common_scripts\utility::flag_wait( "bridge_squad_to_pos5" );
    level._id_617A = "axis_pos6";
    var_0 = getaiarray( "axis" );
    var_1 = common_scripts\utility::getstructarray( level._id_617A, "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5ECA, var_1 );
}

_id_617B()
{
    self endon( "death" );
    self._id_20AF = 1.5;

    if ( randomint( 100 ) > 66 )
        self.grenadeammo = 0;

    if ( !isdefined( level._id_617A ) )
        level._id_617A = "axis_pos3";

    var_0 = common_scripts\utility::getstructarray( level._id_617A, "targetname" );
    thread _id_5ECA( var_0 );
}

_id_617C()
{
    var_0 = common_scripts\utility::getstructarray( "axis_pos4", "targetname" );
    thread _id_5ECA( var_0 );
    self.grenadeammo = 0;
}

_id_617D()
{
    if ( randomint( 100 ) < 25 )
    {
        self.goalradius = 32;
        self setgoalentity( level.player );
        self._id_20AF = 2;
        return;
    }

    var_0 = common_scripts\utility::getstructarray( "axis_pos6", "targetname" );
    thread _id_5ECA( var_0 );
    self._id_20AF = 1;
    self setthreatbiasgroup( "defend_enemies" );

    if ( randomint( 100 ) < 30 )
        self.grenadeammo = 0;
}

_id_617E()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstructarray( "axis_pos6", "targetname" );
    thread _id_5ECA( var_0 );
}

_id_617F( var_0, var_1, var_2 )
{
    while ( var_0.size > var_2 )
    {
        var_0 = maps\_utility::_id_2672( var_0 );
        wait 0.1;
    }

    common_scripts\utility::flag_set( var_1 );
}

_id_6180()
{
    common_scripts\utility::flag_wait( "bridge_squad_to_pos3" );
    var_0 = common_scripts\utility::getstructarray( "axis_pos3", "targetname" );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, ::_id_5ECA, var_0 );
}

_id_6181( var_0, var_1, var_2 )
{
    level.player enableinvulnerability();
    var_3 = getent( "hummer_exit_clip", "targetname" );
    var_4 = var_3.origin;
    var_3 moveto( var_4 - ( 0.0, 0.0, 300.0 ), 0.05 );
    var_5 = common_scripts\utility::getstruct( "new_player_start", "targetname" );
    level.player thread maps\_utility::play_sound_on_entity( "javelin_fire_plr" );
    maps\_utility::_id_1425( "slamzoom_start" );
    wait 0.15;
    level.player.ignoreme = 1;
    level.player freezecontrols( 1 );
    level.player playrumblelooponentity( "damage_heavy" );
    var_6 = common_scripts\utility::getstruct( "player_bridge_start", "targetname" );
    var_7 = var_6.origin;
    var_8 = spawn( "script_model", level.player.origin );
    var_8.angles = var_0.angles;
    var_8 setmodel( "tag_origin" );
    level thread _id_61AE( var_8 );
    _id_5CFE::_id_5C77();
    level.player playerlinktoabsolute( var_8, "tag_origin" );
    level thread _id_6189( level.player.origin, var_1.origin );
    level.player thread maps\_utility::play_sound_on_entity( "scn_ac130_slamzoom_redflags" );
    var_0 delete();
    var_8 moveto( var_2, 1 );
    earthquake( 0.5, 3, var_8.origin, 8000 );
    level.player viewkick( 10, level.player.origin );
    var_9 = 1;
    level thread _id_6186( var_9, "slamzoom_complete" );
    wait(var_9 * 0.5);
    level.player visionsetnakedforplayer( "coup_sunblind", 1.8 );
    maps\_utility::delaythread( 1, maps\_utility::vision_set_fog_changes, "paris_ac130_bridge", 2 );
    maps\_utility::delaythread( 0.6, ::_id_61C1, "white", "slamzoom_complete", 0.4 );
    wait(var_9 * 0.5);
    level.player thread maps\_utility::play_sound_on_entity( "exp_ac130_105mm" );
    wait 0.2;

    if ( isdefined( var_1 ) && isalive( var_1 ) )
        var_1 maps\_utility::_id_2749();

    playfx( level._effect["FX_t72_death_explosion"], var_2 );
    var_10 = getent( "hummer_exit", "targetname" );
    var_11 = maps\_utility::_id_1287( "player_arms", var_10.origin );
    var_11.angles = var_10.angles;
    var_8 moveto( var_10.origin, 0.1 );
    var_8 waittill( "movedone" );
    var_8.angles = var_10.angles;
    var_8 linkto( var_11, "tag_camera" );
    level.player stoprumble( "damage_heavy" );
    musicplay( "paris_ac130_bridge" );
    var_12 = spawn( "script_origin", var_10.origin );
    var_12.angles = var_10.angles;
    setsaveddvar( "sm_SunSampleSizeNear", "0.25" );
    setsaveddvar( "sm_SunShadowScale", "1.0" );
    maps\_utility::_id_194E( "paris_ac130_groundbridge5_ext" );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showStance", 1 );
    common_scripts\utility::flag_set( "slamzoom_complete" );
    var_12 maps\_anim::_id_1246( var_11, "hummer_exit" );
    var_11 hide();
    _id_6184();
    level.player unlink();
    level.player freezecontrols( 0 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowstand( 1 );
    level thread _id_61AD( 2.5 );
    thread _id_6182( var_3, var_4, var_12 );
    level thread _id_619D();
    wait 1.5;
    var_8 delete();
    var_11 delete();
    level.player disableinvulnerability();
}

_id_6182( var_0, var_1, var_2 )
{
    var_3 = distancesquared( var_2.origin, level.player.origin );

    while ( var_3 < 16900 )
    {
        var_3 = distancesquared( var_2.origin, level.player.origin );
        wait 0.5;
    }

    var_0 moveto( var_1, 0.05 );
}

_id_6183()
{
    var_0 = getent( "hummer_exit", "targetname" );
    var_0._id_1032 = "hummer";
    var_0 maps\_anim::_id_1244();
    common_scripts\utility::flag_wait( "slamzoom_complete" );
    var_0 maps\_anim::_id_11DD( [ var_0 ], "hummer_exit" );
}

_id_6184()
{
    level.player takeallweapons();

    if ( level._id_1F19 == "start_bridge" || level._id_1F19 == "start_chase" )
    {
        level _id_5EB6( 1 );
        level thread _id_619A( 3 );
        return;
    }

    foreach ( var_1 in level._id_6185 )
    {
        if ( issubstr( tolower( var_1 ), "alt_" ) )
        {
            level.player setweaponammoclip( var_1, 1 );
            level.player setweaponammostock( var_1, 2 );
            continue;
        }
        else if ( var_1 == "rpg_player" )
        {
            level.player giveweapon( var_1 );
            level.player setweaponammoclip( var_1, 1 );
            level.player setweaponammostock( var_1, 0 );
            continue;
        }
        else
        {
            level.player giveweapon( var_1 );
            level.player givemaxammo( var_1 );
        }
    }

    var_3 = level.player getweaponslistprimaries();
    level.player switchtoweapon( var_3[0] );
}

_id_6186( var_0, var_1 )
{
    level._id_1436 = [];
    level._id_1436["nearStart"] = 0;
    level._id_1436["nearEnd"] = 1;
    level._id_1436["farStart"] = 8000;
    level._id_1436["farEnd"] = 10000;
    level._id_1436["nearBlur"] = 6;
    level._id_1436["farBlur"] = 0;
    var_2 = [];
    var_2["nearStart"] = 24;
    var_2["nearEnd"] = 15;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 140;
    var_2["farEnd"] = 100;
    var_2["farBlur"] = 4;
    var_3 = level._id_1436;
    maps\_utility::_id_27C0( var_3, var_2, var_0 + 0.2 );
    common_scripts\utility::flag_wait( var_1 );
    maps\_utility::_id_27C0( var_2, var_3, 0.1 );
}

_id_6187()
{
    level._id_6188 = level._id_6126;
    wait 5;
    level._id_6188 maps\_utility::_id_219B();
    level._id_6188.goalradius = 10;
    level._id_6188.ignoresuppression = 1;
    var_0 = getnode( "hvt_guard_start", "targetname" );
    level._id_6188 setgoalnode( var_0 );
    level._id_6188.ignoreall = 1;
    level._id_6188.ignoreme = 1;
    level._id_6188 maps\_utility::_id_251E();
    common_scripts\utility::flag_wait( "player_past_bus" );
    var_0 = getent( "hvt_bus", "targetname" );
    level._id_6188 maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "ac130_rno_movinup" );

    if ( common_scripts\utility::cointoss() )
        level._id_6126 maps\_utility::delaythread( 6.5, maps\_utility::play_sound_on_entity, "ac130_trk_gotchacovered" );

    level._id_6188 _id_0546::_id_406D( level._id_6127, var_0 );
    var_1 = getnode( "hvt_guard_bus", "script_noteworthy" );
    level._id_6188 setgoalnode( var_1 );
    level._id_6188.ignoreall = 0;
    common_scripts\utility::flag_wait( "bridge_squad_to_pos4" );
    var_0 = getent( "hvt_car", "targetname" );
    level._id_6188 maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "ac130_rno_movinup" );

    if ( common_scripts\utility::cointoss() )
        level._id_6126 maps\_utility::delaythread( 6.5, maps\_utility::play_sound_on_entity, "ac130_trk_gotchacovered" );

    level._id_6188 _id_0546::_id_406D( level._id_6127, var_0 );
    var_1 = getnode( "hvt_guard_car", "script_noteworthy" );
    level._id_6188 setgoalnode( var_1 );
    common_scripts\utility::flag_wait( "squad_at_final_pos" );
    var_0 = getent( "hvt_second_bus", "targetname" );
    level._id_6188 maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "ac130_rno_movinup" );

    if ( common_scripts\utility::cointoss() )
        level._id_6126 maps\_utility::delaythread( 6.5, maps\_utility::play_sound_on_entity, "ac130_trk_gotchacovered" );

    level._id_6188 _id_0546::_id_406D( level._id_6127, var_0 );
    var_1 = getnode( "hvt_guard_second_bus", "script_noteworthy" );
    level._id_6188 setgoalnode( var_1 );
}

_id_6189( var_0, var_1 )
{
    level.player endon( "death" );
    var_2 = getvehiclenodearray( "c130_nodes", "script_noteworthy" );
    var_3 = maps\_utility::_id_0AE9( var_0, var_2 );
    var_4 = spawnvehicle( "vehicle_ac130_low", "bridge_c130", "c130", var_3.origin, var_3.angles );
    wait 0.1;
    var_4 startpath( var_3 );
    var_4 vehicle_setspeed( 35, 34, 1 );
    level._id_3EA4 = var_4;

    for ( var_5 = 0; var_5 < 2; var_5++ )
    {
        magicbullet( "ac130_40mm_air_support_strobe", level._id_3EA4.origin, var_1 );
        wait 0.05;
    }

    var_6 = magicbullet( "ac130_105mm_alt2", level._id_3EA4.origin, var_1 );
    var_6 waittill( "death" );
    earthquake( 0.7, 0.6, level.player.origin, 300 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 1.5, ::stoprumble, "damage_heavy" );
    common_scripts\utility::flag_wait( "squad_at_final_pos" );
    wait 15;
    level thread _id_61C2();
    var_4 thread _id_6191();
    maps\_utility::_id_1427( 4 );
    maps\_utility::delaythread( 4.5, maps\_utility::_id_142B, "paris_ac130_defend_bridge_mx" );
}

_id_618A()
{
    wait 2;
    var_0 = common_scripts\utility::getstruct( "hummer_shoot_start", "targetname" );
    var_1 = common_scripts\utility::getstruct( "hummer_shoot_end", "targetname" );

    for ( var_2 = 0; var_2 < 10; var_2++ )
    {
        var_3 = randomintrange( 5, 10 );
        var_4 = ( var_3, var_3, var_3 );
        magicbullet( "ak47_ac130", var_0.origin, var_1.origin );
        wait(randomfloatrange( 0.05, 0.25 ));
    }
}

_id_618B()
{
    var_0 = getentarray( "final_bridge_vehicles", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_618C );
    common_scripts\utility::flag_set( "final_vehicles_in" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 thread maps\_vehicle::_id_1F9E();
        wait 0.15;
    }
}

_id_618C()
{
    self._id_29E8 = 1;

    if ( self.classname == "script_vehicle_t72_tank" )
        thread _id_618D();
    else
        thread _id_618E();

    common_scripts\utility::flag_wait( "bridge_bombed" );
    var_0 = self.origin;
    wait(randomfloatrange( 2, 4 ));

    if ( isalive( self ) )
        self dodamage( self.health + 100000, self.origin );
}

_id_618D()
{
    self endon( "death" );
    maps\_vehicle::_id_2A3D();
    var_0 = level._id_6132;
    wait(randomint( 5 ));

    for (;;)
    {
        var_1 = randomint( 100 );
        var_2 = randomintrange( 250, 300 );

        if ( var_1 < 75 )
        {
            var_0 = common_scripts\utility::array_removeundefined( var_0 );
            var_3 = common_scripts\utility::random( var_0 );
            self setturrettargetvec( var_3.origin + ( var_2, var_2, 0 ) );
            wait 1.5;
            self fireweapon();
        }
        else
        {
            self setturrettargetvec( level.player.origin + ( var_2, var_2, 0 ) );
            wait 1.5;
            self fireweapon();
        }

        wait(randomintrange( 9, 15 ));
    }
}

_id_618E()
{
    self endon( "death" );
    maps\_vehicle::_id_2A3D();
    wait(randomint( 5 ));
    var_0 = level._id_6132;

    for (;;)
    {
        var_1 = randomintrange( 100, 150 );
        self setturrettargetvec( level.player.origin + ( var_1, var_1, var_1 ) );
        wait(randomfloatrange( 1, 2.5 ));
        _id_53A3();
        wait 0.4;
        var_0 = common_scripts\utility::array_removeundefined( var_0 );
        var_2 = common_scripts\utility::random( var_0 );
        self setturrettargetvec( var_2.origin + ( var_1, var_1, var_1 ) );
        wait(randomfloatrange( 1, 2.5 ));
        _id_53A3();
        wait 1;
    }
}

_id_53A3()
{
    self endon( "death" );
    var_0 = randomintrange( 2, 15 );
    var_1 = 0.1;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        self fireweapon();
        wait(var_1);
    }
}

_id_618F()
{
    self endon( "death" );

    while ( isalive( self ) )
    {
        maps\_utility::_id_1654( "flag_strobe_ready" );

        if ( common_scripts\utility::cointoss() )
            maps\_utility::_id_11F4( "ac130_plt_giveyouroom" );
        else
            maps\_utility::_id_11F4( "ac130_plt_readyfortargets" );

        level waittill( "air_support_strobe_thrown" );
        wait 5;
    }
}

_id_6190()
{
    while ( !common_scripts\utility::flag( "squad_at_final_pos" ) )
    {
        var_0 = getaiarray( "axis" );

        if ( var_0.size == 0 )
            continue;

        var_1 = common_scripts\utility::random( var_0 );
        var_2 = _id_5F9E::_id_51FF( var_1.origin, level._id_45C0.origin );

        if ( var_2 > 950625 )
        {
            level notify( "bridge_c130_shot" );

            if ( !isalive( var_1 ) )
                continue;

            thread _id_6198( var_1.origin, randomintrange( 2, 3 ) );
            level _id_6196();
        }

        wait 0.05;
    }
}

_id_6191()
{
    level common_scripts\utility::flag_wait_or_timeout( "crash_chopper_unloading", 15 );
    wait 7;
    var_0 = maps\_utility::_id_2642( "bridge_crash_chopper", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 thread _id_6194();

    var_1 = maps\_utility::_id_2642( "bridge_crash_chopper2", "script_noteworthy" );
    wait 3;

    if ( isdefined( var_0 ) )
    {
        if ( isalive( var_0 ) )
        {
            var_2 = var_0.origin;
            thread _id_6198( var_2, randomintrange( 5, 8 ) );
            wait 3;

            if ( isalive( var_0 ) )
                var_0 dodamage( var_0.health + 100000, var_0.origin );
        }
    }

    if ( isdefined( var_1 ) )
    {
        if ( isalive( var_1 ) )
        {
            var_2 = var_1.origin;
            thread _id_6198( var_2, randomintrange( 5, 8 ) );
            wait 3;

            if ( isdefined( var_1 ) && isalive( var_1 ) )
            {
                var_1 dodamage( var_1.health + 100000, var_1.origin );
                playfx( level._effect["FX_mi17_air_explosion"], var_1.origin );
                level thread common_scripts\utility::play_sound_in_space( "mi17_helicopter_crash_close", var_2 );
                level.player playrumblelooponentity( "damage_heavy" );
                earthquake( 0.5, 0.5, level.player.origin, 1000 );
                wait 1;
                level.player stoprumble( "damage_heavy" );
            }
        }
    }

    common_scripts\utility::flag_clear( "squad_at_final_pos" );
    common_scripts\utility::flag_set( "both_choppers_down" );
}

_id_6192()
{
    var_0 = getaiarray( "axis" );

    if ( isdefined( level._id_6193 ) )
        var_0 = common_scripts\utility::add_to_array( var_0, level._id_6193 );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_3 = var_2.origin;
            thread _id_6197( var_3, randomintrange( 1, 2 ) );
            wait 1.5;

            if ( isalive( var_2 ) )
            {
                var_2 maps\_utility::_id_2749();
                wait 3;
            }

            continue;
        }

        continue;
    }
}

_id_6194()
{
    self waittill( "crash_done" );
    common_scripts\utility::flag_set( "chopper_crashed_on_bridge" );
    level.player playrumblelooponentity( "damage_heavy" );
    earthquake( 0.2, 0.5, level.player.origin, 1000 );
    wait 1;
    level.player stoprumble( "damage_heavy" );
}

_id_6195()
{
    self waittill( "crash_done" );
    level.player playrumblelooponentity( "damage_heavy" );
    earthquake( 0.2, 0.5, level.player.origin, 1000 );
    wait 1;
    level.player stoprumble( "damage_heavy" );
}

_id_6196()
{
    var_0 = randomintrange( 25, 30 );
    var_1 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "squad_at_final_pos" ) )
            return;

        wait 1;
        var_1++;

        if ( var_1 >= var_0 )
            return;
    }
}

_id_6197( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    thread _id_6199( var_0, 5 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = randomintrange( 50, 70 );
        var_4 = magicbullet( "ac130_40mm_air_support_strobe", self.origin, var_0 + ( var_3, var_3, 0 ) );
        wait 0.4;
        earthquake( 0.2, 0.15, level.player.origin, 100 );
        level.player playrumblelooponentity( "damage_light" );
        wait 0.5;
        level.player stoprumble( "damage_light" );
        wait(randomfloatrange( 0.2, 1.5 ));
    }

    level notify( "c130_done_shooting" );
}

_id_6198( var_0, var_1 )
{
    level endon( "squad_at_final_pos" );
    thread _id_6199( var_0, 15 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = randomintrange( 50, 70 );
        var_4 = magicbullet( "ac130_40mm_air_support_strobe", self.origin, var_0 + ( var_3, var_3, 0 ) );
        var_4 waittill( "death" );
        earthquake( 0.1, 0.2, level.player.origin, 450 );
        level.player playrumblelooponentity( "damage_light" );
        wait 0.5;
        level.player stoprumble( "damage_light" );
        wait 0.2;
    }

    level notify( "c130_done_shooting" );
}

_id_6199( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = randomintrange( 50, 70 );
        magicbullet( "ac130_25mm_alt2", self.origin, var_0 + ( var_3, var_3, var_3 ) );
        wait 0.1;
    }
}

_id_5EB6( var_0, var_1 )
{
    var_2 = undefined;
    level.player takeallweapons();
    level.player setviewmodel( "viewhands_delta" );

    if ( isdefined( var_1 ) )
        var_2 = "m4m203_reflex";
    else
        var_2 = "m4m203_reflex";

    level.player giveweapon( var_2 );
    level.player giveweapon( "usp_no_knife" );
    level.player givemaxammo( "usp_no_knife" );
    level.player giveweapon( "fraggrenade" );
    level.player setweaponammostock( "fraggrenade", 0 );

    if ( isdefined( var_0 ) )
    {
        level.player givemaxammo( "fraggrenade" );
        level.player giveweapon( "flash_grenade" );
        level.player setoffhandsecondaryclass( "flash" );
    }

    level.player switchtoweapon( var_2 );
}

_id_619A( var_0 )
{
    var_1 = weaponaltweaponname( "m4m203_reflex" );

    if ( var_1 != "none" )
    {
        if ( var_0 == 0 )
        {
            level.player setweaponammoclip( var_1, 0 );
            level.player setweaponammostock( var_1, 0 );
        }
        else
        {
            level.player setweaponammoclip( var_1, 1 );
            level.player setweaponammostock( var_1, 0 );

            if ( var_0 > 1 )
                level.player setweaponammostock( var_1, var_0 - 1 );
        }
    }
}

_id_619B()
{
    var_0 = getent( "hummer_final_pos", "targetname" );
    var_0 hide();
    common_scripts\utility::flag_wait( "bridge_tanks_spawned" );
    var_1 = maps\_utility::_id_27BA();
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( var_4.classname == "script_vehicle_t72_tank" )
        {
            var_4._id_619C = var_4.health;
            var_4.health = 99999;
            var_2[var_2.size] = var_4;
            var_4 thread _id_61A2( "player_shot_tank" );
        }
    }

    var_6 = getvehiclenode( "humvee_bridge_arrive", "script_noteworthy" );
    level thread _id_619F( var_6 );
    var_6 waittill( "trigger", var_7 );
    common_scripts\utility::flag_set( "humvee_at_bridge" );
    var_7 thread _id_61A1();
    var_8 = common_scripts\utility::getstruct( "player_bridge_start", "targetname" );
    var_9 = maps\_utility::_id_2642( "bridge_tank1", "targetname" );
    var_9 setturrettargetvec( var_8.origin );
    wait 1;
    var_10 = var_9 gettagorigin( "tag_flash" );
    var_11 = magicbullet( "t72_125mm", var_10, var_8.origin );
    common_scripts\utility::flag_wait( "humvee_crashed" );
    objective_add( maps\_utility::_id_2816( "OBJ_destroy_tanks" ), "current", &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK" );
    var_2 = common_scripts\utility::array_removeundefined( var_2 );

    foreach ( var_9 in var_2 )
    {
        if ( !isdefined( var_9 ) )
            continue;

        var_9.health = var_9._id_619C;
        var_9.godmode = 0;
        _id_5CFE::_id_5C97( [ var_9 ] );
    }

    level thread _id_619E( 45, "player_shot_tank" );
    common_scripts\utility::array_thread( var_2, ::_id_61A3 );
}

_id_619D()
{
    var_0 = target_getarray();

    foreach ( var_2 in var_0 )
        target_remove( var_2 );
}

_id_619E( var_0, var_1 )
{
    level endon( var_1 );
    wait(var_0);

    if ( !common_scripts\utility::flag( var_1 ) )
        _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_HVI_KILLED" );
}
#using_animtree("vehicles");

_id_619F( var_0 )
{
    var_1 = getent( "hummer_final_pos", "targetname" );
    var_2 = common_scripts\utility::getstruct( "player_bridge_start", "targetname" );
    var_3 = spawn( "script_origin", var_2.origin );
    var_3.angles = var_2.angles;
    var_4 = spawn( "script_model", var_0.origin );
    var_4 setmodel( "vehicle_hummer" );
    var_4._id_1032 = "hummer";
    var_4.team = "allies";
    var_4 maps\_anim::_id_1244();
    var_5 = getstartorigin( var_3.origin, var_3.angles, %paris_ac130_bridge_humvee_crash_car_01 );
    var_6 = getstartangles( var_3.origin, var_3.angles, %paris_ac130_bridge_humvee_crash_car_01 );
    var_4.origin = var_5;
    var_4.angles = var_6;
    var_4 hide();
    var_2 = _id_570B( var_4.origin, var_4.angles, ( 8.0, 36.0, 66.0 ) );
    var_7 = spawn( "script_origin", var_2 );
    var_7.angles = var_4.angles + ( 0.0, 328.0, 0.0 );
    var_7.targetname = "stunt_vehicle_pip";
    var_7 linkto( var_4, "" );
    common_scripts\utility::flag_wait( "humvee_at_bridge" );
    var_4 thermaldrawenable();
    _id_5CFE::_id_5C97( [ var_4 ] );
    var_4 show();
    level thread _id_61A0( var_7 );
    var_3 maps\_anim::_id_1246( var_4, "hummer_crash" );
    common_scripts\utility::flag_set( "humvee_crashed" );
    maps\paris_ac130_pip::_id_6104();
    var_1 show();
    var_1 thermaldrawenable();
    var_7 delete();
    var_4 delete();
    var_3 delete();
}

_id_61A0( var_0 )
{
    maps\paris_ac130_pip::_id_6104();
    wait 0.05;
    maps\paris_ac130_pip::_id_60E5( var_0, undefined, undefined, 65 );
}

_id_61A1()
{
    self hide();
    self.health = 99999;
    _id_5CFE::_id_5CA0( [ self ] );
    _id_5CFE::_id_5CA0( self._id_0A39 );

    foreach ( var_1 in self._id_0A39 )
        var_1 hide();
}

_id_61A2( var_0 )
{
    level endon( var_0 );

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        self.health += var_1;
    }
}

_id_61A3()
{
    while ( !common_scripts\utility::flag( "player_shot_tank" ) )
    {
        level.ac130player waittill( "missile_fire", var_0, var_1 );
        var_2 = var_0.angles;
        var_3 = vectornormalize( anglestoforward( var_2 ) );
        var_4 = bullettrace( var_0.origin, var_0.origin + var_3 * 15000, 1, level.player );
        var_5 = var_4["position"];
        var_6 = 0;

        switch ( var_1 )
        {
            case "ac130_40mm_alt2":
                var_6 = 450;
                break;
            case "ac130_105mm_alt2":
                var_6 = 450;
                break;
            case "ac130_25mm_alt2":
                var_6 = 450;
                break;
        }

        if ( _id_5F9E::_id_51FF( self.origin, var_5 ) < squared( var_6 ) )
        {
            if ( var_1 == "ac130_25mm_alt2" )
            {
                _id_61A4();
                self.health = 50000;
                continue;
            }

            self.health = 10000;
            level thread _id_6181( var_0, self, var_5 );
            self waittill( "death" );
            wait 0.5;
            self._id_2AB9 delete();
            self delete();
            common_scripts\utility::flag_set( "player_shot_tank" );
            break;
        }
    }
}

_id_61A4()
{
    maps\_utility::_id_1F61( "HINT_USE_40_OR_105" );
}

_id_61A5()
{
    return common_scripts\utility::flag( "FLAG_ac130_changed_weapons" );
}

_id_61A6()
{
    var_0 = common_scripts\utility::getstructarray( "window_muzzle", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "hvt_window_targets", "script_noteworthy" );
    level thread _id_61A7( var_0, var_1 );

    while ( !common_scripts\utility::flag( "hvt_slamzoom_complete" ) )
    {
        var_2 = randomintrange( 2, 6 );

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            var_4 = common_scripts\utility::random( var_0 );
            var_5 = common_scripts\utility::random( var_1 );
            magicbullet( "ak47_ac130", var_4.origin, var_5.origin );
            playfx( level._effect["FX_apache_hydra_rocket_flash"], var_4.origin );
            wait 0.2;
        }

        wait(randomfloatrange( 0.3, 0.6 ));
    }
}

_id_61A7( var_0, var_1 )
{
    while ( !common_scripts\utility::flag( "hvt_slamzoom_complete" ) )
    {
        var_2 = common_scripts\utility::random( var_0 );
        var_3 = common_scripts\utility::random( var_1 );
        magicbullet( "rpg_straight_ac130", var_2.origin, var_3.origin );
        wait(randomintrange( 4, 7 ));
    }
}

_id_61A8()
{
    var_0 = getent( "yellow_building_trig", "targetname" );
    var_1 = undefined;

    while ( !common_scripts\utility::flag( "hvt_slamzoom_complete" ) )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();

        level.ac130player waittill( "missile_fire", var_2, var_3 );
        var_4 = var_2.angles;
        var_5 = vectornormalize( anglestoforward( var_4 ) );
        var_6 = bullettrace( var_2.origin, var_2.origin + var_5 * 15000, 1, level.player );
        var_7 = var_6["position"];
        var_1 = spawn( "script_origin", var_7 );

        if ( var_1 istouching( var_0 ) )
        {
            if ( var_3 == "ac130_25mm_alt2" )
            {
                _id_61A4();
                continue;
            }

            maps\_utility::_id_1425( "courtyard_slamzoom" );
            common_scripts\utility::flag_set( "player_shot_yellow_building" );
            level thread _id_61AB( var_2, var_7 );
            wait 1;
            var_8 = getaiarray( "axis" );

            if ( var_8.size > 0 )
            {
                foreach ( var_10 in var_8 )
                {
                    if ( _id_5F9E::_id_51FF( var_10.origin, var_1.origin ) <= squared( 1024 ) )
                    {
                        if ( isdefined( var_10._id_0D04 ) && var_10._id_0D04 )
                            var_10 maps\_utility::_id_1902();

                        var_10 maps\_utility::_id_2749();
                    }
                }
            }

            break;
        }
    }

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_61A9()
{
    var_0 = common_scripts\utility::getstruct( "c130_target2", "targetname" );
    var_1 = getentarray( "courtyard_building_des_a_pristine", "targetname" );
    var_2 = getentarray( "courtyard_building_des_a_damage", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_5EA3 );
    var_3 = common_scripts\utility::getstruct( "courtyard_building_des_b", "targetname" );
    var_4 = getentarray( "courtyard_building_des_b_damage", "targetname" );
    var_5 = getentarray( "courtyard_building_des_b_pristine", "targetname" );
    common_scripts\utility::array_thread( var_4, ::_id_5EA3 );
    var_6 = common_scripts\utility::getstruct( "c130_target1", "targetname" );
    var_7 = getentarray( "courtyard_building_des_c_damage", "targetname" );
    var_8 = getentarray( "courtyard_building_des_c_pristine", "targetname" );
    common_scripts\utility::array_thread( var_7, ::_id_5EA3 );
    var_9 = common_scripts\utility::getstruct( "c130_shoot", "targetname" );
    common_scripts\utility::flag_wait( "player_shot_yellow_building" );
    wait 1.7;
    level thread _id_61AA( var_9, var_3, var_5, var_4 );
    wait 0.3;
    level thread _id_61AA( var_9, var_0, var_1, var_2 );
    wait 0.3;
    level thread _id_61AA( var_9, var_6, var_8, var_7 );
}

_id_61AA( var_0, var_1, var_2, var_3 )
{
    level maps\_utility::delaythread( 0.5, maps\_fx::script_playfx, common_scripts\utility::getfx( "105_impact" ), var_1.origin );
    wait 0.5;
    level thread common_scripts\utility::play_sound_in_space( "scn_ac130_ground_explo_building", var_1.origin );
    wait 0.2;
    common_scripts\utility::array_thread( var_2, ::_id_5EA3 );
    common_scripts\utility::array_thread( var_3, ::_id_6224 );
    return;
}

_id_61AB( var_0, var_1 )
{
    level.player enableinvulnerability();
    wait 0.15;
    level.player freezecontrols( 1 );
    level.player playrumblelooponentity( "damage_heavy" );
    var_2 = common_scripts\utility::getstruct( "player_hvt_zoom_end", "targetname" );
    var_3 = var_2.origin;
    var_4 = spawn( "script_model", level.player.origin );
    var_4 setmodel( "tag_origin" );
    var_4.angles = var_0.angles;
    thread _id_61AE( var_4 );
    _id_5CFE::_id_5C77();
    level.player playerlinktoabsolute( var_4, "tag_origin" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_ac130_slamzoom_redflags" );
    var_0 delete();
    var_4 moveto( var_1, 1 );
    level.player viewkick( 10, level.player.origin );
    earthquake( 1, 1, var_4.origin, 200 );
    var_5 = 0.5;
    level thread _id_6186( var_5, "hvt_slamzoom_complete" );
    wait(var_5);
    level.player visionsetnakedforplayer( "coup_sunblind", 1.3 );
    wait 0.4;
    level.player thread maps\_utility::play_sound_on_entity( "exp_ac130_105mm" );
    maps\_utility::_id_1926();
    var_4 unlink();
    var_4 moveto( var_2.origin + ( 0.0, 0.0, 15.0 ), 0.1 );
    wait 0.1;
    var_4 rotateto( var_2.angles, 0.1 );
    wait 0.1;
    level.player unlink();
    level.player setplayerangles( var_2.angles );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    level.player allowprone( 1 );
    level.player setstance( "prone" );
    level.player.ignoreme = 0;
    level.player freezecontrols( 0 );
    level thread _id_61AD( 3 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "sm_SunSampleSizeNear", "0.25" );
    setsaveddvar( "sm_SunShadowScale", "1.0" );
    common_scripts\utility::flag_set( "hvt_slamzoom_complete" );
    maps\_utility::_id_194E( "paris_ac130_courtyard_bldg" );
    wait 0.5;
    level.player thread maps\_utility::vision_set_fog_changes( "paris_ac130_courtyard", 0.5 );
    level thread _id_61B0();
    wait 0.05;
    level.player stoprumble( "damage_heavy" );
    musicstop();
    wait 1;

    if ( level._id_1F19 == "start_e3" )
        level _id_5EB6( 1, 1 );
    else
    {
        level _id_5EB6();
        level thread _id_619A( 0 );
    }

    level.player thread maps\_utility::_id_2761( "FLAG_hvt_escape_hvt_captured", "step_run_plr_water" );
    level thread _id_61AC();
    wait 5;
    var_4 delete();
    level.player disableinvulnerability();
}

_id_61AC()
{
    level thread _id_6226( ( 43698.0, 63372.7, 18575.7 ), ( 272.097, 345.44, 60.3363 ), "FX_b52_bomber_squadron_a", 25, "hvt_tank_destroyed" );
    level thread _id_6226( ( 3051.71, 35473.2, 1325.11 ), ( 270.0, 0.0, 0.0 ), "FX_ambient_explosion_paris", 8, "hvt_tank_destroyed" );
    level thread _id_6226( ( 1561.02, 35106.4, 1211.25 ), ( 270.0, 0.0, 0.0 ), "FX_ambient_explosion_paris", 8, "hvt_tank_destroyed" );
}

_id_61AD( var_0 )
{
    level.player setmovespeedscale( 0.2 );
    wait(var_0);
    level.player setmovespeedscale( 0.5 );
    wait(var_0);
    level.player setmovespeedscale( 0.7 );
    wait(var_0);
    level.player setmovespeedscale( 1 );
}

_id_61AE( var_0 )
{
    var_1 = anglestoforward( var_0.angles );
    var_2 = anglestoup( var_0.angles );
    var_3 = var_1 * 3000;
    var_4 = var_0.origin + var_3;
    var_3 = var_1 * 4500;
    var_5 = var_0.origin + var_3;
    var_6 = _id_61AF( var_4, var_0.angles, "FX_cloud_single" );
    var_7 = _id_61AF( var_5, var_0.angles, "FX_cloud_single" );
    wait 4;
    stopfxontag( common_scripts\utility::getfx( "FX_cloud_single" ), var_0, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "FX_cloud_single" ), var_0, "tag_origin" );
    var_6 delete();
    var_7 delete();
}

_id_61AF( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_0 );
    var_3.angles = var_1;
    var_3 setmodel( "tag_origin" );
    playfxontag( common_scripts\utility::getfx( var_2 ), var_3, "tag_origin" );
    return var_3;
}

_id_61B0()
{
    level thread _id_61B2( "bullet_exit", "player_went_upstairs" );
    level thread _id_61B2( "cover_impacts", "player_went_upstairs" );
    var_0 = common_scripts\utility::getstruct( "debris_fall_small", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "debris_fall_big", "targetname" );
    wait 0.5;
    playfx( level._effect["debris_fall_big"], var_0.origin );
}

_id_61B1( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( "overlay_static", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1.alpha = 0.4;
    var_1 fadeovertime( 0.2 );
    var_1.alpha = 0;
    wait 0.2;
    var_1 fadeovertime( 0.2 );
    var_1.alpha = 0.9;
    wait 0.4;
    var_1 fadeovertime( 0.2 );
    var_1.alpha = 0;
    wait 1;
    var_1 destroy();
}

_id_61B2( var_0, var_1 )
{
    wait(randomfloatrange( 0.5, 1.3 ));
    var_2 = common_scripts\utility::getstructarray( var_0, "targetname" );

    while ( !common_scripts\utility::flag( var_1 ) )
    {
        foreach ( var_4 in var_2 )
        {
            playfx( level._effect["wood_impact"], var_4.origin );
            wait(randomfloatrange( 0.15, 0.6 ));
        }

        wait(randomfloatrange( 1, 3.5 ));
    }
}

_id_61B3()
{
    self endon( "death" );

    if ( !isalive( self ) )
        return;

    common_scripts\utility::flag_wait( "slamzoom_complete" );
    wait 9;
    self.mgturret[0]._id_61B4 = 0.25;

    for (;;)
    {
        _id_61B6();
        var_0 = randomint( 100 );
        var_1 = randomintrange( 70, 95 );

        if ( var_0 < 25 )
        {
            var_2 = common_scripts\utility::random( level._id_6132 );
            self setturrettargetvec( var_2.origin + ( var_1, var_1, 0 ) );
            wait 1.5;
            self fireweapon();
        }
        else
        {
            self setturrettargetvec( level.player.origin + ( var_1, var_1, 0 ) );
            wait 1.5;
            self fireweapon();
        }

        wait(randomintrange( 3, 5 ));
    }
}

_id_61B5()
{
    common_scripts\utility::flag_wait( "humvee_at_bridge" );
    level endon( "player_shot_tank" );
    self endon( "death" );
    var_0 = randomintrange( 100, 200 );

    for (;;)
    {
        var_1 = common_scripts\utility::random( level._id_6132 );
        self setturrettargetvec( var_1.origin + ( var_0, var_0, 0 ) );
        wait(randomfloatrange( 2.5, 4.3 ));
        var_2 = self gettagorigin( "tag_flash" );
        var_3 = magicbullet( "t72_125mm", var_2, var_1.origin + ( var_0, var_0, 0 ) );
    }
}

_id_61B6()
{
    self endon( "death" );
    level endon( "both_tanks_dead" );

    if ( !level._id_61B7 )
        return;
    else
    {
        var_0 = self gettagorigin( "tag_flash" );
        self setturrettargetvec( level.player.origin + ( 10.0, 10.0, 0.0 ) );
        wait 1.5;
        magicbullet( "t72_125mm", var_0, level.player.origin );
        self fireweapon();
        wait 5;

        if ( !level._id_61B7 )
            return;
        else
        {
            level._id_5258 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
            var_1 = level.player geteye();
            var_0 = self gettagorigin( "tag_flash" );
            var_2 = magicbullet( "t72_125mm", var_0, var_1 );
            wait 0.15;
            earthquake( 1, 1, level.player.origin, 8000 );

            if ( isalive( level.player ) )
                level.player dodamage( level.player.health + 200, var_0, self );
        }
    }
}

_id_61B8()
{
    level endon( "both_tanks_dead" );
    level.player waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_0 ) )
    {
        if ( var_0.classname == "script_vehicle_t72_tank" || var_0.classname == "worldspawn" )
        {
            level notify( "new_quote_string" );
            setdvar( "ui_deadquote", &"PARIS_AC130_OBIT_CUSTOM_TANK_DEATH" );
        }
    }

    if ( isdefined( var_2 ) )
    {
        if ( var_2 == "t72_turret" || var_2 == "f15_missile" )
        {
            level notify( "new_quote_string" );
            setdvar( "ui_deadquote", &"PARIS_AC130_OBIT_CUSTOM_TANK_DEATH" );
        }
    }
}

_id_61B9()
{
    level._id_61B7 = 0;
    level endon( "both_tanks_dead" );
    var_0 = getent( "tank_danger_zone", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
            level._id_61B7 = 1;
        else
            level._id_61B7 = 0;

        wait 0.15;
    }
}

_id_21D1()
{
    if ( isdefined( self ) )
        self delete();
}

_id_61BA()
{
    common_scripts\utility::flag_wait( "player_has_javelin" );

    if ( isalive( self ) )
    {
        var_0 = ( 0.0, 0.0, 60.0 );
        target_set( self, var_0 );
        target_setattackmode( self, "top" );
        target_setjavelinonly( self, 1 );
    }

    thread _id_61BD();
}

_id_61BB()
{
    if ( isalive( self ) )
    {
        var_0 = ( 0.0, 0.0, 60.0 );
        target_set( self, var_0 );
        target_setattackmode( self, "top" );
        target_setjavelinonly( self, 1 );
    }

    self waittill( "death" );
    target_remove( self );
}

_id_61BC()
{
    self.health = 90000;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( var_1 == level.player && var_9 == "javelin" )
        {
            maps\_utility::_id_2749();
            earthquake( 0.2, 0.5, level.player.origin, 1000 );
            level.player playrumblelooponentity( "damage_light" );
            wait 0.5;
            level.player stoprumble( "damage_light" );
            continue;
        }

        self.health = 90000;
    }
}

_id_61BD()
{
    self waittill( "death" );
    level notify( "tank_death" );
    target_remove( self );
    wait 0.7;
    self._id_2AB9 delete();
    self delete();
}

_id_61BE()
{
    level._id_1E2E = 0;

    for (;;)
    {
        level waittill( "air_support_strobe_thrown" );
        wait 3.5;

        if ( level._id_1E2E == 0 )
        {
            maps\_utility::_id_11F4( "ac130_plt_targetsahead" );
            level._id_1E2E++;
            continue;
        }

        maps\_utility::_id_11F4( "ac130_plt_engagingtarget" );
        level._id_1E2E = 0;
    }
}

_id_61BF()
{
    var_0 = level.player getcurrentweapon();

    if ( issubstr( var_0, "javelin" ) )
        return 1;
    else
        return 0;
}

_id_61C0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
    {
        var_2 = var_1 * 0.5;
        var_1 = var_2;
    }

    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3 setshader( var_0, 640, 480 );
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = 0;
    var_3.sort = -1;
    var_3 fadeovertime( var_1 );
    var_3.alpha = 1;
    wait(var_1);
    wait(var_2);
    var_3 fadeovertime( var_2 );
    var_3.alpha = 0;
    wait 1;
    var_3 destroy();
}

_id_61C1( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3 setshader( var_0, 640, 480 );
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = 0;
    var_3.alpha = 1;
    common_scripts\utility::flag_wait( var_1 );

    if ( isdefined( var_2 ) )
        wait(var_2);

    var_3 fadeovertime( 0.5 );
    var_3.alpha = 0;
    wait 1;
    var_3 destroy();
}

_id_09FA( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2.x = 0;
    var_2.y = 0;
    var_2 setshader( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2.alpha = 0;
    var_2 fadeovertime( var_1 );
    var_2.alpha = 1;
}

_id_61C2()
{
    common_scripts\utility::flag_set( "attack_choppers_spawned" );
    var_0 = maps\_vehicle::_id_2881( "bridge_attack_chopper1" );
    var_1 = maps\_vehicle::_id_2881( "bridge_attack_chopper2" );
    wait 0.2;
    var_0 thread _id_61C4();
    var_1 thread _id_61C4();
    wait 0.1;
    common_scripts\utility::array_thread( var_0._id_0A39, ::_id_61C3 );
    common_scripts\utility::array_thread( var_1._id_0A39, ::_id_61C3 );
    var_2 = getent( "jav_crash1", "script_noteworthy" );
    var_0._id_29DC = var_2;
    var_3 = getent( "jav_crash2", "script_noteworthy" );
    var_1._id_29DC = var_3;
    var_4 = getent( "crash_chopper_unload", "script_noteworthy" );
    var_4 waittill( "trigger" );
    common_scripts\utility::flag_set( "crash_chopper_unloading" );
    var_5 = getent( "crash_on_bridge", "script_noteworthy" );
    var_0._id_29DC = var_5;
    var_6 = getent( "crash_into_wall", "script_noteworthy" );
    var_1._id_29DC = var_6;
}

_id_61C3()
{
    self endon( "death" );
    self.ignoreme = 1;
    self waittill( "unload" );
    self.ignoreme = 0;
}

_id_61C4()
{
    var_0 = ( 0.0, 0.0, -50.0 );
    self._id_29E0 = 0;
    target_set( self, var_0 );
    target_setjavelinonly( self, 1 );
}

_id_61C5()
{
    var_0 = getentarray( "crash_clip", "targetname" );
    var_1 = getentarray( "crash_assets", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    foreach ( var_6 in var_0 )
        var_6 notsolid();

    common_scripts\utility::flag_wait( "chopper_crashed_on_bridge" );

    foreach ( var_3 in var_1 )
        var_3 show();

    foreach ( var_6 in var_0 )
        var_6 solid();
}

_id_61C6()
{
    level._id_61C7 = 1;
    level._id_0A7A = [];
    _id_6157();
    _id_6159();
    _id_616A();
    level thread _id_618B();
    _id_0546::_id_4068();
    _id_6169();
    level._id_614D thread _id_61C8();
    level._id_614E thread _id_61C8();
    level thread _id_61C9();
    var_0 = common_scripts\utility::getstruct( "bridge_collapse_player_start", "targetname" );
    _id_5CFE::_id_5C77();
    setsaveddvar( "sm_SunSampleSizeNear", "0.25" );
    setsaveddvar( "sm_SunShadowScale", "1.0" );
    level.player setorigin( var_0.origin );
    _id_5EB6( 1 );
    common_scripts\utility::flag_set( "tower_final_start" );
    iprintlnbold( "PLEASE DO NOT USE THIS SKIPTO. IT IS STRICTLY FOR TESTING PURPOSES." );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, ::_id_21D1 );
    var_2 = getentarray( "bridge_tanks", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, ::_id_21D1 );
    var_3 = getentarray( "crash_clip", "targetname" );
    var_4 = getentarray( "crash_assets", "script_noteworthy" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    foreach ( var_9 in var_3 )
        var_9 notsolid();

    _id_616F();
    level thread _id_61D3();
    level thread _id_61DB();
    common_scripts\utility::flag_set( "slamzoom_complete" );
    common_scripts\utility::flag_set( "bombing_run" );
    maps\_utility::_id_142B( "paris_ac130_defend_bridge_mx" );
    wait 5;
    level thread _id_61CA();
    var_11 = getentarray( "chopper_fodder", "targetname" );
    common_scripts\utility::array_thread( var_11, maps\_utility::add_spawn_function, ::_id_617E );
    wait 0.1;
    maps\_spawner::_id_2135( var_11 );
}

_id_61C8()
{
    self waittill( "reached_end_node" );
    var_0 = thread maps\_vehicle::_id_2514();

    foreach ( var_2 in var_0 )
    {
        var_2.ignoreall = 1;

        if ( var_2 == level._id_6133 )
        {
            var_2 thread _id_6171();
            continue;
        }
        else
            level._id_0A7A = common_scripts\utility::add_to_array( level._id_0A7A, var_2 );
    }
}

_id_61C9()
{
    wait 5;
    var_0 = common_scripts\utility::getstructarray( "bridge_collapse_ai_start", "targetname" );

    while ( level._id_0A7A.size < 7 )
        wait 0.05;

    var_1 = level._id_0A7A;

    foreach ( var_3 in var_0 )
    {
        var_4 = common_scripts\utility::random( var_1 );
        var_4 forceteleport( var_3.origin, var_3.angles );
        var_1 = common_scripts\utility::array_remove( var_1, var_4 );

        if ( var_4 == level._id_6127 )
            continue;
    }

    common_scripts\utility::flag_set( "squad_at_skipto_pos" );
}

_id_61CA()
{
    level._effect["plane_bomb_explosion2"] = loadfx( "explosions/fuel_storage" );
    var_0 = getvehiclenodearray( "sonic_boom", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, _id_4960::_id_3E81 );
    common_scripts\utility::flag_wait( "slamzoom_complete" );
    var_1 = getent( "bridge_jet_1", "targetname" );
    var_2 = getent( "bridge_jet_2", "targetname" );
    level._id_61CB = var_1 thread maps\_vehicle::_id_1F9E();
    wait 0.2;
    var_3 = var_2 thread maps\_vehicle::_id_1F9E();
    common_scripts\utility::flag_wait( "bombing_run" );
    var_4 = getvehiclenode( "bridge_bomb_start", "script_noteworthy" );
    var_5 = getvehiclenode( "bomb_start", "script_noteworthy" );
    var_6 = getent( "eiffel_bombing_jet", "targetname" );
    var_7 = var_6 thread maps\_vehicle::_id_1F9E();
    wait 0.1;
    var_8 = spawn( "script_model", var_7.origin );
    var_8 setmodel( "vehicle_a10_warthog" );
    var_8.modelscale = 10;
    var_8.angles = var_7.angles;
    var_8 linkto( var_7 );
    var_7 hide();
    var_7 maps\_utility::delaythread( 4.5, ::_id_61CC );
    var_7 maps\_utility::delaythread( 4.5, maps\_utility::play_sound_on_entity, "scn_ac130_eiffel_bomber" );
    maps\_utility::_id_11F4( "ac130_o61_bombsaway" );
    var_5 waittill( "trigger" );
    common_scripts\utility::exploder( "bombing_run_tower_1" );
    earthquake( 0.3, 8, level.player.origin, 200 );
    level.player playrumblelooponentity( "damage_light" );
    level.player common_scripts\utility::delaycall( 4, ::stoprumble, "damage_light" );
    var_9 = getent( "bridge_bombing_jet", "targetname" );
    var_10 = var_9 thread maps\_vehicle::_id_1F9E();
    wait 0.1;
    var_8 = spawn( "script_model", var_10.origin );
    var_8 setmodel( "vehicle_a10_warthog" );
    var_8.modelscale = 10;
    var_8.angles = var_10.angles;
    var_8 linkto( var_10 );
    var_10 hide();
    var_10 maps\_utility::delaythread( 5.8, ::_id_61CC );
    var_10 maps\_utility::delaythread( 5.5, maps\_utility::play_sound_on_entity, "scn_ac130_eiffel_bomber" );
    maps\_utility::delaythread( 3.5, maps\_utility::_id_11F4, "ac130_o62_bombsaway" );
    var_4 waittill( "trigger" );
    common_scripts\utility::flag_set( "bridge_bombed" );
    common_scripts\utility::exploder( "bombing_run_tower_2" );
    earthquake( 0.4, 5, level.player.origin, 200 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 4, ::stoprumble, "damage_heavy" );
    wait 5;
    common_scripts\utility::flag_set( "tower_final_start" );
    var_11 = getaiarray( "axis" );

    foreach ( var_13 in var_11 )
        var_13 maps\_utility::_id_2749();
}

_id_61CC()
{
    for ( var_0 = 0; var_0 < 7; var_0++ )
    {
        thread _id_61CD();
        wait 0.4;
    }
}

_id_61CD()
{
    var_0 = spawn( "script_model", self.origin - ( 0.0, 0.0, 100.0 ) );
    var_0.angles = self.angles;
    var_0 setmodel( "vehicle_f15_missile" );
    var_1 = anglestoforward( self.angles ) * 2;
    var_2 = anglestoup( self.angles ) * -0.2;
    var_3 = [];

    for ( var_4 = 0; var_4 < 3; var_4++ )
        var_3[var_4] = ( var_1[var_4] + var_2[var_4] ) / 2;

    var_3 = ( var_3[0], var_3[1], var_3[2] );
    var_3 *= 3000;
    var_0 movegravity( var_3, 5.0 );
    wait 5;
    var_0 delete();
}

_id_61CE()
{
    level._id_5258 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( level._id_5258 );
    wait 0.5;
    level._id_5258 rotateto( ( 30.0, -15.0, 35.0 ), 1 );
    wait 0.2;
    level._id_5258 rotateto( ( 0.0, 0.0, 0.0 ), 0.3 );
    wait 0.5;
    level._id_5258 rotateto( ( 10.0, -15.0, -20.0 ), 1 );
    wait 1;
    level._id_5258 rotateto( ( 0.0, 0.0, 0.0 ), 1 );
}

_id_61CF()
{
    level endon( "player_on_board_littlebird" );
    level._id_5258 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( level._id_5258 );

    for (;;)
    {
        var_0 = randomintrange( 15, 25 );
        var_1 = randomfloatrange( 0.7, 2.3 );
        var_2 = randomfloatrange( 0.6, 1.2 );
        level.player playrumblelooponentity( "damage_heavy" );
        earthquake( 0.2, 2, level.player.origin, 8000 );

        if ( common_scripts\utility::cointoss() )
            var_1 *= -1;

        level._id_5258 rotateto( ( var_1, var_1, var_1 ), var_2 );
        wait(var_2);
        level.player thread maps\_utility::play_sound_on_entity( "elm_quake_sub_rumble" );
        level._id_5258 rotateto( ( 0.0, 0.0, 0.0 ), var_2, var_2 * 0.5, var_2 * 0.5 );
        wait(var_2);
        level.player stoprumble( "damage_heavy" );
        wait(var_0);
    }
}

_id_61D0()
{
    var_0 = common_scripts\utility::getstructarray( "tower_rockets", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "tower_rockets_ambient", "targetname" );
    var_2 = getentarray( "tower_aa", "targetname" );
    common_scripts\utility::flag_wait( "all_tanks_destroyed" );
    common_scripts\utility::array_thread( var_2, ::_id_61EE, "bridge_bombed" );
    level thread _id_61D2( var_0, 6, "bridge_bombed" );
    level thread _id_61D2( var_1, 4, "bridge_bombed" );
    var_3 = common_scripts\utility::getstructarray( "ambient_bombing_run", "targetname" );
    level thread _id_61D1( var_3, "bridge_bombed" );
}

_id_61D1( var_0, var_1 )
{
    level endon( var_1 );

    for (;;)
    {
        foreach ( var_3 in var_0 )
        {
            var_4 = anglestoforward( var_3.angles );
            var_5 = anglestoup( var_3.angles );
            playfx( common_scripts\utility::getfx( "ambient_bombing" ), var_3.origin, var_4, var_5 );
            common_scripts\utility::play_sound_in_space( "scn_ac130_distant_explo_building", var_3.origin );
            level.player playrumblelooponentity( "damage_light" );
            level.player common_scripts\utility::delaycall( 0.6, ::stoprumble, "damage_light" );
            earthquake( 0.2, 0.4, level.player.origin, 200 );
            wait(randomintrange( 10, 15 ));
        }
    }
}

_id_61D2( var_0, var_1, var_2 )
{
    level endon( var_2 );
    maps\_utility::_id_0B53( var_0 );

    for (;;)
    {
        foreach ( var_4 in var_0 )
        {
            var_5 = anglestoforward( var_4.angles );
            var_6 = var_5 * randomintrange( 20000, 30000 );
            var_7 = var_4.origin + var_6;
            var_8 = spawn( "script_model", var_4.origin );
            var_8 setmodel( "tag_origin" );
            var_8.angles = var_4.angles;
            var_8 rotatepitch( 180, 0.05 );
            wait 0.2;
            playfxontag( common_scripts\utility::getfx( "FX_s300v_a_missile_trail" ), var_8, "tag_origin" );
            var_8 moveto( var_7, 2, 1.6, 0.3 );
            var_8 waittill( "movedone" );
            playfx( common_scripts\utility::getfx( "FX_aa_fire_flash" ), var_8.origin );
            var_8 delete();
            wait(var_1);
        }
    }
}

_id_5EB0( var_0 )
{
    if ( sighttracepassed( level.player geteye(), var_0, 0, level.player ) )
        return 1;

    return 0;
}

_id_61D3()
{
    common_scripts\utility::flag_set( "pickup_choppers_in" );
    var_0 = [];
    var_1 = [];
    var_2 = common_scripts\utility::getstruct( "little_bird1_start", "targetname" );
    var_3 = common_scripts\utility::getstruct( "pickup_node_before_stage", "script_noteworthy" );
    var_4 = maps\_vehicle::_id_2881( "little_bird1" );
    var_4.health = 90000;
    wait 0.1;

    foreach ( var_6 in var_4._id_0A39 )
    {
        var_6.ignoreme = 1;

        if ( isdefined( var_6._id_251B ) && var_6._id_251B == 2 )
        {
            var_6 hide();
            var_6 setcontents( 0 );
            level._id_61D4 = var_6;
            level._id_61D4 thread maps\_utility::_id_0D04();
            level._id_61D4.ignoreall = 1;
            level._id_61D4.ignoreme = 1;
        }
    }

    var_4 thread maps\_vehicle::_id_26A1( var_2 );
    var_4 waittill( "touch_down" );
    var_4 maps\_vehicle::_id_2514();
    var_4._id_2B0C = 1;
    level._id_6132 = common_scripts\utility::array_remove( level._id_6132, level._id_6127 );
    level._id_6132 = common_scripts\utility::array_remove( level._id_6132, level._id_6126 );
    level._id_0A7A = common_scripts\utility::array_remove( level._id_0A7A, level._id_6126 );
    level._id_61D4._id_251B = 2;
    var_0 = maps\_utility::_id_0BC3( var_0, level._id_61D4 );
    var_8 = getaiarray( "allies" );

    foreach ( var_6 in var_8 )
    {
        if ( !maps\_utility::is_in_array( level._id_6132, var_6 ) && maps\_utility::is_in_array( level._id_0A7A, var_6 ) )
        {
            var_10 = var_6;
            level._id_6132 = maps\_utility::_id_0BC3( level._id_6132, var_10 );

            if ( level._id_6132.size == 5 )
                break;
        }
    }

    level._id_61D5 = 0;
    var_12 = 3;

    foreach ( var_6 in level._id_6132 )
    {
        var_6._id_251B = var_12;

        if ( var_12 < 5 )
        {
            var_0 = maps\_utility::_id_0BC3( var_0, var_6 );
            var_6._id_0EF1 = undefined;
            var_6 maps\_utility::_id_219B();
            var_6 thread _id_61D6();
        }
        else
        {
            var_1 = maps\_utility::_id_0BC3( var_1, var_6 );
            var_6._id_0EF1 = undefined;
            var_6 maps\_utility::_id_219B();
        }

        var_12++;
    }

    maps\_utility::_id_265A( "allies" );

    foreach ( var_16 in level._id_6132 )
    {
        var_16.ignoreall = 1;
        var_16.ignoreme = 1;
    }

    var_4 thread maps\_vehicle::_id_2B0B( var_3, var_0, "left" );
    var_4 thread maps\_vehicle::_id_2B0B( var_3, var_1, "right" );
    level._id_61D4._id_0EF1 = undefined;
    var_4 thread maps\_vehicle::_id_2B0D( "left", var_0 );
    var_4 thread maps\_vehicle::_id_2B0D( "right", var_1 );
    level thread _id_61D7( var_4 );
    maps\_utility::_id_26BF( "last_guys_guard_volk" );
    var_18 = "tag_guy2";
    maps\_utility::delaythread( 3, maps\_utility::_id_11F4, "ac130_snd_gettingouttahere" );
    var_4 maps\_utility::delaythread( 5, ::_id_61DA, var_18 );
    maps\_utility::_id_11F4( "ac130_vnd_ondeck" );
    common_scripts\utility::flag_wait( "player_on_board_littlebird" );
    var_4 thread _id_61E1();
    level common_scripts\utility::flag_wait_or_timeout( "little_bird_full", 30 );
    level thread _id_61D8();
    var_19 = common_scripts\utility::getstruct( "little_bird1_escape", "targetname" );
    var_4 maps\_vehicle::_id_25AB( "idle_alert" );
    var_4 thread maps\_vehicle::_id_26A1( var_19 );
    wait 1;
    var_4 maps\_vehicle::_id_25AB( "idle_alert_to_casual" );
}

_id_61D6()
{
    self waittill( "animontagdone" );
    level._id_61D5++;
}

_id_61D7( var_0 )
{
    while ( level._id_61D5 != 2 )
        wait 0.1;

    wait 1;
    common_scripts\utility::flag_set( "little_bird_full" );
}

_id_61D8()
{
    var_0 = getvehiclenode( "finale_bomb_start", "script_noteworthy" );
    var_0 thread _id_4960::_id_495D();
    var_1 = maps\_vehicle::_id_2A9A( "little_bird2" );
    wait 0.1;

    foreach ( var_3 in var_1 )
    {
        var_3.health = 90000;
        var_3 maps\_vehicle::_id_2A12();
        var_3 thread _id_61D9();
    }

    var_5 = maps\_vehicle::_id_2881( "finale_bombing_jet" );
    maps\_vehicle::_id_2A9A( "seaknights" );
    maps\_utility::delaythread( 1, maps\_vehicle::_id_2A9A, "escape_cowbell_jets" );
}

_id_61D9()
{
    self waittill( "touch_down" );
    maps\_vehicle::_id_2514();
}

_id_61DA( var_0 )
{
    var_1 = self gettagorigin( var_0 );
    var_2 = 50;
    var_3 = 100;
    var_4 = 0;
    var_5 = spawn( "trigger_radius", var_1, var_4, var_2, var_3 );
    var_6 = common_scripts\utility::spawn_tag_origin();
    var_6.origin = self gettagorigin( var_0 );
    var_6.angles = self gettagangles( var_0 );
    var_6.angles += ( 0.0, 0.0, 0.0 );
    var_6 linkto( self, var_0, ( 0.0, 0.0, 0.0 ), ( 0.0, 90.0, 0.0 ) );
    objective_string( maps\_utility::_id_2816( "OBJ_defend_lz" ), &"PARIS_AC130_OBJ_BOARD_THE_LITTLEBIRD" );
    objective_position( maps\_utility::_id_2816( "OBJ_defend_lz" ), var_6.origin );
    objective_onentity( maps\_utility::_id_2816( "OBJ_defend_lz" ), var_6 );
    level thread _id_615F( "player_on_board_littlebird", undefined, "ac130_snd_getonboard", "ac130_snd_onthebird" );
    var_5 waittill( "trigger" );
    objective_state( maps\_utility::_id_2816( "OBJ_defend_lz" ), "done" );
    var_7 = level.player getweaponslistall();
    var_8 = level.player getweaponslistprimaries();
    level.player takeallweapons();
    level.player.ignoreme = 1;
    level.player freezecontrols( 1 );
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    level.player disableweapons();
    var_9 = 1.0;
    var_10 = 40;
    var_11 = 40;
    var_12 = 10;
    var_13 = 45;
    level.player playerlinktoblend( var_6, "tag_origin", 0.8, 0.3, 0.3 );
    wait 1;
    level.player playerlinktodelta( var_6, "tag_origin", var_9, var_10, var_11, var_12, var_13 );
    level.player freezecontrols( 0 );
    level.player takeallweapons();
    level.player lerpviewangleclamp( 1, 0.25, 0.25, var_10, var_11, var_12, var_13 );
    common_scripts\utility::flag_set( "player_on_board_littlebird" );
    level.player thread maps\_utility::vision_set_fog_changes( "paris_ac130_bridge_takeoff", 8 );
    wait 15;
    level thread _id_09FA( "black", 5 );
    wait 5;
    maps\_utility::_id_195A();
}

_id_61DB()
{
    level._effect["shell"] = loadfx( "shellejects/20mm_cargoship" );
    var_0 = maps\_utility::_id_26A3( "pickup_chopper" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_vehicle::_id_1F9E();
        wait 0.1;

        if ( isdefined( var_3.script_noteworthy ) )
        {
            var_3 thread _id_61DC();
            var_3 thread _id_61A2( "player_on_board_littlebird" );
        }
    }

    level thread _id_61DD();
    level thread _id_61DE();
}

_id_61DC()
{
    self._id_5ED4 = spawnturret( "misc_turret", self gettagorigin( "tag_gun_r" ), "btr80_ac130_turret" );
    self._id_5ED4.angles = self gettagangles( "tag_gun_r" );
    self._id_5ED4 setmodel( "weapon_minigun" );
    self._id_5ED4 linkto( self, "tag_gun_r" );
    self._id_5ED4 setmode( "manual" );
    self._id_5ED4 setturretteam( "allies" );
    self._id_5ED4 setdefaultdroppitch( 0 );
    self._id_5ED4 setaispread( 5 );
    wait 8;

    while ( !common_scripts\utility::flag( "player_on_board_littlebird" ) )
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2.istarget ) )
                var_0 = common_scripts\utility::array_remove( var_0, var_2 );
        }

        if ( var_0.size > 0 )
        {
            var_2 = common_scripts\utility::random( var_0 );
            var_2.istarget = 1;
            var_4 = var_2 geteye();

            if ( isalive( var_2 ) )
            {
                self._id_5ED4 settargetentity( var_2 );

                if ( isalive( var_2 ) )
                {
                    level notify( "new_blackhawk_target" );
                    _id_61DF( randomfloatrange( 1.5, 6 ) );

                    if ( isalive( var_2 ) )
                        var_2 maps\_utility::_id_2749();
                }
            }
        }

        wait(randomintrange( 5, 9 ));
    }
}

_id_61DD()
{
    var_0 = [];
    var_0[var_0.size] = "ac130_apa_insight";
    var_0[var_0.size] = "ac130_apl_takeoutguys";
    var_0[var_0.size] = "ac130_apl_getaway";
    var_0[var_0.size] = "ac130_agn_solidbox";
    maps\_utility::_id_0B53( var_0 );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            level waittill( "new_blackhawk_target" );
            maps\_utility::_id_11F4( var_2 );
        }
    }
}

_id_61DE()
{
    var_0 = [];
    var_0[var_0.size] = "ac130_apa_goodshot";
    var_0[var_0.size] = "ac130_apl_suppressed";
    var_0[var_0.size] = "ac130_apa_youreclear";
    maps\_utility::_id_0B53( var_0 );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            level waittill( "blackhawk_target_down" );
            maps\_utility::_id_11F4( var_2 );
        }
    }
}

_id_61DF( var_0 )
{
    self._id_5ED4 maps\_utility::play_sound_on_entity( "blackhawk_gatling_spinup" );
    thread _id_61E0( var_0 );
    self endon( "stop_shooting" );

    for (;;)
    {
        self._id_5ED4 shootturret();
        playfxontag( level._effect["shell"], self, "tag_gun_r" );
        wait 0.05;
    }
}

_id_61E0( var_0 )
{
    self._id_5ED4 thread common_scripts\utility::play_loop_sound_on_entity( "blackhawk_gatling_spinloop" );
    self._id_5ED4 thread common_scripts\utility::play_loop_sound_on_entity( "blackhawk_gatling_fire" );
    wait(var_0);
    self._id_5ED4 thread common_scripts\utility::stop_loop_sound_on_entity( "blackhawk_gatling_spinloop" );
    self._id_5ED4 thread common_scripts\utility::stop_loop_sound_on_entity( "blackhawk_gatling_fire" );
    self notify( "stop_shooting" );
    self._id_5ED4 thread maps\_utility::play_sound_on_entity( "blackhawk_gatling_cooldown" );
    level notify( "blackhawk_target_down" );
}

_id_61E1()
{
    var_0 = [];
    var_0[var_0.size] = "ac130_apl_l3elim";
    var_0[var_0.size] = "ac130_hqr_vulturestatus";
    var_0[var_0.size] = "ac130_apl_circletonorth";
    var_0[var_0.size] = "ac130_bl1_blueone";
    var_0[var_0.size] = "ac130_bl1_turningwest";
    var_0[var_0.size] = "ac130_gt6_longknife";
    var_0[var_0.size] = "ac130_gt6_keepscreening";
    maps\_utility::_id_0B53( var_0 );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            maps\_utility::play_sound_on_tag( var_2, "tag_guy2" );
            wait(randomfloatrange( 2.5, 3.5 ));
        }
    }
}

_id_61E2()
{
    var_0 = common_scripts\utility::getstruct( "desfx_1", "targetname" );
    var_1 = common_scripts\utility::getstruct( "desfx_2", "targetname" );
    var_2 = common_scripts\utility::getstruct( "desfx_3", "targetname" );
    var_3 = common_scripts\utility::getstruct( "desfx_4", "targetname" );
    var_4 = getent( "tower", "targetname" );
    var_5 = getent( "des_1", "targetname" );
    var_6 = getent( "des_2", "targetname" );
    var_7 = getent( "des_3", "targetname" );
    var_8 = getent( "des_4", "targetname" );
    var_9 = getent( "des_5", "targetname" );
    var_10 = getent( "des_6", "targetname" );
    var_11 = getent( "des_7", "targetname" );
    var_12 = getent( "des_8", "targetname" );
    var_13 = getent( "des_9", "targetname" );
    var_14 = getent( "des_10", "targetname" );
    var_15 = getent( "des_11", "targetname" );
    var_16 = [];
    var_16[var_16.size] = var_5;
    var_16[var_16.size] = var_6;
    var_16[var_16.size] = var_7;
    common_scripts\utility::array_thread( var_16, ::_id_61E6 );
    var_17 = [];
    var_17[var_17.size] = var_8;
    var_17[var_17.size] = var_9;
    var_17[var_17.size] = var_10;
    var_17[var_17.size] = var_11;
    var_17[var_17.size] = var_12;
    var_17[var_17.size] = var_13;
    var_17[var_17.size] = var_14;
    var_17[var_17.size] = var_15;

    foreach ( var_19 in var_17 )
    {
        var_19 hide();
        var_19._id_1032 = "tower";
        var_19 maps\_utility::_id_2629();
    }

    if ( !isdefined( level._id_61C7 ) )
    {
        common_scripts\utility::flag_wait( "slamzoom_complete" );
        wait 1;
        magicbullet( "f15_missile", level._id_61CB.origin, var_0.origin );
        wait 0.3;
        magicbullet( "f15_missile", level._id_61CB.origin, var_0.origin );
        wait 0.3;
        magicbullet( "f15_missile", level._id_61CB.origin, var_0.origin );
        wait 1;
    }

    var_15 thread _id_61E3( "TAG_TOP_FX2", 1 );
    var_15 thread _id_61E3( "TAG_MID_FX2", 1 );
    wait 0.1;
    var_5 show();
    var_4 hide();
    var_5 maps\_anim::_id_1246( var_5, "des_1" );
    var_15 maps\_anim::_id_1246( var_15, "des_1" );
    var_15 thread _id_61E3( "TAG_TOP_FX2", 1 );
    wait 0.1;
    var_6 show();
    var_5 hide();
    var_15 thread _id_61E3( "TAG_MID_FX2", 1 );
    var_6 maps\_anim::_id_1246( var_6, "des_2" );
    var_15 maps\_anim::_id_1246( var_15, "des_2" );
    wait 5;
    var_15 thread _id_61E3( "TAG_TOP_FX1", 1 );
    wait 0.1;
    var_7 show();
    var_6 hide();
    var_7 maps\_anim::_id_1246( var_7, "des_3" );
    var_15 maps\_anim::_id_1246( var_15, "des_3" );
    level thread _id_61E5();
    common_scripts\utility::flag_wait( "tower_final_start" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_flash_burst_a" ), var_15, "j_top_03" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_fall_a_wide" ), var_15, "j_mid" );
    var_15 thread _id_61E3( "TAG_LOW_FX1", 1 );
    var_8 show();
    var_7 hide();

    foreach ( var_19 in var_17 )
        var_19 thread maps\_anim::_id_1246( var_19, "des_finale" );

    var_15 thread maps\_utility::play_sound_on_entity( "scn_ac130_eiffel_tower_fall" );
    var_23 = level.player geteye();
    playfx( level._effect["tower_ash"], var_23 );
    level notify( "final_tower_collapse" );
    common_scripts\utility::flag_wait( "hide_4_show_5" );
    var_9 show();
    var_8 hide();
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_burst_a" ), var_15, "tag_low_fx1" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_burst_a" ), var_15, "J_Low_break06" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_spark_burst_b" ), var_15, "tag_low_fx1" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_spark_burst_b" ), var_15, "tag_low_fx2" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_loop_a" ), var_15, "j_top_03" );
    var_8 thread _id_61E4( "TAG_LOW_FX2" );
    common_scripts\utility::flag_wait( "hide_5_show_6" );
    var_10 show();
    var_9 hide();
    var_10 thread _id_61E4( "TAG_LOW_FX3" );
    common_scripts\utility::flag_wait( "hide_6_show_7" );
    var_11 thread _id_61E3( "TAG_LOW_FX4" );
    earthquake( 0.4, 0.5, level.player.origin, 200 );
    var_11 show();
    var_10 hide();
    common_scripts\utility::flag_wait( "hide_7_show_8" );
    var_11 thread _id_61E4( "TAG_MID_FX3" );
    var_12 show();
    var_11 hide();
    common_scripts\utility::flag_wait( "hide_8_show_9" );
    var_13 thread _id_61E4( "TAG_MID_FX4" );
    var_13 show();
    var_12 hide();
    common_scripts\utility::flag_wait( "hide_9_show_10" );
    var_14 thread _id_61E4( "TAG_MID_FX2" );
    var_14 show();
    var_13 hide();
    common_scripts\utility::flag_wait( "hide_10_show_11" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_burst_b" ), var_15, "tag_mid_fx1" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_burst_b" ), var_15, "J_mid_break03" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_spark_burst_a" ), var_15, "J_mid_break02" );
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_spark_burst_a" ), var_15, "J_mid_break05" );
    var_15 thread _id_61E4( "TAG_MID_FX1" );
    var_15 show();
    var_14 hide();
    wait 7;
    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_loop_b" ), var_15, "j_top_03" );
    wait 1;
    stopfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_loop_a" ), var_15, "j_top_03" );
}

_id_61E3( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        playfxontag( common_scripts\utility::getfx( "huge_explosion" ), self, var_0 );

    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_debris_a" ), self, var_0 );
}

_id_61E4( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        playfxontag( common_scripts\utility::getfx( "huge_explosion" ), self, var_0 );

    playfxontag( common_scripts\utility::getfx( "FX_eiffel_tower_stress" ), self, var_0 );
}
#using_animtree("script_model");

_id_61E5( var_0 )
{
    var_1 = getanimlength( %paris_ac130_tower_destruction_finale );
    common_scripts\utility::flag_wait( "tower_final_start" );
    earthquake( 0.1, var_1 * 0.5, level.player.origin, 200 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 3, ::stoprumble, "damage_heavy" );
    wait(var_1 * 0.5);
    earthquake( 0.3, var_1 * 0.2, level.player.origin, 200 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 3, ::stoprumble, "damage_heavy" );
    wait(var_1 * 0.1);
    wait 0.3;
    earthquake( 0.5, 0.4, level.player.origin, 200 );
    wait 0.4;
    earthquake( 0.2, 3, level.player.origin, 200 );
    wait 10;
    level thread _id_61CF();
}

_id_61E6()
{
    self._id_1032 = "tower";
    maps\_utility::_id_2629();
    self hide();
    maps\_anim::_id_11CF( self, self.targetname );
}
#using_animtree("generic_human");

_id_61E7()
{
    maps\_utility::_id_265A( "allies" );
    _id_6159();
    _id_0546::_id_4068();
    level._id_6115 = "viewhands_player_delta";
    _id_61E8::_id_6113();
    level _id_6158();
    level._id_3E8A = "ac130_40mm_air_support_strobe_iw";
    createthreatbiasgroup( "axis" );
    createthreatbiasgroup( "allies" );
    createthreatbiasgroup( "turret_player" );
    createthreatbiasgroup( "street_player" );
    setthreatbias( "turret_player", "axis", 0 );
    setthreatbias( "street_player", "axis", 200000000 );
    level thread _id_61A9();
    level thread _id_61FC();
    level thread _id_6161();
    level thread _id_6220();
    level thread _id_61F4();
    level thread _id_620A();
    level thread _id_6209();
    level thread _id_6200();
    level thread _id_61A8();
    level thread _id_61A6();
    level thread _id_621C();
    level thread _id_621D();
    level thread _id_61EA();
    level._id_0C59["snd"]["door_kick"] = %door_kick_in;
    level._id_0C59["hitman"]["hvt_orders"] = %stand_exposed_wave_target_spotted;
    level._id_0C59["hitman"]["balcony_jump1"] = %traverse_jumpdown_130;
    level._id_0C59["hitman"]["balcony_jump2"] = %traverse_jumpdown_96;
    level._id_0C59["snd"]["slow_door"] = %hunted_open_barndoor_flathand;
    level._id_0C59["generic"]["table_hop"] = %traverse40_2_cover;
    level._id_0C59["snd"]["pinned"] = %paris_ac130_pinned_sandman;
    level._id_0C59["snd"]["pinned_idle"][0] = %paris_ac130_pinned_sandman_idle;
    level._id_0C59["snd"]["pinned_idle_single"] = %paris_ac130_pinned_sandman_idle;
    level._id_0C59["snd"]["pinned_sandman_wave"] = %paris_ac130_pinned_sandman_wave;
    level._id_0C59["hitman"]["pinned"] = %paris_ac130_pinned_hitman;
    level._id_0C59["hitman"]["stairs_sprint"] = %traverse_stair_run_02;
    level._id_0C59["guard"]["pinned"] = %paris_ac130_pinned_guard;
    level._id_0C59["guard"]["pinned_idle"][0] = %paris_ac130_pinned_guard_idle;
    level._id_0C59["hvt"]["pinned"] = %paris_ac130_pinned_hvt;
    level._id_0C59["hvt"]["pinned_idle"][0] = %paris_ac130_pinned_hvt_idle;
    level._id_0C59["soldier"]["pinned"] = %paris_ac130_pinned_soldier01;
    level._id_0C59["soldier"]["pinned_idle"][0] = %paris_ac130_pinned_soldier01_idle;
    maps\_anim::_id_1264( "snd", "kick", ::_id_6223, "door_kick" );
    var_0 = getvehiclenodearray( "sonic_boom_custom", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, _id_4960::_id_3E81 );
    var_1 = getentarray( "hvt_jets", "script_noteworthy" );
    level thread _id_61F0( var_1 );
    var_2 = getent( "hvt_squad_to_exit", "targetname" );
    var_2 thread _id_61E9( "hvt_tank_destroyed" );
    var_3 = getent( "hvt_squad_to_fountain", "targetname" );
    var_3 common_scripts\utility::trigger_off();
    var_4 = getent( "hvt_street", "targetname" );
    var_4 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "hvt_slamzoom_complete" );
    wait 0.1;
    var_5 = getentarray( "aa_fire", "targetname" );
    common_scripts\utility::array_thread( var_5, ::_id_61EE, "FLAG_hvt_escape_hvt_captured" );
    level._id_6127.ignoreme = 1;
    var_3 common_scripts\utility::trigger_on();
    var_4 common_scripts\utility::trigger_on();
    var_6 = [];
    var_6[0] = getent( "player_turret", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, _id_61E8::_id_6116 );
    common_scripts\utility::array_thread( var_6, _id_61E8::_id_6120, "shell", "FLAG_courtyard_slamzoom_out_finished" );
    common_scripts\utility::flag_wait( "hvt_tank_destroyed" );
    var_2 common_scripts\utility::trigger_on();
}

_id_61E9( var_0 )
{
    common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( var_0 );
    common_scripts\utility::trigger_on();
}

_id_61EA()
{
    var_0 = getentarray( "curtains", "script_noteworthy" );
    var_1 = getentarray( "curtains_left", "targetname" );
    var_2 = getentarray( "curtains_left", "targetname" );

    foreach ( var_4 in var_0 )
    {
        if ( var_4.targetname == "curtains_left" )
        {
            var_4._id_1032 = "left_curtain";
            var_4 maps\_anim::_id_1244();
            var_4 thread maps\_anim::_id_124E( var_4, "left_curtain_wind" );
            continue;
        }

        var_4._id_1032 = "right_curtain";
        var_4 maps\_anim::_id_1244();
        var_4 thread maps\_anim::_id_124E( var_4, "right_curtain_wind" );
    }
}

_id_61EB()
{
    if ( level._id_1F19 == "start_e3" )
    {
        level.player enableinvulnerability();
        level.player notifyonplayercommand( "stop_demo", "+usereload" );
        level.player waittill( "stop_demo" );
        thread _id_09FA( "black", 3 );
        wait 3;
        level.player maps\_utility::delaythread( 0.3, maps\_utility::play_sound_on_entity, "player_slamzoom_out" );
        maps\_audio_mix_manager::_id_150F( "scn_ac130_e3demo_amb_mix", 1 );
        level.player.ignoreme = 1;
        level.player freezecontrols( 1 );
        level.player disableweapons();
        var_0 = spawn( "script_origin", level.player.origin );
        var_0.angles = ( 0.0, 0.0, 0.0 );
        level.player enableinvulnerability();
        level.player playerlinktoabsolute( var_0 );
        var_0 moveto( ( 0.0, 0.0, 300.0 ), 0.3 );
        wait 1.6;
        setsaveddvar( "g_friendlynamedist", 0 );
        setsaveddvar( "ui_hidemap", 1 );
        setsaveddvar( "compass", 0 );
        setsaveddvar( "ammoCounterHide", "1" );
        setsaveddvar( "hud_showStance", 0 );
        wait 5;
        level thread _id_09FA( "black", 3 );
        level._id_1958 = 1;
        wait 3;
        maps\_utility::_id_195A();
    }
}

_id_61EC()
{
    wait 4;
    level thread maps\paris_ac130_pip::_id_60E5( level._id_45C0 );
    level maps\_utility::delaythread( 8, maps\paris_ac130_pip::_id_6104 );
}

_id_61ED( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = anglestoforward( self.angles );
        var_3 = randomintrange( 10, 20 );
        var_4 = var_2 * -200;
        var_5 = self.origin + var_4 + ( var_3, var_3, 120 );
        var_6 = var_2 * 800;
        var_7 = self.origin + var_6;
        magicbullet( "rpg", var_5, var_7 );
        wait(randomfloatrange( 1.5, 3 ));
    }
}

_id_61EE( var_0 )
{
    wait(randomintrange( 1, 3 ));
    var_1 = randomintrange( 1, 4 );
    var_2 = randomintrange( 60, 100 );

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        thread _id_61EF( var_0 );
        wait 0.1;
        self rotatepitch( var_2 * -1, var_1 );
        wait(var_1);
        self rotatepitch( var_2, var_1 );
        wait(var_1);
        self notify( "stop_firing" );
        wait(randomintrange( 6, 10 ));
    }
}

_id_61EF( var_0 )
{
    self endon( "stop_firing" );

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = anglestoforward( self.angles );
        playfx( level._effect["FX_flak_tracers"], self.origin, var_1 );
        wait 0.5;
    }
}

_id_61F0( var_0 )
{
    level endon( "FLAG_hvt_escape_hvt_captured" );
    common_scripts\utility::flag_wait( "hvt_slamzoom_complete" );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            var_2.count = 1;
            var_3 = var_2 thread maps\_vehicle::_id_1F9E();
            wait 0.1;

            if ( common_scripts\utility::cointoss() )
                var_3 thread _id_61F2();

            wait(randomintrange( 15, 20 ));
        }
    }
}

_id_61F1( var_0 )
{
    level endon( "bridge_collapse_start" );
    common_scripts\utility::flag_wait( "slamzoom_complete" );
    wait 10;

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            var_2.count = 1;
            var_3 = var_2 thread maps\_vehicle::_id_1F9E();
            wait 0.1;

            if ( randomint( 100 ) > 50 )
                var_3 thread _id_61F2();

            wait(randomintrange( 15, 20 ));
        }
    }
}

_id_61F2()
{
    self endon( "reached_end_node" );
    var_0 = anglestoforward( self.angles );
    var_1 = var_0 * ( randomintrange( 3500, 4500 ) * 2 );
    var_2 = self.origin + var_1;
    var_3 = spawn( "script_model", var_2 );
    var_3.angles = self.angles;
    var_3 setmodel( "vehicle_mig29_low" );
    var_3 linkto( self );
    thread _id_61F3( var_3 );
    var_4 = ( 76.0, -74.0, 20.0 );
    var_5 = ( 76.0, 74.0, 20.0 );
    var_6 = ( 76.0, -74.0, 25.0 );
    var_7 = ( 76.0, 74.0, 25.0 );
    var_8 = 0;

    while ( isdefined( self ) )
    {
        var_9 = _id_570B( self.origin, self.angles, var_5 );
        var_0 = anglestoforward( self.angles );
        var_1 = var_0 * 1000;
        playfx( level._effect["FX_jet_20mm_tracer"], var_9, var_0 );
        wait 0.15;
        var_10 = _id_570B( self.origin, self.angles, var_4 );
        var_0 = anglestoforward( self.angles );
        var_1 = var_0 * 1000;
        playfx( level._effect["FX_jet_20mm_tracer"], var_10, var_0 );
        wait 0.15;
        var_8++;

        if ( var_8 >= 10 )
        {
            var_9 = _id_570B( self.origin, self.angles, var_7 );
            var_0 = anglestoforward( self.angles );
            var_1 = var_0 * 1000;
            magicbullet( "f15_missile", var_9, var_9 + var_1 );
            wait 0.3;
            var_10 = _id_570B( self.origin, self.angles, var_6 );
            var_0 = anglestoforward( self.angles );
            var_1 = var_0 * 1000;
            magicbullet( "f15_missile", var_10, var_10 + var_1 );
            var_8 = 0;
        }
    }
}

_id_61F3( var_0 )
{
    self waittill( "reached_end_node" );
    var_0 delete();
}

_id_570B( var_0, var_1, var_2 )
{
    var_3 = cos( var_1[1] );
    var_4 = sin( var_1[1] );
    var_5 = var_2[0] * var_3 - var_2[1] * var_4;
    var_6 = var_2[0] * var_4 + var_2[1] * var_3;
    var_5 += var_0[0];
    var_6 += var_0[1];
    return ( var_5, var_6, var_0[2] + var_2[2] );
}

_id_61F4()
{
    thread maps\_utility::_id_2634( "hvt_squad_to_fountain" );

    foreach ( var_1 in level._id_6132 )
    {
        var_1.ignoreme = 0;
        var_1.ignoreall = 1;
        var_1._id_61F5 = var_1._id_20AF;
        var_1._id_20AF = 0.33;
        var_1 setlookatentity();
    }

    level._id_6135 maps\_utility::_id_1057();
    var_3 = getnode( "gator_cover", "targetname" );
    level._id_6135.goalradius = 32;
    level._id_6135 setgoalnode( var_3 );
    level._id_6133.ignoreall = 1;
    level._id_6133.ignoreme = 1;
    maps\_utility::_id_26BF( "squad_HVT_pos1" );
    common_scripts\utility::flag_wait( "player_shot_yellow_building" );
    level._id_6134._id_1032 = "hitman";
    level._id_6135._id_1032 = "soldier";
    level._id_6126._id_1032 = "guard";
    level._id_6127._id_1032 = "hvt";
    level._id_45C0._id_1032 = "snd";
    var_4 = getent( "pinned_node", "targetname" );
    level._id_6127._id_406B = var_4;
    var_5 = [];
    var_5[var_5.size] = level._id_6135;
    var_5[var_5.size] = level._id_6126;
    var_5[var_5.size] = level._id_6127;
    maps\_utility::_id_1926();
    level._id_6134 thread _id_61F8( var_4 );
    level._id_45C0 thread _id_61F9( var_4 );
    common_scripts\utility::array_thread( var_5, ::_id_61FA, var_4 );
    common_scripts\utility::flag_wait( "turret_guy_dead" );
    level._id_6135 stopanimscripted();
    level._id_6134 maps\_utility::_id_109E();
    common_scripts\utility::flag_set( "squad_to_courtyard" );
    maps\_utility::_id_1425( "squad_outside" );
    maps\_utility::_id_142B( "paris_ac130_courtyard_fight" );
    level._id_45C0 maps\_utility::_id_123B();
    level._id_45C0 maps\_utility::_id_257D();
    level._id_45C0 stopanimscripted();
    var_6 = getent( "doorkick", "targetname" );
    var_6 maps\_anim::_id_124A( level._id_45C0, "door_kick" );
    var_6 maps\_anim::_id_1246( level._id_45C0, "door_kick" );
    level._id_45C0 maps\_utility::_id_13A4( "r" );
    level._id_6135 maps\_utility::_id_13A4( "r" );
    level._id_6135.ignoreall = 1;
    level._id_6135.ignoreme = 1;
    level._id_6135.ignoresuppression = 1;
    level thread _id_61FE();
    maps\_utility::_id_26BF( "red_to_courtyard" );
    level _id_615C();
    wait 4;

    foreach ( var_1 in level._id_6132 )
    {
        var_1._id_20AF = 3;
        var_1.ignoreall = 0;
        var_1.ignoreme = 0;
        var_1.ignoresuppression = 0;
    }

    level common_scripts\utility::flag_wait_or_timeout( "squad_garden_pos2", 35 );
    level thread _id_615C();
    var_9 = getent( "squad_garden_pos2", "targetname" );

    if ( isdefined( var_9 ) )
    {
        maps\_utility::_id_26BF( var_9.targetname );
        var_9 delete();
        common_scripts\utility::flag_set( "squad_garden_pos2" );
    }

    foreach ( var_1 in level._id_6132 )
        var_1._id_20AF = 1;

    while ( level._id_61F6 )
        wait 0.5;

    wait 10;
    common_scripts\utility::flag_wait( "hvt_monument_clear" );
    maps\_utility::_id_1425( "squad_to_fountain" );
    level thread _id_61FF();
    level thread _id_615C();
    maps\_utility::_id_26BF( "hvt_squad_to_fountain" );
    common_scripts\utility::flag_set( "hvt_squad_to_fountain" );
    wait 0.2;

    while ( _id_5F9E::_id_51FF( level._id_45C0.origin, level.player.origin ) > squared( 700 ) )
        wait 0.1;

    common_scripts\utility::flag_wait( "hvt_tank_destroyed" );
    wait 2;
    maps\_utility::_id_26BF( "hvt_squad_to_parking_lot" );
    level._id_45C0 maps\_utility::_id_219B();
    var_12 = getnode( "sandman_door", "targetname" );
    level._id_45C0.goalradius = 32;
    level._id_45C0 setgoalnode( var_12 );
    var_13 = maps\_utility::_id_2642( "courtyard_chopper", "targetname" );
    var_13 thread maps\_vehicle::_id_2A13();
    var_13 delete();
    maps\_utility::_id_265A( "allies" );
}

_id_61F7()
{
    level.player endon( "death" );
    level._id_6185 = level.player getweaponslistall();
    var_0 = spawn( "script_model", level.player.origin );
    var_0.angles = level.player getplayerangles();
    var_0 setmodel( "tag_origin" );
    level.player freezecontrols( 1 );
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player playerlinktoabsolute( var_0, "tag_origin" );
    level.player enableinvulnerability();
    level.player hideviewmodel();
    level.player takeallweapons();
    level.player.ignoreme = 1;
    var_1 = ( 1750.0, 41099.0, 5943.0 );
    var_2 = ( 90, 267.5, level.player.angles[2] );
    var_0 movez( 5943, 1.2, 1.2 );
    level thread _id_61B1( 0.4 );
    var_0 rotateto( var_2, 0.2 );
    var_0 thread maps\_utility::play_sound_on_entity( "player_slamzoom_out" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "slamout_static" );
    level.player visionsetnakedforplayer( "paris_ac130_enhanced", 2 );
    maps\_utility::delaythread( 0.6, _id_5CFE::_id_5C97, level._id_6132 );
    wait 0.8;
    thread _id_61C0( "overlay_static", 0.3, 1 );
    wait 0.3;
    common_scripts\utility::flag_set( "FLAG_hvt_escape_hvt_captured" );
    var_0 thread common_scripts\utility::stop_loop_sound_on_entity( "slamout_static" );
    level thread _id_0546::_id_406C( level._id_6126, level._id_6127 );
}

_id_61F8( var_0 )
{
    level._id_6134 maps\_utility::_id_13A4( "b" );
    level._id_6134.ignoreme = 1;
    level._id_6134.ignoreall = 1;
    level._id_6134 maps\_utility::_id_1057();
    level._id_6134 maps\_utility::_id_2711();
    level._id_6134 maps\_utility::_id_0EEC();
    var_0 maps\_anim::_id_1246( level._id_6134, "pinned" );
    wait 6;
    level._id_6134.ignoreme = 0;
    level._id_6134.ignoreall = 0;
    wait 10;
}

_id_61F9( var_0 )
{
    level endon( "turret_guy_dead" );
    var_1 = getnode( "sandman_cover", "targetname" );
    maps\_utility::_id_123B();
    self.goalradius = 32;
    self setgoalnode( var_1 );
    var_0 maps\_anim::_id_1246( self, "pinned" );
    common_scripts\utility::flag_set( "pinned_anim_complete" );
    var_0 maps\_anim::_id_1246( self, "pinned_idle_single" );
    var_2 = self gettagorigin( "tag_weapon_left" );
    var_3 = self gettagangles( "tag_weapon_left" );
    var_4 = spawn( "script_model", var_2 );
    var_4 setmodel( "weapon_m16_sp_iw5" );
    var_4.angles = var_3;
    var_4 linkto( self, "TAG_WEAPON_LEFT" );
    var_4 hidepart( "TAG_ACOG_2" );
    var_4 hidepart( "TAG_EOTECH" );
    var_4 hidepart( "TAG_HAMR_HYBRID" );
    var_4 hidepart( "TAG_HEARTBEAT" );
    var_4 hidepart( "TAG_FOREGRIP" );
    var_4 hidepart( "TAG_M203" );
    var_4 hidepart( "TAG_M320" );
    var_4 hidepart( "TAG_MAGNIFIER" );
    var_4 hidepart( "TAG_RED_DOT" );
    var_4 hidepart( "TAG_SHOTGUN" );
    var_4 hidepart( "TAG_SILENCER" );
    var_4 hidepart( "TAG_THERMAL_SCOPE" );

    while ( !common_scripts\utility::flag( "player_went_upstairs" ) )
    {
        maps\_utility::_id_24F5();
        var_4 show();
        thread maps\_utility::_id_11F4( "ac130_snd_takeoutmg" );
        var_0 maps\_anim::_id_1246( self, "pinned_sandman_wave" );
        var_4 hide();
        maps\_utility::_id_257D();
        var_0 maps\_anim::_id_1246( self, "pinned_idle_single" );
        var_0 maps\_anim::_id_1246( self, "pinned_idle_single" );
    }

    var_0 maps\_anim::_id_124E( level._id_45C0, "pinned_idle" );
}

_id_61FA( var_0 )
{
    if ( self == level._id_6135 )
        level endon( "turret_guy_dead" );

    var_0 maps\_anim::_id_1246( self, "pinned" );
    var_0 maps\_anim::_id_124E( self, "pinned_idle" );
}

_id_61FB()
{
    level endon( "turret_guy_dead" );

    for (;;)
    {
        wait(randomintrange( 10, 15 ));
        maps\_utility::_id_11F4( "ac130_snd_getmgdown" );
        wait(randomintrange( 10, 15 ));
        maps\_utility::_id_11F4( "ac130_snd_wecanmoveup" );
        wait(randomintrange( 10, 15 ));
    }
}

_id_61FC()
{
    createthreatbiasgroup( "upstairs_enemies" );
    createthreatbiasgroup( "hitman" );
    level._id_6134 setthreatbiasgroup( "hitman" );
    var_0 = getentarray( "upstairs_guys", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_61FD );
    var_1 = common_scripts\utility::getstruct( "2nd_floor_window", "targetname" );
    var_2 = common_scripts\utility::getstruct( "balcony_jump1", "targetname" );
    maps\_utility::_id_262C( "player_stairs" );
    var_3 = maps\_utility::_id_272B( var_0, 1 );
    wait 0.1;
    setthreatbias( "upstairs_enemies", "hitman", 200000000 );
    level._id_6134 maps\_utility::_id_1071();

    while ( var_3.size > 0 )
    {
        var_3 = maps\_utility::_id_1361( var_3 );
        wait 0.5;
    }

    level._id_6134.ignoreall = 1;
    level._id_6134.script_pushable = 0;
    var_4 = getent( "blue_to_hallway", "targetname" );

    if ( isdefined( var_4 ) )
        var_4 delete();

    maps\_utility::_id_26BF( "blue_to_bedroom" );
    wait 6;
    level._id_6134.ignoreall = 0;
}

_id_61FD()
{
    self setthreatbiasgroup( "upstairs_enemies" );
    self.goalradius = 32;
    self.grenadeammo = 0;

    if ( common_scripts\utility::cointoss() )
        maps\_utility::_id_2712();

    maps\_utility::_id_260D();
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) )
    {
        var_0 = common_scripts\utility::getstruct( self.script_noteworthy, "targetname" );
        self._id_1032 = "generic";
        var_0 maps\_anim::_id_124A( self, "table_hop" );
        thread _id_51F7( self );
        var_0 thread maps\_anim::_id_1246( self, "table_hop" );
    }
}

_id_51F7( var_0 )
{
    var_0 common_scripts\utility::waittill_any( "damage", "death" );
    var_0 stopanimscripted();
}

_id_61FE()
{
    level._id_6134 maps\_utility::_id_109E();
    level._id_6134 maps\_utility::_id_0D72( 1 );
    var_0 = common_scripts\utility::getstruct( "balcony_jump1", "targetname" );
    var_1 = common_scripts\utility::getstruct( "balcony_jump2", "targetname" );
    level._id_6134._id_1032 = "hitman";
    var_0 maps\_anim::_id_124A( level._id_6134, "balcony_jump1" );
    var_0 maps\_anim::_id_1246( level._id_6134, "balcony_jump1" );
    var_1 maps\_anim::_id_1246( level._id_6134, "balcony_jump2" );
    level._id_6134 maps\_utility::_id_13A4( "b" );
    level._id_6134.script_pushable = 1;
}

_id_61FF()
{
    level endon( "FLAG_hvt_escape_hvt_captured" );
    var_0 = getent( "pinned_node", "targetname" );
    var_0 notify( "stop_loop" );
    level._id_6126 stopanimscripted();
    level._id_6127 stopanimscripted();
    level._id_6127._id_1416 = 0;
    wait 0.1;
    level._id_6126._id_1032 = "generic";
    level._id_6127._id_1032 = "generic";
    wait 0.1;
    var_1 = common_scripts\utility::getstruct( "hvt_loop", "targetname" );
    level._id_6127._id_406B = var_1;
    level._id_6127._id_406B thread maps\_anim::_id_11C8( level._id_6127, "wounded_idle", "stop_wounded_idle" );
    wait 0.15;
    var_1 = getent( "hvt_carry_fountain", "targetname" );
    level._id_6127 maps\_utility::delaythread( 8, maps\_utility::play_sound_on_entity, "ac130_vlk_getmekilled" );
    level._id_6126 _id_0546::_id_406D( level._id_6127, var_1 );
    objective_position( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), level._id_6127.origin + ( 0.0, 0.0, 55.0 ) );
    objective_setpointertextoverride( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), &"PARIS_AC130_OBJ_PROTECT" );
    var_2 = getnode( "bishop_cover_hvt", "targetname" );
    level._id_6126 setgoalnode( var_2 );
    level._id_6127 thread maps\_utility::play_sound_on_entity( "ac130_vlk_killyouall" );
    common_scripts\utility::flag_wait( "hvt_tank_destroyed" );
    objective_position( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), ( 0.0, 0.0, 0.0 ) );
}

_id_6200()
{
    var_0 = getentarray( "new_tank_guys", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6207 );
    var_1 = getentarray( "courtyard_fence_des_a_pristine", "targetname" );
    var_2 = getentarray( "courtyard_fence_des_a_pristine_models", "targetname" );
    var_3 = getentarray( "courtyard_fence_des_a_damage", "targetname" );
    var_4 = getentarray( "courtyard_fence_des_a_damage_models", "targetname" );
    var_5 = getentarray( "wallgate_pristine", "targetname" );
    var_6 = getentarray( "wallgate_damage", "targetname" );
    var_7 = common_scripts\utility::getstruct( "courtyard_gate_target", "targetname" );
    var_8 = getvehiclenode( "courtyard_tank_end", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::_id_5EA3, 1 );
    common_scripts\utility::array_thread( var_2, ::_id_5EA3 );
    common_scripts\utility::array_thread( var_6, ::_id_5EA3 );
    common_scripts\utility::flag_wait( "hvt_courtyard_clear" );
    var_9 = common_scripts\utility::getstruct( "tank_entrance_fx", "targetname" );
    common_scripts\utility::play_sound_in_space( "scn_ac130_tank_courtyard_arrive", var_9.origin );
    var_10 = maps\_utility::_id_272C( "new_tank_guys" );
    var_11 = vectornormalize( anglestoforward( var_9.angles ) );
    earthquake( 0.6, 2, level.player.origin, 100 );
    thread common_scripts\utility::play_sound_in_space( "t72_fire", var_9.origin );
    playfx( level._effect["FX_osprey_explosion"], var_9.origin, var_11 );
    common_scripts\utility::array_thread( var_5, ::_id_5EA3, 1 );
    common_scripts\utility::array_thread( var_6, ::_id_6224 );
    wait 0.2;
    level thread common_scripts\utility::play_sound_in_space( "scn_ac130_tank_courtyard_wall", var_9.origin );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 2, ::stoprumble, "damage_heavy" );
    wait 1;
    var_12 = getent( "courtyard_tank", "targetname" );
    var_13 = var_12 thread maps\_vehicle::_id_1F9E();
    wait 0.1;
    var_13 thread maps\_vehicle::_id_2A12();
    var_13.health = 999999;
    var_13.mgturret[0] setmode( "manual" );
    var_13.mgturret[0] thread _id_6205();
    var_13 setvehicleteam( "axis" );
    var_13 thread _id_03BB();
    wait 1.5;
    level thread _id_6204( var_13 );
    var_13 thread maps\_utility::play_sound_on_entity( "scn_ac130_tank_courtyard_move" );
    level.player enableinvulnerability();
    earthquake( 0.3, 1, level.player.origin, 1000 );
    wait 1.5;
    var_14 = common_scripts\utility::getstruct( "tank_target_pillars", "targetname" );
    var_13 setturrettargetvec( var_14.origin - ( 0.0, 0.0, 30.0 ) );
    wait 1.5;
    var_13 fireweapon();
    wait 0.8;
    level thread _id_6201();
    wait 0.6;
    earthquake( 0.5, 1, level.player.origin, 100 );
    var_13 thread _id_6206();
    wait 2;
    level.player disableinvulnerability();
}

_id_03BB()
{
    self endon( "death" );
    level endon( "c130_shooting_tank" );

    for (;;)
    {
        var_0 = _id_5F9E::_id_51FF( self.origin, level.player.origin );

        if ( var_0 < 160000 )
        {
            var_1 = level.player.origin + ( 0.0, 0.0, 100.0 );
            magicbullet( "ac130_105mm_alt2", var_1, level.player.origin );
            wait 5;
        }

        wait 0.2;
    }
}

_id_6201()
{
    var_0 = getent( "player_turret", "script_noteworthy" );

    if ( common_scripts\utility::flag( "player_on_dshk_turret" ) && !common_scripts\utility::flag( "player_dismounting_turret" ) )
    {
        level.player freezecontrols( 1 );

        if ( isdefined( var_0._id_6117 ) )
            var_0._id_6117 delete();

        level.player notify( "turret_dismount" );
        level.player shellshock( "default", 2 );
        var_0 _id_61E8::_id_611C();
    }

    var_0 makeunusable();
    var_0 setdefaultdroppitch( 12 );

    if ( isdefined( level.player._id_611B ) )
        level.player._id_611B destroy();

    if ( isdefined( level.player._id_6119 ) )
        level.player._id_6119 destroy();

    if ( isdefined( self._id_51F2 ) )
        self._id_51F2 delete();

    if ( level.player islinked() )
        level.player unlink();

    level.player freezecontrols( 0 );
    level.player enableweapons();

    while ( common_scripts\utility::flag( "player_dismounting_turret" ) )
        wait 0.05;

    var_0 notify( "death" );
    var_1 = var_0 gettagorigin( "tag_weapon" );
    playloopedfx( level._effect["turret_smoke"], 1, var_1 - ( 0.0, 0.0, 15.0 ) );
}

_id_6202()
{
    self endon( "death" );
    level endon( "hvt_tank_destroyed" );
    var_0 = getent( "hvt_street", "targetname" );

    while ( level.player istouching( var_0 ) )
    {
        self setturrettargetvec( level.player geteye() );
        wait(randomfloatrange( 1, 2.5 ));
        self fireweapon();
        wait 2;
    }

    return;
}

_id_6203( var_0 )
{
    maps\_utility::_id_11F4( "ac130_plt_gotyourmark" );
    wait 2.6;
    musicstop( 4 );
    var_1 = getent( "105_shoot", "targetname" );
    var_1.origin = ( 1750.0, 41099.0, 5943.0 );
    var_0 thread maps\_vehicle::_id_2A13();
    var_0.health = 10000;
    var_2 = var_0.origin;
    var_1 thread _id_6199( var_0.origin, 15 );
    var_3 = common_scripts\utility::getstructarray( "destructible_vehicle_target", "targetname" );

    foreach ( var_5 in var_3 )
    {
        magicbullet( "ac130_40mm_air_support_strobe", var_1.origin, var_5.origin );
        wait(randomfloatrange( 0.4, 0.8 ));
        earthquake( 0.4, 0.35, level.player.origin, 100 );
        magicbullet( "ac130_40mm_air_support_strobe", var_1.origin, var_5.origin );
        wait(randomfloatrange( 0.4, 0.8 ));
        earthquake( 0.4, 0.35, level.player.origin, 100 );
    }

    for ( var_7 = 0; var_7 < 8; var_7++ )
    {
        var_8 = randomintrange( 50, 150 );
        var_9 = ( var_8, var_8, 0 );
        magicbullet( "ac130_40mm_air_support_strobe", var_1.origin, var_2 + var_9 );
        earthquake( 0.4, 0.35, level.player.origin, 100 );
        wait(randomfloatrange( 0.15, 0.45 ));
    }

    if ( isalive( var_0 ) )
        var_0 dodamage( var_0.health + 200, var_0.origin );

    var_8 = randomintrange( 100, 200 );
    var_9 = ( var_8, var_8, 0 );
    var_10 = magicbullet( "ac130_105mm_alt2", var_1.origin, var_2 );
    var_10 waittill( "death" );
    earthquake( 0.7, 0.6, level.player.origin, 100 );
    level.player playrumblelooponentity( "damage_heavy" );
    level.player common_scripts\utility::delaycall( 1.5, ::stoprumble, "damage_heavy" );
    var_1 _id_6192();
    common_scripts\utility::flag_set( "hvt_tank_destroyed" );
    maps\_utility::_id_265A( "axis" );
    level thread _id_61F7();
}

_id_6204( var_0 )
{
    level endon( "hvt_tank_destroyed" );
    common_scripts\utility::flag_set( "hvt_air_strobe_start" );
    level.player _id_0622::_id_3E90();
    level.player thread _id_5134( 120 );

    for (;;)
    {
        level.player waittill( "grenade_fire", var_1, var_2 );

        if ( var_2 == "air_support_strobe" )
        {
            common_scripts\utility::flag_set( "player_threw_strobe" );
            var_1 maps\_utility::_id_26DF( "missile_stuck", 3 );
            var_3 = _id_5F9E::_id_51FF( var_1.origin, var_0.origin );

            if ( var_3 < 1000000 )
            {
                common_scripts\utility::flag_set( "c130_shooting_tank" );
                level thread _id_6203( var_0 );
                wait 0.5;
                level.player _id_0622::_id_3E8F();
            }
            else
            {
                level._id_45C0 thread maps\_utility::play_sound_on_entity( "ac130_trk_throwitattank" );
                common_scripts\utility::flag_clear( "player_threw_strobe" );
            }
        }
    }
}

_id_6205()
{
    self.leftarc = 90;
    self.rightarc = 90;
    self.toparc = 20;
    self.bottomarc = 20;
    self settargetentity( level.player );
    self setaispread( 3 );
    thread _id_6216( "c130_shooting_tank" );
}

_id_6206()
{
    self endon( "death" );

    for (;;)
    {
        _id_6202();
        var_0 = randomintrange( 200, 250 );
        self setturrettargetvec( level.player.origin + ( var_0, var_0, 0 ) );
        wait(randomfloatrange( 1, 2.5 ));
        self fireweapon();
        wait 0.4;
        var_1 = common_scripts\utility::random( level._id_6132 );
        self setturrettargetvec( var_1.origin + ( var_0, var_0, 0 ) );
        wait(randomfloatrange( 1, 2.5 ));
        self fireweapon();
        wait(randomfloatrange( 2.5, 3.2 ));
    }
}

_id_6207()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstructarray( "tank_area", "targetname" );
    thread _id_5ECA( var_0 );
}

_id_5134( var_0 )
{
    self endon( "death" );
    self endon( "stop_air_support_hint" );

    if ( !isdefined( var_0 ) )
        var_0 = 40;

    level.player maps\_utility::_id_1654( "flag_strobe_ready" );
    self._id_5135 = 0;

    if ( !_id_5138() )
    {
        thread _id_5136( var_0 );
        maps\_utility::_id_1823( "air_support_hint", var_0 );
    }
}

_id_5136( var_0 )
{
    self endon( "death" );
    self endon( "stop_air_support_hint_timeout" );
    thread _id_5137( var_0 );
    self waittill( "stop_air_support_hint" );
    self._id_5135 = 1;
}

_id_5137( var_0 )
{
    self endon( "death" );
    self endon( "stop_air_support_hint" );
    wait(var_0);
    self notify( "stop_air_support_hint_timeout" );
}

_id_5138()
{
    return level.player._id_5135 || level.player getcurrentweapon() == "air_support_strobe";
}

_id_6208()
{
    for ( var_0 = 0; var_0 < 3; var_0 += var_1 )
        level waittill( "air_support_strobe_killed", var_1 );
}

_id_6209()
{
    level endon( "hvt_squad_to_fountain" );
    level._id_61F6 = 0;
    maps\_utility::_id_262C( "player_bedroom_approach" );
    common_scripts\utility::flag_set( "player_went_to_bedroom" );
    var_0 = getent( "player_upstairs_detector", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
            level._id_61F6 = 1;
        else
            level._id_61F6 = 0;

        wait 0.05;
    }
}

_id_620A()
{
    var_0 = getentarray( "courtyard_wave1", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_6219, 32, 1 );
    var_1 = getentarray( "main_courtyard_floods", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_6219, undefined, 1 );
    var_2 = getentarray( "tank_squad", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_620F );
    var_3 = getentarray( "window_guys", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_620E );
    var_4 = getentarray( "outside_only_guys", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_6219, 32, 1 );
    var_5 = getentarray( "left_side_enemies", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_620C );
    var_6 = getentarray( "tank_squad", "targetname" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_620E );
    var_7 = getentarray( "roof_rpg_guy", "targetname" );
    var_8 = maps\_utility::_id_272B( var_7, 1 );
    wait 0.1;

    foreach ( var_10 in var_8 )
    {
        var_10.goalradius = 24;
        var_10 thread _id_620D();
    }

    _id_5CFE::_id_5C97( var_8 );
    level thread _id_6211();
    common_scripts\utility::flag_wait( "player_shot_yellow_building" );
    var_12 = maps\_utility::_id_272C( "courtyard_wave1" );
    wait 1;
    maps\_spawner::_id_2135( var_1 );
    var_13 = maps\_vehicle::_id_2881( "courtyard_chopper" );
    wait 0.1;
    var_13 thread maps\_vehicle::_id_2A12();
    common_scripts\utility::flag_wait( "hvt_slamzoom_complete" );
    var_8 = common_scripts\utility::array_removeundefined( var_8 );
    maps\_utility::_id_135B( var_8 );
    common_scripts\utility::flag_wait( "squad_to_courtyard" );
    var_14 = common_scripts\utility::getstructarray( "fountain", "targetname" );
    var_1 = common_scripts\utility::array_removeundefined( var_1 );
    maps\_utility::_id_135B( var_1 );
    var_15 = getaiarray( "axis" );

    for ( var_16 = 0; var_16 < 6; var_16++ )
    {
        if ( isdefined( var_15[var_16] ) )
            var_15[var_16] thread _id_5ECA( var_14 );
    }

    common_scripts\utility::flag_wait( "squad_garden_pos2" );
    var_17 = getent( "monument_trig", "targetname" );
    var_18 = [];

    for (;;)
    {
        var_18 = var_17 maps\_utility::_id_2789( "axis" );

        if ( var_18.size <= 3 )
            break;

        wait 0.5;
    }

    common_scripts\utility::flag_set( "hvt_monument_clear" );
    common_scripts\utility::flag_wait( "hvt_squad_to_fountain" );
    var_14 = common_scripts\utility::getstructarray( "street_area", "targetname" );
    var_19 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_19, ::_id_5ECA, var_14 );
    var_20 = maps\_utility::_id_272B( var_6 );
    var_21 = maps\_utility::_id_272B( var_3 );
    wait 10;
    var_4 = getentarray( "outside_only_guys", "targetname" );
    level._id_620B = maps\_utility::_id_272B( var_4 );
    wait 10;
    var_15 = getaiarray( "axis" );

    while ( var_15.size > 5 )
    {
        var_15 = getaiarray( "axis" );
        wait 1;
    }

    common_scripts\utility::flag_set( "hvt_courtyard_clear" );
}

_id_620C()
{
    self.goalradius = 32;
    var_0 = common_scripts\utility::getstructarray( "fountain", "targetname" );
    thread _id_5ECA( var_0 );
}

_id_620D()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_shot_yellow_building" );
    self._id_0CD1 = 0;
    self.a.rockets = 0;
}

_id_620E()
{
    self endon( "death" );
    self.goalradius = 32;
    self._id_20AF = 0.7;
    common_scripts\utility::flag_wait( "hvt_courtyard_clear" );
    wait(randomfloatrange( 1.5, 2.3 ));
    maps\_utility::_id_2749();
}

_id_620F()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_on_turret" );
    self._id_20AF = 0.2;
    common_scripts\utility::flag_wait( "hvt_courtyard_clear" );
    var_0 = common_scripts\utility::getstructarray( "tank_area", "targetname" );
    _id_5ECA( var_0 );
}

_id_6210()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_on_turret" );
    self._id_20AF = 0.2;
    var_0 = common_scripts\utility::getstructarray( "tank_area", "targetname" );
    _id_5ECA( var_0 );
    common_scripts\utility::flag_wait( "hvt_courtyard_clear" );
    var_0 = common_scripts\utility::getstructarray( "tank_area", "targetname" );
    _id_5ECA( var_0 );
}

_id_6211()
{
    level endon( "turret_guy_dead" );
    common_scripts\utility::flag_wait( "player_shot_yellow_building" );
    var_0 = getent( "turret_guy", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F();
    var_1.ignoreme = 1;
    var_1.goalradius = 8;
    var_1.ignoresuppression = 1;
    var_1.ignorerandombulletdamage = 1;
    var_1 thread maps\_utility::_id_0D04();
    var_2 = getent( "window_turret", "script_noteworthy" );
    var_2 setmode( "manual" );
    var_1 thread _id_6215( "turret_guy_dead", var_2 );
    var_2 thread _id_6214();
    var_3 = common_scripts\utility::getstruct( "window_target1", "targetname" );
    var_4 = spawn( "script_origin", var_3.origin );
    common_scripts\utility::flag_wait( "hvt_slamzoom_complete" );
    wait 5;
    var_5 = common_scripts\utility::getstructarray( "hvt_window_targets", "script_noteworthy" );
    var_2 thread _id_6216( "end_turret_script_control", 1 );
    var_4 delete();
    var_1 maps\_utility::delaythread( 8, maps\_utility::_id_1902 );
    var_2 setaispread( 1 );

    foreach ( var_7 in var_5 )
    {
        var_4 = spawn( "script_origin", var_7.origin );
        var_2 settargetentity( var_4 );
        wait 0.1;
        var_4 delete();
    }

    var_9 = level._id_6132;
    var_9 = common_scripts\utility::array_remove( var_9, level._id_6134 );
    var_9 = common_scripts\utility::array_remove( var_9, level._id_6133 );
    var_10 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_11 = getent( "window_damage_trig", "targetname" );
    var_11 thread _id_6212();

    while ( !common_scripts\utility::flag( "player_went_upstairs" ) )
    {
        var_12 = level.player getstance();

        if ( var_12 == "stand" || level.player istouching( var_11 ) )
            var_2 settargetentity( level.player );
        else
        {
            var_13 = common_scripts\utility::random( var_9 );
            var_7 = var_13 geteye() + ( 0.0, 0.0, 35.0 );
            var_10 moveto( var_7, 0.05 );
            var_10 waittill( "movedone" );
            var_10 linkto( var_13 );
            var_2 settargetentity( var_10 );
        }

        wait(randomfloatrange( 1, 2.5 ));

        if ( var_10 islinked() )
            var_10 unlink();
    }

    common_scripts\utility::flag_set( "end_turret_script_control" );
    var_2 setmode( "auto_ai" );
    var_2 setturretteam( "axis" );
    var_2 setaispread( 20 );
    var_1 useturret( var_2 );
    var_1 maps\_utility::_id_280D();
    common_scripts\utility::flag_wait( "player_went_to_bedroom" );
    var_0.health = 10;
    var_2 setmode( "manual" );
    var_2 thread _id_6216( "turret_guy_dead" );

    while ( !common_scripts\utility::flag( "turret_guy_dead" ) )
    {
        var_14 = var_2 getturretowner();

        if ( isdefined( var_14 ) )
        {
            var_2 settargetentity( common_scripts\utility::random( level._id_6132 ) );
            wait(randomfloatrange( 1, 1.5 ));
            continue;
        }

        _id_6213( var_1, var_2 );
    }
}

_id_6212()
{
    level.player endon( "death" );
    level endon( "turret_guy_dead" );

    for (;;)
    {
        if ( level.player istouching( self ) )
            level.player dodamage( 33, level.player.origin );

        wait 0.5;
    }
}

_id_6213( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_0 endon( "death" );
        var_0.ignoreall = 1;
        var_0 setgoalpos( var_1.origin );
        var_0 waittill( "goal" );
        var_0 useturret( var_1 );
        var_0.ignoreall = 0;
    }
    else
    {

    }
}

_id_6214()
{
    level endon( "player_went_upstairs" );
    var_0 = self gettagorigin( "tag_flash" );
    var_1 = anglestoup( self.angles );
    var_2 = anglestoforward( self.angles );

    for (;;)
    {
        self waittill( "turret_fire" );
        playfx( level._effect["big_muzzle"], var_0, var_2, var_1 );
    }
}

_id_6215( var_0, var_1 )
{
    self waittill( "death", var_2 );
    common_scripts\utility::flag_set( var_0 );
    wait 0.5;
    var_3 = var_1 gettagorigin( "trigger" );
    var_1 makeunusable();
    var_1 setdefaultdroppitch( 12 );
    playloopedfx( level._effect["turret_smoke"], 1, var_3 );
    var_1 setmode( "auto_ai" );
    var_1 notify( "death" );
}

_id_6216( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_1 ) )
        level endon( "turret_guy_dead" );

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        if ( isdefined( self ) )
        {
            self shootturret();
            wait(randomfloatrange( 0.05, 0.3 ));
        }
    }
}

_id_6217()
{
    common_scripts\utility::flag_wait( "squad_to_courtyard" );
    level endon( "squad_to_fountain" );
    var_0 = spawn( "trigger_radius", self.origin - ( 0.0, 0.0, 47.0 ), 9, 70, 70 );

    for (;;)
    {
        var_1 = self getturretowner();

        if ( !isdefined( var_1 ) )
        {
            var_0 waittill( "trigger", var_2 );

            if ( isalive( var_2 ) )
            {
                var_2 endon( "death" );
                var_2._id_6218 = 1;
                var_2.goalradius = 8;
                var_2 setgoalpos( self.origin );
                var_2 waittill( "goal" );
                self setmode( "auto_ai" );
                var_2 useturret( self );
                var_2.ignoreall = 0;
                break;
            }
        }

        wait 1;
    }
}

_id_6219( var_0, var_1 )
{
    thread _id_621E( "axis" );
    self.a._id_0D31 = 1;

    if ( isdefined( var_0 ) )
        self.goalradius = var_0;

    if ( isdefined( var_1 ) )
        self.grenadeammo = 0;
    else if ( randomint( 100 ) > 66 )
        self.grenadeammo = 0;

    thread _id_6210();
}

_id_621A()
{
    var_0 = getent( "barrel_shield", "targetname" );
    var_0 setcandamage( 1 );
    var_1 = getent( "turret_barrel", "script_noteworthy" );
    var_2 = var_1.origin + ( 0.0, 0.0, 50.0 );
    var_3 = getentarray( "turret_nest_debris", "script_noteworthy" );

    for (;;)
    {
        var_0 waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

        if ( isdefined( var_5 ) && var_5 == level.player )
        {
            var_1 maps\_utility::_id_2733();
            playfx( level._effect["debris_explosion"], var_2 );
            earthquake( 0.4, 0.6, level.player.origin, 200 );
            level thread common_scripts\utility::play_sound_in_space( "car_explode", var_2 );
            common_scripts\utility::array_thread( var_3, ::_id_621B );
            var_0 delete();
            return;
        }
    }
}

_id_621B()
{
    self physicslaunchclient( self.origin, anglestoforward( self.angles ) * 20000 );
    wait 3;

    for (;;)
    {
        if ( !level.player maps\_utility::_id_260A( self.origin ) )
        {
            self delete();
            return;
        }
        else
            wait 1;
    }
}

_id_621C()
{
    level endon( "FLAG_hvt_escape_hvt_captured" );
    var_0 = getent( "hvt_street", "targetname" );
    var_0 waittill( "trigger" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
            level.player setthreatbiasgroup( "street_player" );
        else
            level.player setthreatbiasgroup( "allies" );

        wait 0.5;
    }
}

_id_621D()
{
    var_0 = getent( "player_turret", "script_noteworthy" );
    var_0 setleftarc( 45 );
    var_0 setrightarc( 45 );
    common_scripts\utility::flag_wait( "hvt_squad_to_fountain" );
    var_1 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_1, ::_id_621E, "allies" );

    while ( !common_scripts\utility::flag( "FLAG_hvt_escape_hvt_captured" ) )
    {
        var_0 waittill( "turretownerchange" );
        var_2 = var_0 getturretowner();

        if ( isdefined( var_2 ) && var_2 == level.player )
        {
            common_scripts\utility::flag_set( "player_on_turret" );

            if ( isdefined( level.player.maxhealth ) )
                level.player.health = level.player.maxhealth;

            level.player setthreatbiasgroup( "turret_player" );
            var_3 = getaiarray( "axis" );
            common_scripts\utility::array_thread( var_3, ::_id_621E, "axis" );
            continue;
        }

        var_4 = level.player getthreatbiasgroup();

        if ( var_4 == "turret_player" )
        {
            level.player setthreatbiasgroup( "allies" );

            if ( isdefined( level.player.maxhealth ) )
                level.player.health = level.player.maxhealth;
        }
    }
}

_id_621E( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

_id_5ECA( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );
    self notify( "new_retreat_pos" );
    self endon( "new_retreat_pos" );
    var_1 = common_scripts\utility::random( var_0 );
    self.goalradius = randomintrange( 150, 200 );
    wait(randomfloatrange( 0.2, 1 ));
    self notify( "stop_going_to_node" );
    self.ignoresuppression = 1;
    self setgoalpos( var_1.origin );
    self waittill( "goal" );
    self.ignoresuppression = 0;
    self.goalradius = 400;
}

_id_621F( var_0 )
{
    self endon( "death" );
    self.ignoreall = 1;
    self.goalradius = 20;
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
    maps\_utility::_id_2749();
}

_id_6220()
{
    wait 2;
    objective_add( maps\_utility::_id_2816( "OBJ_shoot_yellow_bldng" ), "current", &"PARIS_AC130_OBJ_SHOOT_COURTYARD_BUILDING" );
    maps\_utility::_id_11F4( "ac130_snd_firefromembassy" );
    maps\_utility::_id_11F4( "ac130_plt_onepassonly" );
    level thread _id_619E( 45, "player_shot_yellow_building" );
    _id_615F( "player_shot_yellow_building", undefined, "ac130_fco_okhitem", "ac130_fco_engagebuilding", "ac130_fco_hitbuilding" );
    common_scripts\utility::flag_wait( "hvt_slamzoom_complete" );
    objective_state( maps\_utility::_id_2816( "OBJ_shoot_yellow_bldng" ), "done" );
    var_0 = ( 2848.5, 41653.5, 240.0 );
    objective_add( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), "current", &"PARIS_AC130_OBJ_FLANK_MG_NEST", var_0 );
    level thread _id_6221();
    common_scripts\utility::flag_set( "courtyard_dialogue_complete" );
    common_scripts\utility::flag_wait( "squad_to_courtyard" );
    maps\_utility::_id_11F4( "ac130_snd_alrightletsgo" );
    objective_string( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), &"PARIS_AC130_OBJ_FIGHT_THROUGH_COURTYARD" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait( "squad_garden_pos2" );
    wait 0.3;
    maps\_utility::_id_11F4( "ac130_snd_volkcovered" );
    maps\_utility::_id_11F4( "ac130_rno_affirmative" );
    common_scripts\utility::flag_wait( "hvt_squad_to_fountain" );
    maps\_utility::_id_11F4( "ac130_snd_strongpointmonument" );
    maps\_utility::_id_11F4( "ac130_rno_behindyou" );
    level._id_6134 maps\_utility::delaythread( 10, maps\_utility::play_sound_on_entity, "ac130_trk_convoy" );
    common_scripts\utility::flag_wait( "hvt_courtyard_clear" );
    wait 2;
    maps\_utility::_id_11F4( "ac130_trk_tank" );
    level._id_45C0 maps\_utility::play_sound_on_entity( "ac130_snd_talktomewarhammer" );
    maps\_utility::_id_11F4( "ac130_plt_tenmikes" );
    maps\_utility::_id_11F4( "ac130_snd_rightinfront" );
    common_scripts\utility::flag_wait( "hvt_air_strobe_start" );
    wait 2;
    objective_string( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), &"PARIS_AC130_OBJ_THROW_STROBE" );
    level thread _id_615F( "c130_shooting_tank", undefined, "ac130_snd_getsmokeontank", "ac130_snd_putsmokeontank", "ac130_snd_markonthattank" );
    common_scripts\utility::flag_wait( "hvt_tank_destroyed" );
    wait 2;
    objective_state( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), "done" );
}

_id_6221()
{
    common_scripts\utility::flag_wait_any( "player_went_upstairs", "squad_to_courtyard" );
    objective_position( maps\_utility::_id_2816( "OBJ_flank_mg_nest" ), ( 0.0, 0.0, 0.0 ) );
}

_id_6222()
{
    level.player waittill( "weapon_switch_started" );
    common_scripts\utility::flag_set( "end_sniper_kill_monitor" );
}

_id_6223( var_0 )
{
    level._id_45C0 thread maps\_utility::play_sound_on_entity( "wood_door_kick" );
    var_1 = getent( "1st_floor_left_door", "targetname" );
    var_2 = getent( "1st_floor_right_door", "targetname" );
    var_1 rotateyaw( 85, 0.2 );
    var_1 connectpaths();
    var_2 rotateyaw( -85, 0.2 );
    var_2 connectpaths();
}

_id_5EA3( var_0 )
{
    self hide();
    self notsolid();

    if ( isdefined( var_0 ) )
        self connectpaths();
}

_id_6224()
{
    self show();
}

_id_6225()
{
    var_0 = getentarray( "destructible_vehicle", "targetname" );
    wait 3;
    var_1 = -11910.2;

    foreach ( var_3 in var_0 )
    {
        if ( var_3.origin[0] > var_1 )
            var_3 delete();
    }
}

_id_6226( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawn( "script_model", var_0 );
    var_6.angles = var_1;
    var_6 setmodel( "tag_origin" );
    var_7 = anglestoup( var_6.angles );
    var_8 = anglestoforward( var_6.angles );
    var_6 thread _id_612A( var_4 );
    level endon( var_4 );

    if ( !isdefined( var_3 ) )
        var_3 = 8;

    wait(randomintrange( 2, 4 ));

    if ( isdefined( var_5 ) )
    {
        playfxontag( common_scripts\utility::getfx( var_2 ), var_6, "tag_origin" );
        return;
    }

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( var_2 ), var_6, "tag_origin" );
        wait(var_3 + randomintrange( 3, 6 ));
    }
}

_id_5EDD( var_0 )
{

}
