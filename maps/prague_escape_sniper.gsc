// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7395()
{
    maps\prague_escape_code::_id_7A3B( "soap", "sniper" );
    maps\prague_escape_code::_id_7A3B( "price", "sniper" );
    maps\_shg_common::move_player_to_start( "start_sniper" );
}

_id_7AA7()
{
    level endon( "sniper_cover_blown" );
    maps\_autosave::_id_1C3F();
    maps\_compass::setupminimap( "compass_map_prague_escape_sniper", "sniper_minimap_corner" );
    _id_7AAA();
    _id_7AA8();
    _id_7AAE();
    level thread _id_043C();
    level childthread _id_7AB0();
    level childthread _id_7ABB();
    common_scripts\utility::flag_wait( "start_look_at_price" );
    _id_7AC6();
    _id_7AD2();
    _id_7AD9();
    _id_7AE1();
    _id_7AE3();
    _id_7AE4();
}

_id_043C()
{
    level._id_043C = [];
    var_0 = common_scripts\utility::getstructarray( "pigeon", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = spawn( "script_model", var_2.origin );
        var_3.angles = var_2.angles;
        var_3 setmodel( "pigeon_iw5" );
        var_3.node = var_2;
        level._id_043C[level._id_043C.size] = var_3;
        var_3 thread _id_043D();
    }

    level thread _id_0440();
}

_id_043D()
{
    level endon( "balcony_player_fired" );
    wait(randomfloat( 0.5 ));
    var_0 = spawnstruct();
    var_0.origin = self.node.origin;
    var_0.angles = self.node.angles;
    self._id_1032 = "pigeon";
    maps\_anim::_id_1244();
    self.struct = var_0;
    self setcandamage( 1 );
    var_0 thread maps\_anim::_id_124E( self, "idle" );
    self waittill( "damage" );
    playfx( common_scripts\utility::getfx( "pigeon_gibs" ), self.origin + ( 0.0, 0.0, 5.0 ) );
    level._id_043C = common_scripts\utility::array_remove( level._id_043C, self );
    self delete();
}

_id_043E()
{
    self.struct notify( "stop_loop" );
    maps\_utility::_id_1414();
    level._id_043C = common_scripts\utility::array_remove( level._id_043C, self );
    var_0 = getent( "bird_vehicle", "targetname" );

    while ( isdefined( var_0._id_2973 ) )
        wait 0.05;

    var_1 = maps\_vehicle::_id_211F( var_0 );
    var_1._id_0431 = 1;
    var_1._id_291A = self.node;
    var_1 attachpath( self.node );
    var_1 startpath();
    thread _id_043F();
    self linkto( var_1, "" );
    var_1 thread maps\_vehicle::_id_26A1( self.node );
    var_1._id_2950 = 1;
    var_1 waittill( "death" );
    self delete();
}

_id_043F()
{
    self endon( "death" );
    self setmodel( "pigeon_fly_iw5" );
    var_0 = maps\_utility::_id_1281( "flying" );
    var_1 = 1;
    var_2 = 0.1;
    var_3 = 0.5;

    for ( var_4 = 0; var_4 < 5; var_4++ )
    {
        self clearanim( var_0, 0.5 );
        self setanimrestart( var_0, 1, 0.5, var_1 );
        wait(var_3);
        var_1 -= var_2;
    }
}

_id_0440()
{
    common_scripts\utility::flag_wait( "scaffold_use_limp_a" );

    foreach ( var_1 in level._id_043C )
        var_1 delete();
}

_id_7AA8()
{
    level._id_11BB["prague_killfirm_other_2"] = "prague_escape_soap_targetdown";
    level._id_11BB["prague_killfirm_other_3"] = "prague_escape_soap_gotem";
    level._id_11BB["prague_escape_fail_yuridoin"] = "prague_escape_fail_yuridoin";
    level._id_11BB["prague_escape_fail_whatthehell"] = "prague_escape_fail_whatthehell";
    level._id_11BB["presc_pri_whatstaking"] = "presc_pri_whatstaking";
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "sniper_cover_blown" );
    common_scripts\utility::flag_init( "prague_escape_sniper_complete" );
    common_scripts\utility::flag_init( "start_convoy" );
    common_scripts\utility::flag_init( "convoy_stopped" );
    common_scripts\utility::flag_init( "convoy_arrives_start_makarov" );
    common_scripts\utility::flag_init( "player_used_zoom" );
    common_scripts\utility::flag_init( "makarov_exits_suv" );
    common_scripts\utility::flag_init( "makarov_inside" );
    common_scripts\utility::flag_init( "door_guards_inside" );
    common_scripts\utility::flag_init( "player_looked_at_price" );
    common_scripts\utility::flag_init( "balcony_ai_spawned" );
    common_scripts\utility::flag_init( "balcony_player_fired" );
    common_scripts\utility::flag_init( "breach_ai_spawned" );
    common_scripts\utility::flag_init( "breach_complete" );
    common_scripts\utility::flag_init( "price_discover_kamarov_open_doors" );
    common_scripts\utility::flag_init( "door_guards_start" );
    common_scripts\utility::flag_init( "door_guards_open_door" );
    common_scripts\utility::flag_init( "door_guards_close_door" );
    common_scripts\utility::flag_init( "belltower_intro_dialogue_02" );
    common_scripts\utility::flag_init( "belltower_intro_fade_out" );
    common_scripts\utility::flag_init( "start_look_at_price" );
    common_scripts\utility::flag_init( "queue_sniper_music" );
}

_id_7AAA()
{
    maps\_utility::_id_265A( "allies" );
    maps\_utility::_id_265A( "axis" );
    var_0 = common_scripts\utility::getstruct( "anim_align_hotel_top", "targetname" );
    var_0 maps\_anim::_id_11CF( level._id_4877, "rappel_hook_up_reveal" );
    var_0 = common_scripts\utility::getstruct( "anim_align_hotel_front", "targetname" );
    var_0 thread _id_7ABC();
    var_0 thread _id_7AC1();
    var_1 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_1 hide();
    setsaveddvar( "actionSlotsHide", "1" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "ui_hideMap", "1" );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "cg_drawCrosshair", "0" );
    _id_7AEE();
    var_2 = getentarray( "soap_dont_shoot", "targetname" );
    common_scripts\utility::array_thread( var_2, ::_id_7AF0 );
    var_3 = getent( "fxanim_prague2_bell_tower_mod", "targetname" );
    var_3 hide();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level._id_7AAB = 11;
    level._id_4877 maps\_utility::_id_2709( "m4m203_reflex", "back" );
    level._id_4877 maps\_utility::_id_104A( "m4m203_reflex", "primary" );
    level thread _id_7AF1();
    var_4 = getentarray( "hotel_balcony_first_guard", "targetname" );
    var_5 = [];

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        var_5[var_6] = var_4[var_6] maps\_utility::_id_166F( 1 );
        var_5[var_6]._id_1032 = "generic";
        var_5[var_6] thread _id_7AD5();
    }

    level thread _id_7AC5();
    level._id_7AAC = 0;
}

_id_7AAD()
{
    self.script_noteworthy = "sniper_convoy_vehicle";
}

_id_7AAE()
{
    level thread _id_01F7();
    var_0 = common_scripts\utility::getstruct( "anim_align_belltower", "targetname" );
    var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_1.angles = level.player getplayerangles();
    var_2 = maps\_utility::_id_1287( "player_rifle", var_1 gettagorigin( "tag_weapon" ) );
    var_2.angles = var_1 gettagangles( "tag_weapon" );
    var_2 hidepart( "TAG_MOTION_TRACKER", "viewmodel_rsass_sp_iw5" );
    var_2 hidepart( "TAG_SILENCER", "viewmodel_rsass_sp_iw5" );
    level.player freezecontrols( 1 );
    level.player playerlinktodelta( var_1, "tag_player", 1, 10, 10, 10, 1, 1 );
    var_3 = maps\_utility::_id_2766( level._id_54E0, var_1, var_2 );
    var_4 = maps\_utility::_id_2766( var_1, var_2 );
    var_0 maps\_anim::_id_11BF( var_3, "belltower_intro" );
    level waittill( "introscreen_complete" );
    common_scripts\utility::flag_set( "queue_sniper_music" );
    common_scripts\utility::flag_wait( "introscreen_complete" );
    var_5 = 0.25;
    var_0 thread _id_7AAF();
    var_0 thread maps\_anim::_id_11DD( var_4, "belltower_intro" );
    common_scripts\utility::flag_wait( "belltower_intro_fade_out" );
    level.player lerpfov( 20, 1 );
    var_6 = 0.5;
    maps\prague_escape_code::_id_7A4C( var_6 );
    level thread maps\prague_escape_code::_id_7A4F();
    wait(var_6 * 2);
    level.player unlink();
    var_1 delete();
    var_7 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_7 useby( level.player );
    var_2 delete();
    var_0 notify( "stop_loop" );
    maps\_utility::vision_set_fog_changes( "prague_escape_sniper", 0.1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );
    setsaveddvar( "sv_znear", "100" );
    level thread _id_01F6();
    level thread maps\prague_escape_code::_id_7A50();
}

_id_01F6()
{
    level endon( "player_off_rifle" );

    for (;;)
    {
        var_0 = level.player geteye();
        var_1 = anglestoforward( level.player getplayerangles() );
        var_1 *= 12000;
        var_2 = level.player.origin + var_1;
        var_3 = bullettrace( var_0, var_2, 1, level.player );

        if ( isdefined( var_3["position"] ) )
        {
            var_4 = distance( var_0, var_3["position"] );
            setsaveddvar( "sm_lightScore_eyeProjectDist", var_4 );
        }

        wait 0.05;
    }
}

_id_7AAF()
{
    maps\_vehicle::_id_2881( "sniper_ambient_chopper" );
    level._id_54E0 maps\_utility::_id_2612( 1 );
    level._id_54E0 hidepart( "TAG_SILENCER" );
    maps\_anim::_id_1246( level._id_54E0, "belltower_intro" );
    maps\_anim::_id_124E( level._id_54E0, "belltower_intro_idle" );
}

_id_01F7()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 0;
    var_1["nearEnd"] = 0;
    var_1["farStart"] = 0.0147322;
    var_1["farEnd"] = 43.588;
    var_1["nearBlur"] = 6.2;
    var_1["farBlur"] = 4.0;
    maps\_utility::_id_27C0( level._id_1436, var_1, 0.1 );
    var_2 = [];
    var_2["nearStart"] = 0;
    var_2["nearEnd"] = 0;
    var_2["farStart"] = 88.01;
    var_2["farEnd"] = 100.924;
    var_2["nearBlur"] = 4;
    var_2["farBlur"] = 1.9;
    level waittill( "dof_change" );
    maps\_utility::_id_27C0( var_1, var_2, 0.65 );
    var_3 = [];
    var_3["nearStart"] = 95.5068;
    var_3["nearEnd"] = 98.2229;
    var_3["farStart"] = 9325;
    var_3["farEnd"] = 9661;
    var_3["nearBlur"] = 4;
    var_3["farBlur"] = 0.39;
    level waittill( "dof_change" );
    maps\_utility::_id_27C0( var_2, var_3, 0.5 );
    var_4 = [];
    var_4["nearStart"] = 0;
    var_4["nearEnd"] = 3.08329;
    var_4["farStart"] = 514.52;
    var_4["farEnd"] = 2118.8;
    var_4["nearBlur"] = 4;
    var_4["farBlur"] = 2.83;
    level waittill( "dof_change" );
    wait 0.3;
    maps\_utility::_id_27C0( var_3, var_4, 0.4 );
    level.player lerpviewangleclamp( 1, 0.5, 0.5, 0, 0, 0, 0 );
    level waittill( "dof_change" );
    maps\_utility::_id_27C0( var_4, var_0, 0.5 );
}

_id_7AB0()
{
    var_0 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_1 = var_0.origin;
    var_2 = getent( var_0.target, "targetname" ).origin;
    var_3 = var_2 - var_1;
    var_4 = vectortoangles( var_3 );

    while ( !isdefined( var_0 getturretowner() ) )
        wait 0.05;

    common_scripts\utility::exploder( 105 );
    common_scripts\utility::exploder( 120 );
    level thread _id_7AB1();
    level.player disableturretdismount();
    level.player setplayerangles( var_4 );
    var_0 setturretfov( 18 );
    level.player allowads( 0 );
    level._id_1B22 = 1;
    level.player setdepthoffield( 0, 5500, 6850, 8500, 5, 1.5 );
    level thread _id_7AB7();
}

_id_7AB1()
{
    level endon( "player_allowed_to_fire" );

    while ( !level.player attackbuttonpressed() )
        wait 0.05;

    common_scripts\utility::flag_set( "sniper_cover_blown" );
    thread _id_7AB3();
    thread _id_7AB6( 2.5, &"PRAGUE_ESCAPE_COVER_BLOWN" );
    wait 1.5;
    var_0 = getentarray( "convoy_vehicle", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_7AB2 );
}

_id_7AB2()
{
    self vehicle_setspeed( 0, 15 );
    self.favoriteenemy = level.player;
    self setturrettargetent( level.player, ( 0.0, 0.0, 48.0 ) );
    self._id_20AF = 9999;
    self waittill( "turret_on_target" );
    self.mgturret[0] thread maps\_mgturret::_id_2278();
    thread _id_7AB5();
    wait 1;

    if ( isdefined( self.mgturret[0] ) )
        magicbullet( "btr80_ac130_turret", self.mgturret[0] gettagorigin( "tag_flash" ), level.player.origin + ( 0.0, 0.0, 32.0 ) );
}

_id_7AB3()
{
    maps\_utility::_id_1926();
    level notify( "player_off_rifle" );
    wait 0.5;

    if ( common_scripts\utility::cointoss() )
        maps\_utility::_id_11F4( "prague_escape_fail_yuridoin" );
    else
        maps\_utility::_id_11F4( "prague_escape_fail_whatthehell" );

    setsaveddvar( "sm_sunsamplesizenear", 0.25 );
    setsaveddvar( "sm_lightScore_eyeProjectDist", 64 );
    setsaveddvar( "sv_znear", "0" );
    level._id_1B22 = 0;
    level.player enableturretdismount();
    var_0 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_0 delete();
    var_1 = common_scripts\utility::getstruct( "anim_align_belltower", "targetname" );
    var_2 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_2.angles = level.player getplayerangles();
    level.player playerlinktodelta( var_2, "tag_player", 1, 10, 10, 10, 10, 0 );
    level._id_7AB4 = spawn( "script_model", var_2 gettagorigin( "tag_weapon" ) );
    level._id_7AB4.angles = var_2 gettagangles( "tag_weapon" );
    level._id_7AB4 setmodel( "viewmodel_rsass_sp_iw5" );
    level._id_7AB4 linkto( var_2, "tag_weapon" );
    level._id_7AB4 hidepart( "tag_clip", "viewmodel_rsass_sp_iw5" );
    level._id_7AB4 hidepart( "TAG_MOTION_TRACKER", "viewmodel_rsass_sp_iw5" );
    level._id_7AB4 hidepart( "TAG_SILENCER", "viewmodel_rsass_sp_iw5" );
    level.player lerpfov( 65, 0.05 );
    thread maps\_anim::_id_127B( var_2, "scaffolding_fall", 0.6 );
    wait 0.05;
    var_1 maps\_anim::_id_1246( var_2, "scaffolding_fall" );
}

_id_7AB5()
{
    for (;;)
    {
        self fireweapon();
        wait 0.2;
    }
}

_id_7AB6( var_0, var_1 )
{
    wait(var_0);
    setdvar( "ui_deadquote", var_1 );
    maps\_utility::_id_1826();
}

_id_7AB7()
{
    level endon( "sniper_cover_blown" );
    wait 1;
    level._id_4877 maps\_utility::_id_168C( "presc_pri_eyesonconvoy" );
    wait 2;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_iseeit" );
    wait 1;
    common_scripts\utility::flag_wait( "convoy_stopped" );
    wait 0.5;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_stoppinghotel" );
    wait 1;
    level._id_4877 maps\_utility::_id_168C( "presc_pri_doyouseetarget" );
    wait 0.25;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_makarovcar" );
    wait 0.75;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_rightatusprice" );
    wait 1;
    level._id_4877 maps\_utility::_id_168C( "presc_pri_dontgetskiddish" );
    wait 3;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_frontdoorhotelnow" );
    wait 3;
    level._id_4877 maps\_utility::_id_168C( "presc_pri_alrightkamarov" );
    wait 4;
    level._id_4877 maps\_utility::_id_168C( "presc_pri_doyouread" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_switchiton" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_doesntmatter" );
    common_scripts\utility::flag_set( "start_look_at_price" );
}

_id_7AB8()
{
    level endon( "player_off_rifle" );
    level.player notifyonplayercommand( "player_fired", "+attack" );
    var_0 = -5000;

    for (;;)
    {
        maps\_utility::_id_1254( var_0, 1 );
        level.player waittill( "player_fired" );
        level notify( "player_fired_sniper" );
        var_0 = gettime();
        level thread _id_7AB9();

        while ( level.player attackbuttonpressed() )
            wait 0.05;
    }
}

_id_7AB9()
{
    var_0 = 0.25;
    var_1 = 360;
    var_2 = 8000;
    var_3 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_4 = level.player getplayerangles();
    var_5 = vectornormalize( anglestoforward( var_4 ) );
    var_6 = level.player geteye();
    var_7 = var_5 * var_1;
    var_8 = var_6 + var_7;
    var_9 = var_5 * var_2;
    var_10 = var_6 + var_9;
    thread _id_7ABA( var_8, var_10, var_3.origin );
}

_id_7ABA( var_0, var_1, var_2 )
{
    level endon( "player_off_rifle" );
    var_3 = 3500;
    var_4 = bullettrace( var_0, var_1, 1 );
    var_5 = spawn( "script_model", var_2 );
    var_5 setmodel( "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "bullet_geo" ), var_5, "tag_origin" );
    var_5 moveto( var_4["position"], 0.05 );
    wait 1;
    var_5 delete();
}

_id_7ABB()
{
    if ( !common_scripts\utility::flag( "sniper_cover_blown" ) )
        maps\_autosave::_id_1C3F();

    var_0 = common_scripts\utility::getstruct( "anim_align_hotel_front", "targetname" );
    var_0 thread _id_7AC2();
    wait 1;
    level.player thread maps\_utility::_id_1F61( "barrett" );
    level thread _id_7AE6();
    common_scripts\utility::flag_wait( "convoy_stopped" );
    wait 8;
    common_scripts\utility::flag_set( "makarov_exits_suv" );
    level thread _id_7AD4();
    common_scripts\utility::flag_set( "makarov_inside" );
}

_id_7ABC()
{
    var_0 = getentarray( "convoy_vehicle", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_01F8 = spawn( "script_model", var_2.origin );
        var_2._id_01F8.angles = var_2.angles;
        var_2._id_01F8 setmodel( "vehicle_shadow_suburban" );
        var_2._id_01F8 linkto( var_2 );

        if ( isdefined( var_2.mgturret ) )
        {
            var_2.mgturret[0] notify( "stop_burst_fire_unmanned" );
            var_2 maps\_vehicle::_id_2B17( "headlights" );
            var_2 maps\_vehicle::_id_2B17( "taillights" );
            continue;
        }

        var_2 thread _id_7AC0();
    }

    var_4 = getent( "convoy_makarov", "targetname" );
    var_4 setspawnerteam( "axis" );
    common_scripts\utility::flag_wait( "start_convoy" );
    maps\_utility::_id_26BF( "convoy_start_to_hotel" );
    var_5 = var_4 maps\_utility::_id_166F( 1 );
    var_5.team = "axis";
    var_5._id_1032 = "makarov";
    level thread _id_7ABD( var_5 );
    common_scripts\utility::flag_wait( "makarov_exits_suv" );
    _id_7ABE();
}

_id_7ABD( var_0 )
{
    var_1 = getent( "convoy_vehicle_3", "script_noteworthy" );
    var_0 linkto( var_1, "TAG_GUY1" );
    var_1 thread maps\_anim::_id_124E( var_0, "convoy_arrives_idle", undefined, "TAG_GUY1" );
    common_scripts\utility::flag_wait( "convoy_arrives_start_makarov" );
    var_1 notify( "stop_loop" );
    var_1 maps\_anim::_id_1246( var_0, "convoy_arrives_signals", "TAG_GUY1" );
    var_1 thread maps\_anim::_id_124E( var_0, "convoy_arrives_idle", undefined, "TAG_GUY1" );
}

_id_7ABE()
{
    var_0 = getentarray( "convoy_vehicle", "targetname" );

    for ( var_1 = 1; var_1 < var_0.size + 1; var_1++ )
    {
        var_2 = getent( "convoy_vehicle_" + var_1, "script_noteworthy" );
        var_3 = getvehiclenode( "convoy_to_garage_" + var_1, "targetname" );
        var_2 startpath( var_3 );
        wait 0.25;
    }

    wait 1;
    var_4 = getent( "convoy_vehicle_2", "script_noteworthy" );
    var_5 = getent( "convoy_vehicle_3", "script_noteworthy" );
    var_5 waittill( "reached_end_node" );
    var_5._id_01F8 delete();
    var_4 delete();
    var_5 delete();
}

_id_7ABF()
{
    var_0 = getent( "convoy_vehicle_1", "script_noteworthy" );
    var_1 = getent( "convoy_vehicle_4", "script_noteworthy" );
    var_2 = getvehiclenode( "convoy_drive_off_1", "targetname" );
    var_3 = getvehiclenode( "convoy_drive_off_4", "targetname" );
    var_0 startpath( var_2 );
    var_1 startpath( var_3 );
    var_1 waittill( "reached_end_node" );
    var_1._id_01F8 delete();
    var_0._id_01F8 delete();
    wait 1;
    var_0 delete();
    var_1 delete();
}

_id_7AC0()
{
    playfxontag( level._effect["suv_headlight_l"], self, "TAG_HEADLIGHT_LEFT" );
    playfxontag( level._effect["suv_headlight_r"], self, "TAG_HEADLIGHT_RIGHT" );
    playfxontag( level._effect["suv_taillight_l"], self, "TAG_TAIL_LIGHT_LEFT" );
    playfxontag( level._effect["suv_taillight_r"], self, "TAG_TAIL_LIGHT_RIGHT" );
}

_id_7AC1()
{
    level endon( "sniper_cover_blown" );
    var_0 = getentarray( "convoy_guard", "targetname" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_1[var_2] = var_0[var_2] maps\_utility::_id_166F( 1 );
        var_1[var_2]._id_1032 = "convoy_guard_" + ( var_2 + 1 );
        var_1[var_2] maps\_utility::_id_26F6( 1 );
    }

    thread maps\_anim::_id_11D6( var_1, "convoy_arrives_idle" );
    wait 5;
    common_scripts\utility::flag_set( "start_convoy" );
    self notify( "stop_loop" );
    maps\_anim::_id_11DD( var_1, "convoy_setup" );
    thread maps\_anim::_id_11D6( var_1, "convoy_arrives_wait" );
    var_3 = getent( "convoy_vehicle_1", "script_noteworthy" );
    var_3 waittill( "reached_end_node" );
    common_scripts\utility::flag_set( "convoy_stopped" );
    thread maps\_anim::_id_11DD( var_1, "convoy_arrives" );
}

_id_7AC2()
{
    level endon( "sniper_cover_blown" );
    thread _id_7AC4();
    var_0 = getentarray( "convoy_door_guard", "targetname" );
    var_1 = spawn( "script_model", self.origin );
    var_1 setmodel( "tag_origin" );
    var_1.angles = self.angles;
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2[var_3] = var_0[var_3] maps\_utility::_id_166F( 1 );
        var_2[var_3]._id_1032 = "door_guard_" + ( var_3 + 1 );
        var_2[var_3] maps\_utility::_id_26F6( 1 );
    }

    common_scripts\utility::flag_wait( "door_guards_start" );
    var_1 maps\_anim::_id_11DD( var_2, "hotel_door_enter" );
    common_scripts\utility::array_thread( var_2, ::_id_7AC3, var_1 );
    common_scripts\utility::flag_wait( "door_guards_close_door" );
    var_1 notify( "stop_loop" );
    var_1 maps\_anim::_id_11DD( var_2, "hotel_door_close" );
    common_scripts\utility::flag_set( "door_guards_inside" );
    maps\_utility::_id_135B( var_2 );
}

_id_7AC3( var_0 )
{
    self endon( "death" );

    if ( isalive( self ) )
        var_0 maps\_anim::_id_124E( self, "hotel_door_open_wait" );
}

_id_7AC4()
{
    level endon( "sniper_cover_blown" );
    var_0 = getent( "hotel_front_door_left", "targetname" );
    var_1 = getent( "hotel_front_door_right", "targetname" );
    var_2 = spawn( "script_model", var_0.origin );
    var_2.angles = ( 0.0, 212.8, 0.0 );
    var_2 setmodel( "tag_origin_animate" );
    var_2 useanimtree( level._id_1245["script_model"] );
    var_2._id_1032 = "hotel_door_2";
    var_0 linkto( var_2, "origin_animate_jnt" );
    var_3 = spawn( "script_model", var_1.origin );
    var_3.angles = ( 0.0, 32.8, 0.0 );
    var_3 setmodel( "tag_origin_animate" );
    var_3 useanimtree( level._id_1245["script_model"] );
    var_3._id_1032 = "hotel_door_1";
    var_1 linkto( var_3, "origin_animate_jnt" );
    var_4 = maps\_utility::_id_2766( var_2, var_3 );
    common_scripts\utility::flag_wait( "door_guards_start" );
    thread maps\_anim::_id_11DD( var_4, "enter_door" );
    common_scripts\utility::flag_wait( "door_guards_close_door" );
    thread maps\_anim::_id_11DD( var_4, "close_door" );
}

_id_7AC5()
{
    var_0 = getentarray( "intro_patroller", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        wait(randomfloat( 0.5 ));
        var_4 = var_3 maps\_utility::_id_166F( 1 );
        var_1 = maps\_utility::_id_0BC3( var_1, var_4 );
    }

    maps\_utility::_id_27CA( "ambient_street_guys", ::_id_7AD5 );
    maps\_utility::_id_27CA( "ambient_street_guys", ::_id_5EC8, "player_looked_at_price" );
    var_6 = maps\_utility::_id_272A( "ambient_street_guys" );
    level waittill( "player_allowed_to_fire" );
    maps\_utility::_id_135B( var_1 );
}

_id_5EC8( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_7AC6()
{
    if ( !common_scripts\utility::flag( "sniper_cover_blown" ) )
        maps\_autosave::_id_1C3F();

    var_0 = maps\_utility::_id_1287( "prague_rappel_rope", ( 0.0, 0.0, 0.0 ) );
    level._id_7AC7 = [];
    level._id_7AC7[level._id_7AC7.size] = level._id_4877;
    level._id_7AC7[level._id_7AC7.size] = var_0;
    level thread _id_7ACB();
    var_1 = common_scripts\utility::getstruct( "anim_align_hotel_top", "targetname" );
    var_1 maps\_anim::_id_1246( level._id_4877, "rappel_hook_up_reveal" );
    var_1 thread maps\_anim::_id_124E( level._id_4877, "rappel_hook_up_idle" );
    wait 1;
    level thread _id_7AC8();
    var_2 = 0;
    var_3 = common_scripts\utility::getstruct( "sniper_price_start_spot", "targetname" );

    while ( !var_2 )
    {
        var_4 = _id_7AC9( var_3 );

        if ( isdefined( var_4 ) && _id_7AF6( var_4 ) < 4 )
        {
            wait 1;
            var_4 = _id_7AC9( var_3 );

            if ( isdefined( var_4 ) && _id_7AF6( var_4 ) < 4 )
                var_2 = 1;
        }

        wait 0.05;
    }

    common_scripts\utility::flag_set( "player_looked_at_price" );
    level._id_54E0 thread maps\_utility::_id_168C( "presc_mct_wegotyou" );
    level thread _id_7AF4();
    var_1 notify( "stop_loop" );
    var_1 maps\_anim::_id_11DD( level._id_7AC7, "rappel_hook_up" );
    level thread _id_7ABF();
    var_1 thread maps\_anim::_id_11D6( level._id_7AC7, "rappel_mid_idle" );
    var_1 thread _id_7ACD();
}

_id_7AC8()
{
    level endon( "player_looked_at_price" );
    var_0 = common_scripts\utility::getfx( "sniper_glint" );
    var_1 = common_scripts\utility::getstruct( "sniper_price", "targetname" );

    for (;;)
    {
        wait(randomfloatrange( 1, 1.5 ));
        playfx( var_0, var_1.origin, anglestoforward( var_1.angles ) );
    }
}

_id_7AC9( var_0 )
{
    var_1 = vectornormalize( anglestoforward( level.player getplayerangles() ) );
    var_2 = vectornormalize( var_0.origin - level.player.origin );
    var_3 = vectordot( var_1, var_2 );
    return var_3;
}

_id_7ACA( var_0 )
{
    wait 2;
    maps\_utility::_id_2813( var_0 );
}

_id_7ACB()
{
    level endon( "sniper_cover_blown" );
    level endon( "player_looked_at_price" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_inposition" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_findprice" );
    wait 0.25;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_ontopofhotel" );
    level thread _id_7AF2( level._id_4877, "Price", 5 );
}

_id_7ACC()
{
    level endon( "sniper_cover_blown" );
    level endon( "player_looked_at_price" );

    while ( !common_scripts\utility::flag( "player_looked_at_price" ) )
    {
        wait 6;
        level._id_54E0 maps\_utility::_id_168C( "presc_pri_whatstaking" );

        if ( randomint( 2 ) )
        {
            wait 0.25;
            level._id_54E0 maps\_utility::_id_168C( "presc_mct_ontopofhotel" );
        }
    }
}

_id_7ACD()
{
    common_scripts\utility::flag_wait( "balcony_player_fired" );
    self notify( "stop_loop" );
}

_id_7ACE()
{
    var_0 = getent( "bell_tower_sniper_rifle", "targetname" );

    while ( !level.player attackbuttonpressed() )
        wait 0.05;

    common_scripts\utility::flag_set( "balcony_player_fired" );
    wait 0.5;
    _id_7ACF();
}

_id_7ACF()
{
    var_0 = maps\_utility::_id_263E( "hotel_balcony" );
    common_scripts\utility::array_thread( var_0, ::_id_7AD0 );
}

_id_7AD0()
{
    var_0 = "exchange_surprise_" + randomint( level._id_7AD1 );
    wait(randomfloatrange( 0.2, 0.4 ));
    self notify( "end_patrol" );
    maps\_anim::_id_11CC( self, "gravity", var_0 );
    maps\_utility::_id_2612( 0 );
}

_id_7AD2()
{
    level endon( "snipe_cover_blown" );
    level notify( "player_allowed_to_fire" );

    if ( !common_scripts\utility::flag( "sniper_cover_blown" ) )
        maps\_autosave::_id_1C3F();

    maps\prague_escape_code::_id_7A42( &"PRAGUE_ESCAPE_BALCONY_SNIPE", 1, 1 );
    level thread _id_7AD3();
    level thread _id_7AB8();
    level thread _id_7ACE();
    level thread _id_7AD6();
    common_scripts\utility::flag_wait( "balcony_player_fired" );
}

_id_7AD3()
{
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_fourtargets" );
    wait 10;
    level thread maps\prague_escape_code::_id_615F( "balcony_player_fired", "presc_mct_takethemout", "presc_mct_fourtargets" );
}

_id_7AD4()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_hotel_balcony", "targetname" );
    var_1 = getentarray( "hotel_balcony_backup_guards", "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_2[var_3] = var_1[var_3] maps\_utility::_id_166F( 1 );
        var_2[var_3]._id_1032 = "generic";
        var_2[var_3] thread _id_7AD5();
        var_2[var_3] maps\_utility::_id_260D();
    }

    common_scripts\utility::flag_set( "balcony_ai_spawned" );
}

_id_7AD5()
{
    self waittill( "goal" );
    var_0 = getnode( self.target, "targetname" );

    if ( !isdefined( var_0.target ) )
        var_0 thread maps\_anim::_id_11C8( self, "bored_idle" );
}

_id_7AD6()
{
    common_scripts\utility::flag_wait( "balcony_player_fired" );
    level thread _id_7AD8();
    var_0 = maps\_utility::_id_263E( "hotel_balcony" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            wait 1.25;
            level thread _id_7AD7( var_2 );
        }
    }
}

_id_7AD7( var_0 )
{
    var_1 = 0.25;
    var_2 = 360;
    var_3 = 8000;
    var_4 = common_scripts\utility::getstruct( "sniper_soap_fire_pos", "targetname" ).origin;
    var_5 = vectornormalize( var_0.origin - var_4 );
    var_6 = var_5 * var_2;
    var_7 = var_4 + var_6;
    var_8 = var_5 * var_3;
    var_9 = var_4 + var_8;
    thread common_scripts\utility::play_sound_in_space( "soap_weapon_fire", var_4 );
    thread _id_7ABA( var_7, var_9 + ( 0.0, 0.0, 48.0 ), var_4 );

    if ( randomint( 100 ) < 33 )
        level notify( "soap_confirms_kill" );

    if ( isalive( var_0 ) )
        var_0 maps\prague_escape_code::_id_441E();
}

_id_7AD8()
{
    level endon( "breach_complete" );
    var_0 = [];
    var_0[var_0.size] = "prague_killfirm_other_2";
    var_0[var_0.size] = "prague_killfirm_other_3";
    var_0 = maps\_utility::_id_0B53( var_0 );

    foreach ( var_2 in var_0 )
    {
        level waittill( "soap_confirms_kill" );
        maps\_utility::_id_11F4( var_2, 1 );
    }
}

_id_7AD9()
{
    maps\prague_escape_code::_id_7A45( undefined );
    maps\_utility::_id_265B( "axis" );
    level._id_4877 maps\_utility::_id_1057();
    maps\_utility::delaythread( 2.3, ::_id_00C5 );
    var_0 = common_scripts\utility::getstruct( "anim_align_hotel_balcony", "targetname" );
    var_1 = getanimlength( level._id_0C59["price"]["price_window_breach"] );
    var_0 thread maps\_anim::_id_11DD( level._id_7AC7, "price_window_breach" );
    common_scripts\utility::flag_wait( "breach_ai_spawned" );
    common_scripts\utility::waitframe();
    var_2 = maps\_utility::_id_263E( "hotel_breach" );
    common_scripts\utility::array_thread( var_2, ::_id_7ADA, var_0 );
    maps\_utility::_id_26BF( "trig_price_breach_cover" );
    level thread _id_7ADC();
    level._id_4877 maps\_utility::_id_2612( 0 );
    level._id_4877 maps\_utility::_id_0A23( 0 );
    level._id_4877.grenadeammo = 0;
    level thread _id_7ADB();
    wait(level._id_7AAB);
    common_scripts\utility::flag_set( "breach_complete" );
}

_id_7ADA( var_0 )
{
    if ( self._id_1032 == "window_breach_grd_2" )
    {
        var_1 = self.model;
        var_2 = spawn( "script_model", self.origin );
        self delete();
        var_2 setmodel( var_1 );
        var_2 useanimtree( level._id_1245["generic_human"] );
        var_2._id_1032 = "window_breach_grd_2";
        var_0 thread maps\_anim::_id_1246( var_2, "window_breach" );
        level waittill( "sniping done" );
        var_2 delete();
    }
    else
    {
        maps\_utility::_id_26F6( 1 );
        var_0 thread maps\_anim::_id_1246( self, "window_breach" );
    }
}

_id_7ADB()
{
    var_0 = gettime();
    var_1 = 0;

    while ( gettime() < var_0 + 500 )
    {
        if ( !level.player attackbuttonpressed() )
        {
            var_1++;

            while ( level.player attackbuttonpressed() )
                wait 0.05;
        }

        wait 0.05;
    }

    if ( var_1 < 2 )
        return;
}

_id_7ADC()
{
    common_scripts\utility::exploder( 150 );
    common_scripts\utility::exploder( 151 );
    var_0 = getent( "fxanim_prague2_curtain_fall_mod", "targetname" );
    var_0._id_1032 = "curtain";
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0 maps\_anim::_id_1246( var_0, "window_breach_curtain_fall" );
}

_id_00C5()
{
    for ( var_0 = 0; var_0 < 6; var_0++ )
    {
        var_1 = level._id_4877 gettagorigin( "tag_flash" );
        var_2 = ( 20888.0, 8680.0, 448.0 );
        magicbullet( "ak47", var_1, var_2 );
        wait(randomfloatrange( 0.05, 0.15 ));
    }
}

_id_7ADD( var_0 )
{
    var_1 = level._id_7AAB;
    var_2[0] = var_0;
    var_2[1] = var_0;
    var_2[2] = var_0;
    var_2[3] = var_0;
    waittillframeend;
    level thread _id_7ADE( var_2[level.gameskill], var_1 );
    maps\_utility::_id_263A( "hotel_breach_player_soap_targets" );
}

_id_7ADE( var_0, var_1 )
{
    var_2 = var_1 / ( var_0 + 1 );

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        wait(var_2);
        level._id_7ADF = maps\_utility::_id_2672( level._id_7ADF );

        if ( isdefined( level._id_7ADF[0] ) )
        {
            thread _id_7AD7( level._id_7ADF[0] );
            level._id_7ADF = maps\_utility::_id_0B53( level._id_7ADF );
        }
    }
}

_id_7AE0( var_0 )
{
    level endon( "breach_complete" );
    var_0 = maps\_utility::_id_0B53( var_0 );
    var_1 = 1;

    for (;;)
    {
        wait(var_1);
        var_0 = maps\_utility::_id_2672( var_0 );

        if ( isdefined( var_0[0] ) )
        {
            if ( isdefined( var_0[0].script_noteworthy ) && var_0[0].script_noteworthy == "soap_dont_shoot" )
            {
                var_0 = maps\_utility::array_remove_index( var_0, 0 );
                continue;
            }

            thread _id_7AD7( var_0[0] );
            var_0 = maps\_utility::_id_0B53( var_0 );
        }
    }
}

_id_7AE1()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        var_2 thread maps\prague_escape_code::_id_441E();
        wait(randomfloatrange( 0.25, 0.75 ));
    }

    common_scripts\utility::array_thread( var_0, maps\prague_escape_code::_id_441E );
    var_4 = common_scripts\utility::getstruct( "anim_align_hotel_balcony", "targetname" );
    level thread _id_7AE2();
    var_4 maps\_anim::_id_124A( level._id_4877, "price_discover_kamarov" );
    var_4 thread maps\_anim::_id_1246( level._id_4877, "price_discover_kamarov" );
    wait(getanimlength( level._id_0C59["price"]["price_discover_kamarov"] ) - 2);
}

_id_7AE2()
{
    var_0 = 14;
    level thread _id_00C6();
    var_1 = common_scripts\utility::getstruct( "struct_sniper_elevator_chair", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 setmodel( "com_office_chair_killhouse" );
    var_3 = getent( "kamarov", "targetname" );
    var_4 = var_3 maps\_utility::_id_166F( 1 );
    var_4._id_1032 = "kamarov";
    var_2 thread maps\_anim::_id_124E( var_4, "kamarov_dead" );
    var_5 = getent( "hotel_elevator_door_left", "targetname" );
    var_6 = getent( "hotel_elevator_door_right", "targetname" );
    var_7 = common_scripts\utility::getstruct( "hotel_elevator_door_moveto_left", "targetname" );
    var_8 = common_scripts\utility::getstruct( "hotel_elevator_door_moveto_right", "targetname" );
    var_9 = abs( distance( var_5.origin, var_7.origin ) );
    var_10 = var_9 / var_0 * 0.5;
    var_5 moveto( var_7.origin, var_10, var_10 * 0.1, var_10 * 0.25 );
    var_6 moveto( var_8.origin, var_10, var_10 * 0.1, var_10 * 0.25 );
    level waittill( "sniping done" );
    var_4 delete();
    var_2 delete();
    var_5 delete();
    var_6 delete();
}

_id_7AE3()
{
    level._id_1B22 = 0;
    maps\_utility::_id_261A( 105 );
    level._id_54E0 stoploopsound();
    common_scripts\utility::exploder( 160 );
    var_0 = getent( "fxanim_prague2_hotel_mod", "targetname" );
    var_0._id_1032 = "hotel_columns";
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0 thread maps\_anim::_id_1246( var_0, "hotel_explode" );
    wait 0.3;
    level notify( "player_off_rifle" );
    level.player lerpfov( 65, 0.05 );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );
    setsaveddvar( "sm_lightScore_eyeProjectDist", 64 );
    setsaveddvar( "sv_znear", "0" );
    level.player enableturretdismount();
    maps\_utility::vision_set_fog_changes( "prague_escape_start", 0.05 );
    var_1 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_1 delete();
    level.player playrumbleonentity( "damage_heavy" );
    earthquake( 1.2, 2, level.player.origin, 64 );
}

_id_7AE4()
{
    level notify( "sniping done" );
    var_0 = getentarray( "temp_convoy_checkpoint", "targetname" );
    maps\_utility::_id_135B( var_0 );
    var_1 = getentarray( "convoy_vehicle", "targetname" );
    maps\_utility::_id_135B( var_1 );
    level._id_4877 maps\_utility::_id_1071();
}

_id_7AE5()
{
    var_0 = getentarray( "convoy_vehicle", "targetname" );
    maps\_utility::_id_135B( var_0 );
}

_id_7AE6()
{
    level endon( "start_convoy" );
    level thread _id_7AE7();

    for (;;)
    {
        wait 0.05;
        var_0 = level.player getnormalizedmovement();

        if ( var_0[0] < -0.1 || var_0[0] > 0.1 )
            break;
    }
}

_id_7AE7()
{
    level endon( "start_convoy" );
    wait 5;
    wait 2;
    level.player thread maps\_utility::_id_1F61( "barrett" );
}

_id_7AE8( var_0 )
{
    var_1 = getentarray( "window_breach_guard", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2] maps\_utility::_id_166F( 1 );
        var_3._id_1032 = "window_breach_grd_" + ( var_2 + 1 );
        var_3 maps\_utility::_id_260D();
    }

    var_4 = [];
    level._id_7ADF = [];
    var_5 = getentarray( "hotel_breach_player_soap_targets", "targetname" );
    var_6 = var_5.size;

    for ( var_2 = 1; var_2 < var_5.size; var_2++ )
        var_5[var_2] thread _id_7AE9();

    level thread _id_7ADD( var_6 );
    common_scripts\utility::flag_set( "breach_ai_spawned" );
}

_id_7AE9()
{
    var_0 = maps\_utility::_id_166F( 1 );
    var_0 thread _id_7AED();
}

_id_7AEA( var_0 )
{
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_almosttime" );
}

_id_00C6()
{
    level.player maps\_utility::play_sound_on_entity( "presc_mct_zoominyuri" );
    level.player maps\_utility::play_sound_on_entity( "presc_pri_allclear" );
    level.player maps\_utility::play_sound_on_entity( "presc_mct_makarov" );
    level.player maps\_utility::play_sound_on_entity( "presc_mkv_welcometohell" );
    level.player maps\_utility::play_sound_on_entity( "presc_mct_getouttathere" );
}

_id_7AEB( var_0 )
{
    level._id_54E0 playloopsound( "scn_prague_belltower_bomb_beep" );
    common_scripts\utility::exploder( 155 );
}

_id_7AEC( var_0 )
{
    level._id_54E0 thread maps\_utility::_id_168C( "presc_pri_damnit" );
}

_id_7AED()
{
    maps\_utility::_id_260D();
    self waittill( "goal" );
    level._id_7ADF[level._id_7ADF.size] = self;
}

_id_7AEE()
{
    level._id_7AEF["convoy"][0] = "presc_mct_eyesonconvoy";
    level._id_7AEF["convoy"][1] = "presc_mct_outofyoursights";
    level._id_7AEF["convoy"][2] = "presc_mct_focus";
    level._id_7AEF["makarov"][0] = "presc_pri_doyouseetarget";
    level._id_7AEF["Price"][0] = "presc_mct_findprice";
    level._id_7AEF["Price"][1] = "presc_mct_ontopofhotel";
    level._id_7AEF["Price"][2] = "presc_pri_whatstaking";
}

_id_7AF0()
{
    maps\_utility::_id_109B( 1 );
}

_id_7AF1()
{
    var_0 = getentarray( "fxanim_prague2_curtain_win_long_mod", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_1032 = "curtain";
        var_2 useanimtree( level._id_1245["script_model"] );
        var_2 thread maps\_anim::_id_124E( var_2, "curtain_idle" );
    }

    common_scripts\utility::flag_wait( "soap_picked_up" );
    maps\_utility::_id_1F09( var_0, "stop_loop" );
}

_id_7AF2( var_0, var_1, var_2 )
{
    level notify( "sniper_control_stop_poi" );
    level endon( "sniper_control_stop_poi" );
    level._id_7AF3 = var_1;
    level thread _id_7AF5( var_0, var_2 );
}

_id_7AF4()
{
    level notify( "sniper_control_stop_poi" );
}

_id_7AF5( var_0, var_1 )
{
    level endon( "sniper_cover_blown" );
    level endon( "sniper_control_stop_poi" );
    var_2 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_3 = 180;
    var_4 = ( 0.0, 5.0, 0.0 );
    var_5 = 0;

    while ( !common_scripts\utility::flag( "player_looked_at_price" ) )
    {
        var_6 = level.player getplayerangles();
        var_7 = vectornormalize( anglestoforward( var_6 ) );
        var_8 = var_2.origin;
        var_9 = var_0.origin - var_8;
        var_10 = vectornormalize( var_9 );
        var_11 = vectordot( var_7, var_10 );

        if ( isdefined( var_11 ) )
            var_12 = _id_7AF6( var_11 );
        else
            continue;

        if ( isdefined( var_12 ) && isdefined( var_1 ) && var_12 > var_1 )
            var_5++;
        else
            var_5 = 0;

        if ( var_5 > var_3 )
        {
            if ( !randomint( 4 ) )
            {
                var_13 = randomintrange( 1, level._id_7AEF[level._id_7AF3].size ) - 1;
                level._id_54E0 thread maps\_utility::_id_168C( level._id_7AEF[level._id_7AF3][var_13] );
            }

            var_5 = 0;
            var_14 = vectortoangles( var_10 );
            var_15 = vectornormalize( anglestoup( var_14 ) );
            var_16 = vectornormalize( anglestoright( var_14 ) );
            var_17 = vectordot( var_15, var_7 );
            var_18 = vectordot( var_16, var_7 );
            var_19 = undefined;

            if ( var_17 < -0.07 )
            {
                if ( var_18 < -0.07 )
                    var_19 = "presc_mct_upandright";
                else if ( var_18 > 0.07 )
                    var_19 = "presc_mct_upandleft";
                else
                    var_19 = "presc_mct_upalittle";
            }
            else if ( var_17 > 0.07 )
            {
                if ( var_18 < -0.07 )
                    var_19 = "presc_mct_downandright";
                else if ( var_18 > 0.07 )
                    var_19 = "presc_mct_lowerleft";
                else
                    var_19 = "presc_mct_downabit";
            }
            else if ( var_18 < -0.07 )
                var_19 = "presc_mct_pullitmore";
            else if ( var_18 > 0.07 )
                var_19 = "presc_mct_totheleft";

            if ( isdefined( var_19 ) )
                level._id_54E0 thread maps\_utility::_id_168C( var_19 );
        }

        common_scripts\utility::waitframe();
    }
}

_id_7AF6( var_0 )
{
    var_1 = acos( var_0 ) * 2;
    return var_1;
}

_id_676B( var_0, var_1, var_2 )
{
    self endon( "deleted_through_script" );

    if ( isdefined( var_2 ) )
        wait(var_2);

    self._id_1032 = var_0;
    self useanimtree( level._id_1245[self._id_1032] );
    thread maps\_anim::_id_1246( self, var_1, "stop_looping_anims" );
}

_id_7AF7( var_0, var_1, var_2 )
{
    wait(var_0);
    var_1 notify( var_2 );
}
