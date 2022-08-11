// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level.defconmode ) || level.defconmode == 0 )
        return;

    if ( !isdefined( game["defcon"] ) )
        game["defcon"] = 4;

    makedvarserverinfo( "scr_defcon", game["defcon"] );
    level.defconstreakadd[5] = 0;
    level.defconstreakadd[4] = 0;
    level.defconstreakadd[3] = -1;
    level.defconstreakadd[2] = -1;
    level.defconstreakadd[1] = -1;
    level.defconpointmod[5] = 1;
    level.defconpointmod[4] = 1;
    level.defconpointmod[3] = 1;
    level.defconpointmod[2] = 1;
    level.defconpointmod[1] = 2;
    updatedefcon( game["defcon"] );
    thread defconkillstreakthread();
}

defconkillstreakwait( var_0 )
{
    for (;;)
    {
        level waittill( "player_got_killstreak_" + var_0, var_1 );
        level notify( "defcon_killstreak", var_0, var_1 );
    }
}

defconkillstreakthread()
{
    level endon( "game_ended" );
    var_0 = 10;
    level thread defconkillstreakwait( var_0 );
    level thread defconkillstreakwait( var_0 - 1 );
    level thread defconkillstreakwait( var_0 - 2 );
    level thread defconkillstreakwait( var_0 * 2 );
    level thread defconkillstreakwait( var_0 * 2 - 1 );
    level thread defconkillstreakwait( var_0 * 2 - 2 );
    level thread defconkillstreakwait( var_0 * 3 );
    level thread defconkillstreakwait( var_0 * 3 - 1 );
    level thread defconkillstreakwait( var_0 * 3 - 2 );

    for (;;)
    {
        level waittill( "defcon_killstreak", var_1, var_2 );

        if ( game["defcon"] <= 1 )
            continue;

        if ( var_1 % var_0 == var_0 - 2 )
        {
            foreach ( var_4 in level.players )
            {
                if ( !isalive( var_4 ) )
                    continue;

                var_4 thread maps\mp\gametypes\_hud_message::playercardsplashnotify( "two_from_defcon", var_2 );
            }

            continue;
        }

        if ( var_1 % var_0 == var_0 - 1 )
        {
            foreach ( var_4 in level.players )
            {
                if ( !isalive( var_4 ) )
                    continue;

                var_4 thread maps\mp\gametypes\_hud_message::playercardsplashnotify( "one_from_defcon", var_2 );
            }

            continue;
        }

        updatedefcon( game["defcon"] - 1, var_2, var_1 );
    }
}

updatedefcon( var_0, var_1, var_2 )
{
    var_0 = int( var_0 );
    var_3 = game["defcon"];
    game["defcon"] = var_0;
    level.objectivepointsmod = level.defconpointmod[var_0];
    setdvar( "scr_defcon", game["defcon"] );

    if ( isdefined( var_1 ) )
        var_1 notify( "changed_defcon" );

    if ( var_0 == var_3 )
        return;

    if ( game["defcon"] == 3 && isdefined( var_1 ) )
    {
        var_1 maps\mp\killstreaks\_killstreaks::givekillstreak( "airdrop_mega" );
        var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "caused_defcon", var_2 );
    }

    foreach ( var_5 in level.players )
    {
        if ( isalive( var_5 ) )
        {
            var_5 thread maps\mp\gametypes\_hud_message::defconsplashnotify( game["defcon"], var_0 < var_3 );

            if ( isdefined( var_1 ) )
                var_5 thread maps\mp\gametypes\_hud_message::playercardsplashnotify( "changed_defcon", var_1 );
        }
    }
}
