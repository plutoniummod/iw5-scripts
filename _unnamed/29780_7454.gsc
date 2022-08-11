// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_745E( var_0 )
{
    common_scripts\utility::flag_init( "atvi_credits_go" );
    level._id_745F = 1.35;
    level._id_7460 = 1.75;
    level._id_7461 = [];
    level._id_7462 = 22.5;
    level._id_7463 = -120;
    maps\_utility::_id_1DE7();

    if ( !isdefined( var_0 ) )
        var_0 = "all";

    switch ( var_0 )
    {
        case "all":
            maps\creditsmw3::_id_745D();
            break;
    }
}

_id_746E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
        precachestring( var_0 );

    if ( isdefined( var_2 ) )
        precachestring( var_2 );

    if ( !isdefined( var_4 ) )
        var_4 = level._id_745F;

    var_5 = spawnstruct();
    var_5.type = "entry";
    var_5._id_746F = var_0;
    var_5._id_7470 = var_1;
    var_5._id_7471 = var_2;
    var_5._id_7472 = var_3;
    var_5._id_7473 = var_4;
    level._id_7461[level._id_7461.size] = var_5;
}

_id_7456()
{
    _id_74A5();
}

_id_7455( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 1.5 * level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "titlec";
    var_2._id_3E1B = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7474( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 1.25 * level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "subtitlec";
    var_2._id_7475 = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7457( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 1.2 * level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "headerlr";
    var_3._id_5C80 = var_0;
    var_3.right = var_1;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_7476( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "subheaderlr";
    var_3._id_5C80 = var_0;
    var_3.right = var_1;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_7477( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "subheaderl";
    var_2._id_5C80 = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7478( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "subheaderr";
    var_2.right = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_002D( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "centered";
    var_2._id_002E = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_002F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = level._id_745F;

    var_5 = spawnstruct();
    var_5.type = "credit4";
    var_5._id_7473 = var_4;
    var_5._id_0030 = [];

    if ( isdefined( var_0 ) )
    {
        precachestring( var_0 );
        var_5._id_0030[0] = var_0;
    }

    if ( isdefined( var_1 ) )
    {
        precachestring( var_1 );
        var_5._id_0030[1] = var_1;
    }

    if ( isdefined( var_2 ) )
    {
        precachestring( var_2 );
        var_5._id_0030[2] = var_2;
    }

    if ( isdefined( var_3 ) )
    {
        precachestring( var_3 );
        var_5._id_0030[3] = var_3;
    }

    level._id_7461[level._id_7461.size] = var_5;
}

_id_000C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_6 ) )
        var_6 = level._id_745F;

    var_7 = spawnstruct();
    var_7.type = "credit3f";
    var_7._id_7473 = var_6;
    var_7._id_0030 = [];
    var_7._id_000D = [];

    if ( isdefined( var_0 ) )
    {
        precachestring( var_0 );
        var_7._id_0030[0] = var_0;
        var_7._id_000D[0] = var_1;
    }

    if ( isdefined( var_2 ) )
    {
        precachestring( var_2 );
        var_7._id_0030[1] = var_2;
        var_7._id_000D[1] = var_3;
    }

    if ( isdefined( var_4 ) )
    {
        precachestring( var_4 );
        var_7._id_0030[2] = var_4;
        var_7._id_000D[2] = var_5;
    }

    level._id_7461[level._id_7461.size] = var_7;
}

_id_0029( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = level._id_745F;

    var_4 = spawnstruct();
    var_4.type = "credit3";
    var_4._id_7473 = var_3;
    var_4._id_0030 = [];

    if ( isdefined( var_0 ) )
    {
        precachestring( var_0 );
        var_4._id_0030[0] = var_0;
    }

    if ( isdefined( var_1 ) )
    {
        precachestring( var_1 );
        var_4._id_0030[1] = var_1;
    }

    if ( isdefined( var_2 ) )
    {
        precachestring( var_2 );
        var_4._id_0030[2] = var_2;
    }

    level._id_7461[level._id_7461.size] = var_4;
}

_id_7458( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "creditlr";
    var_3._id_5C80 = var_0;
    var_3.right = var_1;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_745C( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "creditl";
    var_2._id_5C80 = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_745A( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "creditr";
    var_2.right = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7479( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "creditlshr";
    var_3._id_5C80 = var_0;
    var_3.right = var_1;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_747A( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "lefttitle";
    var_2._id_3E1B = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_747B( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "leftname";
    var_2.name = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_747C( var_0, var_1 )
{
    _id_747B( var_0, var_1 );
}

_id_747D( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "subleftname";
    var_2.name = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_747E( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "righttitle";
    var_2._id_3E1B = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_747F( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "rightname";
    var_2.name = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7480( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "centerheading";
    var_2._id_7481 = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7482( var_0, var_1, var_2 )
{
    precachestring( var_1 );
    precachestring( var_0 );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "castname";
    var_3._id_3E1B = var_1;
    var_3.name = var_0;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_7483( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level._id_745F;

    var_2 = spawnstruct();
    var_2.type = "centername";
    var_2.name = var_0;
    var_2._id_7473 = var_1;
    level._id_7461[level._id_7461.size] = var_2;
}

_id_7484( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "centernamedouble";
    var_3._id_7485 = var_0;
    var_3._id_7486 = var_1;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_7487( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_745F;

    var_3 = spawnstruct();
    var_3.type = "centerdual";
    var_3._id_3E1B = var_0;
    var_3.name = var_1;
    var_3._id_7473 = var_2;
    level._id_7461[level._id_7461.size] = var_3;
}

_id_7488( var_0, var_1, var_2, var_3 )
{
    precachestring( var_0 );
    precachestring( var_1 );
    precachestring( var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = level._id_745F;

    var_4 = spawnstruct();
    var_4.type = "centertriple";
    var_4._id_7485 = var_0;
    var_4._id_7486 = var_1;
    var_4._id_7489 = var_2;
    var_4._id_7473 = var_3;
    level._id_7461[level._id_7461.size] = var_4;
}

_id_748A()
{
    var_0 = spawnstruct();
    var_0.type = "space";
    level._id_7461[level._id_7461.size] = var_0;
}

_id_748B()
{
    var_0 = spawnstruct();
    var_0.type = "spacesmall";
    level._id_7461[level._id_7461.size] = var_0;
}

_id_748C( var_0, var_1, var_2, var_3 )
{
    precacheshader( var_0 );
    var_4 = spawnstruct();
    var_4.type = "centerimage";
    var_4._id_405D = var_0;
    var_4.width = var_1;
    var_4.height = var_2;
    var_4.sort = 2;

    if ( isdefined( var_3 ) )
        var_4.delay = var_3;

    level._id_7461[level._id_7461.size] = var_4;
}

_id_748D( var_0, var_1, var_2, var_3 )
{
    precacheshader( var_0 );
    var_4 = spawnstruct();
    var_4.type = "leftimage";
    var_4._id_405D = var_0;
    var_4.width = var_1;
    var_4.height = var_2;
    var_4.sort = 2;

    if ( isdefined( var_3 ) )
        var_4.delay = var_3;

    level._id_7461[level._id_7461.size] = var_4;
}

_id_748E()
{
    visionsetnaked( "", 0 );
    var_0 = getdvar( "ui_char_museum_mode" );

    for ( var_1 = 0; var_1 < level._id_7461.size; var_1++ )
    {
        var_2 = 0.5;
        var_3 = level._id_7461[var_1].type;

        if ( var_3 == "centerimage" )
        {
            if ( isdefined( var_0 ) && var_0 != "credits_black" )
                common_scripts\utility::flag_wait( "atvi_credits_go" );

            var_4 = level._id_7461[var_1]._id_405D;
            var_5 = level._id_7461[var_1].width;
            var_6 = level._id_7461[var_1].height;
            var_7 = newhudelem();
            var_7 setshader( var_4, var_5, var_6 );
            var_7.alignx = "center";
            var_7.horzalign = "center";
            var_7.x = 0;
            var_7.y = 480;
            var_7.sort = 2;
            var_7.foreground = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;

            if ( isdefined( level._id_7461[var_1].delay ) )
                var_2 = level._id_7461[var_1].delay;
            else
                var_2 = 0.037 * var_6;
        }
        else if ( var_3 == "leftimage" )
        {
            var_4 = level._id_7461[var_1]._id_405D;
            var_5 = level._id_7461[var_1].width;
            var_6 = level._id_7461[var_1].height;
            var_7 = newhudelem();
            var_7 setshader( var_4, var_5, var_6 );
            var_7.alignx = "center";
            var_7.horzalign = "left";
            var_7.x = 128;
            var_7.y = 480;
            var_7.sort = 2;
            var_7.foreground = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
            var_2 = 0.037 * var_6;
        }
        else if ( var_3 == "lefttitle" )
        {
            var_8 = level._id_7461[var_1]._id_3E1B;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_8 );
            var_7.alignx = "left";
            var_7.horzalign = "left";
            var_7.x = 28;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
            var_7 thread _id_7494();
        }
        else if ( var_3 == "leftname" )
        {
            var_10 = level._id_7461[var_1].name;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_10 );
            var_7.alignx = "left";
            var_7.horzalign = "left";
            var_7.x = 60;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
            var_7 thread _id_7494();
        }
        else if ( var_3 == "castname" )
        {
            var_8 = level._id_7461[var_1]._id_3E1B;
            var_10 = level._id_7461[var_1].name;
            var_9 = level._id_7461[var_1]._id_7473;
            var_11 = newhudelem();
            var_11 settext( var_8 );
            var_11.alignx = "left";
            var_11.horzalign = "left";
            var_11.x = 60;
            var_11.y = 480;

            if ( !level.console )
                var_11.font = "default";
            else
                var_11.font = "small";

            var_11.fontscale = var_9;
            var_11.sort = 2;
            var_11.glowcolor = ( 0.3, 0.6, 0.3 );
            var_11.glowalpha = 1;
            var_12 = newhudelem();
            var_12 settext( var_10 );
            var_12.alignx = "right";
            var_12.horzalign = "left";
            var_12.x = 275;
            var_12.y = 480;

            if ( !level.console )
                var_12.font = "default";
            else
                var_12.font = "small";

            var_12.fontscale = var_9;
            var_12.sort = 2;
            var_12.glowcolor = ( 0.3, 0.6, 0.3 );
            var_12.glowalpha = 1;
            var_11 thread _id_7493( level._id_7462 );
            var_11 moveovertime( level._id_7462 );
            var_11.y = level._id_7463;
            var_12 thread _id_7493( level._id_7462 );
            var_12 moveovertime( level._id_7462 );
            var_12.y = level._id_7463;
            var_11 thread _id_7494();
            var_12 thread _id_7494();
        }
        else if ( var_3 == "subleftname" )
        {
            var_10 = level._id_7461[var_1].name;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_10 );
            var_7.alignx = "left";
            var_7.horzalign = "left";
            var_7.x = 92;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
            var_7 thread _id_7494();
        }
        else if ( var_3 == "righttitle" )
        {
            var_8 = level._id_7461[var_1]._id_3E1B;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_8 );
            var_7.alignx = "left";
            var_7.horzalign = "right";
            var_7.x = -132;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
        }
        else if ( var_3 == "rightname" )
        {
            var_10 = level._id_7461[var_1].name;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_10 );
            var_7.alignx = "left";
            var_7.horzalign = "right";
            var_7.x = -100;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
        }
        else if ( var_3 == "centerheading" )
        {
            var_13 = level._id_7461[var_1]._id_7481;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_13 );
            var_7.alignx = "center";
            var_7.horzalign = "center";
            var_7.x = 0;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
        }
        else if ( var_3 == "centerdual" )
        {
            var_8 = level._id_7461[var_1]._id_3E1B;
            var_10 = level._id_7461[var_1].name;
            var_9 = level._id_7461[var_1]._id_7473;
            var_11 = newhudelem();
            var_11 settext( var_8 );
            var_11.alignx = "right";
            var_11.horzalign = "center";
            var_11.x = -8;
            var_11.y = 480;

            if ( !level.console )
                var_11.font = "default";
            else
                var_11.font = "small";

            var_11.fontscale = var_9;
            var_11.sort = 2;
            var_11.glowcolor = ( 0.3, 0.6, 0.3 );
            var_11.glowalpha = 1;
            var_12 = newhudelem();
            var_12 settext( var_10 );
            var_12.alignx = "left";
            var_12.horzalign = "center";
            var_12.x = 8;
            var_12.y = 480;

            if ( !level.console )
                var_12.font = "default";
            else
                var_12.font = "small";

            var_12.fontscale = var_9;
            var_12.sort = 2;
            var_12.glowcolor = ( 0.3, 0.6, 0.3 );
            var_12.glowalpha = 1;
            var_11 thread _id_7493( level._id_7462 );
            var_11 moveovertime( level._id_7462 );
            var_11.y = level._id_7463;
            var_12 thread _id_7493( level._id_7462 );
            var_12 moveovertime( level._id_7462 );
            var_12.y = level._id_7463;
        }
        else if ( var_3 == "centertriple" )
        {
            var_14 = level._id_7461[var_1]._id_7485;
            var_15 = level._id_7461[var_1]._id_7486;
            var_16 = level._id_7461[var_1]._id_7489;
            var_9 = level._id_7461[var_1]._id_7473;
            var_11 = newhudelem();
            var_11 settext( var_14 );
            var_11.alignx = "center";
            var_11.horzalign = "center";
            var_11.x = -160;
            var_11.y = 480;

            if ( !level.console )
                var_11.font = "default";
            else
                var_11.font = "small";

            var_11.fontscale = var_9;
            var_11.sort = 2;
            var_11.glowcolor = ( 0.3, 0.6, 0.3 );
            var_11.glowalpha = 1;
            var_12 = newhudelem();
            var_12 settext( var_15 );
            var_12.alignx = "center";
            var_12.horzalign = "center";
            var_12.x = 0;
            var_12.y = 480;

            if ( !level.console )
                var_12.font = "default";
            else
                var_12.font = "small";

            var_12.fontscale = var_9;
            var_12.sort = 2;
            var_12.glowcolor = ( 0.3, 0.6, 0.3 );
            var_12.glowalpha = 1;
            var_17 = newhudelem();
            var_17 settext( var_16 );
            var_17.alignx = "center";
            var_17.horzalign = "center";
            var_17.x = 160;
            var_17.y = 480;

            if ( !level.console )
                var_17.font = "default";
            else
                var_17.font = "small";

            var_17.fontscale = var_9;
            var_17.sort = 2;
            var_17.glowcolor = ( 0.3, 0.6, 0.3 );
            var_17.glowalpha = 1;
            var_11 thread _id_7493( level._id_7462 );
            var_11 moveovertime( level._id_7462 );
            var_11.y = level._id_7463;
            var_12 thread _id_7493( level._id_7462 );
            var_12 moveovertime( level._id_7462 );
            var_12.y = level._id_7463;
            var_17 thread _id_7493( level._id_7462 );
            var_17 moveovertime( level._id_7462 );
            var_17.y = level._id_7463;
        }
        else if ( var_3 == "centername" )
        {
            var_10 = level._id_7461[var_1].name;
            var_9 = level._id_7461[var_1]._id_7473;
            var_7 = newhudelem();
            var_7 settext( var_10 );
            var_7.alignx = "left";
            var_7.horzalign = "center";
            var_7.x = 8;
            var_7.y = 480;

            if ( !level.console )
                var_7.font = "default";
            else
                var_7.font = "small";

            var_7.fontscale = var_9;
            var_7.sort = 2;
            var_7.glowcolor = ( 0.3, 0.6, 0.3 );
            var_7.glowalpha = 1;
            var_7 thread _id_7493( level._id_7462 );
            var_7 moveovertime( level._id_7462 );
            var_7.y = level._id_7463;
        }
        else if ( var_3 == "centernamedouble" )
        {
            var_14 = level._id_7461[var_1]._id_7485;
            var_15 = level._id_7461[var_1]._id_7486;
            var_9 = level._id_7461[var_1]._id_7473;
            var_11 = newhudelem();
            var_11 settext( var_14 );
            var_11.alignx = "center";
            var_11.horzalign = "center";
            var_11.x = -80;
            var_11.y = 480;

            if ( !level.console )
                var_11.font = "default";
            else
                var_11.font = "small";

            var_11.fontscale = var_9;
            var_11.sort = 2;
            var_11.glowcolor = ( 0.3, 0.6, 0.3 );
            var_11.glowalpha = 1;
            var_12 = newhudelem();
            var_12 settext( var_15 );
            var_12.alignx = "center";
            var_12.horzalign = "center";
            var_12.x = 80;
            var_12.y = 480;

            if ( !level.console )
                var_12.font = "default";
            else
                var_12.font = "small";

            var_12.fontscale = var_9;
            var_12.sort = 2;
            var_12.glowcolor = ( 0.3, 0.6, 0.3 );
            var_12.glowalpha = 1;
            var_11 thread _id_7493( level._id_7462 );
            var_11 moveovertime( level._id_7462 );
            var_11.y = level._id_7463;
            var_12 thread _id_7493( level._id_7462 );
            var_12 moveovertime( level._id_7462 );
            var_12.y = level._id_7463;
        }
        else if ( _id_7491( var_3, var_1 ) )
        {

        }
        else if ( var_3 == "spacesmall" )
            var_2 = 0.1875;
        else
        {

        }

        wait(var_2 * level._id_7462 / 22.5);
    }
}

_id_748F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = newhudelem();

    if ( !level.console )
        var_2.font = "default";
    else
        var_2.font = "small";

    var_2.fontscale = var_0;
    var_2.sort = 2;
    var_2.glowcolor = ( 0.3, 0.6, 0.3 );
    var_2.glowalpha = 1;
    var_2.color = ( var_1, var_1, var_1 );
    return var_2;
}

_id_7490()
{
    thread _id_7493( level._id_7462 );
    self moveovertime( level._id_7462 );
    self.y = level._id_7463;
}

_id_000E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;
    else if ( var_0 == "subtitle" )
    {
        self.color = ( 1.0, 1.0, 1.0 );
        self.glowcolor = ( 0.2, 0.4, 0.2 );
        self.glowalpha = 1;
    }
}

_id_7491( var_0, var_1 )
{
    var_2 = 60;
    var_3 = -60;
    var_4 = 0;
    var_5 = 480;

    if ( var_0 == "credit3f" )
    {
        var_6 = [ 60, 0, -60 ];
        var_7 = [ "left", "center", "right" ];
        var_8 = [ "left", "center", "right" ];
        var_9 = level._id_7461[var_1];
        var_10 = var_9._id_7473;

        for ( var_1 = 0; var_1 < 3; var_1++ )
        {
            if ( isdefined( var_9._id_0030[var_1] ) )
            {
                var_11 = _id_748F( var_10, 0.8 );
                var_11 settext( var_9._id_0030[var_1] );
                var_11.alignx = var_7[var_1];
                var_11.horzalign = var_8[var_1];
                var_11.x = var_6[var_1];
                var_11.y = var_5;
                var_11.glowcolor = ( 0.0, 0.0, 0.0 );
                var_11.glowalpha = 0;
                var_11 _id_000E( var_9._id_000D[var_1] );
                var_11 thread _id_7490();
            }
        }

        return 1;
    }
    else if ( var_0 == "credit3" )
    {
        var_6 = [ 60, 0, -60 ];
        var_7 = [ "left", "center", "right" ];
        var_8 = [ "left", "center", "right" ];
        var_9 = level._id_7461[var_1];
        var_10 = var_9._id_7473;

        for ( var_1 = 0; var_1 < 3; var_1++ )
        {
            if ( isdefined( var_9._id_0030[var_1] ) )
            {
                var_11 = _id_748F( var_10, 0.9 );
                var_11 settext( var_9._id_0030[var_1] );
                var_11.alignx = var_7[var_1];
                var_11.horzalign = var_8[var_1];
                var_11.x = var_6[var_1];
                var_11.y = var_5;
                var_11.glowcolor = ( 0.0, 0.0, 0.0 );
                var_11.glowalpha = 0;
                var_11 thread _id_7490();
            }
        }

        return 1;
    }
    else if ( var_0 == "credit4" )
    {
        var_12 = [ 20, 220, -220, -20 ];
        var_13 = [ "left", "left", "right", "right" ];
        var_14 = [ "left", "left", "right", "right" ];
        var_9 = level._id_7461[var_1];
        var_10 = var_9._id_7473;

        for ( var_1 = 0; var_1 < 4; var_1++ )
        {
            if ( isdefined( var_9._id_0030[var_1] ) )
            {
                var_11 = _id_748F( var_10, 0.9 );
                var_11 settext( var_9._id_0030[var_1] );
                var_11.alignx = var_13[var_1];
                var_11.horzalign = var_14[var_1];
                var_11.x = var_12[var_1];
                var_11.y = var_5;
                var_11.glowcolor = ( 0.0, 0.0, 0.0 );
                var_11.glowalpha = 0;
                var_11 thread _id_7490();
            }
        }

        return 1;
    }
    else if ( var_0 == "creditlr" )
    {
        var_15 = level._id_7461[var_1]._id_5C80;
        var_16 = level._id_7461[var_1].right;
        var_10 = level._id_7461[var_1]._id_7473;
        var_11 = _id_748F( var_10, 0.9 );
        var_11 settext( var_15 );
        var_11.alignx = "left";
        var_11.horzalign = "left";
        var_11.x = var_2;
        var_11.y = var_5;
        var_17 = _id_748F( var_10, 0.9 );
        var_17 settext( var_16 );
        var_17.alignx = "right";
        var_17.horzalign = "right";
        var_17.x = var_3;
        var_17.y = var_5;
        var_11 thread _id_7490();
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "creditl" )
    {
        var_15 = level._id_7461[var_1]._id_5C80;
        var_10 = level._id_7461[var_1]._id_7473;
        var_11 = _id_748F( var_10, 0.9 );
        var_11 settext( var_15 );
        var_11.alignx = "left";
        var_11.horzalign = "left";
        var_11.x = var_2;
        var_11.y = var_5;
        var_11 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "creditr" )
    {
        var_16 = level._id_7461[var_1].right;
        var_10 = level._id_7461[var_1]._id_7473;
        var_17 = _id_748F( var_10, 0.9 );
        var_17 settext( var_16 );
        var_17.alignx = "right";
        var_17.horzalign = "right";
        var_17.x = var_3;
        var_17.y = var_5;
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "subheaderlr" )
    {
        var_15 = level._id_7461[var_1]._id_5C80;
        var_16 = level._id_7461[var_1].right;
        var_10 = level._id_7461[var_1]._id_7473;
        var_11 = _id_748F( var_10 );
        var_11 settext( var_15 );
        var_11.alignx = "left";
        var_11.horzalign = "left";
        var_11.x = var_2;
        var_11.y = var_5;
        var_11.glowcolor = ( 0.45, 0.9, 0.45 );
        var_17 = _id_748F( var_10 );
        var_17 settext( var_16 );
        var_17.alignx = "right";
        var_17.horzalign = "right";
        var_17.x = var_3;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.45, 0.9, 0.45 );
        var_11 thread _id_7490();
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "subheaderl" )
    {
        var_15 = level._id_7461[var_1]._id_5C80;
        var_10 = level._id_7461[var_1]._id_7473;
        var_11 = _id_748F( var_10 );
        var_11 settext( var_15 );
        var_11.alignx = "left";
        var_11.horzalign = "left";
        var_11.x = var_2;
        var_11.y = var_5;
        var_11.glowcolor = ( 0.45, 0.9, 0.45 );
        var_11 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "subheaderr" )
    {
        var_16 = level._id_7461[var_1].right;
        var_10 = level._id_7461[var_1]._id_7473;
        var_17 = _id_748F( var_10 );
        var_17 settext( var_16 );
        var_17.alignx = "right";
        var_17.horzalign = "right";
        var_17.x = var_3;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.45, 0.9, 0.45 );
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "headerlr" )
    {
        var_15 = level._id_7461[var_1]._id_5C80;
        var_16 = level._id_7461[var_1].right;
        var_10 = level._id_7461[var_1]._id_7473;
        var_11 = _id_748F( var_10 );
        var_11 settext( var_15 );
        var_11.alignx = "left";
        var_11.horzalign = "left";
        var_11.x = var_2;
        var_11.y = var_5;
        var_11.glowcolor = ( 0.6, 0.9, 0.6 );
        var_17 = _id_748F( var_10 );
        var_17 settext( var_16 );
        var_17.alignx = "right";
        var_17.horzalign = "right";
        var_17.x = var_3;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.6, 0.9, 0.6 );
        var_11 thread _id_7490();
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "centered" )
    {
        var_18 = level._id_7461[var_1]._id_002E;
        var_10 = level._id_7461[var_1]._id_7473;
        var_17 = _id_748F( var_10 );
        var_17 settext( var_18 );
        var_17.alignx = "center";
        var_17.horzalign = "center";
        var_17.x = var_4;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.0, 0.0, 0.0 );
        var_17.glowalpha = 0;
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "subtitlec" )
    {
        var_16 = level._id_7461[var_1]._id_7475;
        var_10 = level._id_7461[var_1]._id_7473;
        var_17 = _id_748F( var_10 );
        var_17 settext( var_16 );
        var_17.alignx = "center";
        var_17.horzalign = "center";
        var_17.x = var_4;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.45, 0.9, 0.45 );
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "titlec" )
    {
        var_16 = level._id_7461[var_1]._id_3E1B;
        var_10 = level._id_7461[var_1]._id_7473;
        var_17 = _id_748F( var_10 );
        var_17 settext( var_16 );
        var_17.alignx = "center";
        var_17.horzalign = "center";
        var_17.x = var_4;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.6, 0.9, 0.6 );
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "creditlshr" )
    {
        var_15 = level._id_7461[var_1]._id_5C80;
        var_19 = level._id_7461[var_1].right;
        var_10 = level._id_7461[var_1]._id_7473;
        var_11 = _id_748F( var_10 );
        var_11 settext( var_15 );
        var_11.alignx = "left";
        var_11.horzalign = "left";
        var_11.x = var_2;
        var_11.y = var_5;
        var_17 = _id_748F( var_10 );
        var_17 settext( var_19 );
        var_17.alignx = "right";
        var_17.horzalign = "right";
        var_17.x = var_3;
        var_17.y = var_5;
        var_17.glowcolor = ( 0.45, 0.9, 0.45 );
        var_11 thread _id_7490();
        var_17 thread _id_7490();
        return 1;
    }
    else if ( var_0 == "entry" )
    {
        var_20 = level._id_7461[var_1]._id_746F;
        var_21 = level._id_7461[var_1]._id_7470;
        var_22 = level._id_7461[var_1]._id_7471;
        var_23 = level._id_7461[var_1]._id_7472;
        var_10 = level._id_7461[var_1]._id_7473;

        if ( isdefined( var_20 ) )
        {
            var_11 = _id_748F( var_10 );
            var_11 settext( var_20 );
            _id_7492( var_11, var_21, "left", var_2, var_5 );
            var_11 thread _id_7490();
        }

        if ( isdefined( var_22 ) )
        {
            var_17 = _id_748F( var_10 );
            var_17 settext( var_22 );
            _id_7492( var_17, var_23, "right", var_3, var_5 );
            var_17 thread _id_7490();
        }

        return 1;
    }

    return 0;
}

_id_7492( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 0;
    var_7 = 0.9;
    var_0.alignx = var_3;
    var_0.horzalign = var_3;
    var_0.x = var_4;
    var_0.y = var_5;

    switch ( var_1 )
    {
        case "title":
            var_0.alignx = "center";
            var_0.horzalign = "center";
            var_0.x = var_6;
            var_0.y = var_5;
            var_0.glowcolor = ( 0.6, 0.9, 0.6 );
            var_0.fontscale = 1.5 * var_2;
            break;
        case "subtitle":
            var_0.alignx = "center";
            var_0.horzalign = "center";
            var_0.x = var_6;
            var_0.y = var_5;
            var_0.glowcolor = ( 0.45, 0.9, 0.45 );
            var_0.fontscale = 1.25 * var_2;
            break;
        case "header":
            var_0.alignx = "center";
            var_0.horzalign = "center";
            var_0.x = var_6;
            var_0.y = var_5;
            var_0.glowcolor = ( 0.45, 0.9, 0.45 );
            var_0.fontscale = 1.2 * var_2;
            break;
        case "subheader":
            var_0.glowcolor = ( 0.45, 0.9, 0.45 );
            break;
        case "credit":
            var_0.color = ( var_7, var_7, var_7 );
            break;
        default:
            break;
    }
}

_id_7493( var_0 )
{
    wait(var_0 - 2);
    self destroy();
}

_id_7494()
{
    self.alpha = 0;
    wait(level._id_7462 * 0.08);
    self fadeovertime( 0.2 );
    self.alpha = 1;
    self setpulsefx( 50, int( level._id_7462 * 0.6 * 1000 ), 500 );
}

_id_7495( var_0, var_1 )
{
    _id_747C( var_0 );
    _id_748B();
    _id_747D( var_1 );
    _id_748A();
}

_id_7496( var_0, var_1 )
{
    _id_747A( var_0 );
    _id_748B();
    _id_747B( var_1 );
    _id_748A();
}

_id_7497( var_0, var_1 )
{
    _id_747A( var_0 );
    _id_748B();
    _id_747B( var_1 );
}

_id_7498( var_0, var_1 )
{
    _id_747C( var_0 );
    _id_748B();
    _id_747D( var_1 );
}

_id_7499( var_0, var_1 )
{
    _id_747B( var_0 );
    _id_747B( var_1 );
}

_id_749A( var_0, var_1 )
{
    _id_747D( var_0 );
    _id_747D( var_1 );
}

_id_749B( var_0, var_1, var_2 )
{
    _id_747D( var_0 );
    _id_747D( var_1 );
    _id_747D( var_2 );
}

_id_749C( var_0, var_1, var_2, var_3 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_748D( var_0, var_1, var_2, var_3 );
    else
        _id_748C( var_0, var_1, var_2, var_3 );
}

_id_749D( var_0 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_747A( var_0 );
    else
        _id_7480( var_0 );
}

_id_749E( var_0 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_747C( var_0 );
    else
        _id_7480( var_0 );
}

_id_749F( var_0, var_1 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
    {
        _id_747A( var_0 );
        _id_748B();
        _id_747B( var_1 );
    }
    else
        _id_7487( var_0, var_1 );
}

_id_74A0( var_0, var_1 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
    {
        _id_747C( var_0 );
        _id_748B();
        _id_747D( var_1 );
    }
    else
        _id_7487( var_0, var_1 );
}

_id_74A1( var_0, var_1, var_2 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_7482( var_0, var_1 );
    else
        _id_7480( var_0 );
}

_id_74A2( var_0 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_747B( var_0 );
    else
        _id_7483( var_0 );
}

_id_74A3( var_0 )
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_747D( var_0 );
    else
        _id_7483( var_0 );
}

_id_74A4()
{
    if ( getdvar( "ui_char_museum_mode" ) != "credits_black" )
        _id_748A();
    else
        _id_748B();
}

_id_74A5()
{
    _id_748A();
    _id_748A();
}

_id_74A6()
{
    _id_74A7();
    _id_74A8();
    _id_74A9();
    _id_74AA();
    _id_74AB();
    _id_74AC();
    _id_74AD();
    _id_74AE();
    _id_74AF();
    _id_74B0();
    _id_74B1();
    _id_74B2();
    _id_74B3();
}

_id_74A7()
{
    _id_748C( "logo_activision", 256, 128, 3.875 );
    _id_748A();
    _id_748A();
    _id_7480( &"CREDIT_PRODUCTION" );
    _id_748B();
    _id_7487( &"CREDIT_PRODUCER", &"CREDIT_CHRIS_WILLIAMS" );
    _id_748B();
    _id_7487( &"CREDIT_ASSOCIATE_PRODUCERS", &"CREDIT_VINCENT_FENNEL" );
    _id_7483( &"CREDIT_TAYLOR_LIVINGSTON" );
    _id_7483( &"CREDIT_DEREK_RACCA" );
    _id_748B();
    _id_7487( &"CREDIT_PRODUCTION_COORDINAT", &"CREDIT_ADRIENNE_ARRASMITH" );
    _id_748B();
    _id_7487( &"CREDIT_ADDITIONAL_PRODUCTIO", &"CREDIT_RHETT_CHASSEREAU" );
    _id_748B();
    _id_7487( &"CREDIT_SENIOR_EXECUTIVE_PRO", &"CREDIT_MARCUS_IREMONGER" );
    _id_748B();
    _id_7487( &"CREDIT_HEAD_OF_PRODUCTION", &"CREDIT_STEVE_ACKRICH" );
    _id_74A5();
}

_id_74A8()
{
    _id_7480( &"CREDIT_PUBLIC_RELATIONS" );
    _id_748B();
    _id_7487( &"CREDIT_DIRECTOR_OWNED_PROPE", &"CREDIT_MIKE_MANTARRO" );
    _id_748B();
    _id_7487( &"CREDIT_PR_MANAGER", &"CREDIT_JOHN_RAFACZ" );
    _id_748B();
    _id_7487( &"CREDIT_JUNIOR_PUBLICIST", &"CREDIT_MONICA_PONTRELLI" );
    _id_7483( &"CREDIT_JOSHUA_SELINGER" );
    _id_748B();
    _id_7487( &"CREDIT_EUROPEAN_PR_DIRECTOR", &"CREDIT_NICK_GRANGE" );
    _id_74A5();
}

_id_74A9()
{
    _id_7480( &"CREDIT_PRODUCTION_SERVICES_" );
    _id_748B();
    _id_7487( &"CREDIT_SENIOR_DIRECTOR_OF_P", &"CREDIT_BARRY_KEHOE" );
    _id_748B();
    _id_7487( &"CREDIT_LOCALISATION_MANAGER", &"CREDIT_FIONA_EBBS" );
    _id_748B();
    _id_7487( &"CREDIT_SENIOR_LOCALIZATION_", &"CREDIT_ANNETTE_LEE" );
    _id_748B();
    _id_7487( &"CREDIT_LOCALISATION_PROJECT", &"CREDIT_JACK_OHARA" );
    _id_748B();
    _id_7487( &"CREDIT_LOCALISATION_QA_MANA", &"CREDIT_DAVID_HICKEY" );
    _id_748B();
    _id_7487( &"CREDIT_LOCALISATION_ASSISTA", &"CREDIT_YVONNE_COSTELLO" );
    _id_74A5();
    _id_7480( &"CREDIT_LOCALIZATION_QA_TEST" );
    _id_748B();
    _id_7484( &"CREDIT_LUIS_HERNANDEZ_DALMA", &"CREDIT_VINCENZO_FERRARA_" );
    _id_7484( &"CREDIT_LARA_SOLA_GALLEGO", &"CREDIT_JEREMY_LEVI_" );
    _id_7484( &"CREDIT_SEBASTIEN_MAZZERBO_", &"CREDIT_DARIO_MILONE_" );
    _id_7484( &"CREDIT_KERILL_MEIER_OBRIEN", &"CREDIT_MARCELL_WITEK_" );
    _id_748A();
    _id_7487( &"CREDIT_IT_NETWORK_TECHNICIA", &"CREDIT_FERGUS_LINDSAY_" );
    _id_74A5();
    _id_7480( &"CREDIT_LOCALIZATION_TOOLS_" );
    _id_74A5();
}

_id_74AA()
{
    _id_7480( &"CREDIT_CENTRAL_TECHNOLOGY" );
    _id_748B();
    _id_7487( &"CREDIT_VP_ART_PRODUCTION", &"CREDIT_ALESSANDRO_TENTO_" );
    _id_748A();
    _id_7480( &"CREDIT_ENGINEERING" );
    _id_748B();
    _id_7487( &"CREDIT_VP_OF_ONLINE_", &"CREDIT_JOHN_BOJORQUEZ" );
    _id_748B();
    _id_7487( &"CREDIT_MANAGING_DIRECTOR_DE", &"CREDIT_PAT_GRIFFITH_" );
    _id_748B();
    _id_7487( &"CREDIT_TECHNICAL_DIRECTOR", &"CREDIT_WADE_BRAINERD_" );
    _id_748A();
    _id_7480( &"CREDIT_STUDIO_CENTRAL_OUT" );
    _id_748B();
    _id_7487( &"CREDIT_DIRECTOR_ART_PRODUCT", &"CREDIT_RICCARD_LINDE" );
    _id_748B();
    _id_7487( &"CREDIT_TECHNICAL_ART_DIRECT", &"CREDIT_BERNARDO_ANTONIAZZI" );
    _id_7483( &"CREDIT_MITCH_BOWLER" );
    _id_748B();
    _id_7487( &"CREDIT_PRODUCTION_MANAGER", &"CREDIT_MICHAEL_RESTIFO" );
    _id_748B();
    _id_7487( &"CREDIT_PRODUCTION_COORDINAT", &"CREDIT_CHRISTOPHER_CODDING" );
    _id_74A5();
}

_id_74AB()
{
    _id_7487( &"CREDIT_ADDITIONAL_ART", &"CREDIT_BLADE_GAMES_WORLD_IN" );
    _id_74A5();
}

_id_74AC()
{
    _id_7480( &"CREDIT_DEMONWARE" );
    _id_748B();
    _id_7484( &"CREDIT_MICHAEL_COLLINS", &"CREDIT_PAUL_FROESE" );
    _id_7484( &"CREDIT_JOHN_KIRK", &"CREDIT_EMMANUEL_STONE" );
    _id_7484( &"CREDIT_JASON_WEI", "" );
    _id_74A5();
}

_id_74AD()
{
    _id_7480( &"CREDIT_GLOBAL_BRAND_MANAGEM" );
    _id_748B();
    _id_7487( &"CREDIT_VICE_PRESIDENT_OF_MA", &"CREDIT_ROB_KOSTICH" );
    _id_748B();
    _id_7487( &"CREDIT_DIRECTOR_OF_MARKETIN", &"CREDIT_BYRON_BEEDE" );
    _id_748B();
    _id_7487( &"CREDIT_GLOBAL_BRAND_MANAGER", &"CREDIT_GEOFF_CARROLL" );
    _id_748B();
    _id_7487( &"CREDIT_ASSOCIATE_BRAND_MANA", &"CREDIT_JOE_KORSMO" );
    _id_7483( &"CREDIT_MIKE_SCHAEFER" );
    _id_7483( &"CREDIT_DAVID_WANG" );
    _id_74A5();
    _id_7480( &"CREDIT_ART_SERVICES" );
    _id_748B();
    _id_7487( &"CREDIT_ART_SERVICES_LEAD", &"CREDIT_CHRIS_REINHART" );
    _id_74A5();
}

_id_74AE()
{
    _id_7480( &"CREDIT_BUSINESS_AND_LEGAL_A" );
    _id_748B();
    _id_7484( &"CREDIT_GREG_DEUTSCH", &"CREDIT_JANE_ELMS" );
    _id_7484( &"CREDIT_KATE_OGOSTA_", &"CREDIT_AMANDA_OKEEFE" );
    _id_7484( &"CREDIT_TRAVIS_STANSBURY", &"CREDIT_PHIL_TERZIAN" );
    _id_7484( &"CREDIT_MARY_TUCK", "" );
    _id_74A5();
    _id_7480( &"CREDIT_TALENT_AND_AUDIO_MAN" );
    _id_748B();
    _id_7487( &"CREDIT_TALENT_ACQUISITION_M", &"CREDIT_MARCHELE_HARDIN" );
    _id_748B();
    _id_7487( &"CREDIT_TALENT_ASSOCIATE", &"CREDIT_NOAH_SARID" );
    _id_748B();
    _id_7487( &"CREDIT_TALENT_COORDINATOR", &"CREDIT_STEFANI_JONES" );
    _id_74A5();
    _id_7480( &"CREDIT_FINANCE" );
    _id_748B();
    _id_7487( &"CREDIT_VP_OF_STUDIO_FINANCE", &"CREDIT_RAJ_SAIN" );
    _id_748B();
    _id_7487( &"CREDIT_FINANCE_MANAGER", &"CREDIT_CLINTON_ALLEN" );
    _id_7483( &"CREDIT_HARJINDER_SINGH" );
    _id_748B();
    _id_7487( &"CREDIT_SR_FINANCIAL_ANALYST", &"CREDIT_JASON_JORDAN" );
    _id_748B();
    _id_7487( &"CREDIT_FINANCE_ANALYST", &"CREDIT_ADRIAN_GOMEZ" );
    _id_7483( &"CREDIT_FRANSISCA_TAN" );
    _id_74A5();
    _id_7480( &"CREDIT_ACTIVISION_SPECIAL_T" );
    _id_748B();
    _id_7480( &"CREDIT_MIKE_GRIFFITH_BRIAN_" );
    _id_74A5();
}

_id_74AF()
{
    _id_7480( &"CREDIT_QUALITY_ASSURANCE_ATVI" );
    _id_748B();
    _id_7487( &"CREDIT_VP_QUALITY_ASSURANCE", &"CREDIT_PAUL_STERNGOLD" );
    _id_748A();
    _id_7487( &"CREDIT_QUALITY_ASSURANCE_LEAD_ATVI", &"CREDIT_SEAN_BERRETT" );
    _id_748B();
    _id_7487( &"CREDIT_QA_FLOOR_LEAD", &"CREDIT_JAY_MENCONI" );
    _id_748B();
    _id_7487( &"CREDIT_QA_SENIOR_PROJECT_LE", &"CREDIT_HENRY_P_VILLANUEVA" );
    _id_748B();
    _id_7487( &"CREDIT_QA_MANAGER", &"CREDIT_GLENN_VISTANTE" );
    _id_748B();
    _id_7487( &"CREDIT_PROJECT_LEAD", &"CREDIT_ERIK_MELEN_" );
    _id_748A();
    _id_7480( &"CREDIT_QA_TESTERS" );
    _id_748B();
    _id_7488( &"CREDIT_CHAD_SCHMIDT_", &"CREDIT_ADAM_SMITH_", &"CREDIT_DAVION_FARRIS_" );
    _id_7488( &"CREDIT_JOHN_GOLDSWORTHY_", &"CREDIT_NATE_KINNEY_", &"CREDIT_RYAN_TRONDSEN_" );
    _id_7488( &"CREDIT_TARIKH_BROWN_", &"CREDIT_PETE_ROMULO_PEDROZ", &"CREDIT_CHARLES_DAVIS_" );
    _id_7488( &"CREDIT_GABE_NOTO_", &"CREDIT_ULYSSES_HOLGUIN_", &"CREDIT_JOHN_ESTIOKO_" );
    _id_7488( &"CREDIT_XIAOHU_ALCOCER_", &"CREDIT_KEVIN_CHESTER_", &"CREDIT_DANIEL_HERSCHER_" );
    _id_7488( &"CREDIT_LEVETT_WASHINGTON_", &"CREDIT_BRIAN_BAKER", &"CREDIT_MARK_RUZICKA" );
    _id_7488( &"CREDIT_MATT_WELLMAN_", &"CREDIT_ANTHONY_MORENO_", &"CREDIT_CORY_FURLOW_" );
    _id_7488( &"CREDIT_BRIAN_POST_", &"CREDIT_ANDREW_GRASS_", &"CREDIT_QUENTIN_TREMAYNE_C" );
    _id_7488( &"CREDIT_ANDREW_GULOTTA_", &"CREDIT_RICH_BERNOT_", &"CREDIT_TABARI_JEFFRIES_" );
    _id_7488( &"CREDIT_MICHAEL_MONTOYA_", &"CREDIT_CRAIG_NELSON_", &"CREDIT_BRANDON_ARONSON_" );
    _id_7488( &"CREDIT_GREG_SANDS_", &"CREDIT_CARLOS_MORAN_", &"CREDIT_SEAN_MOLINE_" );
    _id_7488( &"CREDIT_LOU_STUDDERT_", &"CREDIT_ROBERT_CHAPLAN_", &"CREDIT_JOSE_VEGA_" );
    _id_7488( &"CREDIT_MIKE_ARDEN_", &"CREDIT_JOE_CHAVEZ_", &"CREDIT_BRADON_MILLER_" );
    _id_74A5();
}

_id_74B0()
{
    _id_7487( &"CREDIT_DIRECTOR_QA", &"CREDIT_CHRISTOPHER_WILSON" );
    _id_748B();
    _id_7487( &"CREDIT_QA_CRG_PROJECT_LEAD", &"CREDIT_MATT_RYAN" );
    _id_748B();
    _id_7487( &"CREDIT_QA_CRGFLOOR_LEAD", &"CREDIT_JONATHAN_MACK" );
    _id_748B();
    _id_7487( &"CREDIT_QA_CRG_TESTERS", &"CREDIT_CHRISTIAN_VASCO" );
    _id_748A();
    _id_7480( &"CREDIT_QA_NETWORK_LAB" );
    _id_748B();
    _id_7487( &"CREDIT_MANAGER_QA_OPERATION", &"CREDIT_CHRIS_KEIM" );
    _id_748B();
    _id_7487( &"CREDIT_QA_NETWORK_LAB_PROJE", &"CREDIT_JESSIE_JONES" );
    _id_7483( &"CREDIT_LEONARD_RODRIGUEZ" );
    _id_748B();
    _id_7487( &"CREDIT_QA_NETWORK_LAB_TESTE", &"CREDIT_BRYAN_CHICE" );
    _id_748A();
    _id_7480( &"CREDIT_QA_COMPATABILITY_LAB" );
    _id_748B();
    _id_7487( &"CREDIT_QACL_LAB_PROJECT_LE", &"CREDIT_ROBERT_FENOGLIO" );
    _id_7483( &"CREDIT_FARID_KAZIMI" );
    _id_7483( &"CREDIT_AUSTIN_KIENZLE" );
    _id_748B();
    _id_7487( &"CREDIT_QACL_LAB_TESTERS", &"CREDIT_ALBERT_LEE" );
    _id_7483( &"CREDIT_WILLIAM_WHALEY" );
    _id_748A();
}

_id_74B1()
{
    _id_7480( &"CREDIT_QA_AV_LAB" );
    _id_748B();
    _id_7487( &"CREDIT_QA_AV_LAB_SR_PR_LEAD", &"CREDIT_VICTOR_DURLING" );
    _id_748B();
    _id_7487( &"CREDIT_QA_AV_LAB_SR_TESTER", &"CREDIT_CLIFF_HOOPER" );
    _id_748B();
    _id_7487( &"CREDIT_QA_AV_LAB_TESTERS", &"CREDIT_DELVEN_RUTLEDGE" );
    _id_7483( &"CREDIT_RYAN_VISTEEN" );
    _id_748A();
    _id_7480( &"CREDIT_QA_MASTERING_LAB" );
    _id_748B();
    _id_7487( &"CREDIT_MASTERING_LAB_SUPERV", &"CREDIT_JOHN_DONNELLY" );
    _id_748B();
    _id_7487( &"CREDIT_LEAD_MASTERING_LAB_T", &"CREDIT_SEAN_KIM" );
    _id_748B();
    _id_7487( &"CREDIT_SENIOR_MASTERING_LAB", &"CREDIT_DANNY_FENG_" );
    _id_748A();
    _id_7480( &"CREDIT_MASTERING_LAB_TECHNI" );
    _id_748B();
    _id_7488( &"CREDIT_TYREE_DERAMUS", &"CREDIT_JOSE_HERNANDEZ", &"CREDIT_KAI_HSU" );
    _id_7488( &"CREDIT_RODRIGO_MAGANA", &"CREDIT_STEVEN_RODRIGUEZ", &"CREDIT_LEEJAY_RONQUILLO" );
    _id_7488( &"CREDIT_ORBEL_SHAKHMALIAN", &"CREDIT_GARY_WASHINGTON", &"" );
    _id_748A();
}

_id_74B2()
{
    _id_7480( &"CREDIT_CUSTOMER_SUPPORT" );
    _id_748B();
    _id_7487( &"CREDIT_CUSTOMER_SUPPORT_MAN", &"CREDIT_GARY_BOLDUC" );
    _id_7483( &"CREDIT_MICHAEL_HILL" );
    _id_74A5();
}

_id_74B3()
{
    _id_7487( &"CREDIT_MANUAL_DESIGN", &"CREDIT_IGNITED_MINDS_LLC" );
    _id_74A5();
    _id_7487( &"CREDIT_PACKAGING_DESIGN_BY", &"CREDIT_RICHARD_KRIEGLER" );
    _id_7483( &"CREDIT_HAMAGAMI" );
    _id_74A5();
    _id_7487( &"CREDIT_FONTS_LICENSED_FROM", &"CREDIT_MONOTYPE" );
    _id_7483( &"CREDIT_T26" );
    _id_74A5();
    _id_7480( &"CREDIT_USES_BINK_VIDEO_COPYRIGHT" );
    _id_748A();
    _id_7480( &"CREDIT_USES_MILES_SOUND_SYSTEM" );
    _id_74A5();
    _id_74A5();
    _id_74A5();
    _id_7480( &"CREDIT_THE_CHARACTERS_AND_EVENTS1" );
    _id_7480( &"CREDIT_THE_CHARACTERS_AND_EVENTS2" );
}

_id_74B4( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3; var_5++ )
        var_4[var_5] = tablelookupbyrow( var_0, var_1, var_2 + var_5 );

    return var_4;
}

_id_74B5( var_0, var_1, var_2 )
{
    var_3[0] = tablelookupbyrow( var_0, var_1, var_2 );
    var_3[1] = tablelookupbyrow( var_0, var_1, var_2 + 1 );
    var_3[2] = tablelookupbyrow( var_0, var_1, var_2 + 2 );
    return var_3;
}

_id_74B6( var_0 )
{
    if ( issubstr( var_0, "&" ) )
    {
        var_0 = getsubstr( var_0, 1 );

        for ( var_1 = getsubstr( var_0, 0, 1 ); var_1 == "\""; var_1 = getsubstr( var_0, 0, 1 ) )
            var_0 = getsubstr( var_0, 1 );

        for ( var_1 = getsubstr( var_0, var_0.size - 1, var_0.size ); var_1 == "\""; var_1 = getsubstr( var_0, var_0.size - 1, var_0.size ) )
            var_0 = getsubstr( var_0, 1, var_0.size - 1 );

        return var_0;
    }
    else
        return var_0;
}

_id_74B7( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; !var_1; var_2++ )
    {
        var_3 = tablelookupbyrow( var_0, var_2, 0 );

        switch ( var_3 )
        {
            case "gap":
                _id_74A5();
                continue;
            case "space":
                _id_748A();
                continue;
            case "spacesmall":
                _id_748B();
                continue;
            case "spacetitle":
                _id_74A4();
                continue;
            case "heading":
                var_4 = tablelookupbyrow( var_0, var_2, 1 );
                _id_7480( _id_74B6( var_4 ) );
                continue;
            case "name":
                var_4 = _id_74B5( var_0, var_2, 1 );

                if ( var_4[0] != " " )
                    _id_747B( _id_74B6( var_4[0] ) );
                else if ( var_4[1] != " " )
                    _id_7483( _id_74B6( var_4[1] ) );
                else
                    _id_747F( _id_74B6( var_4[2] ) );

                continue;
            case "centerdual":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                var_4[1] = tablelookupbyrow( var_0, var_2, 2 );
                _id_7487( _id_74B6( var_4[0] ), _id_74B6( var_4[1] ) );
                continue;
            case "centernamedouble":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                var_4[1] = tablelookupbyrow( var_0, var_2, 2 );
                _id_7484( _id_74B6( var_4[0] ), _id_74B6( var_4[1] ) );
                continue;
            case "centertriple":
                var_4 = _id_74B5( var_0, var_2, 1 );
                _id_7488( _id_74B6( var_4[0] ), _id_74B6( var_4[1] ), _id_74B6( var_4[2] ) );
                continue;
            case "imageiw":
                var_4 = _id_74B4( var_0, var_2, 1, 4 );
                _id_749C( var_4[0], int( var_4[1] ), int( var_4[2] ), float( var_4[3] ) );
                continue;
            case "titlenameiw":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                var_4[1] = tablelookupbyrow( var_0, var_2, 2 );
                _id_749F( _id_74B6( var_4[0] ), _id_74B6( var_4[1] ) );
                continue;
            case "aubtitlenameiw":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                var_4[1] = tablelookupbyrow( var_0, var_2, 2 );
                _id_74A0( _id_74B6( var_4[0] ), _id_74B6( var_4[1] ) );
                continue;
            case "nameiw":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                _id_74A2( _id_74B6( var_4[0] ) );
                continue;
            case "titleiw":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                _id_749D( _id_74B6( var_4[0] ) );
                continue;
            case "subtitleiw":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                _id_749E( _id_74B6( var_4[0] ) );
                continue;
            case "subnameiw":
                var_4[0] = tablelookupbyrow( var_0, var_2, 1 );
                _id_74A3( _id_74B6( var_4[0] ) );
                continue;
            case "castiw":
                var_4 = _id_74B5( var_0, var_2, 1 );
                _id_74A1( _id_74B6( var_4[0] ), _id_74B6( var_4[1] ), _id_74B6( var_4[2] ) );
                continue;
            case "include":
                var_4 = tablelookupbyrow( var_0, var_2, 1 );
                _id_74B7( var_4 );
                continue;
            case "end":
                var_1 = 1;
                continue;
            default:
                continue;
        }
    }
}

_id_74B8( var_0, var_1, var_2, var_3, var_4 )
{
    switch ( var_0 )
    {
        case "gap":
            _id_74A5();
            break;
        case "space":
            _id_748A();
            break;
        case "spacesmall":
            _id_748B();
            break;
        case "spacetitle":
            _id_74A4();
            break;
        case "heading":
            _id_7480( var_1 );
            break;
        case "name":
            if ( isdefined( var_1 ) )
                _id_747B( var_1 );
            else if ( isdefined( var_2 ) )
                _id_7483( var_2 );
            else
                _id_747F( var_3 );

            break;
        case "centerdual":
            _id_7487( var_1, var_2 );
            break;
        case "centernamedouble":
            _id_7484( var_1, var_2 );
            break;
        case "centertriple":
            _id_7488( var_1, var_2, var_3 );
            break;
        case "imageiw":
            _id_749C( var_1, int( var_2 ), int( var_3 ), float( var_4 ) );
            break;
        case "titlenameiw":
            _id_749F( var_1, var_2 );
            break;
        case "subtitlenameiw":
            _id_74A0( var_1, var_2 );
            break;
        case "nameiw":
            _id_74A2( var_1 );
            break;
        case "titleiw":
            _id_749D( var_1 );
            break;
        case "subtitleiw":
            _id_749E( var_1 );
            break;
        case "subnameiw":
            _id_74A3( var_1 );
            break;
        case "castiw":
            _id_74A1( var_1, var_2, var_3 );
            break;
        default:
            break;
    }
}
