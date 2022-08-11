// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.sendmatchdata = getdvar( "sv_hostname" );

    if ( level.sendmatchdata == "" )
        level.sendmatchdata = "CoDHost";

    setdvar( "sv_hostname", level.sendmatchdata );
    level.allowvote = getdvarint( "g_allowvote", 1 );
    setdvar( "g_allowvote", level.allowvote );
    makedvarserverinfo( "ui_allowvote", level.allowvote );
    level.friendlyfire = maps\mp\gametypes\_tweakables::gettweakablevalue( "team", "fftype" );
    makedvarserverinfo( "ui_friendlyfire", level.friendlyfire );
    constraingametype( getdvar( "g_gametype" ) );

    for (;;)
    {
        updateserversettings();
        wait 5;
    }
}

updateserversettings()
{
    var_0 = getdvar( "sv_hostname" );

    if ( level.sendmatchdata != var_0 )
        level.sendmatchdata = var_0;

    var_1 = getdvarint( "g_allowvote", 1 );

    if ( level.allowvote != var_1 )
    {
        level.allowvote = var_1;
        setdvar( "ui_allowvote", level.allowvote );
    }

    var_2 = maps\mp\gametypes\_tweakables::gettweakablevalue( "team", "fftype" );

    if ( level.friendlyfire != var_2 )
    {
        level.friendlyfire = var_2;
        setdvar( "ui_friendlyfire", level.friendlyfire );
    }
}

constraingametype( var_0 )
{
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_0 == "dm" )
        {
            if ( isdefined( var_3.script_gametype_dm ) && var_3.script_gametype_dm != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "tdm" )
        {
            if ( isdefined( var_3.script_gametype_tdm ) && var_3.script_gametype_tdm != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "ctf" )
        {
            if ( isdefined( var_3.script_gametype_ctf ) && var_3.script_gametype_ctf != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "hq" )
        {
            if ( isdefined( var_3.script_gametype_hq ) && var_3.script_gametype_hq != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "sd" )
        {
            if ( isdefined( var_3.script_gametype_sd ) && var_3.script_gametype_sd != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "koth" )
        {
            if ( isdefined( var_3.script_gametype_koth ) && var_3.script_gametype_koth != "1" )
                var_3 delete();
        }
    }
}
