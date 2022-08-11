// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7CD7()
{
    maps\_shg_common::move_player_to_start( "flashback_nuke_player" );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_airlift", 0 );
    common_scripts\utility::flag_set( "start_nuke_scene" );
    maps\prague_escape_code::_id_7A5D();
    level._id_7C85 = newclienthudelem( level.player );
    level._id_7C85.horzalign = "fullscreen";
    level._id_7C85.vertalign = "fullscreen";
    level._id_7C85 setshader( "overlay_flashback_blur", 640, 480 );
    level._id_7C85.archive = 1;
    level._id_7C85.sort = 10;
    maps\_utility::_id_265A();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7CD8()
{
    common_scripts\utility::flag_init( "FLAG_nuke_player_is_upstairs" );
    common_scripts\utility::flag_init( "FLAG_nuke_makarov_take_phone" );
    common_scripts\utility::flag_init( "nuke_explosion_done" );
    common_scripts\utility::flag_init( "nuke_explosion_start" );
    common_scripts\utility::flag_init( "change_grass_speed" );
    common_scripts\utility::flag_init( "kill_nuke_earthquake" );
    common_scripts\utility::flag_init( "spawn_helicopter_1" );
    common_scripts\utility::flag_init( "player_nuke_headlook" );
}

_id_7CD9()
{
    thread maps\_utility::_id_194E( "prague_flashback_airlift" );
    level.player freezecontrols( 1 );
    level.player unlink();
    level.player freezecontrols( 0 );
    level.player maps\_utility::_id_2797( 30 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    maps\_shg_common::move_player_to_start( "flashback_nuke_player" );
    level.player shellshock( "prague_escape_flashback", 15 );
    _id_7CDA();
    wait 0.05;
    thread _id_7CDC();
    common_scripts\utility::flag_wait( "nuke_explosion_done" );
}

_id_7CDA()
{
    var_0 = getent( "ai_makarov_nuke", "targetname" );
    level._id_7CDB = var_0 maps\_utility::_id_166F( 1 );
    level._id_7CDB._id_1032 = "makarov";
    level._id_7CDB.ignoreme = 1;
    level._id_7CDB.ignoreall = 1;
    level._id_7CDB setcandamage( 0 );
}

_id_7CDC()
{
    thread _id_7CDF();
    thread _id_7A71();
    thread _id_7CE4();
    thread _id_7CEF();
    var_0 = common_scripts\utility::getstruct( "anim_align_bunker", "targetname" );
    var_0 maps\_anim::_id_11BF( [ level._id_7CDB ], "shock_and_awe" );
    common_scripts\utility::exploder( 1401 );
    common_scripts\utility::exploder( 1403 );
    common_scripts\utility::flag_wait( "start_nuke_scene" );
    maps\_autosave::_id_1C3F();
    common_scripts\utility::exploder( 1402 );
    common_scripts\utility::exploder( 1404 );
    var_1 = getanimlength( level._id_7CDB maps\_utility::_id_1281( "shock_and_awe" ) );
    var_0 thread maps\_anim::_id_11DD( [ level._id_7CDB ], "shock_and_awe" );
    wait 2.5;
    common_scripts\utility::flag_set( "spawn_helicopter_1" );
    thread _id_7CDD();
    wait 6.75;
    wait(_id_5F9E::_id_5F0F( var_1 - 9.25, 0 ));
    var_0 thread maps\_anim::_id_124E( level._id_7CDB, "idle" );
    var_2 = 30.0;
    common_scripts\utility::flag_wait_or_timeout( "FLAG_nuke_player_is_upstairs", var_2 );
    common_scripts\utility::flag_set( "FLAG_nuke_player_is_upstairs" );
    var_0 maps\_utility::_id_1424( "stop_loop", 0.05 );
    var_3 = level._id_7CDB gettagorigin( "tag_inhand" );
    var_4 = spawn( "script_model", var_3 );
    var_4 setmodel( "hjk_cell_phone_on" );
    var_4 linkto( level._id_7CDB, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 hide();
    var_0 thread maps\_anim::_id_1246( level._id_7CDB, "phonecall" );
    var_4 thread _id_00CF();
    wait 7.8;
    var_5 = level.player common_scripts\utility::spawn_tag_origin();
    var_5 playsound( "presc_yri_itwasmadness" );
    level.player maps\_utility::delaythread( 3.0, maps\_utility::play_sound_on_entity, "prague_escape_nuke_incoming" );
    level.player maps\_utility::delaythread( 6.0, maps\_utility::play_sound_on_entity, "prague_escape_nuke_explosion_dist_sub" );
    level.player maps\_utility::delaythread( 7.0, maps\_utility::play_sound_on_entity, "prague_escape_nuke_wave" );
    wait 2.2;
    var_4 delete();
    var_0 thread maps\_anim::_id_124E( level._id_7CDB, "idle" );
    wait 2.0;
    var_0 thread maps\_anim::_id_1246( level._id_7CDB, "blast" );
    var_0 maps\_utility::_id_1424( "stop_loop", 0.05 );
    var_6 = maps\_hud_util::_id_09A7( "white", 1, level.player );
    maps\_utility::_id_261A( 1401 );
    maps\_utility::_id_261A( 1403 );
    maps\_utility::_id_261A( 1402 );
    thread _id_7CDE();
    wait 0.05;
    var_6 destroy();
    common_scripts\utility::flag_set( "nuke_explosion_start" );
    wait 6.0;
    level._id_7CDB thread _id_5F9E::_id_02F2( 60, 60, 2.0 );
    wait 6.0;
    level.player thread maps\_utility::play_sound_on_entity( "presc_yri_itwasmadness2" );
    common_scripts\utility::flag_wait( "nuke_explosion_done" );
    wait 1.0;
    level._id_7CDB delete();
    var_5 delete();
}

_id_00CF()
{
    common_scripts\utility::flag_wait( "FLAG_nuke_makarov_take_phone" );
    self show();
}

_id_7CDD()
{
    var_0 = getent( "nuke_player_is_upstairs_trigger", "targetname" );

    while ( !common_scripts\utility::flag( "nuke_explosion_done" ) )
    {
        if ( level.player istouching( var_0 ) )
            common_scripts\utility::flag_set( "FLAG_nuke_player_is_upstairs" );
        else
            common_scripts\utility::flag_clear( "FLAG_nuke_player_is_upstairs" );

        wait 0.05;
    }

    var_0 delete();
}

_id_7CDE()
{
    if ( !common_scripts\utility::flag( "FLAG_nuke_player_is_upstairs" ) )
        return;

    var_0 = maps\_utility::_id_1287( "player_rig_nuke", level.player.origin );
    var_0.angles = level.player getplayerangles();
    var_0._id_1032 = "player_rig";
    var_0 dontcastshadows();
    var_0 hide();
    var_1 = var_0 common_scripts\utility::spawn_tag_origin();
    level.player playerlinktodelta( var_1, "tag_origin", 1, 0, 0, 0, 10, 1 );
    var_2 = maps\_utility::_id_283B( "player_nuke_focus", "targetname" );
    var_3 = ( var_2.origin[0], var_2.origin[1], level.player geteye()[2] );
    var_4 = 0.5;
    var_0 rotateto( vectortoangles( var_3 - level.player geteye() ), var_4, var_4 * 0.5, var_4 * 0.5 );
    var_1 rotateto( vectortoangles( var_3 - level.player geteye() ), var_4, var_4 * 0.5, var_4 * 0.5 );
    wait(var_4);
    var_0 setanim( level._id_0C59["player_rig"]["shock_and_awe"], 1.0, 0.05, 2.5 );
    wait 0.05;
    var_5 = getanimlength( level._id_0C59["player_rig"]["shock_and_awe"] );
    var_0 setanimtime( level._id_0C59["player_rig"]["shock_and_awe"], 22.5 / var_5 );
    var_0 castshadows();
    var_0 show();
    var_6 = 0.75;
    level.player playerlinktoblend( var_0, "tag_player", var_6, var_6 * 0.5, var_6 * 0.5 );
    wait(var_6);
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 10, 1 );
    wait(3.0 - var_6);
    var_0 delete();
    var_1 delete();
}

_id_7CDF()
{
    common_scripts\utility::flag_wait( "spawn_helicopter_1" );
    wait 3;
    var_0 = getent( "nuke_stream_ent", "targetname" );
    var_0 delete();
    var_1 = [];
    var_1[var_1.size] = &"PRAGUE_ESCAPE_INTRO_NUKE_1";
    var_1[var_1.size] = &"PRAGUE_ESCAPE_INTRO_NUKE_2";
    var_1[var_1.size] = &"PRAGUE_ESCAPE_INTRO_NUKE_3";
    maps\_introscreen::_id_1D96( var_1 );
}

_id_7A71()
{
    common_scripts\utility::flag_wait( "nuke_explosion_start" );
    common_scripts\utility::exploder( 666 );
    level.player thread maps\_utility::_id_25DF( "prague_escape_nuke_flash", 0.25 );
    common_scripts\utility::flag_set( "change_grass_speed" );
    thread _id_00D0();
    level thread _id_7CE3();
    level thread _id_7CE2();
    level thread _id_7A75();
    level thread _id_7A76();
    level thread _id_7C9C();
    level thread _id_7CE0();
    level.player maps\_utility::delaythread( 1, maps\_utility::_id_25DF, "prague_escape_nuke_explosion", 4 );
    var_0 = getent( "e_airport_stream_ent", "targetname" );
    level.player playersetstreamorigin( var_0.origin );
}

_id_00D0()
{
    var_0 = common_scripts\utility::getstructarray( "nuke_ambient_explosion", "targetname" );
    var_0 = maps\_utility::_id_27EC( var_0 );
    var_1 = common_scripts\utility::add_to_array( _id_5F9E::_id_5F52( var_0[1].target ), var_0[1] );
    var_2 = common_scripts\utility::add_to_array( _id_5F9E::_id_5F52( var_0[2].target ), var_0[2] );
    var_3 = common_scripts\utility::add_to_array( _id_5F9E::_id_5F52( var_0[3].target ), var_0[3] );
    wait 4.0;
    thread _id_00D1( var_1, 1.0 );
    wait 1.0;
    thread _id_00D1( var_2, 1.25 );
    wait 0.5;
    thread _id_00D1( var_3, 1.5 );
}

_id_00D1( var_0, var_1 )
{
    var_1 = _id_5F9E::_id_5F0F( var_1, 0.05 );
    var_2 = common_scripts\utility::getfx( "FX_nuke_background_explosion" );

    foreach ( var_4 in var_0 )
    {
        playfx( var_2, var_4.origin, ( 0.0, 0.0, 1.0 ) );
        wait(var_1);
    }
}

_id_7CE0()
{
    wait 4.5;
    var_0 = getent( "nuke_trees_01", "targetname" );
    var_1 = getent( "nuke_trees_02", "targetname" );
    var_2 = getent( "nuke_trees_03", "targetname" );
    var_3 = getent( "nuke_trees_04", "targetname" );
    var_4 = getent( "nuke_trees_05", "targetname" );
    var_5 = getent( "nuke_trees_06", "targetname" );
    var_6 = getent( "nuke_trees_07", "targetname" );
    var_7 = getent( "nuke_trees_08", "targetname" );
    var_8 = getent( "nuke_trees_09", "targetname" );
    var_9 = getent( "nuke_trees_10", "targetname" );
    var_10 = getent( "nuke_trees_11", "targetname" );
    var_11 = getent( "nuke_trees_12", "targetname" );
    var_12 = getent( "nuke_trees_13", "targetname" );
    var_13 = getent( "nuke_trees_14", "targetname" );
    var_14 = getent( "nuke_trees_15", "targetname" );
    var_0 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    var_1 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    wait 0.15;
    var_2 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    var_3 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    wait 0.15;
    var_4 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    var_5 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    wait 0.1;
    var_6 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    var_7 thread _id_7CE1( "tall_palm_tree", "tall_palm_tree_sway" );
    wait 0.1;
    var_8 thread _id_7CE1( "tall_palm_tree", "tall_palm_tree_sway" );
    var_9 thread _id_7CE1( "tall_palm_tree", "tall_palm_tree_sway" );
    wait 0.1;
    var_10 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    wait 0.1;
    var_11 thread _id_7CE1( "tall_palm_tree", "tall_palm_tree_sway" );
    wait 0.08;
    var_12 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    wait 0.08;
    var_13 thread _id_7CE1( "bushy_palm_tree", "bushy_palm_tree_sway" );
    var_14 thread _id_7CE1( "tall_palm_tree", "tall_palm_tree_sway" );
}

_id_7CE1( var_0, var_1 )
{
    self._id_1032 = var_0;
    self useanimtree( level._id_1245[self._id_1032] );
    thread maps\_anim::_id_1246( self, var_1 );
}

_id_7CE2()
{
    wait 1;
    level.player playrumbleonentity( "grenade_rumble" );
    wait 1;
    level.player playrumblelooponentity( "tank_rumble" );
    wait 3.25;
    level.player stoprumble( "tank_rumble" );
    level.player playrumbleonentity( "grenade_rumble" );
    var_0 = gettime() + 625;

    while ( gettime() < var_0 )
    {
        level.player playrumbleonentity( "light_1s" );
        wait 0.05;
    }

    var_0 = gettime() + 100;

    while ( gettime() < var_0 )
    {
        level.player playrumbleonentity( "grenade_rumble" );
        wait 0.05;
    }
}

_id_7A76()
{
    earthquake( 0.15, 0.5, level.player.origin, 512 );
    wait 1;
    var_0 = gettime() + 4250;

    while ( gettime() < var_0 )
    {
        earthquake( 0.15, 0.05, level.player.origin, 512 );
        wait 0.05;
    }

    earthquake( 0.3, 2.0, level.player.origin, 512 );
    wait 1;
    earthquake( 0.15, 0.5, level.player.origin, 512 );
}

_id_7C9C()
{
    wait 11.0;
    level.player maps\_utility::_id_279D();
    level.player playsound( "scn_prague_flash_airport" );
    maps\prague_escape_code::_id_7A46( "nuke_explosion_done", "start_betray_me_scene", "prague_escape_airport", 3, 0.05 );
}

_id_7CE3()
{
    setexpfog( 0, 17000, 0.678352, 0.498765, 0.372533, 1, 0.5 );
    level._id_7A73 = getmapsunlight();
    level._id_7A74 = ( 3.11, 2.05, 1.67 );
    maps\_utility::_id_25E1( level._id_7A73, level._id_7A74, 2 );
    wait 2;
    level thread maps\_utility::_id_25E1( level._id_7A74, level._id_7A73, 2 );
}

_id_7A75()
{
    earthquake( 0.3, 0.5, level.player.origin, 80000 );
    setblur( 3, 0.1 );
    wait 1;
    setblur( 0, 0.5 );
}

_id_7CE4()
{
    common_scripts\utility::flag_wait( "start_nuke_scene" );
    var_0 = getent( "trig_ground_vehicles", "targetname" );
    var_0 notify( "trigger" );
    common_scripts\utility::flag_wait( "spawn_helicopter_1" );
    var_1 = maps\_vehicle::_id_2A9A( "intro_helis" );
    common_scripts\utility::array_thread( var_1, ::_id_7CEA );

    foreach ( var_3 in var_1 )
        playfxontag( common_scripts\utility::getfx( "cobra_treadfx" ), var_3, "tag_origin" );

    common_scripts\utility::flag_wait( "FLAG_nuke_makarov_take_phone" );
    var_5 = maps\_vehicle::_id_2A9A( "nuke_helis" );
    common_scripts\utility::array_thread( var_5, ::_id_7CEB );
}

_id_7CE5()
{
    self endon( "death" );
    thread _id_7CE9();
    var_0 = randomintrange( 125, 155 );
    self vehicle_setspeed( var_0 );
    self cleargoalyaw();
    self setmaxpitchroll( 25, 50 );
    self setairresistance( 1 );
    self setacceleration( 50 );
    self sethoverparams( 35, 15, 10 );
    common_scripts\utility::flag_wait( "nuke_explosion_start" );
    wait 3;
    self._id_7CE6 = 400;
    self._id_7CE7 = 100;
    thread _id_7CED();
    var_1 = maps\_utility::_id_283B( "mw_chinook_crashspot", "targetname" );
    self setvehgoalpos( var_1.origin, 0 );
}

_id_7CE8()
{
    wait 10;
    var_0 = getent( "poor_bastard", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1._id_1032 = "poor_bastard";
    var_1.ignoreme = 1;
    var_1.ignoreall = 1;
    var_1 linkto( self );
    maps\_anim::_id_1246( var_1, "crewchief_sucked_out", "tag_detach" );
    var_1.allowdeath = 1;
    var_1 maps\_utility::_id_2749();
}
#using_animtree("vehicles");

_id_7CE9()
{
    self useanimtree( #animtree );
}

_id_7CEA()
{
    self endon( "death" );
    self setneargoalnotifydist( 10000 );
    self setmaxpitchroll( 30, 30 );
    self sethoverparams( 35, 15, 10 );
    common_scripts\utility::flag_wait( "nuke_explosion_start" );
    wait 3;
    self delete();
}

_id_7CEB()
{
    self endon( "death" );
    self notify( "stop_default_behavior" );
    var_0 = randomintrange( 155, 175 );
    self vehicle_setspeed( var_0 );
    self cleargoalyaw();
    var_1 = randomintrange( 20, 30 );
    var_2 = randomintrange( 40, 50 );
    self setmaxpitchroll( var_1, var_2 );
    self setairresistance( 1 );
    self setacceleration( 50 );
    self sethoverparams( randomintrange( 20, 30 ), randomintrange( 10, 15 ), randomintrange( 7, 12 ) );
    common_scripts\utility::flag_wait( "nuke_explosion_start" );
    wait(randomfloatrange( 3.5, 5 ));
    var_3 = 0;

    if ( isdefined( self.targetname ) && self.targetname == "near_left_cobra" )
        var_3 = 1;

    thread _id_7CEC( var_3 );
    var_4 = undefined;

    switch ( self.script_noteworthy )
    {
        case "second_chinook":
            var_4 = common_scripts\utility::getstruct( "second_chinook_crashspot", "targetname" );
            break;
        case "middle_cobra":
            var_4 = common_scripts\utility::getstruct( "middle_cobra_crashspot", "targetname" );
            break;
        case "near_left_cobra":
            var_4 = common_scripts\utility::getstruct( "near_left_crashspot", "targetname" );
            break;
        case "far_left_cobra":
            var_4 = common_scripts\utility::getstruct( "far_left_crashspot", "targetname" );
            break;
        case "near_right_cobra":
            var_4 = common_scripts\utility::getstruct( "near_right_crashspot", "targetname" );
            break;
        case "far_right_cobra":
            var_4 = common_scripts\utility::getstruct( "far_right_crashspot", "targetname" );
            break;
    }

    self setvehgoalpos( var_4.origin, 0 );
    wait 10;
    self notify( "stop spin" );
    playfxontag( common_scripts\utility::getfx( "nuked_chopper_explosion" ), self, "tag_origin" );
    self delete();
}

_id_7CEC( var_0 )
{
    self endon( "death" );
    self endon( "stop spin" );
    self setmaxpitchroll( 100, 200 );
    self setturningability( 1 );
    var_1 = 1400;
    var_2 = 200;
    var_3 = undefined;
    var_4 = undefined;

    if ( randomint( 100 ) > 50 )
        var_4 = 1;

    if ( isdefined( var_0 ) && var_0 == 1 )
        playfxontag( common_scripts\utility::getfx( "heli_aerial_explosion_large" ), self, "tag_engine_left" );
    else
        playfxontag( common_scripts\utility::getfx( "nuked_chopper_explosion" ), self, "tag_engine_left" );

    while ( isdefined( self ) )
    {
        if ( isdefined( var_4 ) )
            var_3 = self.angles[1] + randomintrange( 80, 150 );
        else
            var_3 = self.angles[1] - randomintrange( 80, 150 );

        self setyawspeed( var_1, var_2 );
        self settargetyaw( var_3 );

        if ( isdefined( var_0 ) && var_0 == 1 )
            playfxontag( common_scripts\utility::getfx( "chopper_smoke_trail" ), self, "tag_engine_left" );
        else
            playfxontag( common_scripts\utility::getfx( "chopper_smoke_trail" ), self, "tag_engine_left" );

        wait 0.1;
    }
}

_id_7CED()
{
    self endon( "stop_rotate" );
    self setturningability( 1 );
    self vehicle_setspeed( 20 );

    while ( isdefined( self ) )
    {
        self setyawspeed( self._id_7CE6, self._id_7CE7 );
        self settargetyaw( self.angles[1] + 150 );
        wait 0.1;
    }
}

_id_7CEF()
{
    var_0 = getentarray( "nuke_grass", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_676B( "slow_grass", "slow_anim_grass", randomfloatrange( 0.0, 2 ) );

    common_scripts\utility::flag_wait( "change_grass_speed" );

    foreach ( var_2 in var_0 )
    {
        var_2 notify( "stop_animating" );
        var_2 thread _id_676B( "fast_grass", "fast_anim_grass", randomfloatrange( 0.0, 1 ) );
    }

    common_scripts\utility::flag_wait( "nuke_explosion_done" );

    foreach ( var_2 in var_0 )
    {

    }
}

_id_676B( var_0, var_1, var_2 )
{
    self endon( "stop_animating" );

    if ( isdefined( var_2 ) )
        wait(var_2);

    self._id_1032 = var_0;
    self useanimtree( level._id_1245[self._id_1032] );
    thread maps\_anim::_id_124E( self, var_1, "stop_animating" );
}
