// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8094( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    _id_5296( var_1, var_2 );

    if ( isdefined( var_0 ) )
    {
        var_3 = var_0 + "_price";
        var_4 = common_scripts\utility::getstruct( var_3, "targetname" );

        if ( !isdefined( var_4 ) )
        {
            var_4 = getvehiclenode( var_3, "targetname" );
            level._id_4877.target = var_3;
        }
        else if ( var_2 )
        {
            level._id_4877.origin = var_4.origin;
            level._id_4877.angles = var_4.angles;
        }
        else
            level._id_4877 forceteleport( var_4.origin, var_4.angles );

        if ( !var_2 )
            level._id_4877 setgoalpos( var_4.origin );
    }
}
#using_animtree("generic_human");

_id_5296( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !var_1 )
    {
        if ( !isalive( level._id_4877 ) )
        {
            var_2 = getent( "price", "targetname" );
            level._id_4877 = var_2 maps\_utility::_id_166F( 1 );
            level._id_4877 thread maps\_utility::_id_0D04();
        }
    }
    else if ( !isdefined( level._id_4877 ) )
    {
        level._id_4877 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        level._id_4877 setmodel( "body_price_europe_assault_a" );
        level._id_4877.voice = "british";
        level._id_4877 useanimtree( #animtree );
    }

    level._id_4877._id_1032 = "price";
    level._id_63FC = 0;

    if ( isdefined( var_0 ) )
        level._id_4877 thread [[ var_0 ]]();
}

_id_606E()
{
    var_0["ai_eventDistDeath"] = [];
    var_0["ai_eventDistPain"] = [];
    var_0["ai_eventDistExplosion"] = [];
    var_0["ai_eventDistBullet"] = [];
    var_0["ai_eventDistFootstep"] = [];
    var_0["ai_eventDistFootstepWalk"] = [];
    var_0["ai_eventDistFootstepSprint"] = [];
    var_0["ai_eventDistGunShot"] = [];
    var_0["ai_eventDistNewEnemy"] = [];
    var_0["ai_eventDistDeath"]["spotted"] = 1000;
    var_0["ai_eventDistDeath"]["hidden"] = 400;
    var_0["ai_eventDistPain"]["spotted"] = 400;
    var_0["ai_eventDistPain"]["hidden"] = 250;
    var_0["ai_eventDistExplosion"]["spotted"] = 6000;
    var_0["ai_eventDistExplosion"]["hidden"] = 5000;
    var_0["ai_eventDistBullet"]["spotted"] = 400;
    var_0["ai_eventDistBullet"]["hidden"] = 100;
    var_0["ai_eventDistFootstep"]["spotted"] = 150;
    var_0["ai_eventDistFootstep"]["hidden"] = 100;
    var_0["ai_eventDistFootstepWalk"]["spotted"] = 125;
    var_0["ai_eventDistFootstepWalk"]["hidden"] = 100;
    var_0["ai_eventDistFootstepSprint"]["spotted"] = 400;
    var_0["ai_eventDistFootstepSprint"]["hidden"] = 150;
    var_0["ai_eventDistGunShot"]["spotted"] = 1500;
    var_0["ai_eventDistGunShot"]["hidden"] = 1000;
    var_0["ai_eventDistNewEnemy"]["spotted"] = 600;
    var_0["ai_eventDistNewEnemy"]["hidden"] = 300;
    maps\_stealth_utility::_id_4327( var_0 );
    var_1["prone"] = 250;
    var_1["crouch"] = 400;
    var_1["stand"] = 450;
    var_2["prone"] = 400;
    var_2["crouch"] = 600;
    var_2["stand"] = 900;
    maps\_stealth_utility::_id_4323( var_1, var_2 );
    var_3["player_dist"] = 0;
    var_3["sight_dist"] = 0;
    var_3["detect_dist"] = 0;
    maps\_stealth_utility::_id_4325( var_3 );
}

_id_80B5()
{
    var_0["ai_eventDistFootstepWalk"] = [];
    var_0["ai_eventDistFootstepSprint"] = [];
    var_0["ai_eventDistFootstepWalk"]["hidden"] = 50;
    var_0["ai_eventDistFootstepSprint"]["hidden"] = 50;
    maps\_stealth_utility::_id_4327( var_0 );
}

_id_5D0C()
{
    maps\_utility::_id_27D3( "castle", 4 );
    maps\_nightvision::main( level.players );
    visionsetnight( "castle_nvg_grain" );
    level.player setactionslot( 1, "" );
    level thread _id_63FD();
    precachestring( &"SCRIPT_NIGHTVISION_USE" );
    precachestring( &"SCRIPT_NIGHTVISION_STOP_USE" );
    maps\_utility::add_hint_string( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::_id_5236 );
    maps\_utility::add_hint_string( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", maps\_nightvision::_id_5237 );
    level.player thread _id_63FE();
}

_id_63FD()
{
    common_scripts\utility::flag_init( "nvg_on" );

    for (;;)
    {
        level.player waittill( "night_vision_on" );
        common_scripts\utility::flag_set( "nvg_on" );
        level.player waittill( "night_vision_off" );
        common_scripts\utility::flag_clear( "nvg_on" );
    }
}

_id_63FE()
{
    self setactionslot( 1, "nightvision" );
    maps\_utility::_id_13DC( "nightvision_dlight_enabled" );
    common_scripts\utility::flag_wait( "display_nvg_on_hint" );
    maps\_utility::_id_1823( "nvg", 15 );
    common_scripts\utility::flag_wait( "display_nvg_off_hint" );
    maps\_utility::_id_1823( "disable_nvg", 15 );
}

_id_63FF()
{
    precachestring( &"CASTLE_HINT_PARACHUTE_FLARE" );
    precachestring( &"CASTLE_HINT_PARACHUTE_STEER" );
    maps\_utility::add_hint_string( "parachute_flare", &"CASTLE_HINT_PARACHUTE_FLARE", ::_id_6400 );
    maps\_utility::add_hint_string( "parachute_steer", &"CASTLE_HINT_PARACHUTE_STEER" );
}

_id_6400()
{
    return self._id_8062["flare_state"] == "flare_in";
}

_id_7A3F( var_0 )
{
    if ( !isdefined( level._id_7A40 ) )
        level._id_7A40 = [];

    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    level._id_7A40[var_0] = var_1;
}

_id_7A41( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( isdefined( level._id_7A40[var_0] ) )
    {
        if ( var_1 )
            var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        else
            var_2 = spawnstruct();

        var_2.origin = level._id_7A40[var_0].origin;
        var_2.angles = level._id_7A40[var_0].angles;
        return var_2;
    }
    else
    {

    }
}

_id_8097( var_0, var_1 )
{
    var_2 = maps\_utility::_id_2640( var_0, var_1 );

    if ( !isalive( var_2 ) )
    {
        var_3 = getent( var_0, var_1 );
        var_3 waittill( "spawned", var_2 );
    }

    if ( !maps\_utility::_id_13AF( var_2 ) )
        return var_2;
}

_id_810E( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_8097( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
            var_4 thread [[ var_2 ]]( var_3 );
        else
            var_4 thread [[ var_2 ]]();
    }
}

_id_80A0( var_0 )
{
    if ( var_0 == 0 )
        level notify( "_rain_thread" );
    else
        level thread _id_6401( var_0 );
}

_id_6401( var_0 )
{
    var_1 = 0;
    level notify( "_rain_thread" );
    level endon( "_rain_thread" );
    var_2 = common_scripts\utility::getfx( "rain" + var_0 );

    for (;;)
    {
        var_3 = level.player getorigin();
        playfx( var_2, var_3 + ( 0, 0, var_1 ) );
        wait 0.3;
    }
}

_id_80A1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_3 ) )
        level thread _id_6405( var_3, var_4, var_5 );

    if ( var_0 == 0 && var_1 == 0 )
        level notify( "_lightning_thread" );
    else
        level thread _id_6408( var_0, var_1, var_2 );
}

_id_6402( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 setlightintensity( var_3._id_6403 );
        var_3 setlightcolor( var_3._id_6404 );
    }

    level._id_81E9 = common_scripts\utility::array_remove_array( level._id_81E9, var_1 );
}

_id_824A( var_0 )
{
    _id_6402( var_0 );
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 setlightintensity( 0.01 );
}

_id_6405( var_0, var_1, var_2 )
{
    foreach ( var_4 in level._id_81E9 )
    {
        var_4 setlightintensity( var_4._id_6403 );
        var_4 setlightcolor( var_4._id_6404 );
    }

    level._id_81E9 = getentarray( var_0, "targetname" );

    if ( !isdefined( level._id_81E9 ) )
        level._id_81E9 = [];
    else
    {
        foreach ( var_4 in level._id_81E9 )
        {
            if ( !isdefined( var_4._id_6403 ) )
            {
                var_4._id_6403 = var_4 getlightintensity();
                var_4._id_6404 = var_4 getlightcolor();
            }

            var_4 setlightintensity( var_4._id_6403 );
            var_4 setlightcolor( var_4._id_6404 );

            if ( isdefined( var_1 ) )
                var_4._id_6406 = var_1;
            else
                var_4._id_6406 = 3.0;

            if ( isdefined( var_2 ) )
            {
                var_4._id_6407 = var_2;
                continue;
            }

            var_4._id_6407 = var_4._id_6404;
        }
    }
}

_id_6408( var_0, var_1, var_2 )
{
    var_3 = 15000;
    var_4 = ( 0.0, 0.0, 5000.0 );
    var_5 = 0.3;
    var_6 = 0.8;
    var_7 = ( 1.0, 0.0, 0.0 );
    var_8 = ( 1.0, 1.0, 1.0 );
    var_9 = getmapsunlight();
    var_10 = ( var_9[0], var_9[1], var_9[2] );
    var_11 = getmapsundirection();
    level notify( "_lightning_thread" );
    level endon( "_lightning_thread" );
    resetsunlight();
    var_12 = undefined;

    for (;;)
    {
        var_13 = level.player getorigin();

        if ( isdefined( var_2 ) )
        {
            var_12 = anglestoforward( var_2 ) * var_3;
            var_14 = var_12;
        }
        else
        {
            var_12 = anglestoforward( level.player.angles ) * var_3;
            var_14 = maps\castle_fx::_id_7821( var_12, ( 0, randomintrange( -50, 50 ), 0 ) );
        }

        var_15 = var_13 + var_14;
        var_16 = common_scripts\utility::getfx( "lightning_bolt_fast" );
        var_17 = var_5;
        var_18 = 5;

        if ( randomintrange( 0, 100 ) < 30 )
        {
            var_16 = common_scripts\utility::getfx( "lightning_bolt_slow" );
            var_17 = var_6;
            var_18 = 15;
        }

        level notify( "lightning_bolt" );
        playfx( var_16, var_15, var_7 );

        if ( !isdefined( var_2 ) )
            var_19 = var_15 + var_4;
        else
            var_19 = anglestoforward( var_2 );

        setsunlight( var_8[0], var_8[1], var_8[2] );

        foreach ( var_21 in level._id_81E9 )
        {
            var_21 setlightintensity( var_21._id_6406 );
            var_21 setlightcolor( var_21._id_6407 );
        }

        wait(var_17);

        for ( var_23 = 0; var_23 <= var_18; var_23++ )
        {
            var_24 = var_23 / var_18;
            var_25 = vectorlerp( var_8, var_10, var_24 );
            setsunlight( var_25[0], var_25[1], var_25[2] );

            foreach ( var_21 in level._id_81E9 )
            {
                var_21 setlightintensity( var_21._id_6406 + ( var_21._id_6403 - var_21._id_6406 ) * var_24 );
                var_21 setlightcolor( vectorlerp( var_21._id_6407, var_21._id_6404, var_24 ) );
            }

            wait 0.05;
        }

        wait(randomfloatrange( var_0, var_1 ));
    }
}

_id_80A2( var_0, var_1 )
{
    if ( var_0 == 0 && var_1 == 0 )
        level notify( "_cloud_lightning_thread" );
    else
        level thread _id_5CA3( var_0, var_1 );
}

_id_5CA3( var_0, var_1 )
{
    var_2 = 50000;
    var_3 = 10000;
    level notify( "_cloud_lightning_thread" );
    level endon( "_cloud_lightning_thread" );

    for (;;)
    {
        var_4 = level.player getorigin();
        var_5 = anglestoforward( level.player.angles ) * var_2;
        var_6 = maps\castle_fx::_id_7821( var_5, ( 0, randomintrange( -50, 50 ), 0 ) );
        var_7 = var_4 + var_6;
        var_8 = common_scripts\utility::getfx( "lightning" );
        playfx( var_8, var_7 + ( 0, 0, var_3 ) );
        wait(randomfloatrange( var_0, var_1 ));
    }
}

_id_5CA4( var_0 )
{
    wait 1.35;

    if ( isdefined( var_0 ) )
        self playsound( var_0 );
    else
        self playsound( "door_wood_slow_open" );

    self rotateto( self.angles + ( 0.0, -70.0, 0.0 ), 2, 0.5, 0 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, -40.0, 0.0 ), 2, 0, 2 );
}

_id_8093()
{
    level endon( "price_stealth_end" );
    self.pacifist = 1;
    self.ignoreme = 1;
    self.grenadeammo = 0;
    self._id_0D31 = 1;
    maps\_utility::_id_109B();
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    maps\_utility::_id_109E();
    self.pacifist = 0;
    self.ignoreme = 0;
}

_id_80E5()
{
    self endon( "death" );

    if ( isdefined( self._id_80D8 ) && self._id_80D8 == 1 )
    {
        wait 1;
        self setanim( %dying_crawl_death_v1, 1, 0.2, 1 );
        wait 0.5;
        self setanim( %dying_crawl_death_v1, 1, 0.2, 0 );
        setdvar( "ui_deadquote", &"CASTLE_YOUR_ACTIONS_GOT_PRICE" );
        maps\_utility::_id_1826();
    }
    else
    {
        wait 15;
        maps\_utility::_id_2749();
    }
}

_id_80A3( var_0 )
{
    if ( !common_scripts\utility::flag( "_stealth_spotted" ) && maps\_stealth_utility::_id_4213() && !common_scripts\utility::flag( "_stealth_player_nade" ) && maps\_autosave::_id_1C49( 1, 1 ) )
    {
        var_1 = getentarray( "destructible_vehicle", "targetname" );

        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3.healthdrain ) )
                return;
        }

        level thread maps\_utility::_id_1C43();
    }
}

_id_7A47( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    _id_81F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    _id_5CA5( var_2, var_4 );
}

_id_81F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    level.player common_scripts\utility::_disableweapon();

    if ( !isdefined( level.player._id_7A48 ) )
    {
        level.player._id_7A48 = maps\_utility::_id_1287( "player_rig" );
        level.player._id_7A48 hide();
    }

    var_11 = [];

    if ( isarray( var_1 ) )
        var_11 = maps\_utility::_id_0BC3( var_1, level.player._id_7A48 );
    else
        var_11 = maps\_utility::_id_2766( level.player._id_7A48, var_1 );

    var_12 = self;

    if ( var_12 == level )
    {
        var_12 = spawnstruct();
        var_12.origin = level.player.origin;
        var_12.angles = level.player.angles;
    }

    var_12 maps\_anim::_id_11CF( level.player._id_7A48, var_0, var_10 );

    if ( var_4 )
        level.player freezecontrols( var_4 );

    if ( var_3 > 0 )
    {
        level.player playerlinktoblend( level.player._id_7A48, "tag_player", var_3, var_3 * 0.25, var_3 * 0.25 );
        wait(var_3);
    }
    else if ( isdefined( var_5 ) && var_5 )
        level.player playerlinktodelta( level.player._id_7A48, "tag_player", 1.0, var_7, var_6, var_8, var_9 );
    else
        level.player playerlinktoabsolute( level.player._id_7A48, "tag_player" );

    level.player hideviewmodel();
    waittillframeend;
    wait 0.05;
    level.player notify( "player_anim_started" );
    level.player._id_7A48 show();
    var_12 maps\_anim::_id_11DD( var_11, var_0, var_10 );
}

_id_5CA5( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    level.player unlink();
    level.player._id_7A48 delete();

    if ( var_1 )
        level.player freezecontrols( 0 );

    level.player showviewmodel();
    level.player common_scripts\utility::_enableweapon();

    if ( isdefined( var_0 ) && var_0 )
    {
        var_2 = bullettrace( level.player.origin + ( 0.0, 0.0, 40.0 ), level.player.origin + ( 0.0, 0.0, -100.0 ), 0, undefined, 1 );
        level.player setorigin( var_2["position"] );
    }
}

_id_5CA6()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_1 = 1;
    level._id_5691 = 1;
    level._id_5CA7 = [];
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_large";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_large_02";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_small";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_small_02";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_large";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_large_02";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_small";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_small_02";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_large";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_large_02";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_small";
    level._id_5CA7[level._id_5CA7.size] = "overlay_rain_small_02";

    while ( isalive( self ) )
    {
        var_0.origin = self geteye();
        var_0.angles = self getplayerangles();

        if ( var_0.angles[0] < -60 )
        {
            var_2 = bullettrace( var_0.origin, var_0.origin + ( 0.0, 0.0, 500.0 ), 0 );

            if ( var_2["fraction"] == 1 )
            {
                _id_5CB9( 3.0, 0, 1 );
                wait 0.05;
                continue;
            }
        }

        wait 0.5;
    }
}

_id_76F4( var_0 )
{
    if ( isdefined( var_0 ) )
        level endon( var_0 );

    level.player endon( "death" );
    var_1 = spawnstruct();
    var_2 = 40;
    var_3 = 0.5;
    var_4 = 1;
    var_5 = 1;
    var_6 = 0.5;
    var_7 = 16;
    var_8 = 0.7;
    var_9 = 24;
    var_10 = 288.0;
    var_11 = 270;
    var_12 = 48;
    var_13 = 24;
    var_14 = 24;
    var_15 = 40;
    var_16 = 40;
    var_17 = 20;
    var_18 = 5;
    var_19 = 60;
    var_1._id_76F5 = var_7 * -0.5;
    var_1._id_76F6 = var_7 * 0.5;
    var_20 = 0.05;
    var_1.points = [];
    var_1.angles = [];
    var_1._id_76F7 = [];
    var_1._id_76F8 = [];
    var_1._id_76F9 = [];
    var_1._id_76FA = [];
    var_21 = common_scripts\utility::getstruct( "struct_player_shimmy_start", "script_noteworthy" );
    var_22 = 0;

    while ( isdefined( var_21 ) )
    {
        var_1.points[var_22] = var_21.origin;
        var_1.angles[var_22] = var_21.angles;

        if ( var_22 > 0 )
        {
            var_1._id_76F7[var_22 - 1] = var_1.points[var_22] - var_1.points[var_22 - 1];
            var_1._id_76F8[var_22 - 1] = vectornormalize( var_1._id_76F7[var_22 - 1] );
            var_1._id_76F9[var_22 - 1] = length( var_1._id_76F7[var_22 - 1] );
            var_1._id_76FA[var_22 - 1] = vectornormalize( maps\_shg_common::_id_1684( ( 0.0, 0.0, 1.0 ), var_1._id_76F8[var_22 - 1] ) );
        }

        if ( isdefined( var_21.target ) )
        {
            var_21 = common_scripts\utility::getstruct( var_21.target, "targetname" );
            var_22++;
            continue;
        }

        break;
    }

    var_1._id_76F9[var_1._id_76F9.size - 1] = var_1._id_76F9[var_1._id_76F9.size - 1] + 0.125;

    for (;;)
    {
        for (;;)
        {
            if ( _id_7706( var_1, 0 ) || _id_7706( var_1, var_1.points.size - 2 ) )
                break;

            common_scripts\utility::waitframe();
        }

        _id_7707( var_1, level.player.origin );

        if ( !isdefined( var_1._id_76FD ) )
            continue;

        _id_50A4( 0 );
        _id_7707( var_1, level.player.origin );

        if ( var_1._id_76FD == 0 )
            var_1._id_76FE += var_12;
        else
            var_1._id_76FE -= var_12;

        var_1._id_76FF = clamp( var_1._id_76FF, var_1._id_76F5, var_1._id_76F6 );
        var_21 = _id_7708( var_1 );
        var_23 = var_21.origin;
        var_24 = var_21.angles;
        var_25 = 1;
        var_26 = level.player.angles;
        var_27 = common_scripts\utility::spawn_tag_origin();
        var_28 = var_21.origin + ( 0, 0, var_19 ) - level.player geteye();
        var_29 = _id_7705( var_4, vectordot( level.player getvelocity(), vectornormalize( var_28 ) ), length( var_28 ) );
        level.player _id_7704( var_21.origin + ( 0, 0, var_19 ), var_21.angles, var_4, var_29._id_7701, var_29._id_7700, var_4 * 0.4, var_4 * 0.4, var_27, var_15, var_16, var_17, var_18 );
        var_30 = 0;
        var_31 = 0;
        var_32 = 0;
        var_33 = var_11 / var_10;
        var_1._id_7702 = 0;

        for (;;)
        {
            _id_7707( var_1, var_23 );

            if ( !isdefined( var_1._id_76FD ) )
                break;

            var_1._id_7703 = var_1._id_76FD;
            var_34 = level.player getnormalizedmovement();
            var_34 = ( var_34[0], var_34[1] * -1, 0 );

            if ( var_34[0] < 0.25 )
                var_25 = 0;

            if ( length( var_34 ) < 0.1 )
                var_30 = 1;

            if ( var_25 )
                var_35 = var_26;
            else
                var_35 = level.player.angles;

            var_36 = vectortoangles( var_34 );
            var_37 = common_scripts\utility::flat_angle( combineangles( var_35, var_36 ) );
            var_38 = anglestoforward( var_37 ) * length( var_34 );
            var_39 = vectordot( var_38, var_1._id_76F8[var_1._id_76FD] );
            var_40 = vectordot( var_38, var_1._id_76FA[var_1._id_76FD] );

            if ( abs( var_39 ) > 0.1 )
                var_32 += var_20;
            else
            {
                var_32 = 0;
                var_33 = var_11 / var_10;
            }

            var_41 = var_2 + var_9 * sin( var_32 * var_10 );

            if ( var_32 > var_33 )
            {
                var_42 = var_1.points[var_1._id_76FD] + var_1._id_76F8[var_1._id_76FD] * var_1._id_76FE;
                _id_7709( var_42 );
                var_33 += 360.0 / var_10;
            }

            var_1._id_76FE += var_39 * var_41 * var_20;
            var_1._id_76FF += var_40 * var_41 * var_20;
            var_1._id_76FF = clamp( var_1._id_76FF, var_1._id_76F5, var_1._id_76F6 );
            var_21 = _id_7708( var_1 );
            var_24 = _id_50B3( var_21.angles, var_24, var_8 );
            var_27.angles = var_24;
            var_23 = var_21.origin;
            var_27.origin = var_23 + ( 0, 0, var_19 ) - anglestoup( var_24 ) * var_19;
            wait(var_20);
        }

        if ( isdefined( var_1._id_7703 ) )
        {
            if ( var_1._id_7702 )
            {
                var_1._id_76FD = var_1._id_7703;
                var_1._id_76FF += var_14;
                var_43 = _id_7708( var_1 ).origin;
                var_44 = anglestoforward( level.player getplayerangles() );
                level.player enableweapons();
                var_45 = var_6 * 0.2;
                var_46 = var_6 * 0.5;
                level.player lerpviewangleclamp( var_6, var_45, var_46, 0, 0, 0, 0 );
                var_27 rotateto( vectortoangles( var_44 ), var_6, var_45, var_46 );
                var_27 moveto( var_43, var_6, var_45, var_46 );
                wait(var_6);
            }
            else
            {
                var_1._id_76FD = var_1._id_7703;

                if ( var_1._id_76FD == 0 )
                    var_1._id_76FE -= var_13;
                else
                    var_1._id_76FE += var_13;

                var_43 = _id_7708( var_1 ).origin;
                var_44 = var_1._id_76F8[var_1._id_7703];

                if ( var_1._id_7703 == 0 )
                    var_44 *= -1;

                var_47 = getgroundposition( var_43, 16, 24, 24 );

                if ( isdefined( var_47 ) )
                    var_43 = var_47;

                level.player enableweapons();
                var_45 = var_5 * 0.2;
                var_46 = var_5 * 0.5;
                level.player lerpviewangleclamp( var_5, var_45, var_46, 180, 180, 90, 90 );
                var_27 rotateto( vectortoangles( var_44 ), var_5, var_45, var_46 );
                var_27 moveto( var_43, var_5, var_45, var_46 );
                wait(var_5);
            }
        }

        _id_50A5();
        var_27 delete();
        common_scripts\utility::waitframe();
        common_scripts\utility::waitframe();
    }
}

_id_7704( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = level.player getplayerviewheight();
    var_13 = 60;
    var_14 = common_scripts\utility::spawn_tag_origin();
    var_14.angles = self getplayerangles();
    var_14.origin = self.origin + ( 0, 0, var_13 ) + self getvelocity() * 0.1;
    var_15 = common_scripts\utility::spawn_tag_origin();
    var_15 linkto( var_14, "tag_origin", ( 0, 0, -1 * var_13 ), ( 0.0, 0.0, 0.0 ) );
    self playerlinktodelta( var_15, "tag_origin", 1, 0, 0, 0, 0, 1 );
    var_14 moveto( var_0, var_2, var_3, var_4 );
    var_14 rotateto( var_1, var_2, var_5, var_6 );
    wait(var_2);
    var_7.origin = var_0 + ( 0, 0, var_13 ) - anglestoup( var_1 ) * var_13;
    var_7.angles = var_1;
    self playerlinktodelta( var_7, "tag_origin", 1, var_8, var_9, var_10, var_11, 1 );
    var_15 delete();
    var_14 delete();
}

_id_7705( var_0, var_1, var_2 )
{
    var_3 = var_0 * 0.25;
    var_4 = spawnstruct();

    if ( var_2 > 0 && var_1 > 0 )
    {
        var_5 = var_1 / var_2;
        var_6 = 2.0 * var_0 - 2.0 / var_5;

        if ( var_6 > var_3 )
        {
            if ( var_6 <= var_0 )
            {
                var_4._id_7701 = 0;
                var_4._id_7700 = var_6;
            }
            else
            {
                var_4._id_7701 = 0;
                var_4._id_7700 = var_0;
            }
        }
        else
        {
            var_7 = 2.0 / ( 2.0 * var_0 - var_3 );

            if ( var_5 > var_7 * 0.5 )
            {
                var_4._id_7701 = 0;
                var_4._id_7700 = var_3;
            }
            else
            {
                var_4._id_7701 = var_3;
                var_4._id_7700 = var_3;
            }
        }
    }
    else
    {
        var_4._id_7701 = var_3;
        var_4._id_7700 = var_3;
    }

    return var_4;
}

_id_7706( var_0, var_1 )
{
    var_2 = level.player.origin - var_0.points[var_1];
    var_3 = vectordot( var_2, var_0._id_76F8[var_1] );

    if ( var_3 > 0 && var_3 < var_0._id_76F9[var_1] )
    {
        var_4 = vectordot( var_2, var_0._id_76FA[var_1] );

        if ( var_4 > var_0._id_76F5 * 2.5 && var_4 < var_0._id_76F6 * 2.5 )
            return 1;
    }

    return 0;
}

_id_7707( var_0, var_1 )
{
    var_0._id_76FD = undefined;

    for ( var_2 = 0; var_2 < var_0.points.size - 1; var_2++ )
    {
        var_3 = var_1 - var_0.points[var_2];
        var_4 = vectordot( var_3, var_0._id_76F8[var_2] );

        if ( var_4 < var_0._id_76F9[var_2] )
        {
            var_0._id_76FF = vectordot( var_3, var_0._id_76FA[var_2] );
            var_0._id_76FD = var_2;
            var_0._id_76FE = var_4;
            break;
        }
    }

    if ( isdefined( var_0._id_76FD ) && var_0._id_76FD == 0 && var_0._id_76FE < -0.125 )
        var_0._id_76FD = undefined;
}

_id_7708( var_0 )
{
    var_1 = spawnstruct();
    var_2 = var_0._id_76FD;
    var_1.origin = var_0.points[var_2] + var_0._id_76F8[var_2] * var_0._id_76FE + var_0._id_76FA[var_2] * var_0._id_76FF;
    var_3 = undefined;

    if ( var_0._id_76FE > var_0._id_76F9[var_0._id_76FD] && var_0._id_76FD + 1 < var_0._id_76F9.size )
        var_3 = var_0.points[var_0._id_76FD + 1];

    if ( var_0._id_76FE < 0 && var_0._id_76FD > 0 )
        var_3 = var_0.points[var_0._id_76FD];

    if ( isdefined( var_3 ) )
    {
        var_4 = var_1.origin - var_3;
        var_5 = length( var_4 );
        var_6 = -1 * var_0._id_76F5;

        if ( var_0._id_76FF > 0 )
            var_6 = var_0._id_76F6;

        if ( var_5 > var_6 )
        {
            var_4 *= var_6 / var_5;
            var_1.origin = var_3 + var_4;
        }
    }

    var_7 = clamp( var_0._id_76FE / var_0._id_76F9[var_2], 0, 1 );
    var_8 = _id_770A( var_0.angles[var_2] );
    var_9 = var_8;
    var_10 = var_8;

    if ( var_2 + 1 < var_0.angles.size )
        var_9 = _id_770A( var_0.angles[var_2 + 1] );

    if ( var_2 - 1 > 0 )
        var_10 = _id_770A( var_0.angles[var_2 - 1] );

    var_11 = var_9;

    if ( var_2 + 2 < var_0.angles.size )
        var_11 = _id_770A( var_0.angles[var_2 + 2] );

    var_12 = ( 1 + 2 * var_7 ) * squared( 1 - var_7 );
    var_13 = var_7 * squared( 1 - var_7 );
    var_14 = squared( var_7 ) * ( 3 - 2 * var_7 );
    var_15 = squared( var_7 ) * ( var_7 - 1 );
    var_16 = ( var_9 - var_10 ) / 2;
    var_17 = ( var_11 - var_8 ) / 2;
    var_1.angles = _id_770B( var_12 * var_8 + var_13 * var_16 + var_14 * var_9 + var_15 * var_17 );
    return var_1;
}

_id_7709( var_0 )
{

}

_id_770A( var_0 )
{
    return ( angleclamp180( var_0[0] ), angleclamp180( var_0[1] ), angleclamp180( var_0[2] ) );
}

_id_770B( var_0 )
{
    return ( angleclamp( var_0[0] ), angleclamp( var_0[1] ), angleclamp( var_0[2] ) );
}

_id_50B0( var_0, var_1, var_2, var_3, var_4 )
{
    return var_3 + ( var_0 - var_1 ) * ( var_4 - var_3 ) / ( var_2 - var_1 );
}

_id_50B1( var_0, var_1, var_2, var_3, var_4 )
{
    return clamp( _id_50B0( var_0, var_1, var_2, var_3, var_4 ), var_3, var_4 );
}

_id_50B2( var_0, var_1, var_2 )
{
    return angleclamp( var_0 + angleclamp180( var_1 - var_0 ) * var_2 );
}

_id_50B3( var_0, var_1, var_2 )
{
    return ( _id_50B2( var_0[0], var_1[0], var_2 ), _id_50B2( var_0[1], var_1[1], var_2 ), _id_50B2( var_0[2], var_1[2], var_2 ) );
}

_id_50A4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    level.player disableweapons();
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player setstance( "stand" );

    if ( var_0 )
    {
        while ( level.player getstance() != "stand" || level.player isthrowinggrenade() || level.player isswitchingweapon() )
            common_scripts\utility::waitframe();
    }
}

_id_80F1( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = 0.5;
    level endon( "clearing_hints" );

    if ( isdefined( level._id_27BC ) )
        level._id_27BC maps\_hud_util::destroyelem();

    level._id_27BC = maps\_hud_util::createfontstring( "default", 1.5 );
    level._id_27BC maps\_hud_util::setpoint( "MIDDLE", undefined, 0, 30 + var_1 );
    level._id_27BC.color = ( 1.0, 1.0, 1.0 );
    level._id_27BC settext( var_0 );
    level._id_27BC.alpha = 0;
    level._id_27BC fadeovertime( 0.5 );
    level._id_27BC.alpha = 1;
    wait 0.5;
    level._id_27BC endon( "death" );
}

_id_50A5()
{
    level.player unlink();
    level.player enableweapons();
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowsprint( 1 );
}

_id_77E6( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    _id_77E8();
    var_2 = common_scripts\utility::getfx( "flashlight_ai" );

    if ( isdefined( var_1 ) )
        var_2 = common_scripts\utility::getfx( var_1 );
    else if ( var_0 )
        var_2 = common_scripts\utility::getfx( "flashlight_ai_cheap" );

    playfxontag( var_2, self, "tag_flash" );
    self._id_5CA8 = var_2;
}

_id_77E8()
{
    if ( isdefined( self._id_5CA8 ) )
    {
        stopfxontag( self._id_5CA8, self, "tag_flash" );
        self._id_5CA8 = undefined;
    }
}

_id_5CA9( var_0, var_1 )
{
    self endon( var_1 );
    var_0 endon( "death" );
    var_0 endon( "stop_current_anim" );
    var_0 common_scripts\utility::waittill_any( "awareness_alert_level", "damage" );
    var_0._id_8115 = 1;
    var_0 _id_80AD();
}

_id_80AD()
{
    if ( isdefined( self._id_5CAA ) )
        self._id_5CAA notify( "stop_loop" );

    maps\_utility::_id_1414();
    self notify( "stop_current_anim" );
}

_id_80B1( var_0, var_1 )
{
    var_2 = _id_5CAB( var_0 );

    foreach ( var_0 in var_2 )
    {
        var_0 _id_80AD();
        var_0._id_5CAA = self;
        var_0.allowdeath = 1;
        thread _id_5CA9( var_0, var_1 );
    }

    maps\_anim::_id_11DD( var_2, var_1 );
}

_id_80AA( var_0, var_1 )
{
    var_2 = _id_5CAB( var_0 );

    foreach ( var_0 in var_2 )
    {
        var_0 _id_80AD();
        var_0._id_5CAA = self;
        var_0.allowdeath = 1;
        thread _id_5CA9( var_0, var_1 );
    }

    maps\_anim::_id_11D6( var_2, var_1 );
}

_id_5CAB( var_0 )
{
    var_1 = [];

    if ( isarray( var_0 ) )
        var_1 = var_0;
    else
        var_1[0] = var_0;

    return var_1;
}

_id_80FA()
{
    var_0 = getentarray( "tower_gate_left", "targetname" );
    var_1 = getentarray( "tower_gate_right", "targetname" );

    foreach ( var_3 in var_0 )
    {
        var_3 connectpaths();
        var_3 delete();
    }

    foreach ( var_3 in var_1 )
    {
        var_3 connectpaths();
        var_3 delete();
    }
}

_id_80E2( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "_stop_nag_lines" );
    self endon( "_stop_nag_lines" );
    level endon( var_1 );

    if ( common_scripts\utility::flag( var_1 ) )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_6 = 0;
    var_7 = 0;
    var_8 = var_0;
    level._id_5CAC = 0;
    level thread _id_5CAD( self, var_1, var_0.size );

    while ( !common_scripts\utility::flag( var_1 ) )
    {
        if ( !var_7 || var_6 == var_0.size )
        {
            if ( var_3 )
            {
                var_9 = var_8[var_8.size - 1];

                for ( var_10 = 0; var_10 < 20; var_10++ )
                {
                    var_8 = maps\_utility::_id_0B53( var_0 );

                    if ( var_8[0] != var_9 )
                        break;
                }
            }

            var_6 = 0;
        }

        if ( var_7 || !var_4 )
            wait(var_2);

        if ( isdefined( var_5 ) && !self [[ var_5 ]]() )
            continue;

        if ( isdefined( level.scr_sound[self._id_1032] ) && isdefined( level.scr_sound[self._id_1032][var_8[var_6]] ) )
            maps\_utility::_id_168C( var_8[var_6] );
        else
            thread maps\_utility::_id_2730( self._id_1032, var_8[var_6], "white" );

        var_7 = 1;
        var_6++;
    }
}

_id_5CAD( var_0, var_1, var_2 )
{
    common_scripts\utility::waittill_any_ents( var_0, "_stop_nag_lines", level, var_1 );

    if ( level._id_5CAC == 0 )
        _id_80F8( 1 );
    else if ( level._id_5CAC >= var_2 )
        _id_80F8( -1 );

    level._id_5CAC = 0;
}

_id_80F8( var_0 )
{
    level._id_63FC += var_0;
}

_id_5CAE()
{
    var_0 = getentarray( "stinger_emplacement", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 maketurretsolid();
        var_2 thread _id_5CAF();
    }
}

_id_5CAF()
{
    self._id_5CB0 = 2;
    self._id_5CB1 = 2.5;

    for (;;)
    {
        while ( !level.player isusingturret() )
            common_scripts\utility::waitframe();

        var_0 = self getturretowner();

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
        {
            var_1 = _id_5CB3( 0, 0, "right", "bottom", "stinger_emplacement_override_red", 100, 100, 0 );
            var_2 = _id_5CB3( 0, 0, "right", "bottom", "stinger_emplacement_override_white", 100, 100, 0 );
            var_3 = _id_5CB3( 0, 0, "center", "bottom", "stinger_emplacement_ready", 128, 64, 1 );
            var_4 = _id_5CB3( 0, -40, "left", "bottom", "stinger_emplacement_missile_full", 64, 16, 1 );
            var_5 = _id_5CB3( 0, -20, "left", "bottom", "stinger_emplacement_missile_full", 64, 16, 1 );
            thread _id_5CB7( var_2, var_1 );
            thread _id_5CB4( var_4, var_5, self._id_5CB0 );

            if ( self._id_5CB0 == 0 )
            {
                var_3 setshader( "stinger_emplacement_loading", 128, 64 );
                thread _id_5CB6( var_3 );
                self turretfiredisable();
            }
            else
            {
                thread _id_5CB2( var_0, var_4, var_5, var_3 );
                self turretfireenable();
            }

            setsaveddvar( "compass", "0" );
            setsaveddvar( "ui_hidemap", "1" );
            setsaveddvar( "ammoCounterHide", "1" );
            setsaveddvar( "actionSlotsHide", "1" );
            setsaveddvar( "hud_showstance", "0" );

            while ( var_0 isusingturret() )
                common_scripts\utility::waitframe();

            self notify( "stop_dual_stinger" );
            setsaveddvar( "compass", "1" );
            setsaveddvar( "ui_hidemap", "0" );
            setsaveddvar( "ammoCounterHide", "0" );
            setsaveddvar( "actionSlotsHide", "0" );
            setsaveddvar( "hud_showstance", "1" );
            var_1 destroy();
            var_2 destroy();
            var_3 destroy();
            var_4 destroy();
            var_5 destroy();
        }

        common_scripts\utility::waitframe();
    }
}

_id_5CB2( var_0, var_1, var_2, var_3 )
{
    self endon( "stop_dual_stinger" );

    for (;;)
    {
        self waittill( "turret_fire" );
        earthquake( 0.6, 0.5, self.origin, 200 );
        self._id_5CB0--;
        thread _id_5CB5( var_3, self._id_5CB1 );
        thread _id_5CB4( var_1, var_2, self._id_5CB0 );

        if ( self._id_5CB0 == 0 )
        {
            self turretfiredisable();
            self setmodel( "ctl_missile_emplacement" );
            wait 0.5;
            self useby( var_0 );
            break;
        }
        else
        {
            self turretfiredisable();
            wait(self._id_5CB1);
            self turretfireenable();
        }
    }
}

_id_5CB3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = newhudelem();
    var_8.x = var_0;
    var_8.y = var_1;

    if ( var_2 != "fullscreen" )
    {
        var_8.alignx = var_2;
        var_8.aligny = var_3;
    }

    var_8.horzalign = var_2;
    var_8.vertalign = var_3;
    var_8.foreground = 1;
    var_8 setshader( var_4, var_5, var_6 );
    var_8.alpha = var_7;
    return var_8;
}

_id_5CB4( var_0, var_1, var_2 )
{
    switch ( var_2 )
    {
        case 0:
            var_0 setshader( "stinger_emplacement_missile_empty", 64, 16 );
            var_1 setshader( "stinger_emplacement_missile_empty", 64, 16 );
            break;
        case 1:
            var_0 setshader( "stinger_emplacement_missile_empty", 64, 16 );
            break;
        case 2:
            break;
    }
}

_id_5CB5( var_0, var_1 )
{
    self endon( "stop_dual_stinger" );
    var_0 setshader( "stinger_emplacement_loading", 128, 64 );
    thread _id_5CB6( var_0 );
    wait(var_1);
    self notify( "stop_loading" );
    var_0 setshader( "stinger_emplacement_ready", 128, 64 );
    var_0.alpha = 1;
}

_id_5CB6( var_0 )
{
    self endon( "stop_loading" );
    self endon( "stop_dual_stinger" );

    for (;;)
    {
        var_0 maps\_hud_util::fade_over_time( 0, 1.0 );
        var_0 maps\_hud_util::fade_over_time( 1, 1.0 );
    }
}

_id_5CB7( var_0, var_1 )
{
    self endon( "stop_dual_stinger" );

    for (;;)
    {
        var_0.alpha = 0;
        var_1.alpha = 1;
        wait 1;
        var_0.alpha = 1;
        var_1.alpha = 0;
        wait 1;
    }
}

_id_5CB8()
{
    var_0 = 0.1;

    if ( isdefined( level._id_27BC ) )
    {
        level notify( "clearing_hints" );
        level._id_27BC fadeovertime( var_0 );
        level._id_27BC.alpha = 0;
        wait(var_0);
    }
}

_id_80FD()
{
    level endon( "courtyard_stealth_cleanup" );
    level endon( "_stealth_spotted" );
    self waittill( "turret_fire" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_80A9()
{
    level endon( "courtyard_stealth_cleanup" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::waittill_any( "flashbang", "explode", "bulletwhizby", "bullethit", "damage", "grenade danger", "killed" );
    maps\_utility::_id_1414();
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_80AC()
{
    level endon( "courtyard_stealth_cleanup" );
    self endon( "death" );
    common_scripts\utility::waittill_any( "flashbang", "explode", "bulletwhizby", "bullethit", "damage", "grenade danger" );
    maps\_utility::_id_1414();
    wait 1.5;

    if ( isalive( self ) )
        common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_5CB9( var_0, var_1, var_2 )
{
    var_3 = self;

    if ( !isplayer( var_3 ) )
        var_3 = level.player;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        level._id_5691 = var_1;

    var_4 = _id_5CBB( var_3 );
    var_4[0].x = 0;
    var_4[0].y = 0;
    var_4[0] setshader( "overlay_rain", 640, 480 );
    var_4[0].sort = 50;
    var_4[0].lowresbackground = 0;
    var_4[0].alignx = "left";
    var_4[0].aligny = "top";
    var_4[0].alpha = 0.85;
    var_4[0].horzalign = "fullscreen";
    var_4[0].vertalign = "fullscreen";
    var_4[0] fadeovertime( var_0 );
    var_4[0].alpha = var_1;

    for ( var_5 = 1; var_5 < var_4.size; var_5++ )
    {
        var_6 = common_scripts\utility::random( level._id_5CA7 );
        var_4[var_5].x = 0 + randomint( 360 );
        var_4[var_5].y = 0 + randomint( 360 );
        var_4[var_5] setshader( var_6, 256, 256 );
        var_4[var_5].sort = 50;
        var_4[var_5].lowresbackground = 0;
        var_4[var_5].alignx = "left";
        var_4[var_5].aligny = "top";
        var_4[var_5].horzalign = "fullscreen";
        var_4[var_5].vertalign = "fullscreen";
        var_4[var_5].alpha = randomfloatrange( 0.15, 0.3 );
        var_4[var_5] fadeovertime( var_0 );
        var_4[var_5].alpha = var_1;
        wait 0.8;
    }

    level._id_5678 = var_1;
}

_id_5CBA( var_0 )
{
    if ( !isdefined( var_0 ) || !var_0 )
    {
        var_1 = self;

        if ( !isplayer( var_1 ) )
            var_1 = level.player;

        var_2 = _id_5CBB( var_1 );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[0] destroy();

        return;
    }

    _id_5CB9( var_0, 0 );
}

_id_5CBB( var_0 )
{
    if ( !isdefined( var_0._id_5694 ) )
    {
        var_0._id_5694 = [];
        var_0._id_5694[0] = newclienthudelem( var_0 );
        var_0._id_5694[1] = newclienthudelem( var_0 );
        var_0._id_5694[2] = newclienthudelem( var_0 );
        var_0._id_5694[3] = newclienthudelem( var_0 );
        var_0._id_5694[4] = newclienthudelem( var_0 );
    }

    return var_0._id_5694;
}

_id_8175()
{
    _id_5CC1();

    if ( !isdefined( self._id_5CBC ) )
    {
        thread _id_5CBF( level._id_5CBD );
        self._id_5CBC = 1;
    }

    return self._id_5CBE[level._id_5CBD];
}

_id_5CBF( var_0 )
{
    if ( !isdefined( self._id_5CBE ) )
        self._id_5CBE = [];

    self._id_5CBE[var_0] = 0;
    var_1 = 0;
    var_2 = 0.5;

    for (;;)
    {
        if ( self._id_5CBE[var_0] )
        {
            if ( !self [[ level._id_5CC0[var_0] ]]() )
                self._id_5CBE[var_0] = 0;
        }
        else if ( self [[ level._id_5CC0[var_0] ]]() )
        {
            if ( var_1 == 0 )
                var_1 = gettime();

            if ( gettime() - var_1 > var_2 )
                self._id_5CBE[var_0] = 1;
        }
        else if ( var_1 != 0 )
            var_1 = 0;

        wait 0.05;
    }
}

_id_5CC1()
{
    if ( !isdefined( level._id_5CC0 ) )
    {
        level._id_5CBD = 0;
        level._id_5CC0[level._id_5CBD] = ::_id_54B4;
    }
}

_id_54B4()
{
    return self usebuttonpressed();
}

_id_8105( var_0, var_1 )
{
    if ( !isdefined( level._id_54B5 ) )
        level._id_54B5 = 0;

    var_2 = [];
    var_2[0] = "castle_pri_laggingbehind";
    var_2[1] = "castle_pri_slowingme";
    var_2[2] = "castle_pri_onyourown";
    var_2[3] = "castle_pri_donthavetime";
    wait(var_0);

    if ( !common_scripts\utility::flag( var_1 ) )
    {
        if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
            level._id_4877 maps\_utility::_id_168C( var_2[level._id_54B5] );

        level._id_54B5++;

        if ( level._id_54B5 >= var_2.size )
            level._id_54B5 = 0;

        thread _id_8105( var_0 * 1.5, var_1 );
    }
}

_id_8100( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    if ( var_1 )
        common_scripts\utility::array_call( var_2, ::show );
    else
        common_scripts\utility::array_call( var_2, ::hide );
}
