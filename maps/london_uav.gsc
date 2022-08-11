// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5731()
{
    level._id_56B0 = -5;
    level._id_56B6 = 1.25;
    level._id_5732 = 198000;
    precacheshader( "uav_crosshair" );
    precacheshader( "uav_vertical_meter" );
    precacheshader( "uav_horizontal_meter" );
    precacheshader( "overlay_grain" );
    precacheshader( "uav_arrow_up" );
    precacheshader( "uav_arrow_left" );
    precacheshader( "ac130_thermal_overlay_bar" );
    setsaveddvar( "thermalBlurFactorNoScope", 50 );
    common_scripts\utility::flag_init( "uav_hud_enabled" );
}

_id_5733( var_0, var_1, var_2 )
{
    var_3 = maps\_vehicle::_id_2881( var_0 );
    var_3 _id_5734( var_1, var_2 );
    return var_3;
}

_id_5734( var_0, var_1 )
{
    self.player = var_0;
    self._id_5735 = maps\_utility::_id_27BF( self, "tag_origin", ( 0.0, 0.0, -8.0 ), "player_view_controller" );
    self._id_5736 = spawn( "script_origin", self._id_5735.origin );
    self._id_5735 linkto( self._id_5736 );
    thread _id_575A();
    var_2 = self.origin + ( 0.0, 0.0, -1000.0 );

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    self.target_ent = spawn( "script_origin", var_2 );
    self._id_5735 snaptotargetentity( self.target_ent );
    self._id_5736 thread _id_5739( self );
    var_0 _id_56AF();
    var_0 unlink();

    if ( isdefined( self._id_5737 ) )
        self._id_5738 = _id_573A( self._id_5737 );
    else
        self._id_5738 = _id_573A( self._id_5735 );

    var_0 playerlinktodelta( self._id_5735, "tag_player", 1, 0, 0, 0, 0, 1 );
    self._id_5738 useby( var_0 );
    level.player disableturretdismount();
    thread _id_5747();
    thread _id_573B();
    self hide();
}

_id_5739( var_0 )
{
    self endon( "death" );
    self endon( "stop_update_controller_pos" );
    var_0 endon( "death" );
    var_1 = 0.1;
    var_2 = ( 0.0, 0.0, -8.0 );

    for (;;)
    {
        self moveto( var_0.origin + var_2, var_1 );
        var_3 = vectortoangles( var_0.target_ent.origin - self.origin );
        self rotateto( var_3, var_1 );
        wait(var_1);
    }
}

_id_573A( var_0, var_1 )
{
    var_2 = "tag_aim";
    var_3 = var_0 gettagorigin( var_2 );
    var_4 = var_0 gettagangles( var_2 );

    if ( !isdefined( var_1 ) )
        var_1 = "player_view_controller_uav";

    var_5 = spawnturret( "misc_turret", var_3, var_1 );
    var_5.angles = var_4;
    var_5 setmodel( "tag_turret" );
    var_5 linkto( var_0, var_2, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_5 makeunusable();
    var_5 hide();
    var_5 setmode( "manual" );
    var_5 turretfiredisable();
    return var_5;
}

_id_573B()
{
    self endon( "death" );
    self.player thread _id_56B9();
    var_0 = 0.1;
    self._id_573C = _id_5745( 51, 30, 11.58 );
    self._id_573D = _id_5745( 0, 0, 56.06 );
    self._id_573E = self.origin[0];
    self._id_573F = self.origin[1];

    for (;;)
    {
        if ( common_scripts\utility::flag( "uav_hud_enabled" ) )
        {
            var_1 = distance( self._id_5735.origin + ( 0, 0, level._id_5732 ), self.target_ent.origin );
            var_1 = _id_4E3B( var_1 );
            self.player _id_56B4( "brg", angleclamp( int( self.angles[1] - 90 ) * -1 ) );
            self.player _id_56B4( "rng_m", int( var_1 ) );
            self.player _id_56B4( "rng_nm", _id_4E3D( _id_4E3C( var_1 ), 1000 ) );
            self.player _id_56B4( "elv", int( _id_4E3A( self.target_ent.origin[2] ) ) );
            _id_5740( var_0 );
            var_2 = _id_5741();
            var_2 = _id_5742();
        }

        wait(var_0);
    }
}

_id_56B9()
{
    var_0 = self._id_47E6["scanline"];
    var_0 endon( "death" );
    var_1 = 80;
    var_2 = 280;
    var_3 = 7;
    var_4 = 15;
    var_5 = -100;
    var_6 = 580;

    for (;;)
    {
        var_0.y = var_5;
        var_7 = randomintrange( var_1, var_2 );
        var_0 setshader( "ac130_thermal_overlay_bar", 640, var_7 );
        var_8 = randomfloatrange( var_3, var_4 );
        var_0 moveovertime( var_8 );
        var_0.y = var_6;
        wait(var_8);
    }
}

_id_5740( var_0 )
{
    var_1 = self.player getplayerangles();
    var_2 = self.angles[0] - var_1[0] * -1;
    var_3 = angleclamp180( self.angles[1] - var_1[1] );
    self.player _id_56B5( "arrow_left", int( var_2 ) );
    self.player _id_56B5( "arrow_up", int( var_3 ) );
    var_4 = self.player._id_47E6["vert_meter"];
    var_5 = self.player._id_47E6["arrow_left"];
    var_2 = clamp( var_2, var_4._id_4E38, var_4._id_4E37 );
    var_6 = abs( var_2 / var_4._id_298F );
    var_7 = var_4._id_4E39 * var_6;
    var_8 = var_7 - var_4._id_4E39 * 0.5;
    var_9 = var_4.y + var_8;
    var_5 moveovertime( 0.2 );
    var_5.y = var_9;
    var_5._id_44DF moveovertime( var_0 );
    var_5._id_44DF.y = var_9;
    var_10 = self.player._id_47E6["horz_meter"];
    var_11 = self.player._id_47E6["arrow_up"];
    var_6 = var_3 / var_10._id_298F;
    var_7 = var_10._id_4E39 * var_6;
    var_12 = var_10.x + var_7;
    var_11 moveovertime( 0.2 );
    var_11.x = var_12;
    var_11._id_44DF moveovertime( var_0 );
    var_11._id_44DF.x = var_12;
}

_id_5741()
{
    var_0 = self.origin[0] - self._id_573E;
    var_1 = self.origin[1] - self._id_573F;
    var_2 = _id_5746( _id_5743( var_1 ) );
    var_3 = var_0 / var_2[0];
    var_4 = var_1 / var_2[1];
    var_5 = _id_5744( self._id_573D - var_3 );
    var_6 = _id_5744( self._id_573C - var_4 );
    self.player _id_574A( "upper_right", "lat", var_6 );
    self.player _id_574A( "upper_right", "long", var_5 );
}

_id_5742()
{
    var_0 = level.player.origin + anglestoforward( level.player getplayerangles() ) * 10000;
    var_1 = bullettrace( level.player geteye(), var_0, 1, level.player );
    var_2 = var_1["position"];
    var_3 = var_2[0] - self._id_573E;
    var_4 = var_2[1] - self._id_573F;
    var_5 = _id_5746( _id_5743( var_4 ) );
    var_6 = var_3 / var_5[0];
    var_7 = var_4 / var_5[1];
    var_8 = _id_5744( self._id_573D - var_6 );
    var_9 = _id_5744( self._id_573C - var_7 );
    self.player _id_574A( "lower_right", "lat", var_9 );
    self.player _id_574A( "lower_right", "long", var_8 );
}

_id_5743( var_0 )
{
    return var_0 / 4370080.0;
}

_id_5744( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_1 = floor( var_0 );
    var_0 -= var_1;
    var_0 *= 60.0;
    var_2 = floor( var_0 );
    var_0 -= var_2;
    var_0 *= 60.0;
    var_3 = _id_4E3D( var_0, 1000 );
    var_4 = var_3 * 100;

    if ( var_4 - int( var_4 ) == 0 )
        var_3 += 0.001;

    return [ var_1, var_2, var_3 ];
}

_id_5745( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_3 = var_2 / 60;
    var_3 += var_1;
    var_3 /= 60;
    var_3 += var_0;
    return var_3;
}

_id_5746( var_0 )
{
    var_1 = [ 4353310.0, 4356260.0, 4364250.0, 4375280.0, 4386300.0, 4394410.0, 4397400.0 ];
    var_2 = [ 2952.75, 7992.13, 11023.6, 11023.6, 8110.24, 2992.12, 0 ];
    var_3 = [ 4382680.0, 4234290.0, 3798660.0, 3104210.0, 2196850.0, 1137870.0, 0.0 ];
    var_4 = [ -148386.0, -435630.0, -694449.0, -907362.0, -1058980.0, -1137870.0, 0.0 ];
    var_5 = 7;
    var_6 = abs( var_0 ) * var_5 / 90.0;
    var_7 = int( floor( var_6 ) );
    var_8 = ( var_6 - var_7 ) * var_5;
    var_9 = var_1[var_7] + var_8 * var_2[var_7];
    var_10 = var_3[var_7] + var_8 * var_4[var_7];
    return [ var_10, var_9 ];
}

_id_4E3A( var_0 )
{
    return var_0 * 12;
}

_id_4E3B( var_0 )
{
    return var_0 * 0.0254;
}

_id_4E3C( var_0 )
{
    return var_0 * 0.000539957;
}

_id_4E3D( var_0, var_1 )
{
    var_0 = int( var_0 * var_1 ) / var_1;
    return var_0;
}

_id_5747()
{
    self waittill( "death" );

    if ( isdefined( self._id_5738 ) )
        self._id_5738 delete();

    if ( isdefined( self._id_5735 ) )
        self._id_5735 delete();

    if ( isdefined( self._id_5736 ) )
        self._id_5736 delete();
}

_id_5748()
{
    setsaveddvar( "compass", "1" );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "actionSlotsHide", "0" );
}

_id_5749()
{
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
}

_id_56AF( var_0, var_1 )
{
    level._id_56B1 = ( 1.0, 1.0, 1.0 );
    _id_5749();
    self._id_47E6 = [];
    self._id_47E6["static_hud"] = _id_4E43( var_0 );
    self._id_47E6["scanline"] = _id_56B3( var_0 );
    self._id_47E6["horz_meter"] = _id_4E44( var_0 );
    self._id_47E6["vert_meter"] = _id_4E45( var_0 );
    self._id_47E6["crosshair"] = _id_4803( var_0 );
    self._id_47E6["upper_left"] = _id_4E48( var_0 );
    self._id_47E6["upper_right"] = _id_4E49( var_0 );
    self._id_47E6["lower_right"] = _id_4E4A( var_0 );
    self._id_47E6["arrow_left"] = _id_4E4E( "left", var_0 );
    self._id_47E6["arrow_up"] = _id_4E4E( "up", var_0 );
    self._id_47E6["vert_meter"]._id_4E39 = 96;
    self._id_47E6["vert_meter"]._id_4E38 = 10;
    self._id_47E6["vert_meter"]._id_4E37 = 90;
    self._id_47E6["vert_meter"]._id_298F = self._id_47E6["vert_meter"]._id_4E37 - self._id_47E6["vert_meter"]._id_4E38;
    self._id_47E6["horz_meter"]._id_4E39 = 96;
    self._id_47E6["horz_meter"]._id_4E38 = -180;
    self._id_47E6["horz_meter"]._id_4E37 = 180;
    self._id_47E6["horz_meter"]._id_298F = self._id_47E6["horz_meter"]._id_4E37 - self._id_47E6["horz_meter"]._id_4E38;
    self disableweapons();
    self disableoffhandweapons();
    self freezecontrols( 1 );
    setsaveddvar( "sm_sunsamplesizenear", "1" );
    setsaveddvar( "sm_cameraoffset", "3400" );
    common_scripts\utility::flag_set( "uav_hud_enabled" );

    if ( !isdefined( var_1 ) )
        _id_5750( var_0 );
}

_id_56B2( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    self.alpha = 0;
    self fadeovertime( var_0 );
    self.alpha = var_1;
    return 1;
}

_id_4E43( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1.sort = level._id_56B0;
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1 setshader( "overlay_grain", 640, 480 );

    if ( !var_1 _id_56B2( var_0, 0.3 ) )
        var_1.alpha = 0.3;

    return var_1;
}

_id_56B3( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1.sort = level._id_56B0 + 1;
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1 setshader( "ac130_thermal_overlay_bar", 640, 100 );

    if ( !var_1 _id_56B2( var_0, 1 ) )
        var_1.alpha = 1;

    return var_1;
}

_id_4E44( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 320;
    var_1.y = 40;
    var_1.sort = level._id_56B0;
    var_1.alignx = "center";
    var_1.aligny = "bottom";
    var_1.color = level._id_56B1;
    var_1 setshader( "uav_horizontal_meter", 96, 16 );
    var_1 _id_56B2( var_0 );
    return var_1;
}

_id_4E45( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 40;
    var_1.y = 240;
    var_1.sort = level._id_56B0;
    var_1.alignx = "right";
    var_1.aligny = "middle";
    var_1.color = level._id_56B1;

    if ( getdvarint( "widescreen" ) != 1 )
    {
        var_1.horzalign = "left";
        var_1.vertalign = "top";
    }

    var_1 setshader( "uav_vertical_meter", 16, 96 );
    var_1 _id_56B2( var_0 );
    return var_1;
}

_id_4803( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 320;
    var_1.y = 240;
    var_1.sort = level._id_56B0;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1 setshader( "uav_crosshair", 320, 240 );
    var_1 _id_56B2( var_0 );
    return var_1;
}

_id_56B4( var_0, var_1 )
{
    self._id_47E6["lower_right"][var_0]._id_44DF setvalue( var_1 );
}

_id_574A( var_0, var_1, var_2 )
{
    var_3 = self._id_47E6[var_0][var_1]._id_574B;
    var_3["deg"] setvalue( var_2[0] );
    var_3["min"] setvalue( var_2[1] );
    var_3["sec"] setvalue( var_2[2] );
}

_id_56B5( var_0, var_1 )
{
    self._id_47E6[var_0]._id_44DF setvalue( var_1 );
}

_id_4E48( var_0 )
{
    var_1 = [];
    var_1["nar"] = [ &"UAV_NAR", "none" ];
    var_1["white"] = [ &"UAV_WHT", "none" ];
    var_1["rate"] = [ &"UAV_RATE", "none" ];
    var_1["angle"] = [ &"UAV_RATIO", "none" ];
    var_1["numbers"] = [ &"UAV_ABOVE_TEMP_NUMBERS", "none" ];
    var_1["temp"] = [ &"UAV_TEMP", "none" ];
    var_2 = _id_4E4B( var_1, 10, 80, "left", var_0 );

    if ( getdvarint( "widescreen" ) != 1 )
    {
        foreach ( var_4 in var_2 )
        {
            var_4.horzalign = "left";
            var_4.vertalign = "top";
        }
    }

    return var_2;
}

_id_4E49( var_0 )
{
    var_1 = [];
    var_1["acft"] = [ &"UAV_ACFT", "none" ];
    var_1["lat"] = [ &"UAV_N", "none" ];
    var_1["long"] = [ &"UAV_W", "none" ];
    var_1["angle"] = [ &"UAV_HAT", "none" ];
    var_2 = _id_4E4B( var_1, 510, 80, "left", var_0 );
    var_3 = [ var_2["lat"], var_2["long"] ];
    _id_574D( var_3 );
    return var_2;
}

_id_4E4A( var_0 )
{
    var_1 = 30;
    var_2 = [];
    var_2["lat"] = [ &"UAV_N", "none" ];
    var_2["long"] = [ &"UAV_W", "none" ];
    var_3 = _id_4E4B( var_2, 500, 335 - var_1, "left", var_0 );
    _id_574D( var_3 );
    var_2 = [];
    var_2["brg"] = [ &"UAV_BRG", "" ];
    var_2["rng_m"] = [ &"UAV_RNG", &"UAV_M" ];
    var_2["rng_nm"] = [ &"UAV_RNG", &"UAV_NM" ];
    var_2["elv"] = [ &"UAV_ELV", &"UAV_F" ];
    var_4 = _id_4E4B( var_2, 510, 360 - var_1, "right", var_0 );

    foreach ( var_7, var_6 in var_4 )
        var_3[var_7] = var_6;

    return var_3;
}

_id_4E4B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_6 = 10 * level._id_56B6;

    foreach ( var_10, var_8 in var_0 )
    {
        var_9 = newhudelem();
        var_9.x = var_1;
        var_9.y = var_2;
        var_9.sort = level._id_56B0;
        var_9.alignx = var_3;
        var_9.aligny = "middle";
        var_9.fontscale = level._id_56B6;
        var_9.color = level._id_56B1;
        var_9 settext( var_8[0] );

        if ( isdefined( var_8[1] ) )
        {
            if ( !_id_4E4C( var_8[1], "none" ) )
                var_9 _id_4E4D( var_8[1], var_4 );
        }
        else
            var_9 _id_4E4D( undefined, var_4 );

        var_9 _id_56B2( var_4 );
        var_5[var_10] = var_9;
        var_2 += var_6;
    }

    return var_5;
}

_id_574C( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    var_3.x = self.x + 30 + var_2;
    var_3.y = self.y;
    var_3.sort = level._id_56B0;
    var_3.alignx = "right";
    var_3.aligny = "middle";
    var_3.fontscale = level._id_56B6;
    var_3.color = level._id_56B1;

    if ( var_1 )
        var_3 settext( var_0 );
    else
        var_3 setvalue( var_0 );

    return var_3;
}

_id_574D( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_2._id_574B = [];
        var_2._id_574B["deg"] = var_2 _id_574C( 0, 0, 0 );
        var_2._id_574B["deg_str"] = var_2 _id_574C( &"UAV_DEGREE", 1, 2 );
        var_2._id_574B["min"] = var_2 _id_574C( 0, 0, 20 );
        var_2._id_574B["min_str"] = var_2 _id_574C( &"UAV_DEGREE", 1, 22 );
        var_2._id_574B["sec"] = var_2 _id_574C( 0, 0, 60 );
        var_2._id_574B["sec_str"] = var_2 _id_574C( &"UAV_QUOTE", 1, 63 );
    }
}

_id_4E4C( var_0, var_1 )
{
    if ( isstring( var_0 ) )
    {
        if ( var_0 == var_1 )
            return 1;
    }

    return 0;
}

_id_4E4D( var_0, var_1 )
{
    var_2 = 75;

    if ( isdefined( var_0 ) && !_id_4E4C( var_0, "" ) )
    {
        var_3 = newhudelem();
        var_3.x = self.x + var_2;
        var_3.y = self.y;
        var_3.alignx = "right";
        var_3.aligny = "middle";
        var_3.fontscale = level._id_56B6;
        var_3.color = level._id_56B1;
        var_3.sort = level._id_56B0;
        var_3 settext( var_0 );
        self._id_44E0 = var_3;
        var_4 = 1;

        if ( var_0 == &"UAV_NM" )
            var_4 = 2;

        var_3 _id_56B2( var_1 );
        var_2 -= 10 * var_4;
    }

    var_5 = newhudelem();
    var_5.x = self.x + var_2;
    var_5.y = self.y;
    var_5.alignx = "right";
    var_5.aligny = "middle";
    var_5.fontscale = level._id_56B6;
    var_5.color = level._id_56B1;
    var_5.sort = level._id_56B0;
    var_5 setvalue( 0 );
    var_5 _id_56B2( var_1 );
    self._id_44DF = var_5;
}

_id_4E4E( var_0, var_1 )
{
    if ( var_0 == "up" )
    {
        var_2 = "uav_arrow_up";
        var_3 = self._id_47E6["horz_meter"];
        var_4 = 320;
        var_5 = var_3.y + 10;
        var_6 = "center";
        var_7 = "top";
    }
    else
    {
        var_2 = "uav_arrow_left";
        var_3 = self._id_47E6["vert_meter"];
        var_4 = var_3.x + 10;
        var_5 = 240;
        var_6 = "left";
        var_7 = "middle";
    }

    var_8 = newhudelem();
    var_8.x = var_4;
    var_8.y = var_5;
    var_8.alignx = var_6;
    var_8.aligny = var_7;
    var_8.sort = level._id_56B0;
    var_8 setshader( var_2, 16, 16 );

    if ( getdvarint( "widescreen" ) != 1 )
    {
        if ( var_0 == "left" )
        {
            var_8.horzalign = "left";
            var_8.vertalign = "top";
        }
    }

    var_8 _id_56B2( var_1 );
    var_8 _id_4E4F( var_0, var_1 );
    return var_8;
}

_id_4E4F( var_0, var_1 )
{
    if ( var_0 == "up" )
    {
        var_2 = self.x;
        var_3 = self.y + 16;
        var_4 = "center";
        var_5 = "top";
    }
    else
    {
        var_2 = self.x + 16;
        var_3 = self.y;
        var_4 = "left";
        var_5 = "middle";
    }

    var_6 = newhudelem();
    var_6.x = var_2;
    var_6.y = var_3;
    var_6.alignx = var_4;
    var_6.aligny = var_5;
    var_6.sort = level._id_56B0;
    var_6 setvalue( 0 );

    if ( getdvarint( "widescreen" ) != 1 )
    {
        if ( var_0 == "left" )
        {
            var_6.horzalign = "left";
            var_6.vertalign = "top";
        }
    }

    var_6 _id_56B2( var_1 );
    self._id_44DF = var_6;
}

_id_574E( var_0, var_1, var_2, var_3, var_4 )
{
    level.player lerpviewangleclamp( var_0, var_0 * 0.5, var_0 * 0.5, var_1, var_2, var_3, var_4 );
}

_id_56B7( var_0 )
{
    common_scripts\utility::flag_clear( "uav_hud_enabled" );
    _id_5748();

    foreach ( var_2 in self._id_47E6 )
    {
        if ( isarray( var_2 ) )
        {
            foreach ( var_4 in var_2 )
                _id_47EA( var_4, var_0 );

            var_2 = undefined;
            continue;
        }

        _id_47EA( var_2, var_0 );
    }

    _id_5751();

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    setsaveddvar( "sm_sunenable", 1.0 );
}

_id_47EA( var_0, var_1 )
{
    if ( isdefined( var_0._id_574B ) )
    {
        foreach ( var_3 in var_0._id_574B )
            var_3 thread _id_56B8( var_1 );
    }

    if ( isdefined( var_0._id_44DF ) )
        var_0._id_44DF thread _id_56B8( var_1 );

    if ( isdefined( var_0._id_44E0 ) )
        var_0._id_44E0 thread _id_56B8( var_1 );

    if ( isdefined( var_0._id_44DF ) )
    {

    }

    var_0 thread _id_56B8( var_1 );
}

_id_56B8( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self fadeovertime( var_0 );
        self.alpha = 0;
        wait(var_0);
    }

    self destroy();
}

_id_574F()
{
    self enableweapons();
    self enableoffhandweapons();
    self freezecontrols( 0 );
}

_id_5750( var_0 )
{
    if ( isdefined( var_0 ) )
        self visionsetthermalforplayer( "uav_flir_Thermal", var_0 );
    else
        self visionsetthermalforplayer( "uav_flir_Thermal", 0.25 );

    maps\_load::_id_1FB1();
    self thermalvisionon();
}

_id_5751()
{
    maps\_load::_id_1FB3();
    self thermalvisionoff();
}

_id_5752( var_0, var_1, var_2 )
{
    self endon( "death" );
    self notify( "stop_uav_target_tracking" );
    self endon( "stop_uav_target_tracking" );
    var_3 = 0.94;
    var_4 = 0.2;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    for (;;)
    {
        var_5 = var_0.origin + ( 0.0, 0.0, 60.0 );

        if ( isdefined( var_2 ) )
        {
            var_6 = anglestoforward( var_0.angles );
            var_5 = var_0.origin + var_6 * var_2;
        }

        var_7 = self.target_ent.origin * var_3 + var_5 * ( 1.0 - var_3 );
        self.target_ent moveto( var_7, var_4 );
        wait(var_4);
    }
}

_id_4E56( var_0 )
{

}

_id_5753()
{
    if ( !isdefined( level._id_5754 ) )
        level._id_5754 = [];

    level._id_5754[self.unique_id] = self;
}

_id_5755( var_0 )
{
    while ( isdefined( var_0 ) && isalive( var_0 ) )
    {
        wait 0.5;
        self.origin = var_0.origin;
    }

    self delete();
}

_id_5756()
{
    level notify( "stop_draw_uav_targets" );

    foreach ( var_1 in level._id_5754 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _id_5759();
    }

    level._id_5754 = undefined;
}

_id_5757()
{
    var_0 = self.unique_id;
    self waittill( "death" );

    if ( isdefined( level._id_5754 ) )
        level._id_5754[var_0] = undefined;

    if ( isdefined( self ) && isdefined( self._id_3C3D ) )
    {
        if ( isdefined( self._id_5758 ) )
            target_remove( self._id_5758 );
        else
            target_remove( self );
    }
}

_id_5759()
{
    if ( isdefined( self._id_3C3D ) )
    {
        self._id_3C3D = undefined;
        target_remove( self );
    }

    level._id_5754[self.unique_id] = undefined;
}

_id_575A()
{
    level endon( "stop_draw_uav_targets" );

    if ( !isdefined( level._id_5754 ) )
        level._id_5754 = [];

    var_0 = 2;
    var_1 = 0;
    var_2 = 1;

    for (;;)
    {
        foreach ( var_4 in level._id_5754 )
        {
            if ( !isdefined( var_4 ) )
                continue;

            if ( !var_4 _id_3C3C( self.player ) )
                continue;

            var_5 = 0;
            var_1++;

            if ( var_1 >= var_0 )
            {
                var_1 = 0;
                wait(var_2);
            }
        }

        wait 0.05;
    }
}

_id_3C3C( var_0 )
{
    if ( isdefined( self._id_3C3D ) && self._id_3C3D )
        return 0;

    self._id_3C3D = 1;
    target_set( self );

    if ( isai( self ) )
    {
        if ( self.team == "axis" )
        {
            target_setshader( self, "uav_enemy_target" );
            target_setscaledrendermode( self, 1 );
            target_drawcornersonly( self, 1 );
        }
        else
            target_setshader( self, "veh_hud_friendly" );
    }
    else if ( isplayer( self ) )
        target_setshader( self, "hud_fofbox_self_sp" );
    else if ( self.code_classname == "script_vehicle" )
        target_setshader( self, "uav_vehicle_target" );
    else
        target_setshader( self, "uav_enemy_target" );

    target_showtoplayer( self, var_0 );
    return 1;
}
