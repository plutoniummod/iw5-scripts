// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6F55()
{
    if ( isdefined( self._id_26FF ) )
        return;

    maps\_utility::_id_2721();
    maps\_utility::_id_0EEC();
    self._id_26FF = 1;
    self._id_1151 = 1;
    self.ignoresuppression = 1;
    self.maxfaceenemydist = 0;
    self._id_0FF2 = 1;
    self._id_20B7 = 2000;
    self._id_0EEE = 1;
    self.usechokepoints = 0;
    self._id_1089 = 1;
    self.combatmode = "no_cover";
    self._id_6F56 = self.grenadeawareness;
    self.grenadeawareness = 0;
    self._id_6F57 = self.nogrenadereturnthrow;
    self.nogrenadereturnthrow = 1;
    self._id_2802 = self.walkdist;
    self._id_2801 = self.walkdistfacingmotion;
    self.walkdist = 0;
    self.walkdistfacingmotion = 0;
    _id_6F59();
}

_id_6F58()
{
    if ( !isdefined( self._id_26FF ) )
        return;

    maps\_utility::_id_2722();
    self._id_26FF = undefined;
    self._id_1151 = undefined;
    self.ignoresuppression = 0;
    self.maxfaceenemydist = 512;
    self._id_0FF2 = undefined;
    self._id_0EEE = undefined;
    self.usechokepoints = 1;
    self._id_1089 = undefined;
    self.combatmode = "cover";
    self.grenadeawareness = self._id_6F56;
    self.nogrenadereturnthrow = self._id_6F57;
    self.walkdist = self._id_2802;
    self.walkdistfacingmotion = self._id_2801;
    animscripts\animset::_id_0C87();
    self._id_10B5 = "none";
    self allowedstances( "stand", "crouch", "prone" );
    animscripts\animset::_id_0CA0();
    self._id_11A0 = undefined;
    self._id_11A1 = undefined;
    self._id_1193 = undefined;
    self._id_118E = undefined;
    self._id_1194 = undefined;
}
#using_animtree("generic_human");

_id_6F59()
{
    var_0 = [];
    var_0["sprint"] = %casual_killer_jog_a;
    var_0["straight"] = %casual_killer_walk_f;
    var_0["move_f"] = %casual_killer_walk_f;
    var_0["move_l"] = %walk_left;
    var_0["move_r"] = %walk_right;
    var_0["move_b"] = %walk_backward;
    var_0["crouch"] = %crouch_fastwalk_f;
    var_0["crouch_l"] = %crouch_fastwalk_l;
    var_0["crouch_r"] = %crouch_fastwalk_r;
    var_0["crouch_b"] = %crouch_fastwalk_b;
    var_0["stairs_up"] = %traverse_stair_run_01;
    var_0["stairs_down"] = %traverse_stair_run_down;
    self._id_0C88["run"] = var_0;
    self._id_0C88["walk"] = var_0;
    self._id_0C89 = [];
    self._id_0C89["stand"] = %casual_killer_stand_aim5;
    self._id_0C89["stand_add"] = %casual_killer_stand_idle;
    self.a._id_0D26 = "stand";
    self allowedstances( "stand" );
    var_0 = anim._id_0C65._id_0C78;
    var_0["add_aim_up"] = %casual_killer_stand_aim8;
    var_0["add_aim_down"] = %casual_killer_stand_aim2;
    var_0["add_aim_left"] = %casual_killer_stand_aim4;
    var_0["add_aim_right"] = %casual_killer_stand_aim6;
    var_0["straight_level"] = %casual_killer_stand_aim5;
    var_0["fire"] = %casual_killer_stand_auto;
    var_0["single"] = animscripts\utility::_id_0C6D( %casual_killer_stand_auto );
    var_0["burst2"] = %casual_killer_stand_auto;
    var_0["burst3"] = %casual_killer_stand_auto;
    var_0["burst4"] = %casual_killer_stand_auto;
    var_0["burst5"] = %casual_killer_stand_auto;
    var_0["burst6"] = %casual_killer_stand_auto;
    var_0["semi2"] = %casual_killer_stand_auto;
    var_0["semi3"] = %casual_killer_stand_auto;
    var_0["semi4"] = %casual_killer_stand_auto;
    var_0["semi5"] = %casual_killer_stand_auto;
    var_0["exposed_idle"] = animscripts\utility::_id_0C6D( %casual_killer_stand_idle );
    animscripts\animset::_id_0C81( var_0 );
    animscripts\animset::_id_0C84( var_0 );
    _id_6F5E();
    animscripts\init_move_transitions::_id_2082();
    self._id_11A0 = ::_id_6F5C;
    self._id_11A1 = 1;
    anim._id_1164["casual_killer"] = [];
    anim._id_1164["casual_killer"][1] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][2] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][3] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][4] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][6] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][7] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][8] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer"][9] = %casual_killer_walk_stop;
    anim._id_1164["casual_killer_sprint"] = [];
    anim._id_1164["casual_killer_sprint"][1] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][2] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][3] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][4] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][6] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][7] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][8] = %casual_killer_jog_stop;
    anim._id_1164["casual_killer_sprint"][9] = %casual_killer_jog_stop;
    var_1 = [];
    var_1[0] = "casual_killer";
    var_1[1] = "casual_killer_sprint";

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        for ( var_4 = 1; var_4 <= 9; var_4++ )
        {
            if ( var_4 == 5 )
                continue;

            if ( isdefined( anim._id_1164[var_3][var_4] ) )
                anim._id_1186[var_3][var_4] = getmovedelta( anim._id_1164[var_3][var_4], 0, 1 );
        }
    }

    anim._id_1187["casual_killer"][1] = 45;
    anim._id_1187["casual_killer"][2] = 0;
    anim._id_1187["casual_killer"][3] = -45;
    anim._id_1187["casual_killer"][4] = 90;
    anim._id_1187["casual_killer"][6] = -90;
    anim._id_1187["casual_killer"][8] = 180;
    anim._id_1187["casual_killer_sprint"][1] = 45;
    anim._id_1187["casual_killer_sprint"][2] = 0;
    anim._id_1187["casual_killer_sprint"][3] = -45;
    anim._id_1187["casual_killer_sprint"][4] = 90;
    anim._id_1187["casual_killer_sprint"][6] = -90;
    anim._id_1187["casual_killer_sprint"][8] = 180;
    anim._id_1166["casual_killer"] = "stand";
    anim._id_1166["casual_killer_sprint"] = "stand";
    self._id_1193 = ::_id_6F5B;
    self._id_118E = ::_id_6F5A;
    self._id_1194 = 1;
}

_id_6F5A( var_0 )
{
    return 1;
}

_id_6F5B()
{
    if ( _id_6F5D() )
        return "casual_killer_sprint";

    return "casual_killer";
}

_id_6F5C()
{
    if ( isdefined( self._id_1199 ) )
        return;

    self orientmode( "face angle", self.angles[1] );
    self animmode( "zonly_physics", 0 );
    var_0 = randomfloatrange( 0.9, 1.1 );

    if ( _id_6F5D() )
        var_1 = %casual_killer_jog_start;
    else
        var_1 = %casual_killer_walk_start;

    self setflaggedanimknoballrestart( "startmove", var_1, %body, 1, 0.1, var_0 );
    animscripts\shared::_id_0C51( "startmove" );
    self orientmode( "face default" );
    self animmode( "none", 0 );

    if ( animhasnotetrack( var_1, "code_move" ) )
        animscripts\shared::_id_0C51( "startmove" );
}

_id_6F5D()
{
    if ( !isdefined( self._id_0FBC ) )
        return 0;

    if ( isarray( self._id_0FBC ) )
    {
        if ( self._id_0FBC[0] == %casual_killer_jog_a || self._id_0FBC[0] == %casual_killer_jog_b )
            return 1;
        else
            return 0;
    }

    if ( self._id_0FBC == %casual_killer_jog_a || self._id_0FBC == %casual_killer_jog_b )
        return 1;

    return 0;
}

_id_6F5E( var_0 )
{
    self._id_0CA1 = 90;
    self._id_0CA2 = 1;
    self._id_0CA3 = 0.2;

    if ( !isdefined( var_0 ) )
        var_0 = "straight";

    self clearanim( %run_n_gun, 0.2 );

    switch ( var_0 )
    {
        case "straight":
            self._id_0CA4["F"] = %casual_killer_walk_shoot_f;
            self._id_0CA4["L"] = %casual_killer_walk_shoot_l;
            self._id_0CA4["R"] = %casual_killer_walk_shoot_r;
            self._id_0CA4["LB"] = %casual_killer_walk_shoot_l;
            self._id_0CA4["RB"] = %casual_killer_walk_shoot_r;
            break;
        case "down":
            self._id_0CA4["F"] = %casual_killer_walk_shoot_f_aimdown;
            self._id_0CA4["L"] = %casual_killer_walk_shoot_l_aimdown;
            self._id_0CA4["R"] = %casual_killer_walk_shoot_r_aimdown;
            self._id_0CA4["LB"] = %casual_killer_walk_shoot_l_aimdown;
            self._id_0CA4["RB"] = %casual_killer_walk_shoot_r_aimdown;
            break;
    }
}
