// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init_audio()
{
    if ( !isdefined( level.audio ) )
        level.audio = spawnstruct();

    init_reverb();
    init_whizby();
    level.onplayerconnectaudioinit = ::onplayerconnectaudioinit;
}

onplayerconnectaudioinit()
{
    apply_reverb( "default" );
}

init_reverb()
{
    add_reverb( "default", "generic", 0.15, 0.9, 2 );
}

add_reverb( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    is_roomtype_valid( var_1 );
    var_5["roomtype"] = var_1;
    var_5["wetlevel"] = var_2;
    var_5["drylevel"] = var_3;
    var_5["fadetime"] = var_4;
    level.audio.reverb_settings[var_0] = var_5;
}

is_roomtype_valid( var_0 )
{

}

apply_reverb( var_0 )
{
    if ( !isdefined( level.audio.reverb_settings[var_0] ) )
        var_1 = level.audio.reverb_settings["default"];
    else
        var_1 = level.audio.reverb_settings[var_0];

    self setreverb( "snd_enveffectsprio_level", var_1["roomtype"], var_1["drylevel"], var_1["wetlevel"], var_1["fadetime"] );
}

init_whizby()
{
    level.audio.whizby_settings = [];
    set_whizby_radius( 15.0, 30.0, 50.0 );
    set_whizby_spread( 150.0, 250.0, 350.0 );
}

set_whizby_radius( var_0, var_1, var_2 )
{
    level.audio.whizby_settings["radius"] = [ var_0, var_1, var_2 ];
}

set_whizby_spread( var_0, var_1, var_2 )
{
    level.audio.whizby_settings["spread"] = [ var_0, var_1, var_2 ];
}

apply_whizby()
{
    var_0 = level.audio.whizby_settings;
    var_1 = var_0["spread"];
    var_2 = var_0["radius"];
    self setwhizbyspreads( var_1[0], var_1[1], var_1[2] );
    self setwhizbyradii( var_2[0], var_2[1], var_2[2] );
}
