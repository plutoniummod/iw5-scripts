// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7A6E()
{
    common_scripts\utility::flag_init( "nuke_explosion_done" );
}

_id_7A6F()
{

}

_id_7A70()
{
    maps\prague_escape_code::_id_7A46( "airlift_player_spot", "prague_escape_airlift" );
    wait 5;
    _id_7A71();
}

_id_7A71()
{
    thread _id_7A72();
    level.player maps\_utility::_id_25DF( "prague_escape_nuke_flash", 3 );
    wait 0.5;
    common_scripts\utility::exploder( 666 );
    setexpfog( 0, 17000, 0.678352, 0.498765, 0.372533, 1, 0.5 );
    thread _id_7A75();
    thread _id_7A76();
    level.player maps\_utility::delaythread( 1, maps\_utility::_id_25DF, "aftermath", 4 );
    wait 10;
    common_scripts\utility::flag_set( "nuke_explosion_done" );
}

_id_7A72()
{
    level._id_7A73 = getmapsunlight();
    level._id_7A74 = ( 3.11, 2.05, 1.67 );
    maps\_utility::_id_25E1( level._id_7A73, level._id_7A74, 2 );
    wait 1;
    thread maps\_utility::_id_25E1( level._id_7A74, level._id_7A73, 2 );
}

_id_7A75()
{
    earthquake( 0.3, 0.5, level.player.origin, 80000 );
    setblur( 3, 0.1 );
    wait 1;
    setblur( 0, 0.5 );
}

_id_7A76()
{
    wait 1;
    var_0 = gettime() + 5000;

    while ( gettime() < var_0 )
    {
        earthquake( 0.08, 0.05, level.player.origin, 80000 );
        wait 0.05;
    }

    earthquake( 0.5, 1, level.player.origin, 80000 );

    while ( !common_scripts\utility::flag( "nuke_explosion_done" ) )
    {
        earthquake( 0.25, 0.05, level.player.origin, 80000 );
        wait 0.05;
    }
}
