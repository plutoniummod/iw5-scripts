// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7568()
{
    level._id_7569 = 5;
    maps\_utility::_id_27CB( "street_runner", maps\dubai_utils::_id_7447 );
    thread _id_75DF();
    thread _id_75E0();
    thread _id_75E1();
    thread _id_75A3();
    thread _id_757D();
    thread _id_7594();
    thread _id_5E51();
    thread _id_75E2();
    thread _id_75F6();
    thread _id_761F();
    thread maps\dubai_finale::_id_74B9();
    thread maps\dubai_pip::_id_7554();
}

_id_756A( var_0 )
{
    maps\_audio::aud_send_msg( "aud_start_van_blackout_foley" );
    var_1 = 1.5;
    var_2 = maps\dubai_utils::_id_473C();
    var_2.alpha = 1;
    wait(var_0);
    var_2 fadeovertime( var_1 );
    var_2.alpha = 0;
}

_id_7010()
{
    var_0 = [];
    var_0[var_0.size] = &"DUBAI_INTROSCREEN_LINE1";
    var_0["date"] = &"DUBAI_INTROSCREEN_LINE2";
    var_0[var_0.size] = &"DUBAI_INTROSCREEN_LINE3";
    var_0[var_0.size] = &"DUBAI_INTROSCREEN_LINE4";
    var_0[var_0.size] = &"DUBAI_INTROSCREEN_LINE5";
    maps\_introscreen::_id_1D96( var_0 );
}

_id_756B( var_0 )
{
    var_1 = getent( "yuri_juggernaut", "targetname" );
    var_1.script_noteworthy = "yuri_juggernaut";
    var_1 thread maps\_utility::add_spawn_function( ::_id_74DB );
    var_2 = getent( "yuri", "targetname" );
    var_2.script_noteworthy = "yuri";
    var_2 thread maps\_utility::add_spawn_function( ::_id_74DB );

    if ( isdefined( var_0 ) )
    {
        if ( var_0 == "player_start_exterior" || var_0 == "player_start_exterior_circle" || var_0 == "player_start_lobby" || var_0 == "player_start_elevator" )
        {
            maps\_shg_common::_id_166E( var_0, "yuri_juggernaut" );
            level._id_73D7 thread _id_756C();
        }
        else
            maps\_shg_common::_id_166E( var_0, "yuri" );
    }
    else
    {
        var_1 thread maps\_utility::add_spawn_function( ::_id_74DB );
        var_1 maps\_utility::_id_166F( 1 );
        level._id_73D7 thread _id_756C();
    }
}

_id_74DB()
{
    level._id_73D7 = self;
    self._id_1032 = "yuri";
    self.script_noteworthy = "yuri";
    thread maps\_utility::_id_0D04();
    maps\_utility::_id_0EEC();
}
#using_animtree("generic_human");

_id_756C()
{
    var_0 = 0.9;
    thread _id_756F( var_0 );
    self allowedstances( "stand" );
    self.a._id_0D11 = 1;
    self.dontavoidplayer = 1;
    self.nododgemove = 1;
    self.badplaceawareness = 0;
    self.combatmode = "no_cover";
    self._id_100A = 1;
    self._id_10A3 = 0.05;
    self._id_0F3C = 1;
    self.ignoresuppression = 1;
    self._id_1151 = 1;
    self._id_0FDF = 1;
    self._id_1199 = 1;
    self._id_117F = 1;
    self._id_0EEE = 1;
    self._id_0FD9 = 1;
    self.nogrenadereturnthrow = 1;
    maps\_utility::_id_2721();
    var_1 = self.grenadeawareness;
    self.grenadeawareness = 0;
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    var_2[0] = %dubai_jugg_walk_f;
    var_2[1] = %dubai_jugg_walk_l;
    var_2[2] = %dubai_jugg_walk_r;
    var_2[3] = %dubai_jugg_walk_b;
    maps\_utility::_id_26F9( "run", var_2, %dubai_jugg_walk_f );
    self._id_0C88["run"]["stairs_up"] = %dubai_juggernaut_stair_climb;
    maps\_utility::_id_26F9( "walk", var_2 );
    self._id_0C88["walk"]["stairs_up"] = %dubai_juggernaut_stair_climb;
    maps\_utility::_id_26F9( "cqb", var_2 );
    maps\_utility::_id_26F8( %juggernaut_stand_fire_burst, %juggernaut_dubai_aim5, %juggernaut_dubai_stand_idle, %dubai_juggernaut_stand_reload );
    self._id_0C82["add_aim_up"] = %juggernaut_dubai_stand_aim_high;
    self._id_0C82["add_aim_down"] = %juggernaut_dubai_stand_aim_low;
    self._id_0C82["add_aim_left"] = %juggernaut_dubai_stand_aim_left;
    self._id_0C82["add_aim_right"] = %juggernaut_dubai_stand_aim_right;
    self._id_0C82["turn_left_45"] = %dubai_jugg_turn_45_l;
    self._id_0C82["turn_left_90"] = %dubai_jugg_turn_90_l;
    self._id_0C82["turn_left_135"] = %dubai_jugg_turn_135_l;
    self._id_0C82["turn_left_180"] = %dubai_jugg_turn_180_l;
    self._id_0C82["turn_right_45"] = %dubai_jugg_turn_45_r;
    self._id_0C82["turn_right_90"] = %dubai_jugg_turn_90_r;
    self._id_0C82["turn_right_135"] = %dubai_jugg_turn_135_r;
    self._id_0C82["turn_right_180"] = %dubai_jugg_turn_180_r;
    self._id_0C82["fire"] = %juggernaut_stand_fire_burst;
    self._id_0C82["walk_aims"]["walk_aim_2"] = %juggernaut_dubai_walk_aim_low;
    self._id_0C82["walk_aims"]["walk_aim_4"] = %juggernaut_dubai_walk_aim_left;
    self._id_0C82["walk_aims"]["walk_aim_6"] = %juggernaut_dubai_walk_aim_right;
    self._id_0C82["walk_aims"]["walk_aim_8"] = %juggernaut_dubai_walk_aim_high;
    self._id_0C89 = [];
    self._id_0C89["stand"] = %juggernaut_dubai_stand_idle_non_add;
    self._id_0FC6 = var_0;
    self._id_0FF2 = 1;
    thread _id_756D();
    thread _id_756E();
    thread _id_0206();
    common_scripts\utility::flag_wait( "remove_yuri_juggernaut" );
    maps\_utility::_id_1902();
    level._id_73D7 delete();
    level._id_73D7 = getent( "yuri", "targetname" ) maps\_utility::_id_166F( 1 );
    common_scripts\utility::flag_set( "yuri_no_juggernaut_spawned" );
}

_id_0206()
{
    level endon( "remove_yuri_juggernaut" );
    var_0 = self.movemode;

    for (;;)
    {
        if ( var_0 != self.movemode )
        {
            var_0 = self.movemode;
            wait 0.05;
            waittillframeend;
            self._id_0CAB = undefined;
        }

        wait 0.05;
    }
}

_id_756D()
{
    level endon( "remove_yuri_juggernaut" );

    for (;;)
    {
        self waittill( "shoot_behavior_change" );

        if ( isdefined( self._id_023F ) && self._id_023F == 1 )
        {
            self._id_023F = 0;
            animscripts\combat_utility::_id_111E();
        }
    }
}

_id_756E()
{
    level endon( "remove_yuri_juggernaut" );

    for (;;)
    {
        if ( isdefined( self.enemy ) )
            self getenemyinfo( self.enemy );

        wait 0.05;
    }
}

_id_756F( var_0 )
{
    level endon( "remove_yuri_juggernaut" );
    var_1 = self.stairsstate;
    var_2 = self.movemode;

    for (;;)
    {
        wait 0.05;

        if ( var_1 != self.stairsstate || var_2 != self.movemode )
        {
            if ( self.stairsstate == "none" )
                self._id_0FC6 = var_0;
            else if ( self.movemode == "walk" )
                self._id_0FC6 = 1.66667;
            else
                self._id_0FC6 = 1;

            var_1 = self.stairsstate;
            var_2 = self.movemode;
        }
    }
}

_id_7570()
{
    var_0 = [ "TAG_HEARTBEAT", "J_Bipods", "TAG_FOREGRIP", "TAG_SILENCER", "TAG_ACOG_2", "TAG_EOTECH", "TAG_MAGNIFIER", "TAG_MAGNIFIER_EOTECH", "TAG_MAGNIFIER_EOTECH_RETICLE", "J_Flip", "J_Release", "J_Motion_Tracker_RotY", "TAG_FLASH_SILENCED", "TAG_THERMAL_SCOPE", "TAG_RETICLE_ACOG", "J_Motion_Tracker_RotZ", "TAG_RETICLE_RED_DOT", "TAG_RETICLE_THERMAL_SCOPE", "TAG_MOTION_TRACKER", "TAG_SCREEN_BL", "TAG_SCREEN_BR", "TAG_SCREEN_TR" ];

    foreach ( var_2 in var_0 )
        self hidepart( var_2, "viewmodel_pecheneg_sp_iw5" );
}

_id_7571()
{
    var_0 = [ "TAG_FOREGRIP" ];

    foreach ( var_2 in var_0 )
    {

    }
}

_id_5119()
{
    var_0 = getdvarint( "g_friendlyNameDist" );
    setsaveddvar( "g_friendlyNameDist", 0 );
    level.player freezecontrols( 1 );
    thread maps\_utility::_id_265A( "allies" );
    level.player disableweapons();
    level.player enableinvulnerability();
    level.player allowcrouch( 0 );
    level.player enableslowaim();
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showstance", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "vo_intro_on_black" );
    var_1 = 15;
    thread _id_756A( var_1 );
    thread _id_000F();
    maps\_utility::delaythread( var_1 - 5, ::_id_7010 );
    maps\_utility::delaythread( var_1 - 1, ::_id_7574, 15 );
    maps\_utility::delaythread( var_1 + 0.5, ::_id_7574, 12 );
    maps\_utility::delaythread( var_1 + 1.9, ::_id_7574, 5 );
    maps\_utility::delaythread( var_1 + 3, ::_id_7574, 15 );
    maps\_utility::delaythread( var_1 + 5, ::_id_7574, 9 );
    maps\_utility::delaythread( var_1 + 8.3, ::_id_7574, 4 );
    maps\_utility::delaythread( var_1 + 11, ::_id_7574, 3 );
    maps\_utility::delaythread( var_1 + 13.6, ::_id_7574, 6 );
    maps\_utility::delaythread( var_1 + 14.85, ::_id_7574, 2 );
    maps\_utility::delaythread( var_1 + 16.5, ::_id_7574, 7 );
    maps\_utility::delaythread( var_1 + 19, ::_id_7574, 6 );
    level.player common_scripts\utility::delaycall( var_1 + 16.2, ::playrumbleonentity, "damage_light" );
    wait(var_1 - 1);
    setsaveddvar( "g_friendlyNameDist", var_0 );
    level.player shellshock( "slowview", 26 );
    var_2 = "intro";
    var_3 = getent( "intro_anim_node", "targetname" );
    level._id_73D7 thread _id_7573( var_3 );
    level._id_73D7 _id_7571();
    thread _id_757B( var_3 );
    var_4 = getent( "intro_truck", "targetname" );
    var_4._id_1032 = "intro_truck";
    var_4 useanimtree( level._id_1245["intro_truck"] );
    var_5 = maps\_utility::_id_1287( "player_rig_juggernaut", ( 0.0, 0.0, 0.0 ) );
    var_5._id_1032 = "player_rig_juggernaut";
    var_6 = maps\_utility::_id_1287( "player_body_jugg", ( 0.0, 0.0, 0.0 ) );
    var_6._id_1032 = "player_body_jugg";
    var_7 = spawn( "script_model", var_3.origin );
    var_7 setmodel( "viewmodel_pecheneg_sp_iw5" );
    var_7._id_1032 = "intro_player_gun";
    var_7 useanimtree( level._id_1245["intro_player_gun"] );
    var_7 _id_7570();
    var_8 = [];
    var_8[var_8.size] = var_5;
    var_8[var_8.size] = var_6;
    var_8[var_8.size] = var_7;
    var_8[var_8.size] = var_4;
    var_3 maps\_anim::_id_11BF( var_8, var_2 );
    var_9 = 0.15;
    level.player playerlinktoblend( var_5, "tag_player", var_9 );
    level.player common_scripts\utility::delaycall( var_9 + 0.05, ::playerlinktodelta, var_5, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player common_scripts\utility::delaycall( var_9 + 0.1, ::lerpviewangleclamp, 0.5, 0.25, 0.25, 5, 25, 25, 0 );
    level.player freezecontrols( 0 );
    var_3 thread maps\_anim::_id_11DD( var_8, var_2 );
    thread _id_7576();
    var_5 thread _id_7572();
    thread maps\dubai_fx::_id_73D4();
    var_3 waittill( var_2 );
    level.player unlink();
    level.player disableinvulnerability();
    level.player allowcrouch( 1 );
    level.player disableslowaim();
    var_5 delete();
    var_6 delete();
    var_7 delete();
    common_scripts\utility::flag_set( "intro_complete" );
    thread maps\_utility::_id_1425( "intro_complete" );
    thread maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_set( "update_obj_pos_exterior_on_yuri" );
    thread _id_757C();
}

_id_000F()
{
    var_0 = spawn( "script_origin", ( 6200.0, -238.0, 60.0 ) );
    wait 2;
    var_0 playsound( "dubai_scg1_stepout" );
    wait 5;
    var_0 playsound( "dubai_scg1_openfire" );
    wait 6.5;
    var_0 playsound( "dubai_scg1_fire" );
}

_id_7572()
{
    self waittillmatch( "single anim", "raise_weapon" );
    level.player enableweapons();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "hud_showstance", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
    wait 0.5;
    level.player playrumbleonentity( "damage_light" );
}

_id_7573( var_0 )
{
    var_1 = "intro_yuri";
    var_2 = spawn( "script_model", var_0.origin );
    var_2 setmodel( "dub_juggernaut_helmet" );
    var_2._id_1032 = "intro_yuri_helmet";
    var_2 useanimtree( level._id_1245["intro_yuri_helmet"] );
    var_3 = getent( "yuri_intro", "targetname" ) maps\_utility::_id_166F( 1 );
    var_3._id_1032 = "yuri";
    self hide();
    var_4 = [];
    var_4[var_4.size] = self;
    var_4[var_4.size] = var_3;
    var_4[var_4.size] = var_2;
    thread maps\dubai_utils::_id_7446();
    var_3 thread maps\dubai_utils::_id_7446();
    var_0 thread maps\_anim::_id_11DE( var_4, var_1 );
    self waittillmatch( "single anim", "ram_door" );
    level.player playrumbleonentity( "damage_light" );
    maps\_audio::aud_send_msg( "dubai_exit_van" );
    common_scripts\utility::flag_set( "exterior_initial_enemies" );
    self show();
    var_3 delete();
    var_2 delete();
    thread maps\_utility::_id_1C43( 1 );
    var_0 waittill( var_1 );
    self notify( "anim_complete" );
    maps\dubai_utils::_id_7436( "trig_intro_yuri_move" );
}

_id_7574( var_0, var_1 )
{
    level endon( "intro_truck_left" );
    var_2 = ( 6532.0, -284.0, 88.0 );
    var_3 = spawn( "script_origin", var_2 );
    var_3.origin = ( var_2[0], var_2[1] + randomintrange( -36, 36 ), var_2[2] + randomintrange( -32, 32 ) );

    for ( var_4 = 0; var_4 < var_0; var_4++ )
    {
        var_3.origin += ( 0, randomintrange( -15, 15 ), randomintrange( -15, 15 ) );
        magicbullet( "ak47", var_3.origin, var_3.origin + ( -1.0, 0.0, 0.0 ) );
        magicbullet( "ak47", var_3.origin, var_3.origin + ( 1, randomfloatrange( -0.5, 0.5 ), randomfloatrange( -0.5, 0.5 ) ) );

        if ( randomint( 100 ) < 10 )
            level.player playrumbleonentity( "damage_light" );

        wait 0.1;
    }

    var_3 delete();
}

_id_7575()
{
    var_0 = getdvar( "bg_viewBobAmplitudeStanding" );
    var_1 = getdvar( "bg_viewBobAmplitudeStandingAds" );
    var_2 = getdvar( "bg_viewBobAmplitudeDucked" );
    var_3 = getdvar( "bg_viewBobAmplitudeDuckedAds" );
    var_4 = getdvar( "bg_weaponBobAmplitudeStanding" );
    setsaveddvar( "bg_viewBobAmplitudeStanding", "0.035 0.03" );
    setsaveddvar( "bg_viewBobAmplitudeStandingAds", "0.025 0.02" );
    setsaveddvar( "bg_viewBobAmplitudeDucked", "0.025 0.02" );
    setsaveddvar( "bg_viewBobAmplitudeDuckedAds", "0.02 0.015" );
    setsaveddvar( "bg_weaponBobAmplitudeStanding", "0.1 0.05" );
    common_scripts\utility::flag_wait( "remove_player_juggernaut" );
    setsaveddvar( "bg_viewBobAmplitudeStanding", var_0 );
    setsaveddvar( "bg_viewBobAmplitudeStandingAds", var_1 );
    setsaveddvar( "bg_viewBobAmplitudeDucked", var_2 );
    setsaveddvar( "bg_viewBobAmplitudeDuckedAds", var_3 );
    setsaveddvar( "bg_weaponBobAmplitudeStanding", var_4 );
}

_id_7576()
{
    level._id_2342 = 1;
    thread _id_7577();
    thread _id_7575();
    var_0 = level.player._id_20F2.playerhealth_regularregendelay;
    level.player._id_20F2.playerhealth_regularregendelay /= 4;
    var_1 = level.player._id_20F2._id_22F9;
    level.player._id_20F2._id_22F9 /= 5;
    level.player allowjump( 0 );
    level.player allowprone( 0 );
    level.player setviewkickscale( 0.3 );
    var_2 = getdvarfloat( "player_damageMultiplier" );
    setsaveddvar( "player_damageMultiplier", 0.3 );
    setsaveddvar( "player_radiusDamageMultiplier", 0.5 );
    sethudlighting( 1 );
    var_3 = maps\_hud_util::_id_09A7( "juggernaut_overlay_half", 1, level.player );
    var_3.foreground = 0;
    var_3 setshader( "juggernaut_overlay_half", 640, 240 );
    common_scripts\utility::flag_wait( "elevator_chopper_attack" );
    common_scripts\utility::flag_wait( "elevator_chopper_crash_done" );
    var_3 destroy();
    var_3 = maps\_hud_util::_id_09A7( "juggernaut_damaged_overlay", 1, level.player );
    var_3.foreground = 0;
    common_scripts\utility::flag_wait( "remove_player_juggernaut" );
    level._id_2342 = undefined;
    setsaveddvar( "player_damageMultiplier", var_2 );
    setsaveddvar( "player_radiusDamageMultiplier", 1 );
    var_3 destroy();
    sethudlighting( 0 );
    level.player setviewmodel( "viewhands_pmc" );
    level.player disableinvulnerability();
    level.player allowjump( 1 );
    level.player allowsprint( 1 );
    level.player setviewkickscale( 1 );
    wait 0.05;
    level.player maps\_utility::_id_2799( 100 );
    level.player._id_20F2.playerhealth_regularregendelay = var_0;
    level.player._id_20F2._id_22F9 = var_1;
}

_id_7577()
{
    level endon( "remove_yuri_juggernaut" );
    common_scripts\utility::flag_set( "player_dynamic_move_speed" );
    var_0 = 1;
    var_1 = undefined;
    level._id_73D7._id_7578 = spawnstruct();
    setdvarifuninitialized( "debug_playerDMS", 0 );
    var_2 = level._id_73D7;
    level.player maps\_utility::_id_2799( 50 );
    level.player._id_7579 = 0.5;

    while ( common_scripts\utility::flag( "player_dynamic_move_speed" ) )
    {
        var_3 = 0;
        var_4 = ( level.player.origin[0], level.player.origin[1], 0 );
        var_5 = ( var_2.origin[0], var_2.origin[1], 0 );
        var_3 = var_2 maps\dubai_utils::_id_7432();
        var_2._id_7578.origin = var_2 maps\dubai_utils::_id_7431();
        var_1 = var_2._id_7578;

        if ( distancesquared( level.player.origin, var_1.origin ) > squared( 100 ) && var_3 )
        {
            if ( var_0 > 0.55 )
                var_0 -= 0.015;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) < squared( 50 ) || var_3 )
        {
            if ( var_0 < 0.78 )
                var_0 += 0.015;

            if ( var_0 > 0.8 )
                var_0 -= 0.015;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) > squared( 300 ) )
        {
            if ( var_0 < 1.0 )
                var_0 += 0.02;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) > squared( 100 ) )
        {
            if ( var_0 < 1.0 )
                var_0 += 0.01;
        }
        else if ( distancesquared( level.player.origin, var_1.origin ) < squared( 85 ) )
        {
            if ( var_0 > 1.0 )
                var_0 -= 0.01;

            if ( var_0 < 1.0 )
                var_0 += 0.01;
        }

        level.player._id_757A = level.player._id_7579 * var_0;

        if ( level.player._id_757A > 1.1 )
            level.player._id_757A = 1.1;

        level.player setmovespeedscale( level.player._id_757A );
        wait 0.05;
    }

    level.player maps\_utility::_id_2799( 50, 3 );
}

_id_757B( var_0 )
{
    var_1 = "intro_guy1_death";
    var_2 = "intro_guy2_death";
    var_3 = "intro_guy3_death";
    var_4 = "intro_guy4_death";
    var_5 = "intro_guy5_death";
    var_6 = "intro_guy6_death";
    var_7 = getent( "intro_guy1", "targetname" ) maps\_utility::_id_166F( 1 );
    var_8 = getent( "intro_guy2", "targetname" ) maps\_utility::_id_166F( 1 );
    var_9 = getent( "intro_guy3", "targetname" ) maps\_utility::_id_166F( 1 );
    var_10 = getent( "intro_guy4", "targetname" ) maps\_utility::_id_166F( 1 );
    var_11 = getent( "intro_guy5", "targetname" ) maps\_utility::_id_166F( 1 );
    var_12 = getent( "intro_guy6", "targetname" ) maps\_utility::_id_166F( 1 );
    var_7._id_1032 = "generic";
    var_8._id_1032 = "generic";
    var_9._id_1032 = "generic";
    var_10._id_1032 = "generic";
    var_11._id_1032 = "generic";
    var_12._id_1032 = "generic";
    var_0 thread maps\_anim::_id_1246( var_7, var_1 );
    var_0 thread maps\_anim::_id_1246( var_8, var_2 );
    var_0 thread maps\_anim::_id_1246( var_9, var_3 );
    var_0 thread maps\_anim::_id_1246( var_10, var_4 );
    var_0 thread maps\_anim::_id_1246( var_11, var_5 );
    var_0 thread maps\_anim::_id_1246( var_12, var_6 );
    common_scripts\utility::flag_wait( "intro_truck_left" );
    common_scripts\utility::flag_wait( "intro_complete" );
}

_id_757C()
{
    var_0 = getent( "intro_driver", "targetname" ) maps\_utility::_id_166F();
    var_0._id_1032 = "generic";
    var_0 maps\_utility::_id_128B( "civilian_crawl_1_death_A" );
    var_0 kill();
}

_id_757D()
{
    level.destructible_badplace_radius_multiplier = 0.6;
    thread _id_7582();
    thread _id_7589();
    thread _id_758E();
    thread _id_758F();
    thread _id_757E();
    thread _id_758B();
    thread _id_7584();
    thread _id_7585();
    thread _id_7586();
    thread _id_7593();
    var_0 = [];
    var_0[0] = getent( "exterior_goal_1", "targetname" );
    var_0[1] = getent( "exterior_goal_2", "targetname" );
    var_0[2] = getent( "exterior_goal_3", "targetname" );
    var_1 = getentarray( "exterior_enemy", "script_noteworthy" );
    maps\_utility::_id_27C9( var_1, ::_id_7587, var_0 );
    thread _id_7590();
    thread _id_7591();
    maps\_utility::add_hint_string( "hint_dont_leave_yuri", &"DUBAI_DONT_LEAVE", ::_id_7592 );
    maps\_utility::_id_27CB( "suburban", ::_id_758C );
}

_id_757E()
{
    common_scripts\utility::flag_wait( "intro_complete" );
    thread _id_757F();
    common_scripts\utility::flag_wait( "yuri_car_climb" );
    maps\_utility::delaythread( 0.5, common_scripts\utility::flag_set, "exterior_suv_scene" );
}

_id_757F()
{
    common_scripts\utility::flag_wait( "exterior_juggernaut_paired_setup" );
    var_0 = "exterior_juggernaut_paired";
    var_1 = getent( "exterior_juggernaut_paired_node", "targetname" );
    var_2 = maps\_utility::_id_272F( "exterior_juggernaut_paired_enemy", 1 );
    var_2 thread _id_7580( var_0, var_1 );
    var_1 maps\_anim::_id_124A( level._id_73D7, var_0 );
    common_scripts\utility::flag_set( "exterior_juggernaut_paired_start" );

    if ( !common_scripts\utility::flag( "exterior_juggernaut_paired_complete" ) )
    {
        level._id_73D7 thread maps\dubai_utils::_id_7446();
        var_1 maps\_anim::_id_1247( level._id_73D7, var_0 );
        level._id_73D7 notify( "anim_complete" );
        common_scripts\utility::flag_set( "exterior_juggernaut_paired_complete" );
    }

    level._id_73D7 maps\_utility::_id_2686();
}

_id_7580( var_0, var_1 )
{
    self endon( "death" );
    self._id_1032 = "generic";
    self.allowdeath = 1;
    self.ignoreme = 1;
    self.health = 1;
    maps\_utility::_id_1058( 1 );
    var_1 thread maps\_anim::_id_11CF( self, var_0 );
    thread _id_7581( level._id_73D7, self );
    common_scripts\utility::flag_wait( "exterior_juggernaut_paired_start" );
    var_1 maps\_anim::_id_1246( self, var_0 );
}

_id_7581( var_0, var_1 )
{
    var_1 waittill( "death" );
    common_scripts\utility::flag_set( "exterior_juggernaut_paired_complete" );

    if ( common_scripts\utility::flag( "exterior_juggernaut_paired_start" ) )
    {
        var_0 notify( "single anim", "end" );
        var_0 stopanimscripted();
    }
}

_id_7582()
{
    common_scripts\utility::flag_wait( "exterior_initial_enemies" );
    var_0 = maps\_utility::_id_272C( "exterior_initial_enemies", 1 );
    var_0 thread _id_7583();
    common_scripts\utility::flag_wait( "exterior_suv_1" );
    wait 3;
    maps\_utility::_id_272C( "exterior_enemies_1", 1 );
    wait 5;
    maps\_utility::_id_272C( "exterior_enemies_2", 1 );
    common_scripts\utility::flag_wait( "yuri_car_climb" );
    maps\_utility::_id_272C( "exterior_enemies_3", 1 );
}

_id_7583()
{
    level maps\_utility::delaythread( 8, common_scripts\utility::flag_set, "vo_streets_start" );
    var_0 = self;

    while ( var_0.size > 0 )
    {
        var_0 = maps\_utility::_id_2672( var_0 );
        wait 0.25;
    }

    wait 1;
    common_scripts\utility::flag_set( "vo_streets_start" );
}

_id_7584()
{
    common_scripts\utility::flag_wait( "exterior_civilians_initial" );
    wait 10;
    maps\_utility::_id_27CB( "exterior_run_and_hide", maps\dubai_utils::_id_744B, "elevator_doors_closed" );
}

_id_7585()
{
    common_scripts\utility::flag_wait( "exterior_civilians_ramp" );
    wait 6;
}

_id_7586()
{
    common_scripts\utility::flag_wait( "exterior_enemies_violent_death" );
    thread _id_755E( 10, "civilians_lobby_runners", 0.2 );
}

_id_7587( var_0 )
{
    self endon( "death" );
    self.pathrandompercent = 200;
    self setgoalvolumeauto( var_0[0] );
    common_scripts\utility::flag_wait( "exterior_suv_1" );
    self setgoalvolumeauto( var_0[1] );
    common_scripts\utility::flag_wait( "yuri_car_climb" );
    self setgoalvolumeauto( var_0[2] );
}

_id_7588()
{
    var_0 = self.grenadeammo;
    common_scripts\utility::flag_wait( "intro_complete" );
    self.grenadeammo = var_0;
}

_id_7589()
{
    common_scripts\utility::flag_wait( "exterior_rpg_enemies" );
    maps\_utility::_id_27CA( "exterior_rpg_enemies", ::_id_758A );
    maps\_utility::_id_272C( "exterior_rpg_enemies", 1 );
}

_id_758A()
{
    self endon( "death" );
    self.goalradius = 256;
    self.dropweapon = 0;

    while ( !self cansee( level.player ) )
        wait 0.5;

    wait 1;
    common_scripts\utility::flag_set( "exterior_rpg_enemies_in_position" );
    common_scripts\utility::flag_wait( "remove_exterior_rpg_enemies" );
    self delete();
}

_id_758B()
{
    thread maps\dubai_fx::_id_7408();
    thread maps\dubai_fx::_id_7409();
    var_0 = getent( "suv_dest_still_01", "targetname" );
    var_0 thread maps\dubai_fx::_id_740A();
    var_0 thread _id_7622( 201, 3 );
    var_1 = getent( "suv_dest_still_02", "targetname" );
    var_1 thread maps\dubai_fx::_id_740A();
    var_1 thread _id_7622( 206, 3 );
    var_0 maps\_utility::_id_12E2( ::_id_758D );
    common_scripts\utility::flag_wait( "exterior_juggernaut_paired_start" );
    var_0 maps\_utility::_id_1A2A( ::_id_758D );
    common_scripts\utility::flag_wait( "exterior_suv_1" );
    thread maps\_utility::_id_1425( "exterior_suv_1" );
    var_2 = maps\_vehicle::_id_2881( "exterior_suv_1" );
    var_2 thread _id_7622( 202, 4 );
    maps\_audio::aud_send_msg( "bridge_suv_start_1", var_2 );
    var_2 thread maps\dubai_fx::_id_740A();
    wait 3;
    var_3 = maps\_vehicle::_id_2881( "exterior_suv_2" );
    var_3 thread _id_7622( 203, 4 );
    maps\_audio::aud_send_msg( "bridge_suv_start_2", var_3 );
    var_3 thread maps\dubai_fx::_id_740A();
}

_id_758C()
{
    maps\_utility::_id_12E2( ::_id_758D );
    self waittill( "unloaded" );
    maps\_utility::_id_1A2A( ::_id_758D );
}

_id_758D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_0 >= self.health - self._id_163B )
        self.health += var_0;
}

_id_758E()
{
    common_scripts\utility::flag_wait( "exterior_suv_scene" );
    thread maps\_utility::_id_1425( "exterior_suv_scene" );
    var_0 = maps\_vehicle::_id_2881( "exterior_suv_left" );
    maps\_audio::aud_send_msg( "suv_start_1", var_0 );
    var_0 thread maps\dubai_fx::_id_740A();
    var_0 thread _id_7622( 205, 4 );
    wait 1.2;
    var_1 = maps\_vehicle::_id_2881( "exterior_suv_right" );
    maps\_audio::aud_send_msg( "suv_start_2", var_1 );
    var_1 thread maps\dubai_fx::_id_740A();
    var_1 thread _id_7622( 204, 4 );
    var_2 = getent( "exterior_crash_glass", "targetname" );
    common_scripts\utility::noself_delaycall( 3, ::glassradiusdamage, var_2.origin, 100, 100, 100 );
    maps\_audio::aud_send_msg( "suv_04_crash", var_2 );
}

_id_758F()
{
    common_scripts\utility::flag_wait( "exterior_enemies_violent_death" );

    foreach ( var_1 in getaiarray( "axis" ) )
        var_1 thread maps\dubai_utils::_id_441E( randomfloatrange( 0, 3 ), level._id_73D7 );
}

_id_7590()
{
    common_scripts\utility::flag_wait( "player_left_map" );
    level notify( "mission failed" );
    setdvar( "ui_deadquote", &"DUBAI_DONT_LEAVE_FAILURE" );
    maps\_utility::_id_1826();
}

_id_7591()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "player_leaving_map" );
        maps\_utility::_id_1823( "hint_dont_leave_yuri", 5 );
        wait 5;
    }
}

_id_7592()
{
    if ( common_scripts\utility::flag( "player_returning_to_map" ) )
        return 1;
    else
        return 0;
}

_id_7593()
{
    var_0 = getent( "dub_lobby_frontdoor_scripted", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 linkto( var_0 );

    var_0.angles = ( 0.0, 42.0, 0.0 );
    common_scripts\utility::flag_wait( "exterior_enemies_violent_death" );
    var_5 = 0.8;
    var_0 rotateto( var_0.angles + ( 353.0, 0.0, 90.0 ), var_5, var_5 );
    maps\_audio::aud_send_msg( "hotel_door_fall", var_0 );
    wait(var_5);
    var_0 rotateto( var_0.angles + ( -4.0, 0.0, -4.0 ), 0.2, 0, 0.2 );
    wait 0.2;
    var_0 rotateto( var_0.angles + ( 4.0, 0.0, 4.0 ), 0.15, 0.15 );
}

_id_755E( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_1, "targetname" );
    var_5 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0.2;

    if ( !isdefined( var_3 ) )
        var_3 = var_2;

    while ( var_5 < var_0 )
    {
        var_4 = maps\_utility::_id_0B53( var_4 );
        var_6 = randomintrange( 1, var_4.size );
        var_6 = min( var_0 - var_5, var_6 );

        for ( var_7 = 0; var_7 < var_6; var_7++ )
        {
            var_4[var_7]._id_203F = randomintrange( 150, 200 );
            var_8 = var_4[var_7] maps\_utility::_id_166F();
            maps\_audio::aud_send_msg( "spawned_hotel_civilian", var_8 );

            if ( var_2 >= var_3 )
                wait(var_2);
            else
                wait(randomfloatrange( var_2, var_3 ));

            var_5++;
        }
    }
}

_id_7594()
{
    thread _id_7595();
    thread _id_7596();
    thread _id_7598();
    thread _id_759B();
    thread _id_759C();
    thread _id_759D();
    thread _id_759E();
    thread _id_75A0();
}

_id_7595()
{
    common_scripts\utility::flag_wait( "lobby_yuri_to_elevator" );
    thread _id_759F();
    var_0 = "elevator_enter";
    var_1 = getent( "elevator_button_anim_node", "targetname" );
    var_1 maps\_anim::_id_124A( level._id_73D7, var_0 );
    var_1 thread maps\_anim::_id_1246( level._id_73D7, var_0 );
    var_1 waittill( var_0 );
    common_scripts\utility::flag_set( "yuri_in_elevator" );
    var_0 = "elevator_enter_idle";
    var_1 thread maps\_anim::_id_124E( level._id_73D7, var_0, "player_in_elevator" );
    common_scripts\utility::flag_wait( "player_in_elevator" );
    common_scripts\utility::flag_clear( "player_dynamic_move_speed" );
    var_1 notify( "player_in_elevator" );
}

_id_7596()
{
    common_scripts\utility::flag_wait( "lobby_combat_initial" );
    wait 2;
    maps\_utility::_id_27CA( "lobby_combat_initial_enemies", ::_id_7597 );
    maps\_utility::_id_272C( "lobby_combat_initial_enemies" );
    wait 2;
    common_scripts\utility::flag_set( "vo_lobby_start" );
}

_id_7597()
{
    self endon( "death" );
    maps\_utility::_id_260D();
    self._id_1382 = 1;
    common_scripts\utility::flag_wait( "lobby_combat_top" );
    self setgoalentity( level.player, 5 );
}

_id_7598()
{
    common_scripts\utility::flag_wait( "lobby_combat_ascent" );
    maps\_audio::aud_send_msg( "mus_board_escalator" );
    thread _id_7599();
    common_scripts\utility::flag_set( "remove_exterior_rpg_enemies" );
    maps\_utility::_id_272C( "lobby_combat_ascent_enemies" );
}

_id_7599()
{
    maps\_utility::_id_27CA( "lobby_combat_top_initial_enemies", ::_id_759A );
    maps\_utility::_id_272C( "lobby_combat_top_initial_enemies" );
}

_id_759A()
{
    self endon( "death" );
    maps\_utility::_id_0D04();
    self setgoalpos( self.origin );
    self.goalradius = 200;
    common_scripts\utility::flag_wait( "lobby_combat_top" );
    maps\_utility::_id_1902();
    self.goalradius = 500;
}

_id_759B()
{
    level endon( "lobby_combat_top_right" );
    common_scripts\utility::flag_wait( "lobby_combat_top_left" );
    common_scripts\utility::flag_set( "lobby_combat_top" );
    maps\_utility::_id_272C( "lobby_combat_top_left_enemies" );
}

_id_759C()
{
    level endon( "lobby_combat_top_left" );
    common_scripts\utility::flag_wait( "lobby_combat_top_right" );
    common_scripts\utility::flag_set( "lobby_combat_top" );
    maps\_utility::_id_272C( "lobby_combat_top_right_enemies" );
}

_id_759D()
{
    common_scripts\utility::flag_wait( "lobby_combat_top_gallery" );
    maps\_utility::_id_272C( "lobby_combat_top_gallery_enemies" );
}

_id_759E()
{
    common_scripts\utility::flag_wait( "lobby_combat_top_final" );
    maps\_utility::_id_272C( "lobby_combat_top_enemies" );
}

_id_759F()
{
    foreach ( var_1 in getaiarray( "axis" ) )
        var_1 thread maps\dubai_utils::_id_441E( randomfloatrange( 0, 3 ), level._id_73D7 );
}

_id_75A0()
{
    thread _id_75A1();
    maps\_utility::_id_27CB( "civilians_lobby_stationary", maps\dubai_utils::_id_7449, "elevator_doors_closed" );
    maps\_utility::_id_27CB( "civilians_lobby_top_drones", maps\dubai_utils::_id_744B, "elevator_doors_closed" );
    common_scripts\utility::flag_wait( "lobby_combat_top" );
    maps\_utility::_id_272D( "civilians_lobby_top_drones" );
    common_scripts\utility::flag_wait( "lobby_combat_ascent" );
    maps\_utility::_id_272C( "civilians_lobby_cower_upstairs", 1 );
}

_id_75A1()
{
    maps\_utility::_id_27CB( "civilians_lobby_elevator", maps\dubai_utils::_id_744A );
    common_scripts\utility::flag_wait( "lobby_combat_ascent" );
    level._id_75A2 thread common_scripts\_elevator::close_outer_doors( 0 );
    common_scripts\utility::flag_wait( "lobby_yuri_to_elevator" );
    level._id_75A2 thread common_scripts\_elevator::open_outer_doors( 0 );
    maps\_audio::aud_send_msg( "1st_elevator_doors_open", level._id_75A2 common_scripts\_elevator::get_housing_leftdoor() );
    var_0 = maps\_utility::_id_272C( "civilians_lobby_elevator_drones" );
    maps\_audio::aud_send_msg( "start_elevator_civ_runners", var_0 );
}

_id_75A3()
{
    var_0 = getent( "ocean_initial", "targetname" );
    var_1 = getent( "ocean_vista", "targetname" );
    var_1 hide();

    for (;;)
    {
        common_scripts\utility::flag_wait( "ocean_vista" );
        common_scripts\utility::flag_clear( "ocean_initial" );
        var_1 show();
        var_0 hide();
        common_scripts\utility::flag_wait( "ocean_initial" );
        common_scripts\utility::flag_clear( "ocean_vista" );
        var_0 show();
        var_1 hide();
    }
}

_id_5E51()
{
    setdvar( "scr_elevator_speed", "125" );
    level.elevator_debug = 1;
    level._id_75A2 = maps\dubai_utils::_id_7433( "usable_elevator" );
    level._id_75A4 = maps\dubai_utils::_id_7433( "replacement_elevator" );
    level._id_75A2 thread maps\dubai_utils::_id_7444();
    level._id_75A4 thread maps\dubai_utils::_id_7444();
    thread _id_75A5();
    thread _id_75B5();
    thread _id_75B7();
    thread _id_75A9();
    thread _id_75AB();
    var_0 = getent( "lobby_elevator_badplace", "targetname" );
    badplace_brush( "lobby_elevator_badplace", -1, var_0, "axis" );
    var_1 = getent( "top_floor_elevator_badplace", "targetname" );
    badplace_brush( "top_floor_elevator_badplace", -1, var_1, "axis" );
}

_id_75A5()
{
    level._id_7441 = 300;
    common_scripts\utility::array_thread( getentarray( "elevator_glass", "targetname" ), maps\dubai_utils::_id_7440 );
}

_id_75A6()
{
    level endon( "player_jumping" );
    level endon( "drop_player_elevator" );
    level endon( "player_falling_kill_in_progress" );
    level.player waittill( "death" );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = level.player.origin;
    var_0 linkto( level._id_75A2.e["housing"]["mainframe"][0] );
    level.player playerlinkto( var_0 );
}

_id_75A7()
{
    level endon( "player_at_top_floor" );
    level.player waittill( "death" );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = level.player.origin;
    var_1 = getent( "elevator_replacement_blocker", "targetname" );
    var_0 linkto( var_1 );
    level.player playerlinkto( var_0 );
}

_id_75A8()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0.angles = level.player.angles;
    level.player playersetgroundreferenceent( var_0 );
    var_1 = 45;
    var_2 = 0.1;
    var_3 = 3;

    if ( level.player getstance() == "stand" )
        var_3 = 52;
    else if ( level.player getstance() == "crouch" )
        var_3 = 32;

    level.player setorigin( level.player.origin - ( 0, 0, var_3 ) );
    level.player setplayerangles( level.player.angles + ( 0.0, 0.0, 45.0 ) );
}

_id_75A9()
{
    common_scripts\utility::flag_wait( "elevator_chopper_killed" );
    level.player allowcrouch( 0 );
    level.player enableinvulnerability();
    common_scripts\utility::flag_wait( "elevator_chopper_crash_done" );
    level.player hideviewmodel();
    level.player thread maps\dubai_finale::_id_6FFD( 4, 0, 2, 1 );
    var_0 = getdvarint( "g_friendlyNameDist" );
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showstance", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    var_1 = getent( "elevator_button_anim_node", "targetname" );
    var_2 = "remove_gear_player";
    var_3 = level.player getcurrentweapon();

    if ( var_3 != level.secondaryweapon )
    {
        var_4 = level.player getweaponslistall();

        foreach ( var_6 in var_4 )
        {
            if ( var_6 == level.secondaryweapon )
                var_3 = level.secondaryweapon;
        }
    }

    level.player switchtoweapon( var_3 );
    level.player disableweapons();
    var_8 = maps\_utility::_id_1287( "player_rig_juggernaut", var_1.origin );
    var_8._id_1032 = "player_rig_juggernaut";
    var_8 linkto( var_1 );
    thread maps\dubai_fx::_id_73D8( var_8 );
    level.player playerlinktoblend( var_8, "tag_player", 0.5, 0.2, 0.2 );
    var_1 thread maps\_anim::_id_1246( var_8, var_2 );
    var_8 thread _id_75AA();
    var_9 = maps\dubai_utils::_id_473C();
    setblur( 4, 0 );
    common_scripts\utility::noself_delaycall( 2, ::setblur, 2, 2 );
    var_8 waittillmatch( "single anim", "remove_player_helm" );
    wait 0.4;
    level.player playrumbleonentity( "damage_light" );
    var_10 = 0.05;
    var_9 thread maps\dubai_utils::blackout( var_10, 2 );
    wait(var_10);
    common_scripts\utility::flag_set( "remove_player_juggernaut" );
    wait 0.1;
    var_9 maps\dubai_utils::_id_7451( 0.1, 2 );
    var_8 waittillmatch( "single anim", "fade_out" );
    var_9 maps\dubai_utils::blackout( 0.5, 4 );
    var_1 waittill( var_2 );
    var_8 setmodel( "viewhands_player_pmc" );
    var_8._id_1032 = "player_rig";
    var_11 = "remove_gear_player_2";
    var_1 maps\_anim::_id_11CF( var_8, var_11 );
    level.player freezecontrols( 1 );
    wait 2.5;
    common_scripts\utility::flag_set( "elevator_remove_gear_2" );
    level.player freezecontrols( 0 );
    var_1 thread maps\_anim::_id_1246( var_8, var_11 );
    var_9 thread maps\dubai_utils::_id_7451( 1, 2 );
    common_scripts\utility::noself_delaycall( 1, ::setblur, 0, 1 );
    level.player common_scripts\utility::delaycall( 1.5, ::playrumbleonentity, "damage_light" );
    var_8 waittillmatch( "single anim", "hide_player_chest_piece" );
    level notify( "hide_player_chest_piece" );
    var_1 waittill( var_11 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    setsaveddvar( "g_friendlyNameDist", var_0 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "hud_showstance", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
    thread _id_75C2();
    thread maps\_utility::_id_1425( "elevator_jump_start" );
    var_8 unlink();
    level.player unlink();
    var_8 delete();
    common_scripts\utility::flag_wait( "replacement_elevator_in_position" );
    thread _id_75BC();
    common_scripts\utility::flag_wait( "player_jumped_to_replacement_elevator" );
    level.player allowjump( 0 );
    level waittill( "elevator_doors_opening" );
    level.player allowjump( 1 );
    level.player disableinvulnerability();
}

_id_75AA()
{
    maps\_utility::_id_2772( 0.75 );
    maps\_utility::_id_2774( 0 );
    maps\_utility::_id_0A16( 0.5 );
    self waittillmatch( "single anim", "start_slomo" );
    maps\_utility::_id_2775();
    self waittillmatch( "single anim", "end_slomo" );
    maps\_utility::_id_0A17();
}

_id_75AB()
{
    common_scripts\utility::flag_wait( "player_in_elevator" );
    var_0 = getent( "elevator_button_anim_node", "targetname" );
    var_0 linkto( level._id_75A2.e["housing"]["mainframe"][0] );
    var_1 = "elevator_press_button";
    var_0 thread maps\_anim::_id_1246( level._id_73D7, var_1 );
    level._id_73D7 waittillmatch( "single anim", "anim_elevator_button_pressed" );
    common_scripts\utility::flag_set( "elevator_button_pressed" );
    maps\_audio::aud_send_msg( "mus_elevator_button_pressed" );
    level waittill( "elevator_interior_button_pressed" );
    level._id_73D7 linkto( level._id_75A2.e["housing"]["mainframe"][0] );
    var_2 = getent( "elevator_button_anim_node", "targetname" );
    var_2 linkto( level._id_75A2.e["housing"]["mainframe"][0] );
    var_3 = getent( "top_floor_yuri_grenade_location", "targetname" );
    var_3 linkto( level._id_75A4.e["housing"]["mainframe"][0] );
    level._id_73D7 thread _id_75B0();
    level._id_73D7 thread _id_75B2();
    var_0 waittill( var_1 );
    var_4 = "elevator_idle_scan";
    var_0 thread maps\_anim::_id_124E( level._id_73D7, var_4, "chopper_attack_started" );
    common_scripts\utility::flag_wait( "elevator_chopper_preattack" );
    level._id_73D7 maps\_utility::_id_26F8( %dubai_jugg_elevator_idle_scan_fire, %juggernaut_high_aim5, %juggernaut_high_aim_idle, %dubai_juggernaut_stand_reload );
    level._id_73D7._id_0C82["add_aim_up"] = %dubai_jugg_scan_aim_high;
    level._id_73D7._id_0C82["add_aim_down"] = %dubai_jugg_scan_aim_low;
    level._id_73D7._id_0C82["add_aim_left"] = %dubai_jugg_scan_aim_left;
    level._id_73D7._id_0C82["add_aim_right"] = %dubai_jugg_scan_aim_right;
    level._id_73D7 allowedstances( "stand" );
    level._id_73D7.a._id_0D11 = 1;
    var_5 = level._id_73D7.minpaindamage;
    level._id_73D7.minpaindamage = 100000;
    var_6 = anim._id_20A1;
    var_7 = anim._id_209E;
    anim._id_20A1 = 60;
    anim._id_209E = 45;
    var_0 notify( "chopper_attack_started" );
    level._id_73D7.ignoreme = 1;
    common_scripts\utility::flag_wait( "elevator_chopper_near_crash" );
    level._id_73D7.ignoreme = 0;
    var_1 = "chopper_react";
    var_2 thread maps\_anim::_id_1246( level._id_73D7, var_1 );
    common_scripts\utility::flag_wait( "elevator_chopper_crash_done" );
    level._id_73D7 maps\_utility::_id_26F8( %juggernaut_stand_fire_burst, %juggernaut_dubai_aim5, %juggernaut_dubai_stand_idle, %dubai_juggernaut_stand_reload );
    level._id_73D7._id_0C82["add_aim_up"] = %juggernaut_dubai_stand_aim_high;
    level._id_73D7._id_0C82["add_aim_down"] = %juggernaut_dubai_stand_aim_low;
    level._id_73D7._id_0C82["add_aim_left"] = %juggernaut_dubai_stand_aim_left;
    level._id_73D7._id_0C82["add_aim_right"] = %juggernaut_dubai_stand_aim_right;
    level._id_73D7 allowedstances( "stand", "crouch", "prone" );
    level._id_73D7.a._id_0D11 = 0;
    level._id_73D7.minpaindamage = var_5;
    anim._id_20A1 = var_6;
    anim._id_209E = var_7;
    earthquake( 0.4, 3, level.player.origin, 8000 );
    var_8 = spawn( "script_model", var_2.origin );
    var_8 setmodel( "dub_juggernaut_chestarmor" );
    var_8._id_1032 = "elevator_gear";
    var_8 useanimtree( level._id_1245["elevator_gear"] );
    common_scripts\utility::flag_set( "remove_yuri_juggernaut" );
    common_scripts\utility::flag_wait( "yuri_no_juggernaut_spawned" );
    var_1 = "remove_gear";
    var_9[0] = level._id_73D7;
    var_9[1] = var_8;
    level._id_73D7 setmodel( "body_juggernaut_quartergear" );
    var_2 maps\_anim::_id_11BF( var_9, var_1 );
    level._id_73D7 linkto( var_2 );
    var_2 thread maps\_anim::_id_11DD( var_9, var_1 );
    var_10 = spawn( "script_model", var_2.origin );
    var_10 setmodel( "dub_juggernaut_helmet" );
    var_10 maps\_utility::_id_27A0( level._id_73D7, "TAG_INHAND" );
    var_10 linkto( level._id_73D7, "TAG_INHAND" );
    var_11 = "remove_gear_2";
    common_scripts\utility::flag_wait( "elevator_remove_gear_2" );
    var_10 delete();
    var_8 thread _id_75AF();
    level._id_73D7 setmodel( "body_juggernaut_nogear" );
    level._id_73D7 linkto( level._id_75A2.e["housing"]["mainframe"][0] );
    var_2 thread maps\_anim::_id_11DD( var_9, var_11 );
    level._id_73D7 waittillmatch( "single anim", "elevator_replacement_call" );
    level._id_75A4 thread _id_75C4();
    level._id_73D7 waittillmatch( "single anim", "elevator_shake" );
    common_scripts\utility::flag_set( "elevator_initial_short_drop" );
    thread _id_75AC( var_3 );
    thread _id_75AD();
    level._id_73D7 waittillmatch( "single anim", "elevator_drop" );
    common_scripts\utility::flag_set( "elevator_initial_big_drop" );
    level._id_73D7 unlink();
    level._id_73D7 linkto( level._id_75A4.e["housing"]["mainframe"][0] );
}

_id_75AC( var_0 )
{
    common_scripts\utility::flag_wait( "player_jumped_to_replacement_elevator" );
    wait 0.4;
    level._id_73D7 thread _id_75DE( var_0 );
    level waittill( "elevator_doors_opening" );
    level._id_73D7 unlink();
}

_id_75AD()
{
    level endon( "elevator_break_glass" );
    level._id_73D7 waittillmatch( "single anim", "elevator_break_glass" );
    level notify( "elevator_break_glass" );
}

_id_75AE()
{
    level._id_7441 = 400;
    level waittill( "elevator_break_glass" );
    var_0 = getentarray( "elevator_replacement_glass_des", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2.damagetype = "MOD_RIFLE_BULLET";

    common_scripts\utility::array_thread( var_0, maps\dubai_utils::_id_7443 );
    level._id_7441 = 300;
}

_id_75AF()
{
    level waittill( "hide_player_chest_piece" );
    self delete();
}

_id_75B0()
{
    thread _id_75B1();
    self.ignoreall = 1;
    level endon( "elevator_chopper_killed" );
    common_scripts\utility::flag_wait( "elevator_chopper_preattack" );
    self.ignoreall = 0;
    var_0 = getentarray( "elevator_attack_chopper_target_ents", "script_noteworthy" );
    self setentitytarget( var_0[0] );
}

_id_75B1()
{
    common_scripts\utility::flag_wait( "elevator_chopper_killed" );

    if ( isdefined( self ) )
        self clearentitytarget();
}

_id_75B2()
{
    level endon( "elevator_chopper_killed" );

    while ( self.origin[2] < 5120 )
        wait 0.25;

    level._id_75B3 maps\_vehicle::_id_2A12();
    level.player endon( "death" );
    level.player enablehealthshield( 0 );
    level._id_75B3 thread common_scripts\utility::play_loop_sound_on_entity( "littlebird_gatling_fire" );

    for (;;)
    {
        foreach ( var_1 in level._id_75B3.mgturret )
            playfxontag( common_scripts\utility::getfx( "blackhawk_flash_armada" ), var_1, "tag_flash" );

        level.player dodamage( 15 / level.player.damagemultiplier, level._id_75B3.origin, level._id_75B3 );
        var_3 = randomfloatrange( 0.1, 0.3 );
        wait(var_3);
    }
}

_id_75B4( var_0 )
{
    var_1 = getentarray( "elevator_replacement_glass_des", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3.damagetype = "MOD_RIFLE_BULLET";

    maps\_utility::delaythread( 1, common_scripts\utility::array_thread, var_1, maps\dubai_utils::_id_7442 );
    var_5 = "elevator_jump";
    var_0 thread maps\_anim::_id_1246( level._id_73D7, var_5 );
    maps\_utility::delaythread( 1.8, common_scripts\utility::array_thread, var_1, maps\dubai_utils::_id_7443 );
    common_scripts\utility::flag_wait( "replacement_elevator_in_position" );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "update_obj_pos_elevator_jump" );
    var_0 unlink();
    var_0 linkto( level._id_75A4.e["housing"]["mainframe"][0] );
    var_0 waittill( var_5 );
    level endon( "player_elevator_jump_successul" );
    var_5 = "elevator_jump_idle";
    var_0 thread maps\_anim::_id_1246( level._id_73D7, var_5 );
}

_id_75B5()
{
    level._id_75A2 thread _id_75BF();
    level._id_75A4 thread _id_75C3();
}

_id_75B6( var_0 )
{
    self endon( "done_player_keep_away_from_yuri" );

    for (;;)
    {
        var_1 = level._id_73D7;

        if ( isdefined( var_1 ) )
        {
            var_2 = level.player.origin;
            var_3 = var_1.origin;
            var_4 = distance2d( var_2, var_3 );

            if ( var_4 < var_0 )
            {
                var_5 = var_2[2] - var_3[2];

                if ( var_5 > -4 && var_5 < 72 )
                {
                    var_6 = var_2 - var_3;
                    var_6 = ( var_6[0], var_6[1], 0 );
                    var_6 = vectornormalize( var_6 );
                    var_7 = ( var_0 - var_4 ) * 1000 * 0.05;
                    var_8 = var_6 * var_7 * 0.2;
                    level.player setvelocity( var_8 );
                }
            }
        }

        wait 0.05;
    }
}

_id_75B7()
{
    level waittill( "elevator_interior_button_pressed" );
    common_scripts\utility::flag_set( "update_obj_pos_in_elevator" );
    level.player thread _id_75B6( 40 );
    thread _id_75A6();
    thread maps\_utility::_id_265A( "allies" );
    thread maps\_utility::_id_265A( "axis" );
    wait 0.25;
    common_scripts\utility::flag_set( "vo_elevator_start" );
    wait 6.5;
    maps\_utility::_id_27CA( "elevator_ambient_chopper", ::_id_75DD );
    var_0 = maps\_vehicle::_id_2881( "elevator_ambient_chopper" );
    maps\_audio::aud_send_msg( "ambient_elevator_chopper", var_0 );
    level.player._id_75B8 = common_scripts\utility::spawn_tag_origin();
    level.player._id_75B9 = 60;
    level.player thread _id_75C8();
    var_1 = getent( "elevator_attack_chopper", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_75CA );
    level._id_75B3 = var_1 maps\_vehicle::_id_1F9E();
    level._id_75B3 maps\_utility::_id_12E2( ::_id_75CC );
    maps\_audio::aud_send_msg( "elevator_attack_chopper", level._id_75B3 );

    if ( getdvarint( "dev_elevator_anim_test" ) )
    {
        level._id_75B3 kill();
        level._id_75B3 delete();
    }

    level waittill( "elevator_doors_opening" );
    common_scripts\utility::flag_set( "player_at_top_floor" );
    common_scripts\utility::flag_set( "update_obj_pos_top_floor_atrium_landing" );
    level.player notify( "done_player_keep_away_from_yuri" );
    thread maps\_utility::_id_1425( "top_floor_start" );
    thread maps\_utility::_id_265B( "allies" );
    thread maps\_utility::_id_265B( "axis" );
}

_id_75BA()
{
    var_0 = getent( "elevator_player_jump_node", "targetname" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_2 = level._id_75A2 common_scripts\_elevator::get_housing_mainframe();
    var_3 = level._id_75A4 common_scripts\_elevator::get_housing_mainframe();
    common_scripts\utility::flag_wait( "replacement_elevator_in_position" );
    var_4 = var_3 setcontents( 0 );
    thread _id_75BB();
    var_0.origin += ( 0.0, 0.0, 100.0 );
    var_0 linkto( var_2 );
    level waittill( "player_elevator_jump_successul" );
    var_5 = 866.667;
    var_6 = gettime();
    common_scripts\utility::flag_wait( "elevator_initial_big_drop" );
    var_7 = gettime() - var_6;

    if ( !common_scripts\utility::flag( "elevator_initial_big_drop_done" ) )
    {
        var_1.origin += ( 0.0, 0.0, 100.0 );

        if ( var_7 >= var_5 )
        {
            var_0 unlink();
            var_0.origin = var_1.origin;
            var_0 linkto( var_3 );
        }
        else
        {
            var_0 unlink();
            var_8 = ( var_5 - var_7 ) * 0.001;

            if ( var_8 > 0.05 )
            {
                var_0 moveto( var_1.origin, var_8, 0.0, 0.0 );
                wait(var_8);
            }

            var_0.origin = var_1.origin;
            var_0 linkto( var_3 );
        }
    }
    else
    {
        var_0 unlink();
        var_0.origin = var_1.origin;
        var_0 linkto( var_3 );
    }

    var_1 delete();
    common_scripts\utility::flag_wait( "player_finished_jump_to_replacement_elevator" );
    var_3 setcontents( var_4 );
}

_id_75BB()
{
    wait 1;
    var_0 = level._id_73D7 setcontents( 0 );
    common_scripts\utility::flag_wait( "player_finished_jump_to_replacement_elevator" );
    level._id_73D7 setcontents( var_0 );
}

_id_75BC()
{
    thread _id_75BA();
    var_0 = getent( "elevator_player_jump_node", "targetname" );
    var_1 = anglestoforward( var_0.angles + ( 0.0, -90.0, 0.0 ) );
    var_2 = maps\_utility::_id_1287( "player_rig", var_0.origin );
    var_2 hide();
    var_3 = getent( "elevator_jump_trigger", "targetname" );
    thread maps\dubai_utils::_id_6741();

    for (;;)
    {
        var_4 = 0;

        while ( level.player istouching( var_3 ) )
        {
            common_scripts\utility::flag_wait( "player_jumping" );

            if ( maps\dubai_utils::_id_743E( var_3, var_1, 0.915, 1 ) )
            {
                var_4 = 1;
                break;
            }

            wait 0.05;
        }

        if ( var_4 )
            break;

        wait 0.05;
    }

    level notify( "player_jump_watcher_stop" );
    level notify( "player_elevator_jump_successul" );
    stopallrumbles();
    maps\_audio::aud_send_msg( "mus_elevator_heli_player_jump" );

    if ( common_scripts\utility::flag( "drop_player_elevator" ) )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_elevator_jump_complete" );
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "drop_player_elevator" );
    var_5 = "elevator_jump_player";

    if ( !common_scripts\utility::flag( "elevator_initial_big_drop" ) || !common_scripts\utility::flag( "elevator_initial_big_drop_done" ) )
        var_5 = "elevator_jump_player_early";

    var_6[0] = var_2;
    var_0 maps\_anim::_id_11BF( var_6, var_5 );
    var_2 linkto( var_0 );
    var_7 = 0.75;
    level.player playerlinktoblend( var_2, "tag_player", var_7 );
    level.player common_scripts\utility::delaycall( 5.5, ::enableweapons );
    level.player common_scripts\utility::delaycall( 5.5, ::showviewmodel );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_2 common_scripts\utility::delaycall( var_7, ::show );
    level maps\_utility::delaythread( 1.0, common_scripts\utility::flag_set, "player_jumped_to_replacement_elevator" );
    level thread maps\_utility::_id_1424( "elevator_break_glass", 0.8 );
    level.player common_scripts\utility::delaycall( 0.8, ::playrumbleonentity, "damage_light" );
    var_0 thread maps\_anim::_id_1246( var_6[1], var_5 );
    var_0 maps\_anim::_id_1246( var_6[0], var_5 );
    common_scripts\utility::flag_set( "player_finished_jump_to_replacement_elevator" );
    level.player unlink();
    var_2 delete();
    thread _id_75A7();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    wait 4;
    common_scripts\utility::flag_set( "top_floor_countdown_start" );
}

_id_75BD()
{
    level endon( "player_elevator_jump_successul" );
    var_0 = getent( "elevator_drop_volume", "targetname" );

    while ( level.player.origin[2] > level._id_75BE || level.player istouching( var_0 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "elevator_player_missed_jump" );
    common_scripts\utility::flag_set( "vo_elevator_player_falling" );
    thread maps\dubai_utils::_id_743F();
    stopallrumbles();
}

_id_75BF()
{
    var_0 = common_scripts\_elevator::get_housing_mainframe();
    var_1 = getent( "elevator_destroyed_section_intact", "script_noteworthy" );
    var_1 linkto( var_0 );
    var_2 = getent( "elevator_helicopter_crash_location", "script_noteworthy" );
    var_2 linkto( var_0 );
    var_3 = getentarray( "elevator_chopper_rocket_miss_targets", "targetname" );

    foreach ( var_5 in var_3 )
        var_5 linkto( var_0 );

    var_7 = getent( "elevator_jump_trigger", "targetname" );
    var_7 enablelinkto();
    var_7 linkto( var_0 );
    var_8 = common_scripts\_elevator::get_outer_leftdoor( 0 );
    var_9 = common_scripts\_elevator::get_outer_rightdoor( 0 );
    var_8 connectpaths();
    var_9 connectpaths();
    var_10 = getent( "player_elevator_blocker", "targetname" );
    var_10 notsolid();
    common_scripts\utility::flag_wait( "lobby_yuri_to_elevator" );
    thread maps\dubai_utils::_id_744D( "elevator_initial_model", "player_jumped_to_replacement_elevator" );
    common_scripts\utility::flag_wait( "player_in_elevator" );
    var_10 solid();
    common_scripts\utility::flag_wait( "elevator_button_pressed" );
    common_scripts\_elevator::call_elevator( 1 );
    maps\_audio::aud_send_msg( "1st_elevator_doors_close", common_scripts\_elevator::get_housing_leftdoor() );
    self waittill( "closed_inner_doors" );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    var_11 = maps\_utility::_id_27AB( "subtle_tank_rumble" );
    var_11.intensity = 0.45;
    maps\_audio::aud_send_msg( "1st_elevator_platform_start", var_0 );
    common_scripts\utility::flag_wait( "elevator_chopper_crash_done" );
    var_11 stoprumble( "subtle_tank_rumble" );
    maps\_audio::aud_send_msg( "1st_elevator_platform_stop", var_0 );
    maps\dubai_utils::_id_7434( ( 0.0, 0.0, 1.0 ), 0.05, 0.025, 0.025 );
    maps\_utility::delaythread( 0.05, maps\dubai_utils::_id_7434, ( 0.0, 0.0, -1.0 ), 0.05, 0.025, 0.025 );
    common_scripts\utility::exploder( 100 );
    var_12 = getent( "elevator_initial_model", "script_noteworthy" );
    var_12 setmodel( "dub_bldg_elevator_des" );
    var_0 = common_scripts\_elevator::get_housing_mainframe();
    var_13 = self.e["housing"]["mainframe"][1];
    thread maps\dubai_fx::_id_73D9( var_13 );
    thread maps\dubai_fx::_id_73D6();
    var_14 = 50;
    var_15 = 100;
    level._id_75BE = var_0.origin[2] - var_15 - var_14 - 100;
    thread _id_75BD();
    var_11 = maps\_utility::_id_27AB( "steady_rumble" );
    var_11 thread maps\_utility::_id_27AF( 0, 3 );
    thread _id_75C1();
    common_scripts\utility::flag_wait( "elevator_initial_short_drop" );
    maps\_audio::aud_send_msg( "elevator_short_drop", var_0 );
    var_16 = 1;
    thread maps\dubai_utils::_id_7435( var_16, var_14 );
    thread maps\dubai_fx::_id_73DC( var_13 );
    earthquake( 0.25, var_16, level.player.origin, 200 );
    wait(var_16);
    earthquake( 0.5, 0.5, level.player.origin, 200 );
    thread maps\dubai_fx::_id_73DA( var_13 );
    common_scripts\utility::flag_wait( "replacement_elevator_in_position" );
    thread maps\_utility::_id_25EE( "drop_player_elevator", 7 );
    common_scripts\utility::flag_wait( "elevator_initial_big_drop" );
    maps\_audio::aud_send_msg( "elevator_big_drop", var_0 );
    var_16 = 1;
    thread maps\dubai_utils::_id_7435( var_16, var_15 );
    thread maps\dubai_fx::_id_73DC( var_13 );
    earthquake( 0.25, var_16, var_0.origin, 200 );
    wait(var_16);
    common_scripts\utility::flag_set( "elevator_initial_big_drop_done" );
    earthquake( 1, 0.5, var_0.origin, 200 );
    thread maps\dubai_fx::_id_73DB( var_13 );
    common_scripts\utility::flag_wait( "drop_player_elevator" );
    maps\_audio::aud_send_msg( "elevator_freefall", var_13 );

    if ( !common_scripts\utility::flag( "update_obj_pos_elevator_jump_complete" ) )
    {
        level.player allowjump( 0 );
        common_scripts\utility::flag_set( "vo_elevator_player_falling" );
        thread _id_75C0();
    }

    var_16 = 10;
    thread maps\dubai_utils::_id_7435( var_16 );
    thread maps\dubai_fx::_id_73DD( var_13 );

    while ( var_13.origin[2] > 160 )
        wait 0.05;

    maps\_audio::aud_send_msg( "aud_elevator_fail_fall", var_13 );
    self.e["housing"]["inside_trigger"] delete();
    earthquake( 0.15, 1, level.player.origin, 200 );
    var_17 = getent( "elevator_crash_explosion_marker", "targetname" );
    playfx( level._effect["elevator_explosion"], var_17.origin );
}

_id_75C0()
{
    level endon( "elevator_player_missed_jump" );
    var_0 = maps\_utility::_id_27AB( "steady_rumble" );
    var_0.intensity = 0.25;
}

_id_75C1()
{
    level endon( "player_elevator_jump_successul" );
    level endon( "drop_player_elevator" );
    level endon( "elevator_player_missed_jump" );
    common_scripts\utility::flag_wait( "elevator_initial_short_drop" );
    var_0 = maps\_utility::_id_27AB( "steady_rumble" );
    var_0.intensity = 0;
    var_0 maps\_utility::_id_27AF( 1, 1 );
    var_0 maps\_utility::_id_27AF( 0, 0.5 );
    common_scripts\utility::flag_wait( "elevator_initial_big_drop" );
    var_0 = maps\_utility::_id_27AB( "steady_rumble" );
    var_0.intensity = 0;
    var_0 maps\_utility::_id_27AF( 1, 1 );
    var_0 maps\_utility::_id_27AF( 0, 0.5 );
}

_id_75C2()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_0 );
    var_1 = 0;

    for ( var_2 = 0; !common_scripts\utility::flag( "player_jumped_to_replacement_elevator" ); var_1++ )
    {
        var_3 = var_2;
        var_4 = randomfloatrange( 2, 5 );

        if ( var_1 % 2 )
            var_2 = randomintrange( 2, 5 );
        else
            var_2 = randomintrange( -5, -2 );

        var_4 = 2.0;
        var_0 rotatepitch( var_2 - var_3, var_4, var_4 / 2, var_4 / 2 );
        wait(var_4);
    }

    level.player playersetgroundreferenceent( undefined );
    var_0 delete();
}

_id_75C3()
{
    var_0 = common_scripts\_elevator::get_housing_mainframe();
    var_1 = getent( "elevator_player_jump_node", "targetname" );
    var_1 linkto( var_0 );
    var_2 = getent( "elevator_replacement_blocker", "targetname" );
    var_2 linkto( var_0 );
    level waittill( "elevator_interior_button_pressed" );
    common_scripts\_elevator::close_inner_doors();
    common_scripts\utility::flag_wait( "elevator_chopper_crash_done" );
    thread _id_75AE();
    level common_scripts\utility::waittill_any( "elevator_break_glass", "player_elevator_jump_successul" );
    var_2 notsolid();
    common_scripts\utility::flag_wait( "elevator_initial_big_drop" );
    common_scripts\utility::flag_wait( "player_jumped_to_replacement_elevator" );
    common_scripts\utility::flag_wait( "player_finished_jump_to_replacement_elevator" );
    var_3 = maps\_utility::_id_27AB( "subtle_tank_rumble" );
    var_3.intensity = 0.45;
    thread _id_75C5();
    var_2 solid();
    level waittill( "elevator_doors_opening" );
    stopallrumbles();
    var_4 = common_scripts\_elevator::get_outer_leftdoor( 1 );
    var_5 = common_scripts\_elevator::get_outer_rightdoor( 1 );
    var_4 connectpaths();
    var_5 connectpaths();
}

_id_75C4()
{
    thread maps\dubai_utils::_id_744D( "elevator_replacement_model", "restaurant_destruction" );
    var_0 = self.e["housing"]["mainframe"][0];
    maps\_audio::aud_send_msg( "2nd_elevator_platform_start", var_0 );
    var_1 = level._id_75A2.e["housing"]["mainframe"][0];
    var_2 = var_1.origin[2] - var_0.origin[2] - 104;
    var_3 = ( 0, 0, var_2 );
    var_4 = 13;
    var_5 = var_2 / var_4;
    maps\dubai_utils::_id_7434( var_3, var_4, var_4 * level.elevator_accel, var_4 * level.elevator_decel );
    wait(var_4);
    common_scripts\utility::flag_set( "replacement_elevator_in_position" );
    maps\_audio::aud_send_msg( "elevator_platform_stop", var_0 );
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "update_obj_pos_elevator_jump" );
}

_id_75C5()
{
    var_0 = common_scripts\_elevator::get_housing_mainframe();
    var_1 = self.e["floor1_pos"] - var_0.origin;
    var_2 = level.elevator_speed;
    var_3 = abs( distance( self.e["floor1_pos"], var_0.origin ) );
    var_4 = 15;
    thread maps\dubai_utils::_id_7434( var_1, var_4, var_4 * level.elevator_accel, var_4 * level.elevator_decel );
    level._id_75C6 = var_4;
    common_scripts\utility::flag_set( "elevator_replacement_moving_to_top" );
    maps\_audio::aud_send_msg( "elevator_platform_start", var_0 );
    wait(var_4);
    thread common_scripts\_elevator::open_inner_doors();
    thread common_scripts\_elevator::open_outer_doors( 1 );
    maps\_audio::aud_send_msg( "2nd_elevator_platform_stop", var_0 );
    maps\_audio::aud_send_msg( "2nd_elevator_doors_open", common_scripts\_elevator::get_housing_leftdoor() );
    maps\_audio::aud_send_msg( "mus_enter_top_floor" );
}

_id_75C7()
{
    var_0 = 0;
    var_1 = 0.05;

    while ( var_0 < level._id_75C6 )
    {
        var_0 += var_1;
        wait(var_1);
    }
}

_id_75C8()
{
    level endon( "elevator_chopper_killed" );

    for (;;)
    {
        level.player._id_75B8.origin = level.player.origin + ( 0, 0, level.player._id_75B9 );
        wait 0.05;
    }
}

_id_75C9( var_0 )
{
    var_1 = getent( "elevator_attack_chopper", "targetname" );

    for ( var_2[0] = common_scripts\utility::getstruct( var_1.target, "targetname" ); isdefined( var_2[var_2.size - 1].target ); var_2[var_2.size] = common_scripts\utility::getstruct( var_2[var_2.size - 1].target, "targetname" ) )
    {

    }

    for ( var_3 = var_2.size - 3; var_3 < var_2.size - 1; var_3++ )
    {
        if ( var_3 >= 0 )
            var_2[var_3].origin += ( 0, 0, var_0 );
    }

    var_2[var_2.size - 3]._id_2057 = "elevator_chopper_preattack";
    var_4 = common_scripts\utility::getstructarray( "elevator_attack_chopper_hover_location", "script_noteworthy" );

    foreach ( var_6 in var_4 )
        var_6.origin += ( 0, 0, var_0 );
}

_id_75CA()
{
    level endon( "elevator_chopper_killed" );
    _id_75C9( -1000 );
    maps\_vehicle::_id_2A12();
    self._id_2942 = 0;
    self._id_531D = 0;
    self enableaimassist();
    var_0 = getentarray( "elevator_attack_chopper_target_ents", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 linkto( self );

    level._id_75CB = 12;
    common_scripts\utility::flag_wait( "elevator_chopper_preattack" );
    maps\_audio::aud_send_msg( "mus_elevator_heli_attack" );
    self setlookatent( level.player._id_75B8 );
    thread maps\dubai_utils::_id_7438( 0.5, 1, ( 0.0, 0.0, -500.0 ), 250 );
    thread _id_75D1();
    thread _id_75D4();
    thread _id_75D3();
    thread _id_75D6();
    common_scripts\utility::flag_wait( "elevator_chopper_attack" );
    maps\_utility::delaythread( 1, ::_id_75D5, "elevator_attack_chopper_hover_location", "elevator_chopper_killed" );
}

_id_75CC( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_1 == level._id_73D7 || var_1.classname == "misc_turret" )
    {
        self.health += var_0;

        if ( var_1 == level._id_73D7 )
            self._id_531D += var_0;
    }
    else
        self._id_531D += var_0;
}

_id_75CD()
{
    self endon( "death" );

    if ( !isdefined( self._id_75CE ) )
        self._id_75CE = "entry";

    for (;;)
    {
        var_0 = "mg" + self._id_2942 + " state:" + self._id_75CE;
        wait 0.05;
    }
}

_id_75CF()
{
    self endon( "death" );
    var_0 = self.health - self._id_163B;

    while ( self.health > 0 )
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( isdefined( var_1 ) )
        {
            var_8 = self.health - self._id_163B;
            self._id_452F[self._id_452F.size] = var_8;
            var_0 = var_8;
        }
    }
}

_id_75D0()
{
    self endon( "death" );
    self._id_452F = [];
    self._id_452F[0] = self.health - self._id_163B;
    thread _id_75CF();
    var_0 = 0.1;

    for (;;)
    {
        var_1 = self.origin;
        var_2 = self.health - self._id_163B;
        var_3 = ( 0.0, 1.0, 0.0 );

        if ( var_2 < 0 )
            var_3 = ( 1.0, 1.0, 0.0 );

        for ( var_4 = 0; var_4 < self._id_452F.size; var_4++ )
        {
            if ( var_4 & 1 )
                var_3 = ( 1.0, 0.0, 0.0 );
            else
                var_3 = ( 0.0, 0.0, 1.0 );

            var_5 = self._id_452F[var_4];
            var_2 = var_5;
        }

        wait 0.05;
    }
}

_id_75D1()
{
    var_0 = 0;
    thread _id_75D8();
    self._id_2A70 = 1;
    var_1 = 2000;
    var_2 = 2400;
    var_3 = self.health + var_1;
    self.health = var_3 + var_2;
    self._id_29A1 = self.health;
    maps\_vehicle::_id_2A13();
    maps\_utility::delaythread( level._id_75CB, common_scripts\utility::flag_set, "elevator_chopper_min_time_passed" );

    while ( !common_scripts\utility::flag( "elevator_attack_chopper_kill" ) )
    {
        if ( !common_scripts\utility::flag( "elevator_chopper_min_time_passed" ) )
        {
            if ( self.health < var_3 )
                self.health = var_3 + 300;
        }
        else if ( self.health < var_3 )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "elevator_chopper_killed" );
    maps\_vehicle::_id_2A12();
    thread _id_75D9();
    thread maps\_vehicle::_id_29E7( self.model, 0 );
}

_id_75D2( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = ( level.player.origin[0], level.player.origin[1], var_0[2] );
    self._id_75CE = "shoot_windows";
    self setmaxpitchroll( 45, 45 );
    self setlookatent( var_1 );
    self setturrettargetent( var_1 );
    var_2 = 5000;
    var_3 = 6;
    var_4 = "minigun_littlebird_spinnup";
    var_1 moveto( ( level.player.origin[0], level.player.origin[1], var_2 ), var_3, 0, 0 );
    self setvehweapon( var_4 );
    var_5 = [ "TAG_MINIGUN_ATTACH_LEFT", "TAG_MINIGUN_ATTACH_RIGHT" ];
    var_6 = 0.1;

    for ( var_7 = 0; var_7 < var_3; var_7 += var_6 )
    {
        foreach ( var_10, var_9 in self.mgturret )
            self fireweapon( var_5[var_10] );

        wait(var_6);
    }

    self setmaxpitchroll( 20, 20 );
    var_1 delete();
}

_id_75D3()
{
    level endon( "elevator_chopper_killed" );
    var_0 = getentarray( "elevator_chopper_rocket_miss_targets", "targetname" );
    var_0 = maps\_utility::_id_0B53( var_0 );
    var_1 = [];
    var_1[0] = var_0[0];
    self._id_75CE = "rocket0";
    self setlookatent( var_1[0] );
    self setmaxpitchroll( 20, 20 );
    maps\dubai_utils::_id_743B( var_1, 2, 0.5 );
    _id_75D2( var_1[0].origin );
    self._id_75CE = "player";
    self setlookatent( level.player._id_75B8 );

    while ( self.origin[2] < 3584 )
        wait 0.05;

    var_1[0] = var_0[0];
    self._id_75CE = "rocket1";
    self setlookatent( var_1[0] );
    self setmaxpitchroll( 20, 20 );
    wait 1;
    maps\dubai_utils::_id_743B( var_1, randomintrange( 1, 3 ) );
    self._id_75CE = "player";
    self setlookatent( level.player._id_75B8 );
}

_id_75D4()
{
    level endon( "elevator_chopper_killed" );
    self._id_2942 = 1;
    var_0 = 0;
    var_1 = level._id_75CB + 5;
    var_2 = 0.05;

    while ( var_0 < var_1 )
    {
        var_3 = var_0 / var_1;
        var_4 = level.player.health / 100;

        if ( var_4 < var_3 )
            self._id_2942 = 0;
        else
            self._id_2942 = 1;

        var_0 += var_2;
        wait(var_2);
    }

    self._id_2942 = 1;
}

_id_75D5( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        level endon( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 30;

    if ( !isdefined( var_3 ) )
        var_3 = 60;

    self sethoverparams( 512, 20, 5 );
    var_4 = common_scripts\utility::getstructarray( var_0, "script_noteworthy" );
    var_5 = var_4;
    var_6 = common_scripts\utility::getstructarray( "elevator_attack_chopper_hover_location", "script_noteworthy" );
    var_7 = level._id_75A2.e["housing"]["mainframe"][0];
    var_8 = 0;
    var_9 = 0;
    var_10 = 0;

    for (;;)
    {
        if ( !common_scripts\utility::flag( "elevator_chopper_min_time_passed" ) )
        {
            var_5 = common_scripts\utility::getstructarray( "elevator_attack_chopper_kill_node", "targetname" );
            var_8 = 0;
        }
        else
        {
            var_5 = common_scripts\utility::array_remove( var_4, var_5[var_8] );
            var_8 = randomintrange( 0, var_5.size );
        }

        var_11 = randomfloatrange( 1, 4 );

        if ( var_9 )
        {
            self._id_75CE = "dodge";
            var_12 = 1.5 * randomintrange( var_2, var_3 );
            self vehicle_setspeed( var_12, var_12, var_12 );
            self setmaxpitchroll( 45, 45 );
            self sethoverparams( 512, 40, 20 );
            var_11 = 0.5;
            var_9 = 0;
        }
        else
        {
            if ( self._id_75CE == "dodge" )
                self._id_75CE = "player";

            self vehicle_setspeed( randomintrange( var_2, var_3 ), 15, 15 );

            if ( !common_scripts\utility::flag( "elevator_chopper_min_time_passed" ) )
                self setmaxpitchroll( 20, 20 );
            else
                self setmaxpitchroll( 45, 45 );

            self sethoverparams( 512, 20, 5 );
        }

        var_13 = 0.05;
        var_14 = self._id_531D;

        for ( var_15 = 0; var_15 < var_11; var_15 += var_13 )
        {
            if ( var_10 <= 0 )
            {
                var_16 = self._id_531D - var_14;
                var_14 = self._id_531D;

                if ( var_16 > 250 )
                {
                    var_9 = 1;
                    var_17 = var_7.origin[2];
                    var_18 = self.origin[2];
                    var_19 = var_17 - var_18;

                    if ( var_19 < 0 )
                        var_20 = randomintrange( 0, 300 );
                    else
                        var_20 = randomintrange( -100, 0 );

                    foreach ( var_22 in var_6 )
                        var_22.origin += ( 0, 0, var_20 );

                    var_10 = 10;
                    break;
                }
                else
                {
                    if ( common_scripts\utility::flag( "elevator_chopper_min_time_passed" ) )
                        var_20 = randomintrange( 30, 60 );
                    else
                        var_20 = randomintrange( 0, 400 );

                    foreach ( var_22 in var_6 )
                    {
                        if ( var_22.origin[2] < var_7.origin[2] + 400 )
                            var_22.origin += ( 0, 0, var_20 );
                    }

                    var_10 = 5;
                }
            }

            var_10--;
            var_26 = var_5[var_8];
            self setvehgoalpos( var_26.origin, 0 );
            wait(var_13);
        }
    }
}

_id_75D6()
{
    level endon( "elevator_chopper_killed" );
    common_scripts\utility::flag_wait( "elevator_chopper_min_time_passed" );
    wait 5.5;
    var_0 = [];
    var_0[0] = level.player;
    self setlookatent( var_0[0] );
    maps\dubai_utils::_id_743B( var_0, 2, 0.5 );
    wait 1;
    maps\dubai_utils::_id_743B( var_0, 3, 0.5 );
}

_id_4732( var_0, var_1, var_2, var_3 )
{
    self endon( "stop_looping_death_fx" );
    var_4 = _id_4735( var_2, var_1 );

    if ( var_4 == -1 )
        return;

    var_5 = var_1[var_4];
    var_6 = var_0[var_4];
    var_7 = 0.05;
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_8.origin = self gettagorigin( var_5 );
    var_8.angles = self gettagangles( var_5 );
    var_8 linkto( self, var_5 );
    self._id_4733[var_5]["origin"] = var_8;
    self._id_4733[var_5]["fx"] = var_6;
    playfxontag( var_6, var_8, "tag_origin" );

    if ( var_5 == "tag_light_nose" )
        maps\dubai_utils::_id_5730();
}

_id_4735( var_0, var_1 )
{
    var_2 = 1000000;
    var_3 = -1;
    var_4 = 0;
    var_5 = -1;

    foreach ( var_7 in var_1 )
    {
        if ( isdefined( self._id_4733 ) && isdefined( self._id_4733[var_7] ) )
            continue;

        var_8 = self gettagorigin( var_7 );
        var_9 = distance( var_8, var_0 );

        if ( var_9 < var_2 )
        {
            var_2 = var_9;
            var_3 = var_7;
            var_5 = var_4;
        }

        var_4++;
    }

    return var_5;
}

_id_75D7()
{
    self waittill( "death" );
    var_0 = self._id_4733;

    while ( isdefined( self ) )
        wait 0.1;

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3, var_2 in var_0 )
        {
            stopfxontag( var_2["fx"], var_2["origin"], "tag_origin" );
            var_2["origin"] delete();
        }
    }
}

_id_75D8()
{
    self endon( "death" );
    var_0 = [ "fire_smoke_trail_m_emitter", "heli_engine_fire", "fire_smoke_trail_m_emitter", "heli_engine_fire", "fire_smoke_trail_m_emitter", "fire_smoke_trail_m_emitter" ];
    var_1 = [ "tag_origin", "main_rotor_jnt", "tag_deathfx", "tag_engine", "tag_light_belly", "tag_light_nose" ];
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_2[var_2.size] = level._effect[var_0[var_3]];

    var_4 = 5000;
    var_5 = 0;
    var_6 = var_4;
    thread _id_75D7();

    for (;;)
    {
        self waittill( "damage", var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_6 -= var_7;

        if ( var_6 <= 0 && var_5 < 2 )
        {
            thread _id_4732( var_2, var_1, var_10, var_9 );
            var_6 = var_4;
            var_5++;
        }
    }
}

_id_75D9()
{
    var_0 = "helicopter";
    var_1 = self.model;
    thread _id_75DA();

    if ( isdefined( level._id_29D2[var_1] ) && level._id_29D2[var_1] )
        self clearturrettarget();

    if ( isdefined( self._id_256C ) && self._id_256C == 1 )
        self waittill( "crash_done" );

    self notify( "stop_looping_death_fx" );
    maps\_vehicle::_id_29C8( var_1 );
    common_scripts\utility::flag_set( "elevator_chopper_crash_done" );
    maps\_audio::aud_send_msg( "mus_elevator_heli_crash" );
    var_2 = floor( level.player.origin[2] / 288 ) - 10;
    common_scripts\utility::exploder( 100 + var_2 );

    for ( var_3 = 0; var_3 < 4; var_3++ )
        glassradiusdamage( ( -736, 192 - var_3 * 128, ( ceil( floor( level.player.origin[2] / 288 ) ) + 1 ) * 288 ), 100, 300, 100 );

    wait 0.05;
    self delete();
}

_id_75DA()
{
    maps\_audio::aud_send_msg( "elevator_heli_crash_start", self );
    self._id_256C = 1;

    if ( isdefined( self._id_2891 ) )
        maps\dubai_utils::_id_5730();

    thread _id_75DB();
}

_id_75DB()
{
    if ( isdefined( self._id_29DC ) )
        var_0 = self._id_29DC;
    else
    {
        var_1 = maps\_vehicle::_id_29D8();
        var_0 = maps\_utility::_id_0AE9( self.origin, var_1 );
    }

    var_0._id_2233 = 1;
    maps\_vehicle::_id_29DA();
    thread maps\_vehicle::_id_29E4();
    self notify( "newpath" );
    self notify( "deathspin" );

    if ( isdefined( var_0._id_164F ) && var_0._id_164F == "direct" )
        thread _id_75DC( var_0 );

    self waittill( "near_goal" );
    common_scripts\utility::flag_set( "elevator_chopper_near_crash" );
    wait 0.8;
    var_0._id_2233 = undefined;
    self notify( "stop_crash_loop_sound" );
    self notify( "crash_done" );
    maps\_audio::aud_send_msg( "elevator_heli_crashed", self );
}

_id_75DC( var_0 )
{
    self endon( "goal" );
    self endon( "death" );
    var_1 = 45;
    self vehicle_setspeed( var_1, 15, 10 );
    self setneargoalnotifydist( 500 );

    for (;;)
    {
        self setvehgoalpos( var_0.origin, 0 );
        wait 0.05;
    }
}

_id_75DD()
{
    maps\_vehicle::_id_2A12();
}

_id_75DE( var_0, var_1 )
{
    var_2 = "elevator_grenade_throw";
    var_3 = "elevator_idle_post_jump";

    if ( !isdefined( var_1 ) )
        var_0 maps\_utility::delaythread( 3, maps\_anim::_id_124E, self, var_3, "top_floor_yuri_grenade_start" );

    common_scripts\utility::flag_wait( "elevator_replacement_moving_to_top" );

    if ( isdefined( level._id_75C6 ) )
        wait(level._id_75C6);

    var_0 notify( "top_floor_yuri_grenade_start" );
    common_scripts\utility::flag_set( "top_floor_yuri_grenade_start" );
    var_4 = self.grenadeawareness;
    self.grenadeawareness = 0;
    var_0 thread maps\_anim::_id_1247( self, var_2 );
    self waittillmatch( "single anim", "grenade_right" );
    var_5 = spawn( "script_model", self gettagorigin( "tag_inhand" ) );
    var_5 setmodel( "projectile_m67fraggrenade" );
    var_5 linkto( self, "tag_inhand" );
    self waittillmatch( "single anim", "grenade_throw" );
    var_5 delete();
    wait 0.05;
    var_6 = self gettagorigin( "tag_inhand" );
    var_7 = common_scripts\utility::get_target_ent( "top_floor_yuri_grenade_dest" );
    var_8 = magicgrenade( "fraggrenade", var_6, var_7.origin, 1.05 );
    wait 1;
    common_scripts\utility::flag_set( "top_floor_yuri_grenade_thrown" );
    self.grenadeawareness = var_4;
    maps\_utility::_id_2686();
    wait 4;
    var_0 notify( "top_floor_yuri_grenade_start" );
}

_id_75DF()
{
    common_scripts\utility::flag_wait( "elevator_doors_closed" );
    clearallcorpses();
}

_id_75E0()
{
    common_scripts\utility::flag_wait( "elevator_doors_closed" );
    var_0 = common_scripts\utility::getstruct( "amb_exterior", "targetname" );
    enableouterspacemodellighting( var_0.origin, ( 0.18, 0.21, 0.25 ) );
}

_id_75E1()
{
    common_scripts\utility::flag_wait( "player_entered_stairwell" );
    var_0 = common_scripts\utility::getstruct( "amb_exterior_roof", "targetname" );
    enableouterspacemodellighting( var_0.origin, ( 0.05, 0.05, 0.05 ) );
}

_id_75E2()
{
    var_0 = [];
    var_0[0] = getent( "combat_lounge_goal_initial", "targetname" );
    var_0[1] = getent( "combat_lounge_goal_1", "targetname" );
    var_0[2] = getent( "combat_lounge_goal_2", "targetname" );
    var_0[3] = getent( "combat_lounge_goal_3", "targetname" );
    var_1 = getentarray( "top_floor_atrium_enemies", "script_noteworthy" );
    maps\_utility::_id_27C9( var_1, ::_id_75EA, var_0 );
    level._id_75E3 = 0;
    level._id_75E4 = var_1.size;
    thread _id_75E6();
    thread _id_75E8();
    thread _id_75E5();
    thread _id_75EC();
    thread _id_75EE();
    thread _id_75F4();
    thread _id_7621();
    common_scripts\utility::flag_wait( "top_floor_player_in_atrium" );
}

_id_75E5()
{
    common_scripts\utility::flag_wait( "player_at_top_floor" );
    thread maps\dubai_fx::_id_740B();
    level._id_73D7 maps\_utility::_id_109B();
    common_scripts\utility::flag_set( "vo_top_floor_start" );
    common_scripts\utility::flag_wait( "top_floor_lounge_clear" );
    wait 2;
    maps\dubai_utils::_id_7436( "trig_combat_restaurant_approach" );
}

_id_75E6()
{
    common_scripts\utility::flag_wait( "player_at_top_floor" );
    maps\_utility::_id_27CA( "combat_lounge_initial_enemies", ::_id_75E7 );
    maps\_utility::_id_272C( "combat_lounge_initial_enemies" );
}

_id_75E7()
{
    self.grenadeawareness = 0;
}

_id_75E8()
{
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_1" );
    var_0 = getent( "top_floor_close_path_volume", "targetname" );
    badplace_brush( "top_floor_close_path_volume", -1, var_0, "allies", "axis" );
    maps\_utility::_id_272C( "combat_lounge_enemies" );
    thread _id_75E9( 2, "top_floor_lounge_combat_2" );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_2" );
    maps\_utility::_id_272C( "combat_lounge_enemies_2" );
    badplace_delete( "top_floor_close_path_volume" );
    thread _id_75E9( 2, "top_floor_lounge_combat_3" );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_3" );
    maps\_utility::_id_272C( "combat_lounge_enemies_3" );
}

_id_75E9( var_0, var_1 )
{
    level endon( var_1 );

    for (;;)
    {
        if ( getaicount( "axis" ) <= var_0 )
        {
            common_scripts\utility::flag_set( var_1 );
            break;
        }

        wait 0.25;
    }
}

_id_75EA( var_0 )
{
    self endon( "death" );
    self endon( "combat_restaurant_approach" );
    thread _id_0207();
    thread _id_75EB();
    self setgoalvolumeauto( var_0[0] );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_1" );
    self setgoalvolumeauto( var_0[1] );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_2" );
    self setgoalvolumeauto( var_0[2] );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_3" );
    self setgoalvolumeauto( var_0[3] );
    wait 1;

    while ( getaicount( "axis" ) > 3 )
        wait 0.25;

    if ( !common_scripts\utility::flag( "top_floor_lounge_clear" ) )
        maps\dubai_utils::_id_7436( "top_floor_yuri_final_color_trigger" );

    self setgoalentity( level.player );
    self.goalradius = 500;
}

_id_75EB()
{
    self waittill( "death" );
    level._id_75E3++;

    if ( level._id_75E3 == 2 )
        return;

    if ( level._id_75E3 == 11 )
        return;

    if ( level._id_75E3 == 17 )
        return;

    if ( level._id_75E3 == level._id_75E4 )
        common_scripts\utility::flag_set( "top_floor_lounge_clear" );
    else
    {
        return;
        return;
    }
}

_id_0207()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "combat_restaurant_approach" );
    self setgoalentity( level.player );
    self.goalradius = 500;
}

_id_75EC()
{
    common_scripts\utility::flag_wait( "top_floor_player_in_atrium" );
    maps\_utility::_id_27CA( "top_floor_ambient_chopper", ::_id_75ED );
    var_0 = maps\_vehicle::_id_2881( "top_floor_ambient_chopper" );
    maps\_audio::aud_send_msg( "top_floor_ambient_chopper", var_0 );
}

_id_75ED()
{
    self vehicle_setspeedimmediate( 60, 20 );
    maps\_vehicle::_id_2A12();
    maps\_vehicle::_id_2A3D();
    thread maps\dubai_utils::_id_7438( 0.5, 0, undefined, 500 );
}

_id_75EE()
{
    common_scripts\utility::flag_wait( "top_floor_countdown_start" );
    level._id_66CA = getdvarfloat( "makarov_escaping_time_left" ) * 60;
    thread _id_75EF();
    thread _id_75F0();
    thread _id_75F1();
    thread _id_75F2();
}

_id_75EF()
{
    level._id_51C0 = maps\_hud_util::_id_09A5();
    level._id_51C0 setpulsefx( 30, 900000, 700 );
    var_0 = 1200;

    if ( isdefined( level._id_66CA ) )
        var_0 = level._id_66CA;

    level._id_51C0.label = &"DUBAI_MAKAROV_ESCAPING";
    level._id_51C0 settenthstimer( var_0 );
    wait(level._id_66CA);

    if ( isdefined( level._id_51C0 ) )
        level._id_51C0 destroy();
}

_id_75F0()
{
    level endon( "chopper_restaurant_strafe_run" );
    wait(level._id_66CA);

    if ( !common_scripts\utility::flag( "chopper_restaurant_strafe_run" ) )
        maps\dubai_finale::_id_74D0();
}

_id_75F1()
{
    common_scripts\utility::flag_wait( "chopper_restaurant_strafe_run" );

    if ( isdefined( level._id_51C0 ) )
        level._id_51C0 destroy();
}

_id_75F2()
{
    level endon( "chopper_restaurant_strafe_run" );
    var_0 = level._id_66CA * 1000;
    var_1 = gettime();
    maps\_utility::_id_25F6( "timer_started", 10 );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_1" );
    wait 3.5;
    var_2 = ( gettime() - var_1 ) / 1000;
    var_3 = level._id_66CA - 180;
    thread _id_75F3( var_2, var_3 );
    common_scripts\utility::flag_wait( "top_floor_lounge_combat_3" );
    var_2 = ( gettime() - var_1 ) / 1000;
    var_3 = level._id_66CA - 90;
    thread _id_75F3( var_2, var_3 );
    common_scripts\utility::flag_wait( "top_floor_lounge_clear" );
    var_2 = ( gettime() - var_1 ) / 1000;
    var_3 = level._id_66CA - 30;
    thread _id_75F3( var_2, var_3 );
}

_id_75F3( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( var_0 + 2.5 < var_1 )
    {
        maps\_utility::_id_25F6( "lounge_clear", var_1 - var_0 );

        if ( var_2 )
            wait 3;
        else
            wait 10;

        common_scripts\utility::flag_clear( "can_save" );
        wait 2;
        common_scripts\utility::flag_set( "can_save" );
    }
}

_id_75F4()
{
    maps\_utility::_id_27CB( "atrium_runner", maps\dubai_utils::_id_744B, "restaurant_destruction" );
    maps\_utility::_id_27CB( "lower_floor_runner", maps\dubai_utils::_id_7447 );
    common_scripts\utility::flag_wait( "player_at_top_floor" );
    common_scripts\utility::flag_wait( "top_floor_civilians_game_room_runners" );
    maps\_utility::_id_272D( "atrium_runner" );
    level.friendlyfiredisabled = 1;
    wait 5;
    level.friendlyfiredisabled = 0;
}

_id_75F5()
{
    var_0 = getentarray( "lower_floor_runner_left", "targetname" );
    var_1 = getentarray( "lower_floor_runner_right", "targetname" );
    var_2 = getent( "player_on_atrium_left_side", "targetname" );
    var_3 = getent( "player_on_atrium_right_side", "targetname" );

    for ( var_4 = 0; var_4 < 10; var_4++ )
    {
        for ( var_5 = 0; var_5 < 1; var_5++ )
        {
            var_6 = [];

            if ( !level.player istouching( var_2 ) )
                var_6 = common_scripts\utility::array_combine( var_6, var_1 );

            if ( !level.player istouching( var_3 ) )
                var_6 = common_scripts\utility::array_combine( var_6, var_0 );

            var_6 = maps\_utility::_id_0B53( var_6 );

            if ( isdefined( var_6[0] ) )
                var_6[0] maps\_utility::_id_166F();

            wait(randomfloatrange( 0.2, 0.5 ));
        }

        wait(randomfloatrange( 5, 10 ));
    }
}

_id_75F6()
{
    thread _id_75F8();
    thread _id_7605();
    thread _id_75FE();
    thread _id_7600();
    thread _id_75F7();
    thread _id_7615();
    thread _id_761A();
    thread _id_761C();
    thread _id_75FC();
}

_id_75F7()
{
    var_0 = getent( "restaurant_yuri_badplace_vol", "targetname" );
    badplace_brush( "restaurant_yuri_badplace_vol", -1, var_0, "allies" );
    common_scripts\utility::flag_wait( "restaurant_destruction" );
    level._id_73D7 forceteleport( ( -1046.0, -266.0, 7768.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_73D7.ignoreall = 1;
    level._id_73D7.ignoreme = 1;
    common_scripts\utility::flag_wait( "restaurant_destruction_player_over_ledge" );
    common_scripts\utility::flag_set( "top_floor_corpses" );
    level._id_73D7 maps\_utility::delaythread( 3, maps\_utility::_id_24F5 );
    var_1 = "restaurant_wounded";
    var_2 = "restaurant_idle";
    var_3 = getent( "restaurant_destruction_player_start_node", "targetname" );
    thread maps\dubai_fx::_id_7407();
    var_4 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_4 setmodel( "fx_char_light_rig" );
    var_4._id_1032 = "fx_char_light_rig";
    var_4 useanimtree( level._id_1245["fx_char_light_rig"] );
    var_5 = [];
    var_5[var_5.size] = level._id_73D7;
    var_5[var_5.size] = var_4;
    var_3 thread maps\_anim::_id_11DD( var_5, var_1 );
    var_4 thread maps\dubai_fx::_id_73E9();
    level._id_73D7 waittillmatch( "single anim", "yuri_performance" );
    common_scripts\utility::flag_set( "vo_restaurant_destruction_yuri" );
    level._id_73D7 setanim( %dubai_restaurant_yuri_start_facial_b );
    level._id_73D7 waittillmatch( "single anim", "dialog" );
    level._id_73D7 clearanim( %dubai_restaurant_yuri_start_facial_b, 0.2 );
    var_3 waittill( var_1 );
    var_3 thread maps\_anim::_id_11D6( var_5, var_2 );
}

_id_75F8()
{
    common_scripts\utility::flag_wait( "restaurant_makarov" );
    common_scripts\utility::flag_wait( "restaurant_makarov_spotted" );
    var_0 = getent( "restaurant_makarov", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_75F9 );
    level._id_59A6 = var_0 maps\_utility::_id_166F( 1 );
}

_id_75F9()
{
    self notsolid();
    maps\_utility::_id_24F5();
    self._id_2044 = maps\_utility::_id_270F( "civilian_run_upright_relative" );
    common_scripts\utility::flag_wait( "restaurant_makarov_spotted" );
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_makarov_spotted" );
    common_scripts\utility::flag_set( "vo_restaurant_start" );
    self waittill( "goal" );
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_makarov_escaped" );
    self delete();
}

_id_75FA()
{
    common_scripts\utility::flag_wait( "restaurant_makarov_spotted" );
}

_id_75FB()
{
    level endon( "restaurant_makarov_spotted" );

    while ( !self cansee( level._id_73D7 ) )
        wait 0.5;

    common_scripts\utility::flag_set( "restaurant_makarov_spotted" );
}

_id_75FC()
{
    var_0 = getentarray( "des_ceilingcrossbar_01", "script_noteworthy" );
    var_1 = getentarray( "des_ceilingcrossbar_02", "script_noteworthy" );
    var_2 = getentarray( "des_ceilingcrossbar_03", "script_noteworthy" );
    var_3 = getentarray( "des_ceilingbeam_support_01", "script_noteworthy" );
    var_4 = getentarray( "des_ceilingbeam_fall_01", "script_noteworthy" );
    var_5 = getentarray( "des_floor_2", "script_noteworthy" );
    var_0 = var_0 _id_75FD();
    var_1 = var_1 _id_75FD();
    var_2 = var_2 _id_75FD();
    var_3 = var_3 _id_75FD();
    var_4 = var_4 _id_75FD();
    var_5 = var_5 _id_75FD();
    common_scripts\utility::array_call( var_0, ::connectpaths );
    common_scripts\utility::array_call( var_1, ::connectpaths );
    common_scripts\utility::array_call( var_2, ::connectpaths );
    common_scripts\utility::array_call( var_3, ::connectpaths );
    common_scripts\utility::array_call( var_4, ::connectpaths );
    common_scripts\utility::array_call( var_5, ::connectpaths );
}

_id_75FD()
{
    var_0 = self;

    foreach ( var_2 in var_0 )
    {
        if ( var_2.classname == "script_model" )
            var_0 = common_scripts\utility::array_remove( var_0, var_2 );
    }

    return var_0;
}

_id_75FE()
{
    common_scripts\utility::flag_wait( "combat_restaurant_approach" );
    var_0 = getentarray( "combat_restaurant_approach_enemy", "targetname" );
    level._id_75FF = var_0.size;
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7602 );
    maps\_utility::_id_272B( var_0, undefined, 1 );
}

_id_7600()
{
    common_scripts\utility::flag_wait( "combat_restaurant" );
    var_0 = getentarray( "combat_restaurant_enemy", "targetname" );
    level._id_75FF += var_0.size;
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7602 );
    maps\_utility::_id_272B( var_0, undefined, 1 );
}

_id_7601()
{
    var_0 = 5;
    var_1 = getentarray( "combat_restaurant_enemy_reinforcement", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_7602 );
    var_2 = 0;
    var_3 = 10;

    while ( !common_scripts\utility::flag( "chopper_restaurant_strafe_run" ) )
    {
        if ( level._id_75FF < var_0 )
        {
            var_1 = maps\_utility::_id_0B53( var_1 );
            var_1[0].count++;
            var_1[0] maps\_utility::_id_166F();
            level._id_75FF++;
            var_2++;
        }

        if ( var_2 >= var_3 )
            break;

        wait(randomfloatrange( 0.1, 1 ));
    }
}

_id_7602()
{
    self._id_0EC6 = 1;
    thread _id_7604();
    self endon( "death" );
    common_scripts\utility::flag_wait( "combat_restaurant" );
    maps\_utility::_id_260D();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "restaurant_fighter" )
    {
        var_0 = getent( "restaurant_enemy_volume", "targetname" );
        self setgoalvolumeauto( var_0 );
        _id_7603();
    }
    else
    {
        self.pathrandompercent = 200;

        if ( common_scripts\utility::cointoss() )
        {
            var_1 = getent( "restaurant_makarov_goal", "targetname" );
            self setgoalpos( var_1.origin );
            self.goalradius = var_1.radius;
        }
        else
        {
            self setgoalpos( ( -528.0, 984.0, 7768.0 ) );
            self.goalradius = 100;
        }

        self waittill( "goal" );
        self delete();
    }

    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );

    if ( self istouching( getent( "restaurant_drop_volume", "targetname" ) ) )
        self kill();

    common_scripts\utility::flag_wait( "restaurant_tilt" );
    self kill();
}

_id_7603()
{
    wait(randomfloatrange( 2, 8 ));
    self.pathrandompercent = 200;

    if ( common_scripts\utility::cointoss() )
    {
        var_0 = getent( "restaurant_makarov_goal", "targetname" );
        self setgoalpos( var_0.origin );
        self.goalradius = var_0.radius;
    }
    else
    {
        self setgoalpos( ( -528.0, 984.0, 7768.0 ) );
        self.goalradius = 100;
    }

    self waittill( "goal" );
    self delete();
}

_id_7604()
{
    self waittill( "death" );
    level._id_75FF--;
}

_id_7605()
{
    thread _id_760E();
    common_scripts\utility::flag_wait( "chopper_restaurant_strafe_run" );
    level.player enableinvulnerability();
    common_scripts\utility::flag_wait( "restaurant_destruction" );
    thread _id_7606();
    thread _id_7610();
    setsaveddvar( "compass", "0" );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    var_0 = level.player._id_20F2.playerhealth_regularregendelay;
    level.player._id_20F2.playerhealth_regularregendelay = 500;
    var_1 = level.player._id_20F2._id_22F9;
    level.player._id_20F2._id_22F9 = 500;
    level.player thread maps\dubai_finale::_id_6FFD( 4, 0, 2, 1 );
    common_scripts\utility::exploder( 150 );
    playfx( level._effect["dubai_rest_anim_round_table"], ( -1029.1, 6.7, 7753.0 ), ( 1.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    maps\_audio::aud_send_msg( "restaurant_destruction" );
    var_2 = getaiarray( "axis" );
    var_3 = gettime();
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_destruction" );
    thread maps\_utility::_id_265A( "allies" );
    thread maps\_utility::_id_265A( "axis" );
    thread _id_7613();
    thread maps\dubai_utils::_id_7437( "restaurant_sequence_complete" );
    thread _id_7608();
    maps\_utility::delaythread( 13, common_scripts\utility::exploder, 700 );
    var_4 = [];
    var_4[var_4.size] = 2.65;
    var_4[var_4.size] = 5.55;
    var_4[var_4.size] = 3.55;
    var_4[var_4.size] = 3.55;
    level notify( "view_tilt" );
    wait 2.65;
    common_scripts\utility::exploder( 250 );
    thread _id_7611();
    common_scripts\utility::exploder( 300 );
    common_scripts\utility::exploder( 500 );
    wait 4.38;
    common_scripts\utility::exploder( 600 );
    common_scripts\utility::flag_set( "restaurant_tilt" );
    common_scripts\utility::flag_wait( "restaurant_sequence_complete" );
    common_scripts\utility::flag_set( "restaurant_destroyed" );
    setsaveddvar( "compass", "1" );
    setsaveddvar( "hud_showStance", "1" );
    level.player disableinvulnerability();
    level.player._id_20F2.playerhealth_regularregendelay = var_0;
    level.player._id_20F2._id_22F9 = var_1;
}

_id_7606()
{

}

_id_7607()
{
    level endon( "restaurant_success" );
    wait 10.9;
    thread maps\dubai_finale::_id_7548();

    for ( var_0 = 0; var_0 < 2; var_0 += 0.05 )
    {
        if ( level.player usebuttonpressed() )
        {
            thread maps\dubai_finale::_id_7549( 0.1 );
            level notify( "restaurant_success" );
        }

        wait 0.05;
    }

    self hide();
    thread maps\dubai_finale::_id_7549( 0.1 );
    level.player unlink();
    common_scripts\utility::flag_set( "restaurant_destroyed" );
    common_scripts\utility::flag_set( "restaurant_player_falling_to_death" );
}

_id_7608()
{
    level.player hideviewmodel();
    thread _id_7609();
    maps\_audio::aud_send_msg( "restaurant_destruction_begin" );
    var_0 = getent( "restaurant_destruction_player_start_node", "targetname" );
    thread _id_760B();
    thread _id_760A( var_0 );
    var_0 thread _id_760C( "restaurant_column_shatter_1", 2.65, 190 );
    var_0 thread _id_760C( "restaurant_column_shatter_2", 6.33, 191 );
    maps\_utility::delaythread( 6.333, maps\_audio::aud_send_msg, "mus_restaurant_pillar_explodes" );
    var_0 thread _id_760D( "round", 6.33, 150 );
    var_0 thread _id_760D( "square", 6.33, 150 );
    var_1 = maps\_utility::_id_1287( "player_rig", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 hide();
    var_1 thread _id_7607();
    maps\_utility::delaythread( 6.5, maps\_utility::_id_1C43, 1 );
    var_2 = maps\_utility::_id_1287( "player_body", var_0.origin );
    var_2 hide();
    var_3 = maps\_utility::_id_1287( "restaurant_floor", var_0.origin );
    var_3 hide();
    var_4 = getentarray( "des_floor", "script_noteworthy" );
    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_6 = [];
    var_6[var_6.size] = var_1;
    var_6[var_6.size] = var_2;
    var_7 = "restaurant_destruction";
    var_0 maps\_anim::_id_11BF( var_6, var_7 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_8 = 0.15;
    level.player playerlinktoblend( var_1, "tag_player", var_8 );
    level.player disableweapons();
    level.player common_scripts\utility::delaycall( var_8 + 0.05, ::playerlinktodelta, var_1, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player common_scripts\utility::delaycall( var_8 + 0.1, ::lerpviewangleclamp, 0.5, 0.25, 0.25, 5, 25, 25, 0 );
    var_1 common_scripts\utility::delaycall( 0.6, ::show );
    var_2 common_scripts\utility::delaycall( 0.6, ::show );
    var_9 = getdvar( "player_view_pitch_up" );
    var_10 = getdvar( "player_view_pitch_down" );
    setdvar( "player_view_pitch_up", 180 );
    setdvar( "player_view_pitch_down", 90 );
    var_0 thread maps\_anim::_id_11DD( var_6, var_7 );
    var_0 waittill( var_7 );
    var_1 waittillmatch( "single anim", "end" );
    setdvar( "player_view_pitch_up", var_9 );
    setdvar( "player_view_pitch_down", var_10 );
    level.player unlink();
    thread _id_761E();
    level._id_1C4C = 0;
    level.player setmovespeedscale( 1 );
    level.player setstance( "stand" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    var_1 delete();
    var_2 delete();
    var_3 delete();
    common_scripts\utility::flag_set( "restaurant_rubble_fall_on_yuri" );
    common_scripts\utility::flag_set( "restaurant_sequence_complete" );
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_exit" );
    maps\_utility::_id_1425( "restaurant_sequence_complete" );
    thread _id_761D();
    level.player showviewmodel();
    maps\_audio::aud_send_msg( "restaurant_destruction_end" );
}

_id_7609()
{
    level endon( "restaurant_player_falling_to_death" );
    var_0 = maps\_utility::_id_27AB( "steady_rumble" );
    var_0.intensity = 0.03;
    var_0 maps\_utility::delaythread( 2.65, maps\_utility::_id_27AF, 0.5, 0.05 );
    var_0 maps\_utility::delaythread( 3, maps\_utility::_id_27AF, 0.03, 0.5 );
    var_0 maps\_utility::delaythread( 7.1, maps\_utility::_id_27AF, 0, 0.05 );
    var_0 maps\_utility::delaythread( 7.6, maps\_utility::_id_27AF, 1, 0.05 );
    var_0 maps\_utility::delaythread( 8, maps\_utility::_id_27AF, 0, 0.05 );
    var_0 maps\_utility::delaythread( 8.3, maps\_utility::_id_27AF, 1, 0.05 );
    var_0 maps\_utility::delaythread( 8.4, maps\_utility::_id_27AF, 0.1, 0.5 );
    var_0 common_scripts\utility::delaycall( 13, ::stoprumble, "steady_rumble" );
    level.player common_scripts\utility::delaycall( 15.55, ::playrumbleonentity, "damage_light" );
    level.player common_scripts\utility::delaycall( 17.6, ::playrumbleonentity, "damage_light" );
    level.player common_scripts\utility::delaycall( 18, ::playrumbleonentity, "damage_light" );
    common_scripts\utility::noself_delaycall( 20, ::stopallrumbles );
}

_id_760A( var_0 )
{
    var_1 = maps\_utility::_id_1287( "restaurant_floor", var_0.origin );
    var_1 hide();
    var_2 = getentarray( "des_floor", "script_noteworthy" );
    var_3 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_4 = [];
    var_4[var_4.size] = var_1;
    var_5 = "restaurant_destruction_floor";
    var_0 maps\_anim::_id_11BF( var_4, var_5 );
    var_3.origin = ( -462.0, -0.5, 7813.5 );
    var_6 = var_3.origin;
    var_7 = var_3.angles;
    common_scripts\utility::array_call( var_2, ::linkto, var_3 );
    var_3.angles += ( 20.0, 0.0, 0.0 );
    var_3.origin = ( -464.0, -0.5, 7715.5 );
    var_3 linkto( var_1 );
    level._id_73FC = common_scripts\utility::spawn_tag_origin();
    level._id_73FC linkto( var_1 );
    level._id_73FE = common_scripts\utility::spawn_tag_origin();
    level._id_73FE linkto( var_1 );
    var_0 thread maps\_anim::_id_11DD( var_4, var_5 );
    common_scripts\utility::flag_wait( "restaurant_destruction_floor_done" );
    var_1 delete();
    var_8 = 0.25;
    var_3 moveto( var_6, var_8 );
    var_3 rotateto( var_7, var_8 );
    wait 1;
    level._id_73FC delete();
    level._id_73FE delete();
}

_id_760B()
{
    common_scripts\utility::flag_wait( "restaurant_destruction_rolling_soldier" );
    var_0 = getent( "restaurant_destruction_player_start_node", "targetname" );
    var_1 = "restaurant_rolling_soldier";
    var_2 = getent( "restaurant_rolling_soldier", "targetname" ) maps\_utility::_id_166F( 1 );
    var_0 maps\_anim::_id_11C1( var_2, var_1 );
    var_2 kill();
}

_id_760C( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_3 setmodel( "dub_restaurant_column_shatter_02" );
    var_3._id_1032 = "restaurant_column";
    var_3 useanimtree( level._id_1245["restaurant_column"] );
    var_3 hide();
    maps\_anim::_id_11CF( var_3, var_0 );
    wait(var_1);
    common_scripts\utility::exploder( var_2 );
    var_3 show();
    maps\_anim::_id_1246( var_3, var_0 );
    var_3 delete();
}

_id_760D( var_0, var_1, var_2 )
{
    var_3 = "dubai_restaurant_" + var_0 + "_table_sim";
    var_4 = "dub_restaurant_" + var_0 + "table_set_sim";
    var_5 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_5 setmodel( var_4 );
    var_5._id_1032 = var_4;
    var_5 useanimtree( level._id_1245[var_4] );
    maps\_anim::_id_11CF( var_5, var_3 );
    wait(var_1);
    common_scripts\utility::exploder( var_2 );
    var_5 show();
    maps\_anim::_id_1246( var_5, var_3 );
    var_5 delete();
}

_id_760E()
{
    var_0 = 0;
    var_1 = 1;
    var_2 = 2;
    var_3 = 3;
    var_4 = 4;
    var_5 = 5;
    var_6 = 6;
    var_7 = [];
    var_7[var_0] = getentarray( "intact_ceilingbeam_fall_01", "script_noteworthy" );
    var_7[var_1] = getentarray( "des_ceilingbeam_fall_01", "script_noteworthy" );
    var_7[var_2] = var_7[var_0] maps\dubai_utils::_id_7445();
    var_7[var_3] = var_7[var_1] maps\dubai_utils::_id_7445();
    var_7[var_4] = ( 0.0, -5.0, 10.5 );
    var_7[var_5] = ( 0.0, 0.0, 0.0 );
    var_7[var_6] = 300;
    var_8 = [];
    var_8[var_0] = getentarray( "intact_ceilingbeam_support_01", "script_noteworthy" );
    var_8[var_1] = getentarray( "des_ceilingbeam_support_01", "script_noteworthy" );
    var_8[var_2] = var_8[var_0] maps\dubai_utils::_id_7445();
    var_8[var_3] = var_8[var_1] maps\dubai_utils::_id_7445();
    var_8[var_4] = ( 0.0, -5.0, 10.5 );
    var_8[var_5] = ( 0.0, 0.0, 0.0 );
    var_8[var_6] = 300;
    var_9 = [];
    var_9[var_0] = getentarray( "intact_ceilingcrossbar_01", "script_noteworthy" );
    var_9[var_1] = getentarray( "des_ceilingcrossbar_01", "script_noteworthy" );
    var_9[var_2] = var_9[var_0] maps\dubai_utils::_id_7445();
    var_9[var_3] = var_9[var_1] maps\dubai_utils::_id_7445();
    var_9[var_4] = ( 55.6, 0.0, 0.0 );
    var_9[var_5] = ( 0.0, 0.0, 0.0 );
    var_9[var_6] = 300;
    var_10 = [];
    var_10[var_0] = getentarray( "intact_ceilingcrossbar_02", "script_noteworthy" );
    var_10[var_1] = getentarray( "des_ceilingcrossbar_02", "script_noteworthy" );
    var_10[var_2] = var_10[var_0] maps\dubai_utils::_id_7445();
    var_10[var_3] = var_10[var_1] maps\dubai_utils::_id_7445();
    var_10[var_4] = ( 10.0, 0.0, 0.0 );
    var_10[var_5] = ( 0.0, 0.0, 0.0 );
    var_10[var_6] = 300;
    var_11 = [];
    var_11[var_0] = undefined;
    var_11[var_1] = getentarray( "des_floor", "script_noteworthy" );
    var_11[var_2] = var_11[var_1] maps\dubai_utils::_id_7445();
    var_11[var_3] = var_11[var_1] maps\dubai_utils::_id_7445();
    var_11[var_4] = ( 20.0, 0.0, 0.0 );
    var_11[var_5] = ( 0.0, 0.0, 0.0 );
    var_11[var_6] = 500;
    var_12 = [];
    var_12[var_0] = getentarray( "intact_ceilingbeam_fall_02", "script_noteworthy" );
    var_12[var_1] = getentarray( "des_ceilingbeam_fall_02", "script_noteworthy" );
    var_12[var_2] = var_12[var_0] maps\dubai_utils::_id_7445();
    var_12[var_3] = var_12[var_1] maps\dubai_utils::_id_7445();
    var_12[var_4] = ( 0.0, 0.0, 0.0 );
    var_12[var_5] = ( 0.0, 0.0, 0.0 );
    var_12[var_6] = 500;
    var_13 = [];
    var_13[var_0] = getentarray( "intact_ceilingcrossbar_03", "script_noteworthy" );
    var_13[var_1] = getentarray( "des_ceilingcrossbar_03", "script_noteworthy" );
    var_13[var_2] = var_13[var_0] maps\dubai_utils::_id_7445();
    var_13[var_3] = var_13[var_1] maps\dubai_utils::_id_7445();
    var_13[var_4] = ( -4.0, 0.0, 0.0 );
    var_13[var_5] = ( 0.0, 0.0, 0.0 );
    var_13[var_6] = 500;
    var_14 = 4;
    var_15 = 1.5;
    var_16 = var_15;
    var_17 = 0;
    var_18 = var_14;
    var_19 = var_15;
    var_20 = var_16;
    var_21 = var_17;
    var_7 thread _id_760F( var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 );
    var_8 thread _id_760F( var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 );
    var_14 = 4.5;
    var_15 = 1.5;
    var_16 = var_15;
    var_17 = 0;
    var_18 = var_14;
    var_19 = var_15;
    var_20 = var_16;
    var_21 = var_17;
    var_9 thread _id_760F( var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 );
    var_10 thread _id_760F( var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 );
    var_12 thread _id_760F( 7, 0.5, 0.5, 0, 10, 0.5, 0.5, 0 );
    var_13 thread _id_760F( 7, 0.5, 0.5, 0, 10, 0.5, 0.5, 0 );
}

_id_760F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    if ( !isdefined( self[3] ) )
        return;

    var_8.origin = self[3];

    if ( !isdefined( self[5] ) )
        return;

    var_8.angles = self[5];
    common_scripts\utility::array_call( self[1], ::linkto, var_8 );

    if ( !isdefined( self[2] ) )
        return;

    var_8.origin = self[2];

    if ( !isdefined( self[4] ) )
    {

    }

    var_8.angles = self[4];

    if ( !isdefined( self[1][0].script_prefab_exploder ) )
        return;

    var_9 = self[1][0].script_prefab_exploder;
    level waittill( "exploding_" + var_9 );

    if ( var_0 > 0 )
        var_8 common_scripts\utility::delaycall( var_0, ::moveto, self[3], var_1, var_2, var_3 );
    else
        var_8 moveto( self[3], var_1, var_2, var_3 );

    if ( var_4 > 0 )
        var_8 common_scripts\utility::delaycall( var_4, ::rotateto, self[5], var_5, var_6, var_7 );
    else
        var_8 rotateto( self[5], var_5, var_6, var_7 );
}

_id_7610()
{
    for ( var_0 = 0; var_0 < 100; var_0++ )
    {
        common_scripts\utility::array_call( getaiarray( "axis" ), ::delete );
        clearallcorpses();
        common_scripts\utility::array_call( maps\_utility::_id_2831(), ::delete );
        wait 0.05;
    }
}

_id_7611()
{
    common_scripts\utility::flag_set( "restaurant_drop_section_falling" );
    thread maps\dubai_fx::_id_740F();
    thread maps\dubai_utils::_id_744E( 3 );
    var_0 = getent( "restaurant_drop_volume", "targetname" );
    badplace_brush( "restaurant_drop_volume", -1, var_0, "allies", "axis" );
    var_1 = getentarray( "des_fall_01", "script_noteworthy" );
    var_2 = 2.5;
    var_3 = getent( "restaurant_drop_section_pivot", "targetname" );
    common_scripts\utility::array_call( var_1, ::linkto, var_3 );
    level._id_4A81 = common_scripts\utility::spawn_tag_origin();
    level._id_4A81.origin = var_3.origin;
    level._id_4A81.angles = var_3.angles;
    var_3 rotateto( ( -10.0, 0.0, -40.0 ), 1.5, 1.5, 0 );
    level._id_4A81 rotateto( ( -10.0, 0.0, -40.0 ), 1.5, 1.5, 0 );
    wait 1;
    var_3 movegravity( ( 0.0, 0.0, 0.0 ), var_2 );
    level._id_4A81 movegravity( ( 0.0, 0.0, 0.0 ), var_2 );
    wait(var_2);
    var_3 unlink();
    var_3 delete();
    level._id_4A81 delete();

    foreach ( var_5 in var_1 )
    {
        if ( isdefined( var_5 ) )
            var_5 delete();
    }
}

_id_7612()
{
    var_0 = getent( self.script_noteworthy + "_target", "script_noteworthy" );
    var_1 = distance( self.origin, var_0.origin );
    var_2 = var_1 / 50;
    var_3 = var_2 / 4;
    common_scripts\utility::flag_wait( "restaurant_tilt" );
    wait(1 + randomfloat( 0.4 ));
    self moveto( var_0.origin, var_2, var_3, var_3 );
}

_id_7613()
{
    var_0 = getent( "restaurant_drop_volume", "targetname" );
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    var_1 = getglassarray( "muntaha_glass_destroy" );

    foreach ( var_3 in var_1 )
    {
        if ( maps\dubai_utils::_id_743D( var_3, var_0 ) )
            destroyglass( var_3 );
    }

    for ( var_5 = 3; var_5 > -9; var_5-- )
    {
        glassradiusdamage( ( -1196, var_5 * 128, 7824 ), 100, 300, 100 );
        wait 0.1;
    }

    common_scripts\utility::flag_wait( "restaurant_destroyed" );

    foreach ( var_3 in var_1 )
        destroyglass( var_3 );
}

_id_7614()
{
    self waittill( "death" );
}

_id_7615()
{
    common_scripts\utility::flag_wait( "chopper_restaurant_intro" );
    var_0 = maps\_vehicle::_id_2881( "restaurant_helicopter_initial" );
    maps\_audio::aud_send_msg( "restaurant_chopper", var_0 );
    var_0 vehicle_setspeedimmediate( 60, 20 );
    var_0 thread maps\dubai_utils::_id_7438( 0.5, 1, undefined, 250 );
    var_0 maps\_vehicle::_id_2A12();
    var_0 thread _id_761B();
    var_0 thread _id_7616();
    common_scripts\utility::flag_wait( "chopper_restaurant_strafe_run" );
    level.player disableweapons();
    wait 0.4;
    var_1 = common_scripts\utility::getstruct( "restaurant_destruction_rocket_1_start", "targetname" );
    var_2 = common_scripts\utility::getstruct( "restaurant_destruction_rocket_1_end", "targetname" );
    var_3 = magicbullet( "zippy_rockets", var_1.origin, var_2.origin );
    var_3 thread _id_7614();
    var_3 common_scripts\utility::waittill_any_timeout( 0.25, "death" );
    common_scripts\utility::flag_set( "restaurant_destruction" );
    level notify( "restaurant_chopper_end_loop" );
    var_0 delete();
    var_4 = getent( "restaurant_helicopter_animated", "targetname" );
    var_5 = var_4 maps\_utility::_id_1FA3();
    var_5._id_1032 = "md500";
    var_6 = "restaurant_destruction";
    var_5 useanimtree( level._id_1245["md500"] );
    var_5 maps\_vehicle::_id_2A12();
    var_5 thread maps\dubai_utils::_id_7438( 0, 1, undefined, 250 );
    var_5 thread _id_7617();
    var_7 = getent( "restaurant_destruction_player_start_node", "targetname" );
    var_7 maps\_anim::_id_1246( var_5, var_6 );
    var_5 delete();
}

_id_7616()
{
    level endon( "chopper_restaurant_strafe_run" );
    self setlookatent( level.player );
    common_scripts\utility::flag_wait( "restaurant_chopper_move_up" );
    level notify( "restaurant_chopper_end_loop" );
    maps\_utility::delaythread( 1, maps\dubai_utils::_id_743A, "restaurant_chopper_secondary_loop", "restaurant_chopper_end_loop", 15, 25 );
}

_id_7617()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 = [];
    var_1[var_1.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_0", "targetname" );
    var_1[var_1.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_1", "targetname" );
    var_1[var_1.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_2", "targetname" );
    var_2 = [];
    level._id_7618 = 0;
    var_3 = [];
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_0_target_0", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_0_target_1", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_0_target_2", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_destruction_rocket_support_end", "targetname" );
    maps\_utility::delaythread( 1, ::_id_7619, var_3[0] );
    maps\_utility::delaythread( 1.85, ::_id_7619, var_3[1] );
    maps\_utility::delaythread( 2.1, common_scripts\utility::exploder, 151 );
    common_scripts\utility::noself_delaycall( 2.1, ::playfx, level._effect["dubai_rest_anim_sqr_table"], ( -1011.9, 381.5, 7753.0 ), ( 1.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    common_scripts\utility::noself_delaycall( 2.1, ::playfx, level._effect["dubai_rest_anim_sqr_table"], ( -1149.0, 383.6, 7753.0 ), ( 1.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    maps\_utility::delaythread( 2.25, ::_id_7619, var_3[2] );
    maps\_utility::delaythread( 2.45, ::_id_7619, var_3[3] );
    maps\_utility::delaythread( 2.5, common_scripts\utility::exploder, 152 );
    common_scripts\utility::noself_delaycall( 2.5, ::playfx, level._effect["dubai_rest_anim_sqr_table_solo"], ( -903.7, 251.9, 7753.0 ), ( 1.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    maps\_utility::delaythread( 2.65, common_scripts\utility::exploder, 153 );
    common_scripts\utility::noself_delaycall( 2.65, ::playfx, level._effect["dubai_rest_anim_sqr_table"], ( -1149.0, 191.6, 7753.0 ), ( 1.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_1_target_0", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_1_target_1", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_1_target_2", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_strafe_run_1_target_3", "targetname" );
    var_3[var_3.size] = common_scripts\utility::getstruct( "restaurant_destruction_rocket_pillar_end", "targetname" );
    maps\_utility::delaythread( 4.3, ::_id_7619, var_3[4] );
    maps\_utility::delaythread( 5, ::_id_7619, var_3[6] );
    maps\_utility::delaythread( 5.7, ::_id_7619, var_3[7] );
    maps\_utility::delaythread( 6.2, ::_id_7619, var_3[8] );
}

_id_7619( var_0 )
{
    if ( level._id_7618 % 2 == 0 )
        var_1 = "tag_missile_left";
    else
        var_1 = "tag_missile_right";

    var_2 = magicbullet( "zippy_rockets", self gettagorigin( var_1 ), var_0.origin );
    maps\_audio::aud_send_msg( "restaurant_chopper_fire_rocket", var_2 );
    var_2 thread maps\dubai_utils::_id_743C();
    level._id_7618++;
    return var_2;
}

_id_761A()
{
    common_scripts\utility::flag_wait( "model_spot_lighting_enabled" );
    setsaveddvar( "sm_spotLightScoreModelScale", 1 );
    common_scripts\utility::flag_wait( "model_spot_lighting_disabled" );
}

_id_761B()
{
    level endon( "chopper_restaurant_strafe_run" );
    maps\_vehicle::_id_2A3E();

    while ( !common_scripts\utility::flag( "restaurant_chopper_move_up" ) )
    {
        if ( level.player.health < 25 )
        {
            self._id_2942 = 0;
            wait 1;
            continue;
        }

        self._id_2942 = 1;
        wait 0.05;
    }

    self._id_2942 = 0;
    common_scripts\utility::flag_wait( "chopper_restaurant_strafe_run" );
    self._id_2942 = 1;
}

_id_761C()
{
    common_scripts\utility::flag_wait( "restaurant_player_falling_to_death" );
    earthquake( 0.2, 3, level.player.origin, 8000 );
    setblur( 5, 0.5 );
    thread maps\dubai_utils::_id_743F( 1.5 );
    var_0 = spawn( "script_origin", level.player.origin );
    var_0.angles = ( 90.0, 180.0, 0.0 );
    var_0 movegravity( level.player getvelocity(), 7 );
    level.player playerlinktoblend( var_0, undefined, 2 );
}

_id_761D()
{
    level endon( "finale_sequence_begin" );
    common_scripts\utility::flag_wait_or_timeout( "update_obj_pos_stairwell", 10 );

    if ( common_scripts\utility::flag( "update_obj_pos_stairwell" ) )
        maps\_utility::_id_25F3( "leaving_restaurant" );
    else
        maps\dubai_finale::_id_74D0();

    common_scripts\utility::flag_wait_or_timeout( "update_obj_pos_roof", 10 );

    if ( common_scripts\utility::flag( "update_obj_pos_roof" ) )
        maps\_utility::_id_25F3( "in_stairwell" );
    else
        maps\dubai_finale::_id_74D0();

    common_scripts\utility::flag_wait_or_timeout( "update_obj_pos_finale_chopper", 10 );

    if ( !common_scripts\utility::flag( "update_obj_pos_finale_chopper" ) )
        maps\dubai_finale::_id_74D0();
}

_id_761E()
{
    level.player takeallweapons();
    setsaveddvar( "player_sprintUnlimited", 1 );
    level.player giveweapon( "freerunner" );
    level.player switchtoweapon( "freerunner" );
    level.player disableweaponswitch();
    level.player enableweapons();
}

_id_761F()
{
    thread _id_7620();
}

_id_7620()
{
    common_scripts\utility::flag_wait( "player_entered_stairwell" );
    thread maps\dubai_fx::_id_740D();
    thread maps\dubai_fx::_id_740C();
    common_scripts\utility::flag_set( "vo_stairwell_start" );
}

_id_7621()
{
    common_scripts\utility::flag_wait( "top_floor_corpses" );
    var_0 = getent( "atrium_corpse_spawner", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "atrium_corpse", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_0 maps\_utility::_id_166F();
        var_4.origin = var_3.origin;
        var_4.angles = var_3.angles;
        var_4 setcandamage( 0 );
        var_5 = level._id_0C59["generic"][var_3.animation];

        if ( isarray( var_5 ) )
            var_5 = var_5[0];

        var_4 animscripted( "endanim", var_3.origin, var_3.angles, var_5 );
        var_4 maps\_utility::_id_24F5();
        var_4 notsolid();

        if ( issubstr( var_3.animation, "death" ) )
            var_4 common_scripts\utility::delaycall( 0.05, ::setanimtime, var_5, 1.0 );
    }
}

_id_7622( var_0, var_1 )
{
    self.health += 2500;

    if ( isdefined( var_1 ) && var_1 > 0 )
        wait(var_1);

    if ( !isdefined( self ) )
        return;

    var_2 = self.health;
    var_3 = var_2 - 600;

    while ( self.health > 100 )
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8 );

        if ( self.health < var_3 )
        {
            common_scripts\utility::exploder( var_0 );
            break;
        }
    }

    self waittill( "death" );
    maps\_shg_fx::_id_4467( var_0 );
}

_id_0010()
{
    self endon( "stop_pulse" );

    for (;;)
    {
        self fadeovertime( 0.5 );
        self.alpha = 0.5;
        wait 0.5;
        self fadeovertime( 0.5 );
        self.alpha = 1.0;
        wait 0.5;
    }
}

_id_74BA()
{
    common_scripts\utility::flag_wait( "level_end" );
    wait 1;

    if ( !isdefined( level._id_1D95 ) || !level._id_1D95 )
        maps\_utility::_id_195A();

    _id_7624();
    var_0 = 18;
    var_1 = 4;
    wait(var_0 - var_1);

    if ( isdefined( level._id_1D95 ) && level._id_1D95 )
        maps\_audio::aud_send_msg( "level_fade_to_black", [ 0, var_1 ] );

    wait(var_1);
    common_scripts\utility::flag_set( "end_of_credits" );
    setsaveddvar( "ui_nextMission", "0" );

    if ( !isdefined( level._id_1D95 ) || !level._id_1D95 )
    {
        level.player notifyonplayercommand( "tospecops", "pause" );
        level.player notifyonplayercommand( "tospecops", "+gostand" );
        var_2 = 0.5;
        var_3 = 4;
        var_4 = 1;
        var_5 = newhudelem();
        var_5.horzalign = "fullscreen";
        var_5.vertalign = "fullscreen";
        var_5.foreground = 1;
        var_5 setshader( "victory_iw5", 640, 480 );
        var_5.x = 0;
        var_5.y = 0;
        var_5.alpha = 1;
        var_6 = maps\dubai_finale::_id_74D7();
        var_6 fadeovertime( var_2 );
        var_6.alpha = 0;
        wait(var_2);
        wait(var_3);
        maps\_audio::aud_send_msg( "level_fade_to_black", [ 0, var_1 ] );
        var_6 fadeovertime( var_4 );
        var_6.alpha = 1;
        wait(var_4);
        var_5 setshader( "victory_menu", 640, 480 );
        var_7 = level.player maps\_hud_util::createserverclientfontstring( "hudbig", 1.0 );
        var_7.x = 0;
        var_7.y = 190;
        var_7.alignx = "center";
        var_7.aligny = "middle";
        var_7.horzalign = "center";
        var_7.vertalign = "middle";
        var_7.sort = 1;
        var_7.foreground = 1;
        var_7 settext( &"MENU_SP_CONTINUE_TO_SPECIAL_OPS_CAPS" );
        var_7.alpha = 1;
        var_7.hidewheninmenu = 0;
        var_7.color = ( 0.9, 0.9, 0.9 );
        var_7 thread _id_0010();
        var_6 fadeovertime( var_2 );
        var_6.alpha = 0;
        level.player openmenu( "nopause" );
        wait(var_2);
        level.player waittill( "tospecops" );
        var_7 notify( "stop_pulse" );
        var_6 fadeovertime( var_4 );
        var_6.alpha = 1;
        var_7 fadeovertime( var_4 );
        var_7.alpha = 0;
        wait(var_4);
        level.player openmenu( "allowpause" );
        missionsuccess( "sp_intro" );
    }
    else
        changelevel( "", 0 );
}

_id_7623()
{
    var_0 = [ [ 10, ( 2303.0, 159.0, 8797.0 ), ( 664.0, -11.0, 8194.0 ) ], [ 20, ( 4077.0, 10.0, 7876.0 ), ( 664.0, -11.0, 7876.0 ) ], [ 60, ( 5098.0, -108.0, 375.0 ), ( 664.0, -11.0, 100.0 ) ], [ 60, ( 4077.0, -68.0, 7876.0 ), ( 664.0, -11.0, 7876.0 ) ], [ 60, ( 5098.0, -108.0, 375.0 ), ( 664.0, -11.0, 100.0 ) ], [ 60, ( 4077.0, -68.0, 7876.0 ), ( 664.0, -11.0, 7876.0 ) ], [ 60, ( 5098.0, -108.0, 375.0 ), ( 664.0, -11.0, 100.0 ) ], [ 60, ( 4077.0, -68.0, 7876.0 ), ( 664.0, -11.0, 7876.0 ) ], [ 60, ( 5098.0, -108.0, 375.0 ), ( 664.0, -11.0, 100.0 ) ] ];
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = level.player.origin;
    var_1.angles = level.player getplayerangles();
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    level.player setstance( "crouch" );
    level.player playerlinkto( var_1, "tag_origin", 1.0, 45, 45, 45, 45, 0 );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_3 = 1600 * anglestoforward( var_1.angles );
    var_2.origin = var_1.origin + var_3;

    foreach ( var_5 in var_0 )
    {
        var_6 = var_5[0];
        var_7 = var_5[1];
        var_8 = var_5[2];
        var_1 moveto( var_7, var_6, 1, 1 );
        var_2 moveto( var_8, var_6, 1, 1 );

        while ( var_6 > 0 )
        {
            var_9 = var_2.origin - var_1.origin;
            var_10 = vectortoangles( var_9 );
            var_1.angles = var_10;
            wait 0.05;
            var_6 -= 0.05;
        }
    }
}

_id_7624()
{
    if ( !isdefined( level._id_7625 ) )
    {
        level._id_7625 = maps\dubai_utils::_id_473C();
        level._id_7625.sort = 1;
    }

    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player takeallweapons();
    level.player disableweapons();
    level.player freezecontrols( 1 );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "ui_hidemap", 1 );
    common_scripts\utility::flag_set( "atvi_credits_go" );
    maps\_credits::_id_748E();
}

_id_7626()
{
    var_0 = "0";

    if ( var_0 == "0" )
        maps\_credits::_id_745E( "all" );
    else
    {
        maps\_credits::_id_745E( "none" );
        maps\_credits::_id_7483( "Placeholder Credits" );
        maps\_credits::_id_74A5();
        maps\_credits::_id_7483( "Placeholder Person A" );
        maps\_credits::_id_7483( "Placeholder Person B" );
        maps\_credits::_id_7483( "Placeholder Person C" );
    }
}

_id_7627()
{
    maps\_credits::_id_74B8( "heading", &"CREDIT_GLOBAL_BRAND_MANAGEM" );
    maps\_credits::_id_74B8( "spacesmall" );
    maps\_credits::_id_74B8( "centerdual", &"CREDIT_VICE_PRESIDENT_OF_MA", &"CREDIT_ROB_KOSTICH" );
    maps\_credits::_id_74B8( "spacesmall" );
    maps\_credits::_id_74B8( "centerdual", &"CREDIT_DIRECTOR_OF_MARKETIN", &"CREDIT_BYRON_BEEDE" );
    maps\_credits::_id_74B8( "spacesmall" );
    maps\_credits::_id_74B8( "centerdual", &"CREDIT_GLOBAL_BRAND_MANAGER", &"CREDIT_GEOFF_CARROLL" );
    maps\_credits::_id_74B8( "spacesmall" );
    maps\_credits::_id_74B8( "centerdual", &"CREDIT_ASSOCIATE_BRAND_MANA", &"CREDIT_JOE_KORSMO" );
    maps\_credits::_id_74B8( "name", undefined, &"CREDIT_MIKE_SCHAEFER" );
    maps\_credits::_id_74B8( "name", undefined, &"CREDIT_DAVID_WANG" );
    maps\_credits::_id_74B8( "gap" );
}

_id_7628( var_0, var_1 )
{

}

_id_6ABD( var_0 )
{

}
