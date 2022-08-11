// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7BB9()
{
    maps\_shg_common::move_player_to_start( "start_bank" );
    maps\_compass::setupminimap( "compass_map_prague_escape_escort", "escort_minimap_corner" );

    if ( !isdefined( level.player ) )
        level.player = getentarray( "player", "classname" )[0];

    maps\prague_escape_code::_id_7A3B( "price", "bank" );
    maps\prague_escape_code::_id_7A3B( "soap", "bank" );
    level.player enableweapons();
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level._id_54E0 maps\_utility::_id_104A( "p99", "primary" );
    level._id_7B89 = maps\prague_escape_code::_id_7A44( level._id_54E0, &"PRAGUE_ESCAPE_PROTECT_SOAP", 1, 1, "active", &"PRAGUE_ESCAPE_PROTECT" );
    common_scripts\utility::flag_set( "exit_street" );
    common_scripts\utility::flag_set( "tunnel_cleared" );
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7BBA()
{
    _id_7BBB();
    common_scripts\utility::flag_wait( "head_to_court" );
}
#using_animtree("generic_human");

_id_7BBB()
{
    level endon( "lerp_price_soap" );
    level thread _id_7BC8();
    level thread _id_7BC4();
    level thread _id_7BC7();
    level thread _id_7BCA();
    level thread _id_7BDC();
    level thread _id_7BBE();
    var_0 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    var_1 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    common_scripts\utility::flag_wait( "exit_street" );
    level._id_4877 thread _id_7BC3();
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_7_1_alleytunnel_price" );
    var_1 maps\_anim::_id_11DD( var_0, "to_tunnel" );
    common_scripts\utility::flag_set( "vo_bank_divert" );
    level._id_54E0 clearanim( %root, 0 );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_7_2_enemyarrive_price" );
    var_1 maps\_anim::_id_11DD( var_0, "bank_divert" );
    common_scripts\utility::flag_set( "nolerp" );
    level thread _id_7BBC();
}

_id_7BBC()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    var_1 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    level notify( "end_fail_monitor" );
    maps\_compass::setupminimap( "compass_map_prague_escape_standoff", "standoff_minimap_corner" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_7_3_enterbank_price" );
    var_0 maps\_anim::_id_11DD( var_1, "enter_bank" );

    if ( common_scripts\utility::flag( "lerp_price_soap" ) )
        objective_onentity( level._id_7B89, level._id_54E0, ( 0.0, 0.0, 70.0 ) );

    var_0 thread maps\_anim::_id_11D6( var_1, "idle_bank_battle" );
    level thread _id_7BC2();
    common_scripts\utility::flag_wait( "bank_done" );
    var_0 notify( "stop_loop" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_7_4_bankexit_price" );
    var_0 maps\_anim::_id_11DD( var_1, "exit_bank" );
    common_scripts\utility::flag_set( "head_to_court" );
}

_id_5ED0()
{
    self endon( "death" );

    for (;;)
    {
        self waittillmatch( "noteworthy", "start_attacking" );
        thread _id_7BBD();
        self waittillmatch( "noteworthy", "stop_attacking" );
        self notify( "stop_attacking" );
        self clearlookatent();
    }
}

_id_7BBD()
{
    self endon( "death" );
    self endon( "stop_attacking" );
    self setlookatent( level.player );

    for (;;)
    {
        var_0 = randomintrange( 200, 250 );
        var_1 = level.player.origin;
        self setturrettargetvec( var_1 + ( var_0, var_0, 0 ) );
        maps\prague_escape_code::_id_7A68();
        wait(randomfloatrange( 1.5, 2 ));
    }
}

_id_7BBE()
{
    level endon( "nolerp" );
    common_scripts\utility::flag_wait( "suv_reinforce" );
    var_0 = level.player getplayerangles();

    if ( common_scripts\utility::flag( "thru_bank" ) )
    {
        if ( !( var_0[1] > -140 && var_0[1] < -30 ) )
        {
            common_scripts\utility::flag_set( "lerp_price_soap" );
            objective_position( level._id_7B89, ( 0.0, 0.0, 0.0 ) );
            level thread _id_7BBC();
        }
    }

    if ( common_scripts\utility::flag( "thru_street" ) )
    {
        if ( !( var_0[1] > -147 && var_0[1] < -50 ) )
        {
            common_scripts\utility::flag_set( "lerp_price_soap" );
            objective_position( level._id_7B89, ( 0.0, 0.0, 0.0 ) );
            level thread _id_7BBC();
        }
    }
}

_id_7BBF( var_0 )
{
    var_1 = getaiarray( "axis" );

    if ( var_1.size )
    {
        var_1 = sortbydistance( var_1, level._id_4877.origin );
        var_2 = var_1[0];

        if ( isalive( var_2 ) )
        {
            if ( distance2d( var_2.origin, level._id_4877.origin ) < 300 )
            {
                if ( common_scripts\utility::cointoss() )
                {
                    var_3 = level._id_4877 gettagorigin( "tag_flash" );
                    var_4 = var_2 gettagorigin( maps\prague_escape_code::_id_7A66() );
                    magicbullet( "deserteagle", var_3, var_4 );
                }
            }
        }
    }
}

_id_7BC0( var_0 )
{
    var_1 = getaiarray( "axis" );

    if ( var_1.size )
    {
        var_1 = sortbydistance( var_1, level._id_54E0.origin );
        var_2 = var_1[0];

        if ( isalive( var_2 ) )
        {
            if ( distance2d( var_2.origin, level._id_54E0.origin ) < 300 )
            {
                if ( common_scripts\utility::cointoss() )
                {
                    var_3 = level._id_54E0 gettagorigin( "tag_flash" );
                    var_4 = var_2 gettagorigin( maps\prague_escape_code::_id_7A66() );

                    if ( common_scripts\utility::cointoss() )
                        magicbullet( "p99", var_3, var_4 );
                }
            }
        }
    }
}

_id_7BC1( var_0 )
{
    var_1 = getaiarray( "axis" );

    if ( var_1.size )
    {
        var_1 = sortbydistance( var_1, level._id_4877.origin );
        var_2 = var_1[0];

        if ( isalive( var_2 ) )
        {
            if ( common_scripts\utility::cointoss() )
            {
                var_3 = level._id_4877 gettagorigin( "tag_flash" );
                var_4 = var_2 gettagorigin( maps\prague_escape_code::_id_7A66() );
                magicbullet( "deserteagle", var_3, var_4 );
            }
        }
    }
}

_id_7BC2()
{
    level endon( "plug_hydrant_leak" );
    var_0 = getent( "tag_hydrant_fx", "targetname" );

    for (;;)
    {
        playfxontag( level._effect["firehydrant_leak"], var_0, "tag_origin" );
        wait 0.15;
    }
}

_id_7BC3()
{
    level endon( "chasers" );
    wait 4;
    maps\_utility::_id_168C( "presc_pri_keepmoving3" );
    wait 3;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_damnright" );
    common_scripts\utility::flag_wait( "vo_enemyvehicleahead" );
    wait 1;
    maps\_utility::_id_168C( "presc_pri_findsomewhere" );
    common_scripts\utility::flag_wait( "vo_bank_divert" );
    wait 2;
    maps\_utility::_id_168C( "presc_pri_thisway2" );
    common_scripts\utility::flag_wait( "bank_done" );
    maps\_utility::_id_265A( "allies" );
    wait 2;
    maps\_utility::_id_168C( "presc_pri_moreontheway" );
    wait 1;
    maps\_utility::_id_168C( "presc_pri_keepmoving" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_justleaveme" );
    wait 0.8;
    maps\_utility::_id_168C( "presc_pri_gettingyouout" );
}

_id_7BC4()
{
    level._id_7BC5 = getent( "trigger_vehicle_street", "targetname" );
    level._id_7BC5 waittill( "trigger" );
    common_scripts\utility::flag_set( "thru_street" );
    common_scripts\utility::flag_set( "suv_reinforce" );
    level._id_7BC6 common_scripts\utility::trigger_off();
}

_id_7BC7()
{
    level._id_7BC6 = getent( "trigger_vehicle_bank", "targetname" );
    level._id_7BC6 waittill( "trigger" );
    common_scripts\utility::flag_set( "thru_bank" );
    common_scripts\utility::flag_set( "suv_reinforce" );
    level._id_7BC5 common_scripts\utility::trigger_off();
}

_id_7BC8()
{
    maps\_utility::_id_263A( "group_suv" );
    common_scripts\utility::flag_wait( "suv_reinforce" );

    if ( common_scripts\utility::flag( "thru_street" ) )
        maps\_utility::_id_263A( "group_street" );
    else if ( common_scripts\utility::flag( "thru_bank" ) )
        maps\_utility::_id_263A( "group_bank" );

    level thread _id_7BC9();
    common_scripts\utility::flag_wait( "tunnel_cleared" );
    common_scripts\utility::flag_set( "bank_done" );
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    maps\_utility::_id_1425( "bank" );
}

_id_7BC9()
{
    maps\_utility::_id_263A( "group_precursor" );
    maps\_utility::_id_263A( "group_tactical" );
    common_scripts\utility::flag_set( "tunnel_cleared" );
}

_id_7BCA()
{
    common_scripts\utility::flag_wait( "suv_reinforce" );

    if ( common_scripts\utility::flag( "thru_street" ) )
        maps\_utility::_id_263B( "group_street", 1 );
    else if ( common_scripts\utility::flag( "thru_bank" ) )
        maps\_utility::_id_263B( "group_bank", 1 );

    maps\_utility::_id_263B( "group_suv", 1 );
    common_scripts\utility::flag_set( "enter_bank" );
}

_id_7BCB()
{
    self endon( "death" );
    thread maps\prague_escape_code::_id_7A5C();
    self setcandamage( 0 );
    self waittill( "unloaded" );
    self setcandamage( 1 );
    common_scripts\utility::flag_set( "suv_bank_unloaded" );
}

_id_7BCC()
{
    self endon( "death" );
    self setcandamage( 0 );
    thread maps\prague_escape_code::_id_7A5C();
    self waittill( "reached_end_node" );
    self setcandamage( 1 );
}

_id_7BCD()
{
    self endon( "death" );
    thread maps\prague_escape_code::_id_7A5C();
    self setcandamage( 0 );
    self waittill( "reached_end_node" );
    self setcandamage( 1 );
    common_scripts\utility::flag_set( "vo_enemyvehicleahead" );
    wait 1;
    maps\_vehicle::_id_2514();
    self waittill( "unloaded" );
    common_scripts\utility::flag_set( "suv1_unloaded" );
}

_id_7BCE()
{
    self endon( "death" );
    thread maps\prague_escape_code::_id_7A5C();
    thread _id_7BD7();
    self setcandamage( 0 );
    self waittill( "reached_end_node" );
    self setcandamage( 1 );
    wait 0.5;
    maps\_vehicle::_id_2514();
    self waittill( "unloaded" );
    common_scripts\utility::flag_set( "suv2_unloaded" );
}

_id_7BCF()
{
    self endon( "death" );
    self._id_0D31 = 1;
    thread _id_7BDB();
    common_scripts\utility::flag_wait( "suv2_unloaded" );
    var_0 = getent( "vol_alley_entrance", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "suv_reinforce" );
    self cleargoalvolume();
    var_0 = getent( "vol_bank_entrance", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "bank_done" );
    self cleargoalvolume();
}

_id_7BD0()
{
    self endon( "death" );
    thread _id_7BDB();
    self.goalradius = 32;
    self._id_0D31 = 1;
    common_scripts\utility::flag_wait( "suv1_unloaded" );
    self waittill( "goal" );
    var_0 = getent( "vol_bank_interior", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "bank_done" );
    self cleargoalvolume();
}

_id_7BD1()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    self.goalradius = 32;
    self._id_0D31 = 1;
    common_scripts\utility::flag_wait( "suv1_unloaded" );
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    var_0 maps\_anim::_id_124A( self, "bank_entry_door1" );
    var_0 maps\_anim::_id_1246( self, "bank_entry_door1" );
}

_id_7BD2()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    self.goalradius = 32;
    self._id_0D31 = 1;
    common_scripts\utility::flag_wait( "suv1_unloaded" );
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    var_0 maps\_anim::_id_124A( self, "bank_entry_door2" );
    var_0 maps\_anim::_id_1246( self, "bank_entry_door2" );
}

_id_7BD3()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self._id_0D31 = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    common_scripts\utility::flag_wait( "suv_bank_unloaded" );
    var_0 maps\_anim::_id_124A( self, "bank_entry_dive" );
    var_0 maps\_anim::_id_1246( self, "bank_entry_dive" );
    var_1 = getent( "vol_bank_interior", "targetname" );
    self setgoalvolumeauto( var_1 );
}

_id_7BD4()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self._id_0D31 = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    common_scripts\utility::flag_wait( "suv_bank_unloaded" );
    var_0 maps\_anim::_id_124A( self, "bank_entry_left" );
    var_0 maps\_anim::_id_1246( self, "bank_entry_left" );
    var_1 = getent( "vol_bank_interior", "targetname" );
    self setgoalvolumeauto( var_1 );
}

_id_7BD5()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self._id_0D31 = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    common_scripts\utility::flag_wait( "suv_bank_unloaded" );
    var_0 maps\_anim::_id_124A( self, "bank_entry_right" );
    var_0 maps\_anim::_id_1246( self, "bank_entry_right" );
    var_1 = getent( "vol_bank_interior", "targetname" );
    self setgoalvolumeauto( var_1 );
}

_id_7BD6()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self._id_0D31 = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_bank", "targetname" );
    common_scripts\utility::flag_wait( "suv_bank_unloaded" );
    var_0 maps\_anim::_id_124A( self, "bank_entry_jump" );
    var_0 maps\_anim::_id_1246( self, "bank_entry_jump" );
    var_1 = getent( "vol_bank_interior", "targetname" );
    self setgoalvolumeauto( var_1 );
}

_id_7BD7()
{
    self endon( "death" );
    var_0 = getent( "trigger_suv_boxes", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = common_scripts\utility::getstruct( "struct_suv_box", "targetname" );
    physicsexplosioncylinder( var_1.origin, 80, 20, 1.3 );
    radiusdamage( var_1.origin, 40, 100, 80 );
}

_id_7BD8()
{
    var_0 = getent( "fire_hydrant_dmg", "targetname" );
    wait 0.5;
    radiusdamage( var_0.origin, 35, 450, 350 );
}

_id_7BD9()
{
    self endon( "death" );
    var_0 = 300;
    common_scripts\utility::flag_wait( "suv_reinforce" );

    while ( distance2d( self.origin, level._id_4877.origin ) > var_0 )
        wait 0.1;

    _id_7BDA();
}

_id_7BDA()
{
    self endon( "death" );
    var_0 = 0;

    while ( var_0 < 25 )
    {
        var_0 = randomintrange( 0, 50 );
        wait 1.0;
    }

    maps\_utility::_id_2749();
}

_id_7BDB()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "enter_bank" );
    self cleargoalvolume();
    self.goalradius = 32;
    self.ignoresuppression = 1;
    var_0 = getent( "vol_bank_interior", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7BDC()
{
    level endon( "bank_done" );
    var_0 = getent( "trigger_chasers", "script_noteworthy" );
    var_0 waittill( "trigger" );
    setdvar( "ui_deadquote", &"PRAGUE_ESCAPE_PROTECT_FAIL" );
    level thread maps\_utility::_id_1826();
}

_id_7BDD( var_0 )
{
    glassradiusdamage( ( 22898.0, 17305.0, -20.0 ), 200, 500, 500 );
}

_id_7BDE( var_0 )
{
    glassradiusdamage( ( 23264.0, 17162.0, -20.0 ), 64, 500, 500 );
}

_id_7BDF()
{
    common_scripts\utility::flag_init( "thru_bank" );
    common_scripts\utility::flag_init( "thru_street" );
    common_scripts\utility::flag_init( "suv1_unloaded" );
    common_scripts\utility::flag_init( "suv2_unloaded" );
    common_scripts\utility::flag_init( "suv_reinforce" );
    common_scripts\utility::flag_init( "suv_bank_unloaded" );
    common_scripts\utility::flag_init( "enter_bank" );
    common_scripts\utility::flag_init( "tunnel_cleared" );
    common_scripts\utility::flag_init( "bank_done" );
    common_scripts\utility::flag_init( "lerp_price_soap" );
    common_scripts\utility::flag_init( "nolerp" );
    common_scripts\utility::flag_init( "head_to_court" );
    common_scripts\utility::flag_init( "vo_enemyvehicleahead" );
    common_scripts\utility::flag_init( "vo_bank_divert" );
}

_id_7BE0()
{
    var_0 = getent( "suv_blocker1", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_7BCD );
    var_1 = getent( "suv_blocker2", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_7BCE );
    var_2 = getentarray( "alley_cover", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_7BCF );
    var_3 = getent( "bank_breach1", "script_noteworthy" );
    var_3 maps\_utility::add_spawn_function( ::_id_7BD1 );
    var_4 = getent( "bank_breach2", "script_noteworthy" );
    var_4 maps\_utility::add_spawn_function( ::_id_7BD2 );
    var_5 = getentarray( "bank_assault", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_7BD0 );
    var_6 = getentarray( "assault_1", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_7BD3 );
    var_7 = getentarray( "assault_2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::_id_7BD4 );
    var_8 = getentarray( "assault_3", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, ::_id_7BD5 );
    var_9 = getentarray( "assault_4", "script_noteworthy" );
    common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, ::_id_7BD6 );
    var_10 = getent( "suv_bank", "targetname" );
    var_10 thread maps\_utility::add_spawn_function( ::_id_7BCB );
    var_11 = getentarray( "suv_street", "targetname" );
    common_scripts\utility::array_thread( var_11, maps\_utility::add_spawn_function, ::_id_7BCC );
}
