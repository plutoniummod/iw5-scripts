// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6BB3()
{
    maps\_stealth_utility::_id_42FA( "warlord_stealth_function", ::_id_6BB5 );
    maps\_stealth_utility::_id_42FA( "infiltration_stealth_function", ::_id_6BB6 );
    maps\_stealth_utility::_id_42FA( "technical_rider_stealth_function", ::_id_6BB7 );
    level._id_1C4D["_patrol_endon_spotted_flag"] = ::_id_6BE9;
    var_0 = spawnstruct();
    thread _id_6BC7( var_0 );
    level._id_6BB4 = var_0;
}

_id_6BB5()
{
    maps\_stealth_utility::_id_42FB();

    if ( isplayer( self ) )
    {
        thread _id_6BBE();
        return;
    }

    switch ( self.team )
    {
        case "axis":
        case "team3":
            maps\_stealth_utility::_id_4301();
            maps\_stealth_utility::_id_42FF( ::_id_6BBC );
            var_0 = [];
            var_0["attack"] = maps\_stealth_threat_enemy::_id_4257;
            maps\_stealth_utility::_id_4304( var_0 );
            maps\_stealth_utility::_id_4302();
            thread _id_6BB8();
            maps\_stealth_utility::_id_4311();
            var_1 = [];
            var_1["explode"] = ::_id_6BB9;
            var_1["doFlashBanged"] = ::_id_6BBA;

            foreach ( var_4, var_3 in var_1 )
                _id_0563::_id_42C1( var_4, var_3 );

            var_5 = [];
            var_5["hidden"] = ::_id_6BE2;
            var_5["spotted"] = ::_id_6BE3;
            maps\_stealth_utility::_id_42FD( var_5 );
            break;
        case "allies":
            _id_6BD7();
            var_6 = [];
            var_6["hidden"] = ::_id_6BDB;
            var_6["spotted"] = ::_id_6BDC;
            maps\_stealth_utility::_id_42FD( var_6 );
            self._id_4223 = 0;
    }
}

_id_6BB6()
{
    maps\_stealth_utility::_id_42FB();

    if ( isplayer( self ) )
        return;

    switch ( self.team )
    {
        case "axis":
        case "team3":
            maps\_stealth_utility::_id_4301();
            maps\_stealth_utility::_id_42FF( ::_id_6BBD );
            var_0 = [];
            var_0["attack"] = maps\_stealth_threat_enemy::_id_4257;
            maps\_stealth_utility::_id_4304( var_0 );
            thread _id_6BB8();
            maps\_stealth_utility::_id_4311();
            var_1 = [];
            var_1["explode"] = ::_id_6BB9;
            var_1["doFlashBanged"] = ::_id_6BBA;

            foreach ( var_4, var_3 in var_1 )
                _id_0563::_id_42C1( var_4, var_3 );

            self._id_20AF = 3;
            break;
        case "allies":
            break;
    }
}

_id_6BB7()
{
    maps\_stealth_utility::_id_42FB();

    if ( isplayer( self ) )
        return;

    switch ( self.team )
    {
        case "axis":
        case "team3":
            maps\_stealth_utility::_id_4301();
            var_0 = [];
            var_0["attack"] = ::_id_6BE5;
            maps\_stealth_utility::_id_4304( var_0 );
            maps\_stealth_utility::_id_4302();
            thread _id_6BB8();
            maps\_stealth_utility::_id_4311();
            var_1 = [];
            var_1["explode"] = ::_id_6BB9;
            var_1["doFlashBanged"] = ::_id_6BBA;

            foreach ( var_4, var_3 in var_1 )
                _id_0563::_id_42C1( var_4, var_3 );

            var_5 = [];
            var_5["hidden"] = ::_id_6BE2;
            var_5["spotted"] = ::_id_6BE3;
            maps\_stealth_utility::_id_42FD( var_5 );
            self._id_20AF = 3;
            maps\_stealth_shared_utilities::_id_41CF( "animation", "wrapper", ::_id_6BE7 );
            maps\_utility::_id_13DC( "_stealth_behavior_reaction_anim" );
            break;
        case "allies":
            break;
    }
}

_id_6BB8()
{
    waittillframeend;
    maps\_stealth_utility::_id_4308();
}

_id_6BB9( var_0 )
{
    thread _id_6BBB();

    if ( isdefined( self._id_2252 ) )
    {
        wait 0.1;
        _id_6BE4();
    }

    _id_0563::_id_42BD( var_0 );
}

_id_6BBA( var_0 )
{
    thread _id_6BBB();

    if ( isdefined( self._id_2252 ) )
    {
        wait 1;
        _id_6BE4();
    }

    _id_0563::_id_42BC( var_0 );
}

_id_6BBB()
{
    wait(randomfloatrange( 1.5, 2.5 ));
    level notify( "enemy_bad_event" );
}

_id_6BBC()
{
    var_0 = 1;

    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "river_bridge_guys" )
        {
            var_1 = [];
            var_1[0] = 5;
            var_1[1] = 4;
            var_1[2] = 2;
            var_1[3] = 1;
            var_0 = var_1[level.gameskill];
        }
        else if ( self.script_noteworthy == "river_prone_guys" )
        {
            if ( common_scripts\utility::flag( "flag_in_crouch_stealth_range" ) )
                var_0 = 3;
            else
                var_0 = 1;
        }
    }

    wait(var_0);
}

_id_6BBD()
{
    if ( isdefined( self._id_204F ) && ( self._id_204F == "8" || self._id_204F == "400" ) )
        wait 1;
    else
        wait 5;
}

_id_6BBE()
{
    self endon( "death" );
    self._id_4223 = 0;
    self._id_6BBF = self.threatbias;
    _id_22FC();

    if ( isdefined( self._id_6BC0 ) )
        _id_6BC1();
}

_id_22FC()
{
    self endon( "death" );
    level endon( "_stealth_enabled" );

    if ( !common_scripts\utility::flag( "_stealth_enabled" ) )
        return;

    for (;;)
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        self._id_6BC0 = 1;
        self._id_2331 = 1;
        self.threatbias = 1000;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        _id_6BC1();
    }
}

_id_6BC1()
{
    self endon( "death" );
    self._id_6BC0 = undefined;
    self._id_2331 = undefined;
    self.threatbias = self._id_6BBF;
}

_id_6BC2( var_0 )
{
    switch ( var_0 )
    {
        case "ai_eventDistFootstepWalk":
            return 128;
        case "ai_eventDistFootstep":
            return 256;
        case "ai_eventDistFootstepSprint":
            return 400;
        case "ai_eventDistDeath":
            return 1024;
        case "ai_eventDistPain":
            return 512;
        case "ai_eventDistNewEnemy":
            return 1024;
        case "ai_eventDistGunShot":
            return 1024;
        case "ai_eventDistGunShotTeam":
            return 1024;
        case "ai_eventDistExplosion":
            return 1024;
        default:
            break;
    }

    return undefined;
}

_id_6BC3()
{
    maps\_stealth_visibility_system::_id_42F8();
    _id_6BCA();
    _id_6BD5();
    _id_6BD3();
}

_id_6BC4( var_0 )
{
    var_1 = level._id_6BB4._id_6BC5[var_0]["hidden"];
    var_2 = level._id_6BB4._id_6BC5[var_0]["spotted"];
    maps\_stealth_utility::_id_4323( var_1, var_2 );
    var_3 = level._id_6BB4._id_6BC6[var_0];
    var_4 = [ "ai_eventDistFootstep", "ai_eventDistFootstepWalk", "ai_eventDistFootstepSprint", "ai_eventDistDeath", "ai_eventDistPain", "ai_eventDistNewEnemy", "ai_eventDistGunShot", "ai_eventDistGunShotTeam", "ai_eventDistExplosion" ];
    var_5 = [ "spotted", "hidden" ];
    var_6 = [];

    foreach ( var_8 in var_4 )
    {
        var_6[var_8] = [];

        foreach ( var_10 in var_5 )
        {
            if ( isdefined( var_3 ) && isdefined( var_3[var_8] ) && isdefined( var_3[var_8][var_10] ) )
            {
                var_6[var_8][var_10] = var_3[var_8][var_10];
                continue;
            }

            var_6[var_8][var_10] = _id_6BC2( var_8 );
        }
    }

    maps\_stealth_utility::_id_4327( var_6 );
}

_id_6BC7( var_0 )
{
    var_0._id_6BC5 = [];
    var_0._id_6BC6 = [];
    var_0._id_6BC5["river_short"]["hidden"]["prone"] = 240;
    var_0._id_6BC5["river_short"]["hidden"]["crouch"] = 240;
    var_0._id_6BC5["river_short"]["hidden"]["stand"] = 240;
    var_0._id_6BC5["river_short"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["river_short"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["river_short"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["river_short"]["ai_eventDistFootstep"]["hidden"] = 240;
    var_0._id_6BC6["river_short"]["ai_eventDistFootstepSprint"]["hidden"] = 240;
    var_0._id_6BC6["river_short"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["river_short"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["river_medium"]["hidden"]["prone"] = 720;
    var_0._id_6BC5["river_medium"]["hidden"]["crouch"] = 720;
    var_0._id_6BC5["river_medium"]["hidden"]["stand"] = 720;
    var_0._id_6BC5["river_medium"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["river_medium"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["river_medium"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["river_medium"]["ai_eventDistFootstepSprint"]["hidden"] = 264;
    var_0._id_6BC6["river_medium"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["river_medium"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["river_far"]["hidden"]["prone"] = 1200;
    var_0._id_6BC5["river_far"]["hidden"]["crouch"] = 1200;
    var_0._id_6BC5["river_far"]["hidden"]["stand"] = 1200;
    var_0._id_6BC5["river_far"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["river_far"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["river_far"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["river_far"]["ai_eventDistFootstepSprint"]["hidden"] = 264;
    var_0._id_6BC6["river_far"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["river_far"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["river_start"]["hidden"]["prone"] = 480;
    var_0._id_6BC5["river_start"]["hidden"]["crouch"] = 600;
    var_0._id_6BC5["river_start"]["hidden"]["stand"] = 720;
    var_0._id_6BC5["river_start"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["river_start"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["river_start"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["river_start"]["ai_eventDistFootstepSprint"]["hidden"] = 264;
    var_0._id_6BC5["river_crouch"]["hidden"]["prone"] = 24;
    var_0._id_6BC5["river_crouch"]["hidden"]["crouch"] = 24;
    var_0._id_6BC5["river_crouch"]["hidden"]["stand"] = 720;
    var_0._id_6BC5["river_crouch"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["river_crouch"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["river_crouch"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["river_crouch"]["ai_eventDistFootstep"]["hidden"] = 24;
    var_0._id_6BC6["river_crouch"]["ai_eventDistFootstepWalk"]["hidden"] = 24;
    var_0._id_6BC6["river_crouch"]["ai_eventDistFootstepSprint"]["hidden"] = 264;
    var_0._id_6BC6["river_crouch"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["river_crouch"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["blind_and_deaf"]["hidden"]["prone"] = 24;
    var_0._id_6BC5["blind_and_deaf"]["hidden"]["crouch"] = 24;
    var_0._id_6BC5["blind_and_deaf"]["hidden"]["stand"] = 192;
    var_0._id_6BC5["blind_and_deaf"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["blind_and_deaf"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["blind_and_deaf"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["blind_and_deaf"]["ai_eventDistFootstep"]["hidden"] = 24;
    var_0._id_6BC6["blind_and_deaf"]["ai_eventDistFootstepWalk"]["hidden"] = 24;
    var_0._id_6BC6["blind_and_deaf"]["ai_eventDistFootstepSprint"]["hidden"] = 24;
    var_0._id_6BC6["blind_and_deaf"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["blind_and_deaf"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["river_big_moment_prone"]["hidden"]["prone"] = 60;
    var_0._id_6BC5["river_big_moment_prone"]["hidden"]["crouch"] = 600;
    var_0._id_6BC5["river_big_moment_prone"]["hidden"]["stand"] = 600;
    var_0._id_6BC5["river_big_moment_prone"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["river_big_moment_prone"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["river_big_moment_prone"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["river_big_moment_prone"]["ai_eventDistFootstep"]["hidden"] = 60;
    var_0._id_6BC6["river_big_moment_prone"]["ai_eventDistFootstepWalk"]["hidden"] = 60;
    var_0._id_6BC6["river_big_moment_prone"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["river_big_moment_prone"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["inf_patroller"]["hidden"]["prone"] = 24;
    var_0._id_6BC5["inf_patroller"]["hidden"]["crouch"] = 24;
    var_0._id_6BC5["inf_patroller"]["hidden"]["stand"] = 192;
    var_0._id_6BC5["inf_patroller"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["inf_patroller"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["inf_patroller"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistFootstep"]["hidden"] = 24;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistFootstepWalk"]["hidden"] = 24;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistFootstepSprint"]["hidden"] = 24;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistDeath"]["hidden"] = 300;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistPain"]["hidden"] = 300;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistGunShotTeam"]["spotted"] = 1;
    var_0._id_6BC6["inf_patroller"]["ai_eventDistGunShotTeam"]["hidden"] = 1;
    var_0._id_6BC5["inf_stealth"]["hidden"]["prone"] = 480;
    var_0._id_6BC5["inf_stealth"]["hidden"]["crouch"] = 480;
    var_0._id_6BC5["inf_stealth"]["hidden"]["stand"] = 480;
    var_0._id_6BC5["inf_stealth"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["inf_stealth"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["inf_stealth"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistFootstep"]["spotted"] = 1024;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistFootstep"]["hidden"] = 480;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistFootstepWalk"]["spotted"] = 1024;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistFootstepWalk"]["hidden"] = 480;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistFootstepSprint"]["spotted"] = 1024;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistFootstepSprint"]["hidden"] = 480;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistDeath"]["hidden"] = 300;
    var_0._id_6BC6["inf_stealth"]["ai_eventDistPain"]["hidden"] = 300;
    var_0._id_6BC5["inf_aware_stealth"]["hidden"]["prone"] = 1200;
    var_0._id_6BC5["inf_aware_stealth"]["hidden"]["crouch"] = 1200;
    var_0._id_6BC5["inf_aware_stealth"]["hidden"]["stand"] = 1200;
    var_0._id_6BC5["inf_aware_stealth"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["inf_aware_stealth"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["inf_aware_stealth"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistFootstep"]["spotted"] = 1024;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistFootstep"]["hidden"] = 1200;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistFootstepWalk"]["spotted"] = 1024;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistFootstepWalk"]["hidden"] = 1200;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistFootstepSprint"]["spotted"] = 1024;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistFootstepSprint"]["hidden"] = 1200;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistDeath"]["hidden"] = 512;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistPain"]["hidden"] = 256;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistNewEnemy"]["spotted"] = 750;
    var_0._id_6BC6["inf_aware_stealth"]["ai_eventDistNewEnemy"]["hidden"] = 750;
    var_0._id_6BC5["inf_tower_stealth"]["hidden"]["prone"] = 240;
    var_0._id_6BC5["inf_tower_stealth"]["hidden"]["crouch"] = 240;
    var_0._id_6BC5["inf_tower_stealth"]["hidden"]["stand"] = 240;
    var_0._id_6BC5["inf_tower_stealth"]["spotted"]["prone"] = 8192;
    var_0._id_6BC5["inf_tower_stealth"]["spotted"]["crouch"] = 8192;
    var_0._id_6BC5["inf_tower_stealth"]["spotted"]["stand"] = 8192;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistFootstep"]["spotted"] = 1024;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistFootstep"]["hidden"] = 240;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistFootstepWalk"]["spotted"] = 1024;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistFootstepWalk"]["hidden"] = 240;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistFootstepSprint"]["spotted"] = 1024;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistFootstepSprint"]["hidden"] = 240;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistDeath"]["hidden"] = 300;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistPain"]["hidden"] = 300;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistNewEnemy"]["spotted"] = 750;
    var_0._id_6BC6["inf_tower_stealth"]["ai_eventDistNewEnemy"]["hidden"] = 300;
}

_id_6BC8()
{
    _id_6BC4( "river_short" );
}

_id_6BC9()
{
    _id_6BC4( "river_medium" );
}

_id_6BCA()
{
    _id_6BC4( "river_start" );
}

_id_6BCB()
{
    _id_6BC4( "river_far" );
}

_id_6BCC()
{
    _id_6BC4( "river_crouch" );
}

_id_6BCD()
{
    _id_6BC4( "blind_and_deaf" );
}

_id_6BCE()
{
    _id_6BCD();
}

_id_6BCF()
{
    _id_6BC4( "river_big_moment_prone" );
}

_id_6BD0()
{
    _id_6BC4( "inf_stealth" );
}

_id_6BD1()
{
    _id_6BC4( "inf_aware_stealth" );
}

_id_6BD2()
{
    _id_6BC4( "inf_tower_stealth" );
    _id_6BD4();
}

_id_6BD3()
{
    var_0 = [];
    var_0["player_dist"] = 1500;
    var_0["sight_dist"] = 50;
    var_0["detect_dist"] = 50;
    var_0["found_dist"] = 45;
    var_0["found_dog_dist"] = 50;
    maps\_stealth_utility::_id_4325( var_0 );
}

_id_6BD4()
{
    var_0 = [];
    var_0["player_dist"] = 1500;
    var_0["sight_dist"] = 100;
    var_0["detect_dist"] = 100;
    var_0["found_dist"] = 100;
    var_0["found_dog_dist"] = 100;
    maps\_stealth_utility::_id_4325( var_0 );
}

_id_6BD5()
{
    var_0 = [];
    var_0[0] = 1;
    var_0[1] = 1;
    var_0[2] = 1;
    var_0[3] = 0.75;
    maps\_stealth_utility::_id_42F5( var_0[level.gameskill] );
}

_id_6BD6()
{
    var_0 = [];
    var_0[0] = 5;
    var_0[1] = 4;
    var_0[2] = 3;
    var_0[3] = 2;
    maps\_stealth_utility::_id_42F5( var_0[level.gameskill] );
}

_id_6BD7()
{
    self endon( "death" );
    self._id_6BD8 = self._id_20AF;
    self._id_61F5 = self.accuracy;
    self._id_6BD9 = 0.1;
    self._id_6BDA = self._id_134B;
}

_id_6BDB()
{
    self endon( "death" );
    thread _id_6BE0();
    maps\warlord_utility::_id_6BA5( "no_pistol_switch" );
    maps\warlord_utility::_id_6BA5( "dontevershoot" );
    maps\warlord_utility::_id_6BA5( "ignoreme" );
    thread maps\_utility::_id_0D72( 0 );
    self._id_20AF = self._id_6BD8;
    self.accuracy = self._id_61F5;
    _id_6BDE( self._id_6BDA );
}

_id_6BDC()
{
    self endon( "death" );
    self notify( "end_detectable_on_bad_event" );
    maps\warlord_utility::_id_6BA7( "no_pistol_switch" );
    maps\warlord_utility::_id_6BA7( "dontevershoot" );
    maps\warlord_utility::_id_6BA7( "ignoreme" );
    thread maps\_utility::_id_0D72( 1 );

    if ( common_scripts\utility::flag( "_stealth_enabled" ) )
    {
        self._id_20AF = self._id_6BD9;
        self.accuracy = self._id_6BD9;
        _id_6BDE( self._id_6BDD );
    }
    else
    {
        self.ignoreall = 0;
        self._id_20AF = self._id_6BD8;
        self.accuracy = self._id_61F5;
        _id_6BDE( self._id_6BDA );
    }
}

_id_6BDE( var_0 )
{
    if ( isdefined( self._id_134B ) )
        maps\_utility::_id_13A4( var_0 );
    else
        self._id_2687 = var_0;
}

_id_6BDF( var_0 )
{
    self endon( "death" );
    self._id_6BD9 = var_0;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        self._id_20AF = self._id_6BD9;
        self.accuracy = self._id_6BD9;
    }
}

_id_6BE0()
{
    self notify( "end_detectable_on_bad_event" );
    self endon( "end_detectable_on_bad_event" );

    for (;;)
    {
        level waittill( "enemy_bad_event" );
        thread _id_6BE1();
    }
}

_id_6BE1()
{
    maps\warlord_utility::_id_6BA7( "ignoreme" );
    wait 10;
    maps\warlord_utility::_id_6BA5( "ignoreme" );
}

_id_6BE2()
{
    self.fovcosine = 0.5;
    self.fovcosinebusy = 0.1;
    self.favoriteenemy = undefined;
    self._id_0FA0 = 1;
    self._id_0F9F = 1;
    thread maps\_utility::_id_0D72( 0 );

    if ( self.type == "dog" )
        return;

    self.diequietly = 0;
    self clearenemy();
}

_id_6BE3( var_0 )
{
    self.fovcosine = 0.01;
    self.ignoreall = 0;
    self._id_0FA0 = undefined;
    self._id_0F9F = undefined;

    if ( isdefined( self._id_4285 ) )
        self.fixednode = self._id_4285;

    thread maps\_utility::_id_0D72( 1 );

    if ( self.type != "dog" )
    {
        self.diequietly = 0;

        if ( !isdefined( var_0 ) )
        {
            maps\_utility::_id_140C();
            maps\_stealth_shared_utilities::_id_41EF();
        }
    }
    else
    {
        self._id_23DB = undefined;
        self._id_206F = undefined;
    }

    if ( isdefined( var_0 ) )
        return;

    var_1 = level._id_0B6E._id_1124._id_426E[self._id_204F];

    if ( isdefined( var_1 ) )
        self getenemyinfo( var_1 );
}

_id_6BE4()
{
    self endon( "death" );

    if ( isdefined( self._id_0EF1 ) )
    {
        if ( self._id_0EF1 maps\_vehicle_aianim::_id_2567( self._id_2252, "passenger_and_driver" ) )
        {
            self._id_0EF1 notify( "unload_on_stealth_broken" );

            if ( isdefined( self._id_2252 ) )
                self waittill( "jumpedout" );
        }
    }
}

_id_6BE5()
{
    self endon( "death" );
    self endon( "pain_death" );
    wait 1;
    _id_6BE4();
}

_id_6BE6( var_0, var_1 )
{
    self endon( "death" );
    var_2 = maps\_stealth_utility::_id_4215();

    if ( common_scripts\utility::flag( var_2 ) )
        return;

    level endon( var_2 );
    self._id_2050 = 1;
    self.target = self._id_164F;

    if ( !isdefined( var_0 ) && isdefined( self._id_205B ) )
        var_0 = self._id_205B;

    if ( isdefined( var_0 ) )
        self._id_2069 = var_0;

    if ( isdefined( var_1 ) )
        self._id_206A = var_1;

    thread maps\_patrol::_id_204E();
}

_id_6BE7( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    _id_6BE4();

    if ( isdefined( self._id_2252 ) && self._id_2252 == 1 )
        return;

    maps\_stealth_shared_utilities::_id_4200( var_0 );
}

_id_6BE8()
{
    self endon( "death" );
    self waittill( "unload_on_stealth_broken" );

    if ( maps\_utility::_id_133C( "no_unload_zone" ) )
        maps\_utility::_id_13DB( "no_unload_zone" );

    self notify( "stealth_broken_unload" );
    self notify( "newpath" );
    self vehicle_setspeed( 0, 15 );
    wait 1;
    maps\_vehicle::_id_2514( "passenger_and_driver" );
}

_id_6BE9()
{
    thread _id_6BEA();
}

_id_6BEA()
{
    self endon( "death" );
    var_0 = maps\_stealth_utility::_id_4215();
    var_1 = maps\_stealth_utility::_id_4216();
    common_scripts\utility::flag_wait_either( var_0, var_1 );

    if ( maps\_utility::_id_133C( "_stealth_enabled" ) && maps\_utility::_id_1008( "_stealth_enabled" ) )
        self notify( "end_patrol" );
}
