// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4066()
{
    waittillframeend;
    var_0 = getentarray( "caged_chicken", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4067 );
}

_id_4067()
{
    var_0 = maps\_utility::_id_1287( "chicken" );
    thread maps\_anim::_id_1246( var_0, "cage_freakout" );
    var_1 = var_0 maps\_utility::_id_1281( "cage_freakout" );
    var_2 = randomfloatrange( 0, 1.0 );
    var_0 setanimtime( var_1, var_2 );

    for (;;)
    {
        var_0 playsound( "animal_chicken_idle", "sounddone" );
        var_0 waittill( "sounddone" );
    }
}
