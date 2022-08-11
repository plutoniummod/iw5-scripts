// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_60E4()
{
    level._id_0C59["generic"]["setup_pose"] = %casual_stand_idle;
    level._id_3EDA = level.player newpip();
    level._id_3EDA.enable = 0;
}

_id_60E5( var_0, var_1, var_2, var_3 )
{
    if ( issentient( var_0 ) )
    {
        var_0._id_60E6 = var_0._id_1032;
        var_0._id_1032 = "generic";
        var_0 maps\_anim::_id_11CF( var_0, "setup_pose" );

        if ( !isdefined( var_1 ) )
        {
            var_4 = _id_570B( var_0.origin, var_0.angles, ( 12.0, 0.0, 0.0 ) );
            var_5 = var_0 geteye();
            var_6 = spawn( "script_model", ( var_4[0], var_4[1], var_5[2] ) );
            var_6 setmodel( "tag_origin" );
            var_6.angles = var_0.angles;
            var_6 linkto( var_0, "j_neck" );
        }
        else
        {
            var_7 = ( -14.0, -14.0, 63.0 );
            var_4 = _id_570B( var_0.origin, var_0.angles, var_7 );
            var_6 = spawn( "script_model", var_4 );
            var_6 setmodel( "tag_origin" );
            var_6.angles = var_0.angles + ( 0.0, 6.8, 0.0 );
            var_6 linkto( var_0, "j_neck" );
        }

        var_0 thread maps\_anim::_id_1246( var_0, "setup_pose" );
        var_0 common_scripts\utility::delaycall( 0.05, ::setanimtime, %casual_stand_idle, 0.99 );
        var_0._id_1032 = var_0._id_60E7;
    }
    else
    {
        if ( isdefined( var_2 ) )
        {
            var_4 = var_0.origin + var_2;
            var_6 = spawn( "script_model", var_4 );
        }
        else
            var_6 = spawn( "script_model", var_0.origin );

        var_6 setmodel( "tag_origin" );
        var_6.angles = var_0.angles;
        var_6 linkto( var_0 );
    }

    level._id_3EDA.enable = 1;
    level._id_3EDA.freecamera = 1;
    level._id_3EDA.entity = var_6;
    level._id_3EDA.fov = common_scripts\utility::ter_op( isdefined( var_3 ), var_3, 50 );
    var_8 = getdvarint( "widescreen", 1 );
    var_9 = 0.75;
    level._id_60E8 = var_0;
    level._id_3EDA._id_60E9 = 16;
    level._id_3EDA._id_60EA = common_scripts\utility::ter_op( var_8, 220, 130 );
    level._id_3EDA._id_60EB = common_scripts\utility::ter_op( var_8, 135, int( floor( var_9 * level._id_3EDA._id_60EA ) ) );
    level._id_3EDA._id_60EC = common_scripts\utility::ter_op( var_8, 135, int( floor( var_9 * level._id_3EDA._id_60EA ) ) );
    level._id_3EDA._id_60ED = common_scripts\utility::ter_op( var_8, 490, 475 );
    level._id_3EDA._id_60EE = common_scripts\utility::ter_op( var_8, 15, 30 );
    level._id_3EDA._id_60EF = level._id_3EDA._id_60ED + level._id_3EDA._id_60EA * 0.5 - level._id_3EDA._id_60E9 * 0.5;
    level._id_3EDA._id_60F0 = level._id_3EDA._id_60EE;
    level._id_3EDA._id_60F1 = 2;
    level._id_3EDA.enableshadows = 0;
    level._id_3EDA.tag = "tag_origin";
    level._id_3EDA.x = level._id_3EDA._id_60EF;
    level._id_3EDA.y = level._id_3EDA._id_60F0;
    level._id_3EDA.width = level._id_3EDA._id_60E9;
    level._id_3EDA.height = level._id_3EDA._id_60EB;
    level._id_3EDA.visionsetnaked = "paris_ac130_pip";
    var_10 = level._id_3EDA._id_60EF;
    var_11 = level._id_3EDA._id_60F0;
    level._id_3EDA._id_60F2["top_left"] = _id_6100( var_10, var_11, "top_left" );
    level._id_3EDA._id_60F2["top_right"] = _id_6100( var_10, var_11, "top_right" );
    level._id_3EDA._id_60F2["bottom_left"] = _id_6100( var_10, var_11, "bottom_left" );
    level._id_3EDA._id_60F2["bottom_right"] = _id_6100( var_10, var_11, "bottom_right" );
    level.player thread maps\_utility::play_sound_on_entity( "sp_eog_summary" );
    level thread _id_60F6();
    level thread _id_60FF();
    level thread _id_60F4();
    level thread _id_60FC();
    level thread _id_60F8();

    if ( isdefined( level._id_60E8.name ) )
        level thread _id_3EDD();
}

_id_60F3( var_0 )
{
    notifyoncommand( "toggle_pip_cam", "+actionslot 4" );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            level.player waittill( "toggle_pip_cam" );
            var_3 = spawn( "script_model", var_2.origin );
            var_3 setmodel( "tag_origin" );
            var_3.angles = var_2.angles;
            var_3 linkto( var_2, "j_head", ( -13.0, -12.0, 64.0 ), ( 0.0, 0.0, 0.0 ) );
            level._id_3EDA.entity = var_3;
            level._id_60E8 = var_2;
            wait 0.2;
        }
    }
}

_id_3EDD()
{
    level._id_3EDD = newhudelem();
    level._id_3EDD.alpha = 1;
    level._id_3EDD.x = level._id_3EDA._id_60ED + 15;
    level._id_3EDD.y = level._id_3EDA._id_60EE + 1;
    level._id_3EDD.hidewheninmenu = 0;
    level._id_3EDD.hidewhendead = 1;
    level._id_3EDD.fontscale = 1.5;
    level._id_3EDD.font = "objective";
    level._id_3EDD settext( level._id_60E8.name );

    for (;;)
    {
        level.player waittill( "toggle_pip_cam" );
        wait 0.1;
        level._id_3EDD settext( level._id_60E8.name );
    }
}

_id_60F4()
{
    level._id_60F5 = level.player maps\_hud_util::createclienttimer( "objective", 1.5 );
    level._id_60F5.alpha = 1;
    level._id_60F5.x = level._id_3EDA._id_60ED + 200;
    level._id_60F5.y = level._id_3EDA._id_60EE + 82;
    level._id_60F5.hidewheninmenu = 0;
    level._id_60F5.hidewhendead = 1;
    level._id_60F5 settenthstimerup( 0.0 );
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

_id_60F8()
{
    level._id_3EDA endon( "stop_interference" );
    level._id_3EDA._id_60F9 = newhudelem();
    level._id_3EDA._id_60F9.alpha = 1;
    level._id_3EDA._id_60F9.sort = -50;
    level._id_3EDA._id_60F9.x = level._id_3EDA._id_60ED;
    level._id_3EDA._id_60F9.y = level._id_3EDA._id_60EE;
    level._id_3EDA._id_60F9.hidewheninmenu = 0;
    level._id_3EDA._id_60F9.hidewhendead = 1;
    var_0 = [];
    var_0[0] = "ac130_overlay_pip_static_a";
    var_0[1] = "ac130_overlay_pip_static_b";
    var_0[2] = "ac130_overlay_pip_static_c";
    var_0 = maps\_utility::_id_0B53( var_0 );
    level thread _id_60FA();
    level thread _id_60FB();
    var_1 = 135;
    var_2 = randomfloatrange( 0.1, 0.35 );

    for (;;)
    {
        level._id_3EDA._id_60F9 setshader( common_scripts\utility::random( var_0 ), level._id_3EDA._id_60EA, int( var_1 * var_2 ) );
        wait 0.05;
    }
}

_id_60FA()
{
    level._id_3EDA endon( "stop_interference" );

    for (;;)
    {
        var_0 = randomfloatrange( 0.05, 0.08 );
        var_1 = randomfloatrange( 0.1, 0.8 );
        level._id_3EDA._id_60F9 fadeovertime( var_0 );
        level._id_3EDA._id_60F9.alpha = var_1;
        wait(var_0);

        if ( randomint( 100 ) > 50 )
        {
            var_0 = randomfloatrange( 0.25, 0.4 );
            level._id_3EDA._id_60F9 fadeovertime( var_0 );
            level._id_3EDA._id_60F9.alpha = 0;
            wait(var_0);
        }
    }
}

_id_60FB()
{
    level._id_3EDA endon( "stop_interference" );

    for (;;)
    {
        var_0 = randomintrange( 10, 110 );
        level._id_3EDA._id_60F9.y = var_0;
        wait(randomfloatrange( 0.05, 0.4 ));
    }
}

_id_60FC()
{
    var_0 = newhudelem();
    var_0.alpha = 1;
    var_0.sort = -50;
    var_0.x = level._id_3EDA._id_60ED;
    var_0.y = level._id_3EDA._id_60EE;
    var_0.hidewheninmenu = 0;
    var_0.hidewhendead = 1;
    var_0 setshader( "ac130_overlay_pip_vignette", level._id_3EDA._id_60EA, level._id_3EDA._id_60EC );
    level._id_3EDA._id_60FD = var_0;
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
        level._id_3EDA._id_60F7.alpha = 0.3;
        wait(var_1);
    }
}

_id_60FF()
{
    var_0 = 0.1;

    foreach ( var_3, var_2 in level._id_3EDA._id_60F2 )
        var_2 thread _id_6103( var_3, var_0 );

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

_id_6104()
{
    level._id_3EDA notify( "stop_interference" );
    level._id_3EDA._id_60F7.alpha = 1;
    wait 0.5;
    var_0 = 0.25;
    level._id_3EDA.enableshadows = 1;
    level._id_3EDA._id_60F7 fadeovertime( var_0 );
    level._id_3EDA._id_60F7.alpha = 1;
    wait(var_0);
    level._id_3EDA.enable = 0;

    if ( isdefined( level._id_3EDA._id_6105 ) )
        level._id_3EDA._id_6105 delete();

    var_0 = 0.1;

    foreach ( var_3, var_2 in level._id_3EDA._id_60F2 )
        var_2 thread _id_6107( var_3, var_0 );

    level._id_3EDA._id_60F7 scaleovertime( var_0, level._id_3EDA._id_60E9, level._id_3EDA._id_60EB );
    wait(var_0 + 0.05);
    level._id_3EDA.width = level._id_3EDA._id_60E9;
    level._id_3EDA.height = level._id_3EDA._id_60EB;
    level._id_3EDA.x = level._id_3EDA._id_60EF;
    level._id_3EDA.y = level._id_3EDA._id_60F0;

    if ( isdefined( level._id_3EDA._id_60F2 ) )
        common_scripts\utility::array_thread( level._id_3EDA._id_60F2, ::_id_6106 );

    level._id_3EDA._id_60F7 destroy();

    if ( isdefined( level._id_3EDD ) )
        level._id_3EDD destroy();

    if ( isdefined( level._id_60F5 ) )
        level._id_60F5 destroy();

    if ( isdefined( level._id_3EDA._id_60FD ) )
        level._id_3EDA._id_60FD destroy();

    if ( isdefined( level._id_3EDA._id_60F9 ) )
        level._id_3EDA._id_60F9 destroy();

    level._id_3EDA.enable = 0;
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
