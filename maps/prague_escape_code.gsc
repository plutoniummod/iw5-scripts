// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7A3A()
{
    common_scripts\utility::flag_init( "screen_fade_out_start" );
    common_scripts\utility::flag_init( "screen_fade_out_end" );
    common_scripts\utility::flag_init( "screen_fade_in_start" );
    common_scripts\utility::flag_init( "screen_fade_in_end" );
    common_scripts\utility::flag_init( "screen_fade_out_active" );
    common_scripts\utility::flag_init( "screen_fade_in_active" );
    common_scripts\utility::flag_init( "play_left_hand_blood" );
    common_scripts\utility::flag_init( "play_right_hand_blood" );
    common_scripts\utility::flag_init( "outof_range" );
    common_scripts\utility::flag_init( "in_range" );
    common_scripts\utility::flag_init( "FLAG_soap_blood_fx" );
    common_scripts\utility::flag_init( "FLAG_soap_walk_blood_drip_elbow" );
    common_scripts\utility::flag_init( "FLAG_soap_walk_blood_drip_hip" );
    common_scripts\utility::flag_init( "FLAG_soap_walk_blood_smear" );
}

_id_7A3B( var_0, var_1, var_2 )
{
    var_0 = tolower( var_0 );
    _id_7A3C( var_0, var_2 );
    var_3 = _id_7A3D( var_0 );

    if ( isdefined( var_1 ) )
    {
        var_4 = common_scripts\utility::getstruct( var_1 + "_" + var_0, "targetname" );
        var_3 forceteleport( var_4.origin, var_4.angles );
        var_3 setgoalpos( var_4.origin );
    }
}

_id_7A3C( var_0, var_1 )
{
    var_2 = _id_7A3D( var_0 );

    if ( !isalive( var_2 ) )
    {
        var_3 = getent( var_0, "targetname" );
        var_2 = var_3 maps\_utility::_id_166F( 1 );
        var_2._id_1032 = var_0;
        var_2 thread maps\_utility::_id_0D04( 1 );
    }

    if ( isdefined( var_1 ) )
        var_2 thread [[ var_1 ]]();

    var_2 _id_7A3E( var_0 );
}

_id_7A3D( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "price":
            var_1 = level._id_4877;
            break;
        case "soap":
            var_1 = level._id_54E0;
            break;
        default:
    }

    return var_1;
}

_id_7A3E( var_0 )
{
    switch ( var_0 )
    {
        case "price":
            level._id_4877 = self;
            break;
        case "soap":
            level._id_54E0 = self;
            break;
        default:
    }
}

_id_7A3F( var_0 )
{
    if ( !isdefined( level._id_7A40 ) )
        level._id_7A40 = [];

    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    level._id_7A40[var_0] = var_1;
}

_id_7A41( var_0 )
{
    if ( isdefined( level._id_7A40[var_0] ) )
    {
        var_1 = spawnstruct();
        var_1.origin = level._id_7A40[var_0].origin;
        var_1.angles = level._id_7A40[var_0].angles;
        return var_1;
    }
    else
    {

    }
}

_id_7A42( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = "active";

    if ( !isdefined( var_1 ) || var_1 )
        level._id_7A43++;

    objective_add( level._id_7A43, var_4, var_0 );

    if ( isdefined( var_3 ) )
        objective_position( level._id_7A43, var_3 );

    if ( !isdefined( var_2 ) || var_2 )
        objective_current( level._id_7A43 );

    return level._id_7A43;
}

_id_7A44( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
    {

    }

    _id_7A42( var_1, var_2, var_3, undefined, var_4 );
    objective_onentity( level._id_7A43, var_0, ( 0.0, 0.0, 70.0 ) );

    if ( isdefined( var_5 ) )
        objective_setpointertextoverride( level._id_7A43, var_5 );

    return level._id_7A43;
}

_id_7A45( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_7A43;

    maps\_utility::_id_2727( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        objective_delete( var_0 );
}

_id_441E( var_0 )
{
    self endon( "death" );

    if ( !issentient( self ) || !isalive( self ) )
        return;

    if ( isdefined( self._id_441E ) && self._id_441E )
        return;

    self._id_441E = 1;

    if ( isdefined( var_0 ) )
        wait(randomfloat( var_0 ));

    var_1 = [];
    var_1[0] = "j_hip_le";
    var_1[1] = "j_hip_ri";
    var_1[2] = "j_head";
    var_1[3] = "j_spine4";
    var_1[4] = "j_elbow_le";
    var_1[5] = "j_elbow_ri";
    var_1[6] = "j_clavicle_le";
    var_1[7] = "j_clavicle_ri";

    for ( var_2 = 0; var_2 < 3 + randomint( 5 ); var_2++ )
    {
        var_3 = randomintrange( 0, var_1.size );
        thread _id_50B6( var_1[var_3], undefined );
        wait(randomfloat( 0.1 ));
    }

    self dodamage( self.health + 50, self.origin );
}

_id_50B6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._effect["flesh_hit"];

    playfxontag( var_1, self, var_0 );
}

_id_7A46( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    common_scripts\utility::flag_set( var_0 );
    _id_7A4B( "white" );
    _id_7A4C( var_3 );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_flashback", var_3 );
    _id_7A4F();

    if ( isdefined( var_5 ) )
    {
        wait 1;
        level.player maps\_utility::play_sound_on_entity( var_5 );
    }

    common_scripts\utility::flag_set( var_1 );

    if ( isdefined( var_6 ) )
        wait(var_6);

    _id_7A4C( 1 );
    wait 1.5;
    level.player maps\_utility::vision_set_fog_changes( var_2, var_4 );
    _id_7A50();
}

_id_7A47( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    level.player common_scripts\utility::_disableweapon();
    level.player hideviewmodel();

    if ( !isdefined( level.player._id_7A48 ) )
    {
        level.player._id_7A48 = maps\_utility::_id_1287( "player_rig" );
        level.player._id_7A48 hide();
    }

    var_4 = [];

    if ( isarray( var_1 ) )
        var_4 = maps\_utility::_id_0BC3( var_1, level.player._id_7A48 );
    else
        var_4 = maps\_utility::_id_2766( level.player._id_7A48, var_1 );

    var_5 = self;

    if ( var_5 == level )
    {
        var_5 = spawnstruct();
        var_5.origin = level.player.origin;
        var_5.angles = level.player.angles;
    }

    var_5 maps\_anim::_id_11CF( level.player._id_7A48, var_0 );

    if ( var_3 > 0 )
    {
        level.player freezecontrols( 1 );
        level.player playerlinktoblend( level.player._id_7A48, "tag_player", var_3, var_3 * 0.25, var_3 * 0.25 );
        wait(var_3);
    }
    else
        level.player playerlinktoabsolute( level.player._id_7A48, "tag_player" );

    waittillframeend;
    level.player notify( "player_anim_started" );
    level.player._id_7A48 show();
    var_5 maps\_anim::_id_11DD( var_4, var_0 );
    level.player unlink();
    level.player._id_7A48 delete();
    level.player freezecontrols( 0 );
    level.player showviewmodel();
    level.player common_scripts\utility::_enableweapon();

    if ( isdefined( var_2 ) && var_2 )
    {
        var_6 = bullettrace( level.player.origin + ( 0.0, 0.0, 40.0 ), level.player.origin + ( 0.0, 0.0, -100.0 ), 0, undefined, 1 );
        level.player setorigin( var_6["position"] );
    }
}

_id_7A49()
{
    level._id_7A4A = spawnstruct();
    _id_7A4E();
}

_id_7A4B( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        level._id_7A4A._id_5C3C = var_1;

    if ( isdefined( var_2 ) )
        level._id_7A4A._id_5C3D = var_2;

    level._id_7A4A.shader = var_0;
}

_id_7A4C( var_0 )
{
    level._id_7A4A._id_7A4D = var_0;
}

_id_7A4E()
{
    level._id_7A4A.x = 0;
    level._id_7A4A.y = 0;
    level._id_7A4A.horzalign = "fullscreen";
    level._id_7A4A.vertalign = "fullscreen";
    level._id_7A4A.foreground = 1;
    level._id_7A4A.alpha = 0;
    level._id_7A4A._id_7A4D = 2;
    level._id_7A4A.shader = "black";
    level._id_7A4A._id_5C3C = 640;
    level._id_7A4A._id_5C3D = 480;
}

_id_7A4F()
{
    common_scripts\utility::flag_set( "screen_fade_out_start" );
    common_scripts\utility::flag_clear( "screen_fade_in_start" );
    common_scripts\utility::flag_clear( "screen_fade_in_end" );
    common_scripts\utility::flag_set( "screen_fade_out_active" );

    if ( !isdefined( level._id_7A4A.hud ) )
        level._id_7A4A.hud = newhudelem();

    level._id_7A4A.hud.x = level._id_7A4A.x;
    level._id_7A4A.hud.y = level._id_7A4A.y;
    level._id_7A4A.hud.horzalign = level._id_7A4A.horzalign;
    level._id_7A4A.hud.vertalign = level._id_7A4A.vertalign;
    level._id_7A4A.hud.foreground = level._id_7A4A.foreground;
    level._id_7A4A.hud.alpha = level._id_7A4A.alpha;
    level._id_7A4A.hud._id_7A4D = level._id_7A4A._id_7A4D;
    level._id_7A4A.hud setshader( level._id_7A4A.shader, level._id_7A4A._id_5C3C, level._id_7A4A._id_5C3D );
    level._id_7A4A.hud fadeovertime( level._id_7A4A.hud._id_7A4D );
    level._id_7A4A.hud.alpha = 1;
    wait(level._id_7A4A.hud._id_7A4D);
    common_scripts\utility::flag_set( "screen_fade_out_end" );
    common_scripts\utility::flag_clear( "screen_fade_out_active" );
}

_id_7A50()
{
    common_scripts\utility::flag_set( "screen_fade_in_start" );
    common_scripts\utility::flag_clear( "screen_fade_out_start" );
    common_scripts\utility::flag_clear( "screen_fade_out_end" );
    common_scripts\utility::flag_set( "screen_fade_in_active" );

    if ( !isdefined( level._id_7A4A.hud ) )
        return;

    level._id_7A4A.hud.alpha = 1;
    level._id_7A4A.hud fadeovertime( level._id_7A4A.hud._id_7A4D );
    level._id_7A4A.hud.alpha = 0;
    wait(level._id_7A4A.hud._id_7A4D);
    level._id_7A4A.hud destroy();
    common_scripts\utility::flag_set( "screen_fade_in_end" );
    common_scripts\utility::flag_clear( "screen_fade_in_active" );
}

_id_7A51( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2 = maps\_utility::_id_2281( var_1.origin, 32 );
    level.player setorigin( var_2 );
    level.player setplayerangles( var_1.angles );
}

_id_6215( var_0 )
{
    self waittill( "death" );
    common_scripts\utility::flag_set( var_0 );
}

_id_789D( var_0, var_1, var_2 )
{
    var_3 = magicgrenade( "molotov", var_0.origin, var_1.origin, 5 );

    if ( !isdefined( var_3 ) )
        return;

    var_3 waittill( "death" );

    if ( isdefined( var_1.script_exploder ) )
        common_scripts\utility::exploder( var_1.script_exploder );

    if ( isdefined( var_2 ) )
    {
        var_4 = vectortoangles( var_1.origin - var_0.origin );
        var_5 = var_3.origin;
        var_6 = spawn( "script_model", var_5 );
        var_6 setmodel( "tag_origin" );
        var_6.angles = ( 270.0, 180.0, 180.0 );
        var_7 = spawn( "script_model", var_5 );
        var_7 setmodel( "tag_origin" );
        var_7.angles = ( 0.0, 0.0, 0.0 );
        var_6 linkto( var_7 );
        var_7.angles = ( 0.0, 180.0, 0.0 ) + var_4;
        playfxontag( common_scripts\utility::getfx( "molotov_trail_F" ), var_6, "tag_origin" );

        for ( var_8 = 0; var_8 < 20; var_8++ )
        {
            var_9 = anglestoforward( var_4 );
            var_10 = var_5 + var_9 * ( var_8 * 10 ) + ( 0.0, 0.0, 4.0 );
            radiusdamage( var_10, 32, 100, 100 );
            wait 0.05;
        }
    }
}

_id_213C( var_0 )
{
    thread maps\_spawner::_id_213E( var_0 );
}

_id_7A52( var_0 )
{
    level.player playrumbleonentity( "grenade_rumble" );
}

_id_7A53( var_0 )
{
    level.player playrumbleonentity( "grenade_rumble" );
    earthquake( 1, 1, level.player.origin, 64 );
}

_id_7A54( var_0 )
{
    level.player playrumbleonentity( "damage_heavy" );
}

_id_7A55( var_0 )
{
    level.player playrumbleonentity( "damage_heavy" );
    earthquake( 1, 1, level.player.origin, 64 );
    setblur( 4, 0.1 );
    wait 0.15;
    setblur( 0, 0.1 );
}

_id_7A56( var_0 )
{
    level.player playrumbleonentity( "damage_light" );
}

_id_7A57( var_0 )
{
    level.player playrumbleonentity( "grenade_rumble" );
}

_id_7A58( var_0 )
{

}

_id_7A59( var_0 )
{
    level.player playrumbleonentity( "damage_light" );
    playfxontag( common_scripts\utility::getfx( "blood_handprint" ), level._id_51F2, "J_Wrist_RI" );
    playfxontag( common_scripts\utility::getfx( "blood_handprint" ), level._id_51F2, "J_Wrist_LE" );
}

_id_7A5A( var_0 )
{
    while ( common_scripts\utility::flag( "play_left_hand_blood" ) )
    {
        playfxontag( common_scripts\utility::getfx( "blood_handprint" ), level._id_51F2, "J_Wrist_LE" );
        wait 0.2;
    }
}

_id_7A5B( var_0 )
{
    common_scripts\utility::flag_set( "play_right_hand_blood" );

    while ( common_scripts\utility::flag( "play_right_hand_blood" ) )
    {
        playfxontag( common_scripts\utility::getfx( "blood_handprint" ), level._id_51F2, "J_Wrist_RI" );
        wait 0.2;
    }
}

_id_7A5C()
{
    self endon( "death" );
    var_0 = self._id_2189 * 0.5;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 == "MOD_GRENADE" )
            self dodamage( var_0, var_2.origin );
    }
}

_id_7A5D()
{
    setsaveddvar( "ui_hidemap", 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setdvar( "old_compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "cg_drawCrosshair", 0 );
}

_id_7A5E()
{
    setsaveddvar( "ui_hidemap", 0 );
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "compass", "1" );
    setdvar( "old_compass", "1" );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "cg_drawCrosshair", 1 );
}

_id_7A5F()
{
    self startragdoll();
    wait 0.05;
}

_id_7A60()
{
    var_0 = 3;
    var_1 = 1;
    var_2 = 1.4;
    setblur( var_0 * 1.2, var_1 );
    wait(var_1);
    setblur( 0, var_2 );
}

_id_7A61( var_0 )
{
    level endon( "end_fail_monitor" );

    for (;;)
    {
        if ( distance2d( level.player.origin, level._id_54E0.origin ) > var_0 )
        {
            if ( !common_scripts\utility::flag( "outof_range" ) )
            {
                common_scripts\utility::flag_set( "outof_range" );
                common_scripts\utility::flag_clear( "in_range" );
                level._id_4877 thread _id_7A63();
                wait(randomintrange( 4, 8 ));
                level thread _id_7A62();
            }
        }
        else if ( common_scripts\utility::flag( "outof_range" ) )
        {
            common_scripts\utility::flag_set( "in_range" );
            common_scripts\utility::flag_clear( "outof_range" );
        }

        wait 0.1;
    }
}

_id_615F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( var_0 );
    var_6 = [];
    var_6[0] = var_1;

    if ( isdefined( var_2 ) )
        var_6[1] = var_2;

    if ( isdefined( var_3 ) )
        var_6[2] = var_3;

    if ( isdefined( var_4 ) )
        var_6[3] = var_4;

    if ( isdefined( var_5 ) )
        var_6[4] = var_5;

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        foreach ( var_8 in var_6 )
        {
            maps\_utility::_id_11F4( var_8 );
            wait(randomintrange( 13, 16 ));
        }
    }
}

_id_7A62()
{
    level endon( "in_range" );
    level endon( "end_fail_monitor" );
    wait 12;
    setdvar( "ui_deadquote", &"PRAGUE_ESCAPE_PROTECT_FAIL" );
    level thread maps\_utility::_id_1826();
}

_id_7A63()
{
    level endon( "in_range" );
    level endon( "end_fail_monitor" );
    var_0 = 3;

    for (;;)
    {
        var_1 = randomint( 3 );

        if ( var_1 != var_0 )
        {
            switch ( var_1 )
            {
                case 0:
                    maps\_utility::_id_168C( "presc_pri_yurigetbackhere" );
                    break;
                case 1:
                    maps\_utility::_id_168C( "presc_pri_yurigetoverhere2" );
                    break;
                case 2:
                    maps\_utility::_id_168C( "presc_pri_whereareyougoing" );
                    break;
            }

            var_0 = var_1;
            wait(randomfloatrange( 4.0, 6.0 ));
        }

        wait 0.1;
    }
}

_id_7A64( var_0 )
{
    for (;;)
    {
        var_1 = getaicount( "axis" );

        if ( var_1 < var_0 + 1 )
            break;

        wait 0.05;
    }
}

_id_7A65( var_0 )
{
    self endon( "stop_phantom_kills" );

    for (;;)
    {
        var_1 = getaiarray( "axis" );

        if ( var_1.size )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isalive( var_3 ) )
                {
                    if ( distance2d( var_3.origin, self.origin ) < var_0 )
                    {
                        var_4 = self gettagorigin( "tag_flash" );
                        var_5 = var_3 gettagorigin( "J_Head" );
                        magicbullet( "p99", var_4, var_5 );
                    }
                }
            }
        }

        wait 0.1;
    }
}

_id_7A66()
{
    var_0 = [];
    var_0[0] = "J_Shoulder_LE";
    var_0[1] = "J_Knee_LE";
    var_0[2] = "J_SpineLower";
    var_0[3] = "J_SpineUpper";
    var_0[4] = "J_Neck";
    var_0[5] = "J_Elbow_LE";
    var_0[6] = "J_Ankle_LE";
    var_1 = randomint( 7 );
    return var_0[var_1];
}

_id_7A67()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "tag_origin" );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    return var_0;
}

_id_7A68( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_attacking" );
    var_2 = randomintrange( 15, 25 );
    var_3 = 0.1;

    if ( !isdefined( self._id_7A69 ) )
        self._id_7A69 = randomintrange( 200, 250 );

    if ( isdefined( var_0 ) )
        self._id_7A69 = 0;

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        if ( common_scripts\utility::cointoss() )
            self._id_7A69 *= -1;

        if ( !isdefined( var_1 ) )
            var_5 = level.player.origin;
        else
            var_5 = var_1.origin;

        if ( isdefined( var_0 ) )
            var_5 = level.player geteye();

        self setturrettargetvec( var_5 + ( self._id_7A69, self._id_7A69, 0 ) );
        self fireweapon();
        wait(var_3);
    }
}

_id_01F3()
{
    self endon( "death" );
    var_0 = [];
    var_0[0] = "presc_rcp_intruder";
    var_0[1] = "presc_rcp_dropweapon";
    var_0[2] = "presc_rcp_handsup";
    var_0 = maps\_utility::_id_0B53( var_0 );
    var_1 = common_scripts\utility::random( var_0 );
    var_0 = common_scripts\utility::array_remove( var_0, var_1 );

    foreach ( var_3 in var_0 )
        maps\_utility::play_sound_on_entity( var_3 );
}

_id_00C3( var_0 )
{
    level notify( "dof_change" );
}
