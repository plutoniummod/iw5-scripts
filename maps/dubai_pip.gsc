// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7554()
{
    var_0 = 1;

    if ( var_0 )
        thread _id_7566();
    else
    {
        level._id_3EDA = level.player newpip();
        level._id_3EDA.enable = 0;
        level._id_3EDA._id_7555 = 0.5;
        thread _id_7558();
    }
}

_id_60E4( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0.origin );
    var_2 setmodel( "tag_origin" );
    var_2.angles = var_0.angles;
    var_2 linkto( var_0 );
    level._id_3EDA.enable = 1;
    level._id_3EDA.freecamera = 1;
    level._id_3EDA.entity = var_2;
    level._id_3EDA.foreground = 1;
    level._id_3EDA.fov = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, 50 );
    level._id_3EDA._id_7556 = var_0;
    level._id_3EDA._id_60E9 = 16;
    level._id_3EDA._id_60EA = 220;
    level._id_3EDA._id_60EB = 135;
    level._id_3EDA._id_60EC = 135;
    level._id_3EDA._id_60ED = 490;
    level._id_3EDA._id_60EE = 25;
    level._id_3EDA._id_60EF = level._id_3EDA._id_60ED + level._id_3EDA._id_60EA * 0.5 - level._id_3EDA._id_60E9 * 0.5;
    level._id_3EDA._id_60F0 = level._id_3EDA._id_60EE;
    level._id_3EDA._id_60F1 = 2;
    level._id_3EDA.tag = "tag_origin";
    level._id_3EDA.x = level._id_3EDA._id_60EF;
    level._id_3EDA.y = level._id_3EDA._id_60F0;
    level._id_3EDA.width = level._id_3EDA._id_60E9;
    level._id_3EDA.height = level._id_3EDA._id_60EB;
    var_3 = level._id_3EDA._id_60EF;
    var_4 = level._id_3EDA._id_60F0;
    level.player thread maps\_utility::play_sound_on_entity( "sp_eog_summary" );
    level thread _id_60F6();
    level thread _id_60FF();
}

_id_60F6()
{
    var_0 = newhudelem();
    var_0.alpha = 1;
    var_0.sort = -50;
    var_0.x = level._id_3EDA._id_60ED;
    var_0.y = level._id_3EDA._id_60EE;
    var_0.hidewheninmenu = 0;
    var_0.hidewhendead = 1;
    var_0 setshader( "overlay_static", level._id_3EDA._id_60EA, level._id_3EDA._id_60EC );
    level._id_3EDA._id_60F7 = var_0;
}

_id_60FE()
{
    level._id_3EDA endon( "stop_interference" );

    for (;;)
    {
        var_0 = randomfloatrange( 0.1, 1 );
        var_1 = var_0 + randomfloatrange( 0.1, 0.4 );
        var_2 = randomfloatrange( 0.1, 0.2 );
        level._id_3EDA._id_60F7 fadeovertime( var_0 );
        level._id_3EDA._id_60F7.alpha = var_2;
        wait(var_1);
        var_0 = randomfloatrange( 0.5, 0.75 );
        var_1 = var_0 + randomfloatrange( 0.5, 1.5 );
        level._id_3EDA._id_60F7 fadeovertime( var_0 );
        level._id_3EDA._id_60F7.alpha = 0.2;
        wait(var_1);
    }
}

_id_60FF()
{
    var_0 = 0.1;
    wait(var_0 + 0.05);
    level._id_3EDA.width = level._id_3EDA._id_60EA;
    level._id_3EDA.height = level._id_3EDA._id_60EC;
    level._id_3EDA.x = level._id_3EDA._id_60ED;
    level._id_3EDA.y = level._id_3EDA._id_60EE;
    level._id_3EDA.enable = 1;
    wait 0.8;
    level notify( "pip_in" );
    level._id_3EDA._id_60F7 fadeovertime( 1 );
    level._id_3EDA._id_60F7.alpha = 0.2;
    level thread _id_60FE();
}

_id_6100( var_0, var_1, var_2 )
{
    var_3 = level._id_3EDA._id_60E9;
    var_4 = level._id_3EDA._id_60EB;
    var_5 = spawnstruct();
    var_6 = level._id_3EDA._id_60F1;
    var_7 = 16;

    if ( var_2 == "top_left" )
    {
        var_8 = "left";
        var_9 = "top";
        var_10 = "left";
        var_11 = "top";
        var_0 -= var_6;
        var_1 -= var_6;
    }
    else if ( var_2 == "top_right" )
    {
        var_8 = "left";
        var_9 = "top";
        var_10 = "right";
        var_11 = "top";
        var_0 = var_0 + var_3 + var_6 - 1;
        var_1 -= var_6;
    }
    else if ( var_2 == "bottom_left" )
    {
        var_8 = "left";
        var_9 = "bottom";
        var_10 = "left";
        var_11 = "bottom";
        var_0 -= var_6;
        var_1 = var_1 + var_4 + var_6;
    }
    else
    {
        var_8 = "left";
        var_9 = "bottom";
        var_10 = "right";
        var_11 = "bottom";
        var_0 = var_0 + var_3 + var_6 - 1;
        var_1 = var_1 + var_4 + var_6;
    }

    var_12 = newhudelem();
    var_12.alignx = var_8;
    var_12.aligny = var_9;
    var_12.x = var_0;
    var_12.y = var_1;
    var_12.hidewheninmenu = 0;
    var_12.hidewhendead = 1;
    var_12 setshader( "white", var_6, var_7 );
    var_5._id_6101 = var_12;
    var_12 = newhudelem();
    var_12.alignx = var_10;
    var_12.aligny = var_11;
    var_12.x = var_0;
    var_12.y = var_1;
    var_12.hidewheninmenu = 0;
    var_12.hidewhendead = 1;
    var_12 setshader( "white", var_7, var_6 );
    var_5._id_6102 = var_12;
    return var_5;
}

_id_6103( var_0, var_1 )
{
    if ( var_0 == "top_left" || var_0 == "bottom_left" )
    {
        self._id_6101 moveovertime( var_1 );
        self._id_6101.x = level._id_3EDA._id_60ED;
        self._id_6102 moveovertime( var_1 );
        self._id_6102.x = level._id_3EDA._id_60ED;
    }
    else
    {
        self._id_6101 moveovertime( var_1 );
        self._id_6101.x = level._id_3EDA._id_60ED + level._id_3EDA._id_60EA;
        self._id_6102 moveovertime( var_1 );
        self._id_6102.x = level._id_3EDA._id_60ED + level._id_3EDA._id_60EA;
    }
}

_id_7557()
{
    level._id_3EDA notify( "stop_interference" );
    level._id_3EDA._id_60F7.alpha = 1;
    wait(level._id_3EDA._id_7555);
    var_0 = 0.25;
    level._id_3EDA._id_60F7 fadeovertime( var_0 );
    level._id_3EDA._id_60F7.alpha = 1;
    wait(var_0);
    level._id_3EDA.enable = 0;

    if ( isdefined( level._id_3EDA._id_6105 ) )
        level._id_3EDA._id_6105 delete();

    var_0 = 0.1;
    wait(var_0 + 0.05);
    level._id_3EDA.width = level._id_3EDA._id_60E9;
    level._id_3EDA.height = level._id_3EDA._id_60EB;
    level._id_3EDA.x = level._id_3EDA._id_60EF;
    level._id_3EDA.y = level._id_3EDA._id_60F0;
    level._id_3EDA._id_60F7 destroy();

    if ( isdefined( level._id_3EDD ) )
        level._id_3EDD destroy();

    if ( isdefined( level._id_60F5 ) )
        level._id_60F5 destroy();

    level._id_3EDA.enable = 0;
    level notify( "pip_closed" );
}

_id_6106()
{
    self._id_6101 destroy();
    self._id_6102 destroy();
}

_id_6107( var_0, var_1 )
{
    if ( var_0 == "top_left" || var_0 == "bottom_left" )
    {
        self._id_6101 moveovertime( var_1 );
        self._id_6101.x = level._id_3EDA._id_60EF;
        self._id_6102 moveovertime( var_1 );
        self._id_6102.x = level._id_3EDA._id_60EF;
    }
    else
    {
        self._id_6101 moveovertime( var_1 );
        self._id_6101.x = level._id_3EDA._id_60EF + level._id_3EDA._id_60E9;
        self._id_6102 moveovertime( var_1 );
        self._id_6102.x = level._id_3EDA._id_60EF + level._id_3EDA._id_60E9;
    }
}

_id_576A( var_0 )
{

}

_id_7558()
{
    var_0 = 8;
    var_1 = 8;
    var_2 = 8;
    var_3 = 5;
    thread _id_7559( "pip_camera_atrium", 15, "pip_atrium_start", var_0, ::_id_755A );
    thread _id_7559( "pip_camera_lounge", 7.5, "pip_lounge_start", var_1, ::_id_755D );
    thread _id_7559( "pip_camera_restaurant", 10, "pip_restaurant_start", var_2, ::_id_7561 );
    var_4 = 0;

    if ( var_4 )
    {
        wait 1;
        common_scripts\utility::flag_set( "pip_atrium_start" );
        wait(var_0 + 1);
        common_scripts\utility::flag_set( "pip_lounge_start" );
        wait(var_1 + 1);
        common_scripts\utility::flag_set( "pip_restaurant_start" );
        wait(var_2 + 1);
        common_scripts\utility::flag_set( "pip_elevator_chopper_start" );
        wait(var_3 + 1);
    }
}

_id_7559( var_0, var_1, var_2, var_3, var_4 )
{
    common_scripts\utility::flag_wait( var_2 );
    var_5 = getent( var_0, "targetname" );

    if ( isdefined( var_4 ) )
        var_5 thread [[ var_4 ]]();

    _id_60E4( var_5, var_1 );
    wait(var_3);
    _id_7557();
}

_id_755A()
{
    thread _id_755B();
    var_0 = -15;
    var_1 = 35;
    var_2 = 8;
    self rotateto( self.angles + ( var_0, var_1, 0 ), var_2 );
    level waittill( "pip_in" );
    maps\_utility::_id_27CA( "pip_atrium_npc", ::_id_755C );
    maps\_utility::_id_272C( "pip_atrium_npc" );
    maps\_utility::delaythread( 3, ::_id_7565, 40, 5 );
    level waittill( "pip_closed" );
}

_id_755B()
{
    var_0 = getent( "pip_makarov_pos_atrium", "targetname" );
    var_1 = getent( "pip_makarov", "targetname" );

    if ( var_1.count < 1 )
        var_1.count++;

    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 teleport( var_0.origin );
    var_2 maps\_utility::_id_104A( "ak47", "primary" );
    var_2._id_1032 = "makarov";
    var_3 = [];
    var_3[var_3.size] = var_2;
    var_0 thread maps\_anim::_id_11DD( var_3, "pip_scene_atrium" );
    maps\_utility::delaythread( 0.05, maps\_anim::_id_127F, var_3, "pip_scene_atrium", 0.1 );
    level waittill( "pip_in" );
    level waittill( "pip_closed" );
    var_2 delete();
}

_id_755C()
{
    self.goalradius = 8;
    self setgoalpos( self.origin );

    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    self.goalradius = 32;
    self setgoalpos( ( 696.0, 643.0, 7776.0 ) );
    self waittill( "goal" );
    self delete();
}

_id_755D()
{
    thread _id_7560();
    thread maps\dubai_code::_id_755E( 4, "civilians_atrium_initial" );
    thread maps\dubai_code::_id_755E( 4, "civilians_atrium" );
    maps\_utility::delaythread( 2, maps\dubai_code::_id_755E, 4, "civilians_atrium" );
    maps\_utility::delaythread( 4, maps\dubai_code::_id_755E, 4, "civilians_atrium" );
    maps\_utility::delaythread( 6, maps\dubai_code::_id_755E, 4, "civilians_atrium" );
    maps\_utility::delaythread( 8, maps\dubai_code::_id_755E, 4, "civilians_atrium" );
    common_scripts\utility::delaycall( 3, ::rotateto, self.angles + ( -2.0, 20.0, 0.0 ), 9 );
    maps\_utility::delaythread( 2, ::_id_7565, 22, 5 );
    level waittill( "pip_in" );
    level waittill( "pip_closed" );
}

_id_755F()
{
    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    var_0 = maps\_utility::_id_166F();
    var_0.fixednode = 1;
    level waittill( "pip_closed" );
    var_0 delete();
}

_id_7560()
{
    var_0 = getent( "pip_makarov_pos_lounge", "targetname" );
    var_1 = getent( "pip_makarov", "targetname" );

    if ( var_1.count < 1 )
        var_1.count++;

    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 teleport( ( 1022.0, -416.0, 7780.0 ), var_0.angles );
    var_2._id_1032 = "makarov";
    var_2 maps\_utility::_id_104A( "ak47", "primary" );
    var_3 = "pip_scene_lounge";
    var_0 maps\_anim::_id_124A( var_2, var_3 );
    var_2.goalradius = 8;
    var_2 setgoalpos( ( 235.0, -345.0, 7792.0 ) );
    var_0 thread maps\_anim::_id_1247( var_2, var_3 );
    level waittill( "pip_closed" );
    var_2 delete();
}

_id_7561()
{
    thread _id_7562();
    maps\_utility::delaythread( 2, ::_id_7565, 22, 5 );
    common_scripts\utility::array_thread( getentarray( "pip_restaurant_npc", "targetname" ), ::_id_7564 );
    thread _id_7563( "pip_restaurant_npc_left", ( -1012.0, -108.0, 7769.0 ), 2.5, "pip_restaurant_npc_left_goal_node" );
    thread _id_7563( "pip_restaurant_npc_right", ( -952.0, -148.0, 7769.0 ), 4.25, "pip_restaurant_npc_right_goal_node" );
}

_id_7562()
{
    var_0 = getent( "pip_makarov_pos_restaurant", "targetname" );
    var_1 = getent( "pip_makarov", "targetname" );

    if ( var_1.count < 1 )
        var_1.count++;

    var_2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 teleport( ( -984.0, -316.0, 7754.0 ), var_0.angles );
    var_2 maps\_utility::_id_104A( "ak47", "primary" );
    var_2._id_1032 = "makarov";
    var_0 maps\_anim::_id_124A( var_2, "pip_scene_restaurant" );
    var_2.goalradius = 8;
    var_2 setgoalpos( ( -876.0, 740.0, 7760.0 ) );
    var_0 thread maps\_anim::_id_1247( var_2, "pip_scene_restaurant" );
    level waittill( "pip_closed" );
    var_2 delete();
}

_id_7563( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_0, "targetname" );
    var_4 = var_4 maps\_utility::_id_166F( 1 );
    var_4 maps\_utility::_id_2713();
    var_4 setgoalpos( var_1 );
    var_4.goalradius = 8;
    var_4.ignoreall = 1;
    wait(var_2);
    var_4 setgoalnode( getnode( var_3, "targetname" ) );
    level waittill( "pip_closed" );
    var_4 delete();
}

_id_7564()
{
    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    var_0 = maps\_utility::_id_166F( 1 );
    var_0.ignoreall = 1;
    var_0.fixednode = 1;
    level waittill( "pip_closed" );
    var_0 delete();
}

_id_7565( var_0, var_1 )
{
    var_2 = level._id_3EDA.fov;
    var_3 = 0.05;
    var_4 = ( var_0 - level._id_3EDA.fov ) * var_3 / var_1;

    for ( var_5 = 0; var_5 < var_1; var_5 += var_3 )
    {
        level._id_3EDA.fov += var_4;
        wait(var_3);
    }
}

_id_7566()
{
    thread _id_7567( "pip_atrium_start", "dubai_pip01" );
    thread _id_7567( "pip_lounge_start", "dubai_pip02" );
    thread _id_7567( "pip_restaurant_start", "dubai_pip03" );
    var_0 = 0;

    if ( var_0 )
    {
        wait 1;
        common_scripts\utility::flag_set( "pip_atrium_start" );
        wait 9;
        common_scripts\utility::flag_set( "pip_lounge_start" );
        wait 9;
        common_scripts\utility::flag_set( "pip_restaurant_start" );
        wait 9;
    }
}

_id_7567( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    var_2 = newhudelem();
    var_2.x = 450;
    var_2.y = 47;
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2.sort = -1;
    var_2 setshader( "cinematic", 175, 170 );
    var_2.alpha = 1.0;

    if ( isdefined( level._id_7148 ) )
    {
        pausecinematicingame( 0 );
        setsaveddvar( "cg_cinematicFullScreen", "1" );
        level._id_7148 = undefined;
    }
    else
    {
        cinematicingame( var_1 );
        maps\_audio::aud_send_msg( "aud_pip_open" );
    }

    setsaveddvar( "cg_cinematicCanPause", "1" );
    wait 1;

    while ( iscinematicplaying() )
        wait 0.05;

    maps\_audio::aud_send_msg( "aud_pip_close" );
    setsaveddvar( "cg_cinematicCanPause", "0" );
    var_2 destroy();
    setsaveddvar( "cg_cinematicFullScreen", "1" );
}
