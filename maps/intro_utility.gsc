// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6EAF()
{
    level._id_6EB0 = [];
    _id_6EB1( "sprint", "+breath_sprint", &"INTRO_HINT_SPRINT_BREATH" );
    _id_6EB1( "sprint", "+sprint", &"INTRO_HINT_SPRINT" );
    _id_6EB1( "sprint_pc", "+breath_sprint", &"INTRO_HINT_SPRINT_BREATH_PC" );
    _id_6EB1( "sprint_pc", "+sprint", &"INTRO_HINT_SPRINT_PC" );
    _id_6EB1( "primary", "weapnext", &"INTRO_HINT_PRIMARY_SWAP" );
    _id_6EB1( "toggle_view", "weapnext", &"INTRO_HINT_TOGGLE_VIEW" );
    _id_6EB1( "ugv_grenade", "+frag", &"INTRO_HINT_UGV_GRENADE" );
    _id_6EB1( "ugv_zoom_360", "+speed_throw", &"INTRO_HINT_UGV_ZOOM_THROW_360" );
    _id_6EB1( "ugv_zoom_360", "+speed", &"INTRO_HINT_UGV_ZOOM_360" );
    _id_6EB1( "ugv_zoom", "+speed_throw", &"INTRO_HINT_UGV_ZOOM_THROW" );
    _id_6EB1( "ugv_zoom", "+speed", &"INTRO_HINT_UGV_ZOOM" );
    _id_6EB1( "ugv_zoom", "+toggleads_throw", &"INTRO_HINT_UGV_ZOOM_TOGGLE_THROW" );
    _id_6EB1( "ugv_zoom", "toggleads", &"INTRO_HINT_UGV_ZOOM_TOGGLE" );
    _id_6EB5();
    _id_6EB8();
}

_id_6EB1( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_6EB0[var_0] ) )
        level._id_6EB0[var_0] = [];

    var_3 = spawnstruct();
    var_3._id_6EB2 = var_1;
    var_3._id_27BB = var_2;
    var_3._id_6EB3 = undefined;
    var_3._id_6EB4 = undefined;
    precachestring( var_2 );
    level._id_6EB0[var_0][level._id_6EB0[var_0].size] = var_3;
}

_id_6EB5()
{
    level._id_6EB6 = "1234567890-=qwertyuiop[]asdfghjkl;'zxcvbnm,./";
    level._id_6EB7 = [];
    level._id_6EB7[level._id_6EB7.size] = "TAB";
    level._id_6EB7[level._id_6EB7.size] = "ENTER";
    level._id_6EB7[level._id_6EB7.size] = "ESCAPE";
    level._id_6EB7[level._id_6EB7.size] = "SPACE";
    level._id_6EB7[level._id_6EB7.size] = "BACKSPACE";
    level._id_6EB7[level._id_6EB7.size] = "UPARROW";
    level._id_6EB7[level._id_6EB7.size] = "DOWNARROW";
    level._id_6EB7[level._id_6EB7.size] = "LEFTARROW";
    level._id_6EB7[level._id_6EB7.size] = "RIGHTARROW";
    level._id_6EB7[level._id_6EB7.size] = "ALT";
    level._id_6EB7[level._id_6EB7.size] = "CTRL";
    level._id_6EB7[level._id_6EB7.size] = "SHIFT";
    level._id_6EB7[level._id_6EB7.size] = "CAPSLOCK";
    level._id_6EB7[level._id_6EB7.size] = "F1";
    level._id_6EB7[level._id_6EB7.size] = "F2";
    level._id_6EB7[level._id_6EB7.size] = "F3";
    level._id_6EB7[level._id_6EB7.size] = "F4";
    level._id_6EB7[level._id_6EB7.size] = "F5";
    level._id_6EB7[level._id_6EB7.size] = "F6";
    level._id_6EB7[level._id_6EB7.size] = "F7";
    level._id_6EB7[level._id_6EB7.size] = "F8";
    level._id_6EB7[level._id_6EB7.size] = "F9";
    level._id_6EB7[level._id_6EB7.size] = "F10";
    level._id_6EB7[level._id_6EB7.size] = "F11";
    level._id_6EB7[level._id_6EB7.size] = "F12";
    level._id_6EB7[level._id_6EB7.size] = "INS";
    level._id_6EB7[level._id_6EB7.size] = "DEL";
    level._id_6EB7[level._id_6EB7.size] = "PGDN";
    level._id_6EB7[level._id_6EB7.size] = "PGUP";
    level._id_6EB7[level._id_6EB7.size] = "HOME";
    level._id_6EB7[level._id_6EB7.size] = "END";
    level._id_6EB7[level._id_6EB7.size] = "MOUSE1";
    level._id_6EB7[level._id_6EB7.size] = "MOUSE2";
    level._id_6EB7[level._id_6EB7.size] = "MOUSE3";
    level._id_6EB7[level._id_6EB7.size] = "MOUSE4";
    level._id_6EB7[level._id_6EB7.size] = "MOUSE5";
    level._id_6EB7[level._id_6EB7.size] = "MWHEELUP";
    level._id_6EB7[level._id_6EB7.size] = "MWHEELDOWN";
    level._id_6EB7[level._id_6EB7.size] = "AUX1";
    level._id_6EB7[level._id_6EB7.size] = "AUX2";
    level._id_6EB7[level._id_6EB7.size] = "AUX3";
    level._id_6EB7[level._id_6EB7.size] = "AUX4";
    level._id_6EB7[level._id_6EB7.size] = "AUX5";
    level._id_6EB7[level._id_6EB7.size] = "AUX6";
    level._id_6EB7[level._id_6EB7.size] = "AUX7";
    level._id_6EB7[level._id_6EB7.size] = "AUX8";
    level._id_6EB7[level._id_6EB7.size] = "AUX9";
    level._id_6EB7[level._id_6EB7.size] = "AUX10";
    level._id_6EB7[level._id_6EB7.size] = "AUX11";
    level._id_6EB7[level._id_6EB7.size] = "AUX12";
    level._id_6EB7[level._id_6EB7.size] = "AUX13";
    level._id_6EB7[level._id_6EB7.size] = "AUX14";
    level._id_6EB7[level._id_6EB7.size] = "AUX15";
    level._id_6EB7[level._id_6EB7.size] = "AUX16";
    level._id_6EB7[level._id_6EB7.size] = "KP_HOME";
    level._id_6EB7[level._id_6EB7.size] = "KP_UPARROW";
    level._id_6EB7[level._id_6EB7.size] = "KP_PGUP";
    level._id_6EB7[level._id_6EB7.size] = "KP_LEFTARROW";
    level._id_6EB7[level._id_6EB7.size] = "KP_5";
    level._id_6EB7[level._id_6EB7.size] = "KP_RIGHTARROW";
    level._id_6EB7[level._id_6EB7.size] = "KP_END";
    level._id_6EB7[level._id_6EB7.size] = "KP_DOWNARROW";
    level._id_6EB7[level._id_6EB7.size] = "KP_PGDN";
    level._id_6EB7[level._id_6EB7.size] = "KP_ENTER";
    level._id_6EB7[level._id_6EB7.size] = "KP_INS";
    level._id_6EB7[level._id_6EB7.size] = "KP_DEL";
    level._id_6EB7[level._id_6EB7.size] = "KP_SLASH";
    level._id_6EB7[level._id_6EB7.size] = "KP_MINUS";
    level._id_6EB7[level._id_6EB7.size] = "KP_PLUS";
    level._id_6EB7[level._id_6EB7.size] = "KP_NUMLOCK";
    level._id_6EB7[level._id_6EB7.size] = "KP_STAR";
    level._id_6EB7[level._id_6EB7.size] = "KP_EQUALS";
    level._id_6EB7[level._id_6EB7.size] = "PAUSE";
    level._id_6EB7[level._id_6EB7.size] = "SEMICOLON";
    level._id_6EB7[level._id_6EB7.size] = "COMMAND";
    level._id_6EB7[level._id_6EB7.size] = "181";
    level._id_6EB7[level._id_6EB7.size] = "191";
    level._id_6EB7[level._id_6EB7.size] = "223";
    level._id_6EB7[level._id_6EB7.size] = "224";
    level._id_6EB7[level._id_6EB7.size] = "225";
    level._id_6EB7[level._id_6EB7.size] = "228";
    level._id_6EB7[level._id_6EB7.size] = "229";
    level._id_6EB7[level._id_6EB7.size] = "230";
    level._id_6EB7[level._id_6EB7.size] = "231";
    level._id_6EB7[level._id_6EB7.size] = "232";
    level._id_6EB7[level._id_6EB7.size] = "233";
    level._id_6EB7[level._id_6EB7.size] = "236";
    level._id_6EB7[level._id_6EB7.size] = "241";
    level._id_6EB7[level._id_6EB7.size] = "242";
    level._id_6EB7[level._id_6EB7.size] = "243";
    level._id_6EB7[level._id_6EB7.size] = "246";
    level._id_6EB7[level._id_6EB7.size] = "248";
    level._id_6EB7[level._id_6EB7.size] = "249";
    level._id_6EB7[level._id_6EB7.size] = "250";
    level._id_6EB7[level._id_6EB7.size] = "252";
}

_id_6EB8()
{
    if ( level.console )
    {
        _id_6EB9( getcommandfromkey( "BUTTON_START" ), "BUTTON_START" );
        _id_6EB9( getcommandfromkey( "BUTTON_A" ), "BUTTON_A" );
        _id_6EB9( getcommandfromkey( "BUTTON_B" ), "BUTTON_B" );
        _id_6EB9( getcommandfromkey( "BUTTON_X" ), "BUTTON_X" );
        _id_6EB9( getcommandfromkey( "BUTTON_Y" ), "BUTTON_Y" );
        _id_6EB9( getcommandfromkey( "BUTTON_LSTICK" ), "BUTTON_LSTICK" );
        _id_6EB9( getcommandfromkey( "BUTTON_RSTICK" ), "BUTTON_RSTICK" );
        _id_6EB9( getcommandfromkey( "BUTTON_LSHLDR" ), "BUTTON_LSHLDR" );
        _id_6EB9( getcommandfromkey( "BUTTON_RSHLDR" ), "BUTTON_RSHLDR" );
        _id_6EB9( getcommandfromkey( "BUTTON_LTRIG" ), "BUTTON_LTRIG" );
        _id_6EB9( getcommandfromkey( "BUTTON_RTRIG" ), "BUTTON_RTRIG" );
    }
    else
    {
        for ( var_0 = 0; var_0 < level._id_6EB6.size; var_0++ )
            _id_6EB9( getcommandfromkey( level._id_6EB6[var_0] ), level._id_6EB6[var_0] );

        for ( var_0 = 0; var_0 < level._id_6EB7.size; var_0++ )
            _id_6EB9( getcommandfromkey( level._id_6EB7[var_0] ), level._id_6EB7[var_0] );
    }
}

_id_6EB9( var_0, var_1 )
{
    if ( var_0 == "" )
        return;

    var_2 = getarraykeys( level._id_6EB0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = level._id_6EB0[var_2[var_3]];

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( var_4[var_5]._id_6EB2 != var_0 )
                continue;

            var_4[var_5]._id_6EBA = var_1;
        }
    }
}

_id_6EBB( var_0 )
{
    var_1 = "did_action_" + var_0;

    for ( var_2 = 0; var_2 < level._id_6EB0[var_0].size; var_2++ )
    {
        var_3 = level._id_6EB0[var_0][var_2];
        notifyoncommand( var_1, var_3._id_6EB2 );
    }

    return var_1;
}

_id_6EBC( var_0, var_1, var_2, var_3 )
{
    _id_442B();
    level endon( "clearing_hints" );
    var_4 = _id_6EBF( var_0 );

    if ( !isdefined( var_4 ) )
        return;

    level._id_442C = maps\_hud_util::createfontstring( "objective", level._id_6EBD );
    level._id_442C.hidewheninmenu = 1;
    level._id_442C maps\_hud_util::setpoint( "TOP", undefined, 0, 110 );
    level._id_442C.sort = 0.5;

    if ( var_0 == "melee" && level.xenon && var_4._id_6EBA == "BUTTON_RSTICK" )
        level._id_442C settext( &"TRAINER_HINT_MELEE_CLICK" );
    else
        level._id_442C settext( var_4._id_27BB );

    _id_6EBE( var_3, var_1 );
    level._id_442C fadeovertime( 0.5 );
    level._id_442C.alpha = 0;
    wait 0.5;
    _id_442B();
}

_id_6EBE( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        var_2 = var_0 + "_timeout";
        level.player endon( var_2 );
        level.player thread _id_6EC0( var_0, var_2, var_1 );
    }

    level.player waittill( var_0 );
}

_id_442B()
{
    if ( isdefined( level._id_442C ) )
        level._id_442C maps\_hud_util::destroyelem();

    if ( isdefined( level._id_442D ) )
        level._id_442D maps\_hud_util::destroyelem();

    if ( isdefined( level._id_442E ) )
        level._id_442E maps\_hud_util::destroyelem();

    if ( isdefined( level._id_442F ) )
        level._id_442F maps\_hud_util::destroyelem();

    if ( isdefined( level._id_442A ) )
        level._id_442A maps\_hud_util::destroyelem();

    level notify( "clearing_hints" );
}

_id_4429( var_0 )
{
    if ( isdefined( var_0 ) )
        level._id_442A = maps\_hud_util::createicon( "popmenu_bg", 650, 50 );
    else
        level._id_442A = maps\_hud_util::createicon( "popmenu_bg", 650, 30 );

    level._id_442A.hidewheninmenu = 1;
    level._id_442A maps\_hud_util::setpoint( "TOP", undefined, 0, 105 );
    level._id_442A.alpha = 0.5;
    level._id_442A.sort = 0;
}

_id_6EBF( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_6EB0[var_0].size; var_1++ )
    {
        var_2 = level._id_6EB0[var_0][var_1];
        var_3 = getkeybinding( var_2._id_6EB2 );

        if ( !var_3["count"] )
            continue;

        return level._id_6EB0[var_0][var_1];
    }

    return undefined;
}

_id_6EC0( var_0, var_1, var_2 )
{
    self endon( var_0 );
    wait(var_2);
    self notify( var_1 );
}

_id_5F32( var_0 )
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D fadeovertime( var_0 );
    level._id_473D.alpha = 1;
}

_id_6EC1( var_0 )
{
    if ( isdefined( level._id_473D ) )
    {
        level._id_473D fadeovertime( var_0 );
        level._id_473D.alpha = 0;
    }

    wait(var_0);
    level._id_473D destroy();
}

_id_6BA9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = maps\_anim::_id_1202( var_2 );
    var_6 = var_5["origin"];
    var_7 = var_5["angles"];

    if ( isdefined( var_3 ) )
        var_8 = var_3;
    else
        var_8 = var_0._id_1032;

    if ( isdefined( level._id_0C59[var_8][var_1] ) )
    {
        if ( isarray( level._id_0C59[var_8][var_1] ) )
            var_9 = getstartorigin( var_6, var_7, level._id_0C59[var_8][var_1][0] );
        else
            var_9 = getstartorigin( var_6, var_7, level._id_0C59[var_8][var_1] );
    }
    else
        var_9 = var_6;

    if ( !isdefined( var_4 ) )
        var_4 = 48;

    var_10 = distancesquared( var_0.origin, var_9 );

    if ( var_10 > var_4 * var_4 )
        return 0;

    return 1;
}

_id_6EC2( var_0, var_1, var_2 )
{
    thread maps\_anim::_id_124E( var_0, var_1, var_2 );
    thread _id_6EC3( var_0, var_2 );
}

_id_6EC3( var_0, var_1 )
{
    self endon( var_1 );
    var_0 waittill( var_1 );
    self notify( var_1 );
}

_id_6EC4( var_0, var_1, var_2 )
{
    thread maps\_anim::_id_11D6( var_0, var_1, var_2 );

    foreach ( var_4 in var_0 )
        thread _id_6EC3( var_4, var_2 );
}

_id_4BF3()
{
    if ( !isalive( self ) )
        return;

    self.allowdeath = 1;
    self.a._id_0D55 = 1;
    maps\_utility::_id_0D72( 0 );
    self kill();
}

_id_6B82( var_0, var_1 )
{
    return var_0 + " - " + var_1;
}

_id_6B83()
{
    var_0 = [];

    foreach ( var_9, var_2 in level.createfxexploders )
    {
        var_3 = undefined;

        foreach ( var_5 in var_2 )
        {
            var_6 = "script group not on all parts of exploder: " + var_9 + ", at: " + var_5.v["origin"];

            if ( !isdefined( var_5.model ) || !isdefined( var_5.model._id_16A6 ) )
            {
                var_3 = 0;

                if ( !isdefined( var_0[var_9] ) )
                    var_0[var_9] = [];

                var_0[var_9][var_0[var_9].size] = var_5;
                continue;
            }

            var_3 = 1;
            var_7 = _id_6B82( var_5.model._id_16A6, var_5.model.script_exploder );
            var_5.v["exploder"] = var_7;

            if ( !isdefined( var_0[var_7] ) )
                var_0[var_7] = [];

            var_0[var_7][var_0[var_7].size] = var_5;
        }
    }

    level.createfxexploders = var_0;

    for ( var_10 = 0; var_10 < 6; var_10++ )
    {
        switch ( var_10 )
        {
            case 0:
                var_11 = "trigger_multiple";
                break;
            case 1:
                var_11 = "trigger_once";
                break;
            case 2:
                var_11 = "trigger_use";
                break;
            case 3:
                var_11 = "trigger_radius";
                break;
            case 4:
                var_11 = "trigger_lookat";
                break;
            default:
                var_11 = "trigger_damage";
                break;
        }

        var_12 = getentarray( var_11, "classname" );

        for ( var_13 = 0; var_13 < var_12.size; var_13++ )
        {
            if ( isdefined( var_12[var_13].script_prefab_exploder ) )
                var_12[var_13].script_exploder = var_12[var_13].script_prefab_exploder;

            if ( isdefined( var_12[var_13].script_exploder ) )
            {
                if ( isdefined( var_12[var_13]._id_16A6 ) )
                {
                    level notify( "killexplodertridgers" + var_12[var_13].script_exploder );
                    var_12[var_13].script_exploder = _id_6B82( var_12[var_13]._id_16A6, var_12[var_13].script_exploder );
                    level thread _id_6EC5( var_12[var_13] );
                }

                var_2 = level.createfxexploders[var_12[var_13].script_exploder];

                foreach ( var_5 in var_2 )
                {
                    if ( !isdefined( var_5.v["trigger"] ) )
                        var_5.v["trigger"] = [];

                    var_5.v["trigger"][var_5.v["trigger"].size] = var_12[var_13];
                }
            }
        }
    }
}

_id_6EC5( var_0 )
{
    level endon( "killexplodertridgers" + var_0.script_exploder );
    var_0 waittill( "trigger", var_1 );

    if ( isdefined( var_1 ) )
    {
        if ( isai( var_1 ) && var_1 isbadguy() || isdefined( var_1.script_team ) && var_1.script_team == "axis" )
        {
            level thread _id_6EC5( var_0 );
            return;
        }
    }

    if ( isdefined( var_0.script_chance ) && randomfloat( 1 ) > var_0.script_chance )
    {
        if ( !var_0 maps\_utility::script_delay() )
            wait 4;

        level thread _id_6EC5( var_0 );
        return;
    }

    if ( !var_0 maps\_utility::script_delay() && isdefined( var_0._id_1ED3 ) )
        wait(var_0._id_1ED3);

    common_scripts\utility::exploder( var_0.script_exploder );
    level notify( "killexplodertridgers" + var_0.script_exploder );
}

_id_6EC6()
{
    self.maxhealth = 20000;
    self setnormalhealth( self.maxhealth );
    self setcandamage( 1 );
}

_id_6EC7()
{
    _id_6EC6();
    self._id_6EC8 = [ "tag_glass_front", "tag_glass_back", "tag_glass_left_front", "tag_glass_right_front", "tag_glass_left_back", "tag_glass_right_back", "tag_light_left_front", "tag_light_right_front", "tag_light_left_back", "tag_light_right_back" ];
    self._id_6EC9 = [];

    for ( var_0 = 0; var_0 < self._id_6EC8.size; var_0++ )
    {
        self._id_6EC9[var_0] = spawnstruct();
        self._id_6EC9[var_0].v["currentState"] = 0;
        self._id_6EC9[var_0].v["health"] = 40;
        self._id_6EC9[var_0].v["invul"] = 0;
        _id_6ECA( self, var_0 );
    }

    self._id_6EC9[0].v["destruct_fx"] = "car_glass_large";
    self._id_6EC9[0].v["tag_fx"] = "tag_glass_front_fx";
    self._id_6EC9[0].v["maxState"] = 2;
    self._id_6EC9[1].v["destruct_fx"] = "car_glass_large";
    self._id_6EC9[1].v["tag_fx"] = "tag_glass_back_fx";
    self._id_6EC9[1].v["maxState"] = 2;
    self._id_6EC9[2].v["destruct_fx"] = "car_glass_med";
    self._id_6EC9[2].v["tag_fx"] = "tag_glass_left_front_fx";
    self._id_6EC9[2].v["maxState"] = 2;
    self._id_6EC9[3].v["destruct_fx"] = "car_glass_med";
    self._id_6EC9[3].v["tag_fx"] = "tag_glass_right_front_fx";
    self._id_6EC9[3].v["maxState"] = 1;
    self._id_6EC9[4].v["destruct_fx"] = "car_glass_med";
    self._id_6EC9[4].v["tag_fx"] = "tag_glass_left_back_fx";
    self._id_6EC9[4].v["maxState"] = 2;
    self._id_6EC9[5].v["destruct_fx"] = "car_glass_med";
    self._id_6EC9[5].v["tag_fx"] = "tag_glass_right_back_fx";
    self._id_6EC9[5].v["maxState"] = 2;
    self._id_6EC9[6].v["destruct_fx"] = "car_glass_headlight";
    self._id_6EC9[6].v["tag_fx"] = "tag_light_left_front";
    self._id_6EC9[6].v["maxState"] = 1;
    self._id_6EC9[7].v["destruct_fx"] = "car_glass_headlight";
    self._id_6EC9[7].v["tag_fx"] = "tag_light_right_front";
    self._id_6EC9[7].v["maxState"] = 1;
    self._id_6EC9[8].v["destruct_fx"] = "car_glass_brakelight";
    self._id_6EC9[8].v["tag_fx"] = "tag_light_left_back";
    self._id_6EC9[8].v["maxState"] = 1;
    self._id_6EC9[9].v["destruct_fx"] = "car_glass_brakelight";
    self._id_6EC9[9].v["tag_fx"] = "tag_light_right_back";
    self._id_6EC9[9].v["maxState"] = 1;
    thread _id_6ECB();
}

_id_6ECA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_3 = self._id_6EC8[var_1];

    if ( var_0._id_6EC9[var_1].v["currentState"] == 0 )
    {
        self showpart( var_3 );
        self hidepart( var_3 + "_d" );
    }
    else if ( var_0._id_6EC9[var_1].v["currentState"] == 1 )
    {
        self hidepart( var_3 );
        self showpart( var_3 + "_d" );
    }
    else
    {
        self hidepart( var_3 );
        self hidepart( var_3 + "_d" );

        if ( isdefined( var_2 ) && var_2 )
        {
            var_4 = var_0._id_6EC9[var_1].v["destruct_fx"];
            var_5 = var_0._id_6EC9[var_1].v["tag_fx"];
            playfxontag( common_scripts\utility::getfx( var_4 ), self, var_5 );
        }
    }
}

_id_6ECB( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_0 endon( "death" );

    for (;;)
    {
        var_0 setnormalhealth( var_0.maxhealth );
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( isdefined( var_7 ) && var_7 == "" )
        {
            if ( isdefined( var_8 ) && var_8 != "" && var_8 != "tag_body" && var_8 != "body_animate_jnt" )
                var_7 = var_8;
            else
                var_7 = undefined;
        }

        if ( !isdefined( var_7 ) )
            continue;

        var_9 = tolower( var_7 );

        foreach ( var_12, var_11 in self._id_6EC8 )
        {
            if ( var_9 == var_11 || var_9 == var_11 + "_d" )
                _id_6ECC( var_0, var_12, var_1 );
        }
    }
}

_id_6ECC( var_0, var_1, var_2 )
{
    if ( self._id_6EC9[var_1].v["currentState"] < 2 )
    {
        if ( self._id_6EC9[var_1].v["invul"] )
            return;

        self._id_6EC9[var_1].v["health"] -= var_2;

        if ( self._id_6EC9[var_1].v["health"] < 0 )
        {
            if ( self._id_6EC9[var_1].v["currentState"] < self._id_6EC9[var_1].v["maxState"] )
            {
                self._id_6EC9[var_1].v["health"] = 40;
                self._id_6EC9[var_1].v["currentState"]++;
                var_0 _id_6ECA( self, var_1, 1 );
            }
        }
    }
}

_id_6ECD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_10 = maps\_utility::_id_09A9();
    var_11 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_11.origin = var_10.origin;
    var_11.angles = var_10 getplayerangles();

    if ( isdefined( var_9 ) && var_9 )
        var_10 playerlinkto( var_11, "", var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_5 ) )
        var_10 playerlinkto( var_11, "", var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_4 ) )
        var_10 playerlinkto( var_11, "", var_4 );
    else
        var_10 playerlinkto( var_11 );

    var_11 moveto( var_0, var_2, var_2 * 0.25 );
    var_11 rotateto( var_1, var_2, var_2 * 0.25 );
    wait(var_3);
    var_11 delete();
}
