// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

setoverkillpro()
{

}

unsetoverkillpro()
{

}

setempimmune()
{

}

unsetempimmune()
{

}

setautospot()
{
    autospotadswatcher();
    autospotdeathwatcher();
}

autospotdeathwatcher()
{
    self waittill( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    self autospotoverlayoff();
}

unsetautospot()
{
    self notify( "endAutoSpotAdsWatcher" );
    self autospotoverlayoff();
}

autospotadswatcher()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( self isusingturret() )
        {
            self autospotoverlayoff();
            continue;
        }

        var_1 = self playerads();

        if ( var_1 < 1 && var_0 )
        {
            var_0 = 0;
            self autospotoverlayoff();
        }

        if ( var_1 < 1 && !var_0 )
            continue;

        if ( var_1 == 1 && !var_0 )
        {
            var_0 = 1;
            self autospotoverlayon();
        }
    }
}

setregenspeed()
{

}

unsetregenspeed()
{

}

sethardshell()
{
    self.shellshockreduction = 0.25;
}

unsethardshell()
{
    self.shellshockreduction = 0;
}

setsharpfocus()
{
    self setviewkickscale( 0.5 );
}

unsetsharpfocus()
{
    self setviewkickscale( 1 );
}

setdoubleload()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endDoubleLoad" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self getweaponslist( "primary" );

        foreach ( var_2 in var_0 )
        {
            var_3 = self getweaponammoclip( var_2 );
            var_4 = weaponclipsize( var_2 );
            var_5 = var_4 - var_3;
            var_6 = self getweaponammostock( var_2 );

            if ( var_3 != var_4 && var_6 > 0 )
            {
                if ( var_3 + var_6 >= var_4 )
                {
                    self setweaponammoclip( var_2, var_4 );
                    self setweaponammostock( var_2, var_6 - var_5 );
                    continue;
                }

                self setweaponammoclip( var_2, var_3 + var_6 );

                if ( var_6 - var_5 > 0 )
                {
                    self setweaponammostock( var_2, var_6 - var_5 );
                    continue;
                }

                self setweaponammostock( var_2, 0 );
            }
        }
    }
}

unsetdoubleload()
{
    self notify( "endDoubleLoad" );
}

setmarksman()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::setrecoilscale( 10 );
    self.recoilscale = 10;
}

unsetmarksman()
{
    maps\mp\_utility::setrecoilscale( 0 );
    self.recoilscale = 0;
}

setstunresistance()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.stunscaler = 0.5;
}

unsetstunresistance()
{
    self.stunscaler = 1;
}

setsteadyaimpro()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self setaimspreadmovementscale( 0.5 );
}

unsetsteadyaimpro()
{
    self notify( "end_SteadyAimPro" );
    self setaimspreadmovementscale( 1.0 );
}

blastshieldusetracker( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "end_perkUseTracker" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "empty_offhand" );

        if ( !common_scripts\utility::isoffhandweaponenabled() )
            continue;

        self [[ var_1 ]]( maps\mp\_utility::_hasperk( "_specialty_blastshield" ) );
    }
}

perkusedeathtracker()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self._useperkenabled = undefined;
}

setrearview()
{

}

unsetrearview()
{
    self notify( "end_perkUseTracker" );
}

setendgame()
{
    if ( isdefined( self.endgame ) )
        return;

    self.maxhealth = maps\mp\gametypes\_tweakables::gettweakablevalue( "player", "maxhealth" ) * 4;
    self.health = self.maxhealth;
    self.endgame = 1;
    self.attackertable[0] = "";
    self visionsetnakedforplayer( "end_game", 5 );
    thread endgamedeath( 7 );
    self.hasdonecombat = 1;
}

unsetendgame()
{
    self notify( "stopEndGame" );
    self.endgame = undefined;
    revertvisionset();

    if ( !isdefined( self.endgametimer ) )
        return;

    self.endgametimer maps\mp\gametypes\_hud_util::destroyelem();
    self.endgameicon maps\mp\gametypes\_hud_util::destroyelem();
}

revertvisionset()
{
    if ( isdefined( level.nukedetonated ) )
        self visionsetnakedforplayer( level.nukevisionset, 1 );
    else
        self visionsetnakedforplayer( "", 1 );
}

endgamedeath( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self endon( "stopEndGame" );
    wait(var_0 + 1);
    maps\mp\_utility::_suicide();
}

setsiege()
{
    thread tracksiegeenable();
    thread tracksiegedissable();
}

tracksiegeenable()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_trackSiege" );

    for (;;)
    {
        self waittill( "gambit_on" );
        self.movespeedscaler = 0;
        maps\mp\gametypes\_weapons::updatemovespeedscale();
        var_0 = weaponclass( self getcurrentweapon() );

        if ( var_0 == "pistol" || var_0 == "smg" )
            self setspreadoverride( 1 );
        else
            self setspreadoverride( 2 );

        self player_recoilscaleon( 0 );
        self allowjump( 0 );
    }
}

tracksiegedissable()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_trackSiege" );

    for (;;)
    {
        self waittill( "gambit_off" );
        unsetsiege();
    }
}

stancestatelistener()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notifyonplayercommand( "adjustedStance", "+stance" );

    for (;;)
    {
        self waittill( "adjustedStance" );

        if ( self.movespeedscaler != 0 )
            continue;

        unsetsiege();
    }
}

jumpstatelistener()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notifyonplayercommand( "jumped", "+goStand" );

    for (;;)
    {
        self waittill( "jumped" );

        if ( self.movespeedscaler != 0 )
            continue;

        unsetsiege();
    }
}

unsetsiege()
{
    self.movespeedscaler = 1;
    self resetspreadoverride();
    maps\mp\gametypes\_weapons::updatemovespeedscale();
    self player_recoilscaleoff();
    self allowjump( 1 );
}

setchallenger()
{
    if ( !level.hardcoremode )
    {
        self.maxhealth = maps\mp\gametypes\_tweakables::gettweakablevalue( "player", "maxhealth" );

        if ( isdefined( self.xpscaler ) && self.xpscaler == 1 && self.maxhealth > 30 )
            self.xpscaler = 2;
    }
}

unsetchallenger()
{
    self.xpscaler = 1;
}

setsaboteur()
{
    self.objectivescaler = 1.2;
}

unsetsaboteur()
{
    self.objectivescaler = 1;
}

setlightweight()
{
    self.movespeedscaler = maps\mp\_utility::lightweightscalar();
    maps\mp\gametypes\_weapons::updatemovespeedscale();
}

unsetlightweight()
{
    self.movespeedscaler = 1;
    maps\mp\gametypes\_weapons::updatemovespeedscale();
}

setblackbox()
{
    self.killstreakscaler = 1.5;
}

unsetblackbox()
{
    self.killstreakscaler = 1;
}

setsteelnerves()
{
    maps\mp\_utility::giveperk( "specialty_bulletaccuracy", 1 );
    maps\mp\_utility::giveperk( "specialty_holdbreath", 0 );
}

unsetsteelnerves()
{
    maps\mp\_utility::_unsetperk( "specialty_bulletaccuracy" );
    maps\mp\_utility::_unsetperk( "specialty_holdbreath" );
}

setdelaymine()
{

}

unsetdelaymine()
{

}

setbackshield()
{
    self attachshieldmodel( "weapon_riot_shield_mp", "tag_shield_back" );
}

unsetbackshield()
{
    self detachshieldmodel( "weapon_riot_shield_mp", "tag_shield_back" );
}

setlocaljammer()
{
    if ( !maps\mp\_utility::isemped() )
        self radarjamon();
}

unsetlocaljammer()
{
    self radarjamoff();
}

setac130()
{
    thread killstreakthink( "ac130", 7, "end_ac130Think" );
}

unsetac130()
{
    self notify( "end_ac130Think" );
}

setsentryminigun()
{
    thread killstreakthink( "airdrop_sentry_minigun", 2, "end_sentry_minigunThink" );
}

unsetsentryminigun()
{
    self notify( "end_sentry_minigunThink" );
}

settank()
{
    thread killstreakthink( "tank", 6, "end_tankThink" );
}

unsettank()
{
    self notify( "end_tankThink" );
}

setprecision_airstrike()
{
    thread killstreakthink( "precision_airstrike", 6, "end_precision_airstrike" );
}

unsetprecision_airstrike()
{
    self notify( "end_precision_airstrike" );
}

setpredatormissile()
{
    thread killstreakthink( "predator_missile", 4, "end_predator_missileThink" );
}

unsetpredatormissile()
{
    self notify( "end_predator_missileThink" );
}

sethelicopterminigun()
{
    thread killstreakthink( "helicopter_minigun", 5, "end_helicopter_minigunThink" );
}

unsethelicopterminigun()
{
    self notify( "end_helicopter_minigunThink" );
}

killstreakthink( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( var_2 );

    for (;;)
    {
        self waittill( "killed_enemy" );

        if ( self.pers["cur_kill_streak"] != var_1 )
            continue;

        thread maps\mp\killstreaks\_killstreaks::givekillstreak( var_0 );
        thread maps\mp\gametypes\_hud_message::killstreaksplashnotify( var_0, var_1 );
        return;
    }
}

setthermal()
{
    self thermalvisionon();
}

unsetthermal()
{
    self thermalvisionoff();
}

setonemanarmy()
{
    thread onemanarmyweaponchangetracker();
}

unsetonemanarmy()
{
    self notify( "stop_oneManArmyTracker" );
}

onemanarmyweaponchangetracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stop_oneManArmyTracker" );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 != "onemanarmy_mp" )
            continue;

        thread selectonemanarmyclass();
    }
}

isonemanarmymenu( var_0 )
{
    if ( var_0 == game["menu_onemanarmy"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_defaults_splitscreen"] ) && var_0 == game["menu_onemanarmy_defaults_splitscreen"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_custom_splitscreen"] ) && var_0 == game["menu_onemanarmy_custom_splitscreen"] )
        return 1;

    return 0;
}

selectonemanarmyclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    common_scripts\utility::_disableweaponswitch();
    common_scripts\utility::_disableoffhandweapons();
    common_scripts\utility::_disableusability();
    self openpopupmenu( game["menu_onemanarmy"] );
    thread closeomamenuondeath();
    self waittill( "menuresponse", var_0, var_1 );
    common_scripts\utility::_enableweaponswitch();
    common_scripts\utility::_enableoffhandweapons();
    common_scripts\utility::_enableusability();

    if ( var_1 == "back" || !isonemanarmymenu( var_0 ) || maps\mp\_utility::isusingremote() )
    {
        if ( self getcurrentweapon() == "onemanarmy_mp" )
        {
            common_scripts\utility::_disableweaponswitch();
            common_scripts\utility::_disableoffhandweapons();
            common_scripts\utility::_disableusability();
            self switchtoweapon( common_scripts\utility::getlastweapon() );
            self waittill( "weapon_change" );
            common_scripts\utility::_enableweaponswitch();
            common_scripts\utility::_enableoffhandweapons();
            common_scripts\utility::_enableusability();
        }

        return;
    }

    thread giveonemanarmyclass( var_1 );
}

closeomamenuondeath()
{
    self endon( "menuresponse" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    common_scripts\utility::_enableweaponswitch();
    common_scripts\utility::_enableoffhandweapons();
    common_scripts\utility::_enableusability();
    self closepopupmenu();
}

giveonemanarmyclass( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( maps\mp\_utility::_hasperk( "specialty_omaquickchange" ) )
    {
        var_1 = 3.0;
        self playlocalsound( "foly_onemanarmy_bag3_plr" );
        self playsoundtoteam( "foly_onemanarmy_bag3_npc", "allies", self );
        self playsoundtoteam( "foly_onemanarmy_bag3_npc", "axis", self );
    }
    else
    {
        var_1 = 6.0;
        self playlocalsound( "foly_onemanarmy_bag6_plr" );
        self playsoundtoteam( "foly_onemanarmy_bag6_npc", "allies", self );
        self playsoundtoteam( "foly_onemanarmy_bag6_npc", "axis", self );
    }

    thread omausebar( var_1 );
    common_scripts\utility::_disableweapon();
    common_scripts\utility::_disableoffhandweapons();
    common_scripts\utility::_disableusability();
    wait(var_1);
    common_scripts\utility::_enableweapon();
    common_scripts\utility::_enableoffhandweapons();
    common_scripts\utility::_enableusability();
    self.omaclasschanged = 1;
    maps\mp\gametypes\_class::giveloadout( self.pers["team"], var_0, 0 );

    if ( isdefined( self.carryflag ) )
        self attach( self.carryflag, "J_spine4", 1 );

    self notify( "changed_kit" );
    level notify( "changed_kit" );
}

omausebar( var_0 )
{
    self endon( "disconnect" );
    var_1 = maps\mp\gametypes\_hud_util::createprimaryprogressbar( 0, -25 );
    var_2 = maps\mp\gametypes\_hud_util::createprimaryprogressbartext( 0, -25 );
    var_2 settext( &"MPUI_CHANGING_KIT" );
    var_1 maps\mp\gametypes\_hud_util::updatebar( 0, 1 / var_0 );

    for ( var_3 = 0; var_3 < var_0 && isalive( self ) && !level.gameended; var_3 += 0.05 )
        wait 0.05;

    var_1 maps\mp\gametypes\_hud_util::destroyelem();
    var_2 maps\mp\gametypes\_hud_util::destroyelem();
}

setblastshield()
{
    self setweaponhudiconoverride( "primaryoffhand", "specialty_blastshield" );
}

unsetblastshield()
{
    self setweaponhudiconoverride( "primaryoffhand", "none" );
}

setfreefall()
{

}

unsetfreefall()
{

}

settacticalinsertion()
{
    self setoffhandsecondaryclass( "flash" );
    maps\mp\_utility::_giveweapon( "flare_mp", 0 );
    self givestartammo( "flare_mp" );
    thread monitortiuse();
}

unsettacticalinsertion()
{
    self notify( "end_monitorTIUse" );
}

clearprevioustispawnpoint()
{
    common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );

    if ( isdefined( self.setspawnpoint ) )
        deleteti( self.setspawnpoint );
}

updatetispawnposition()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "end_monitorTIUse" );

    while ( maps\mp\_utility::isreallyalive( self ) )
    {
        if ( isvalidtispawnposition() )
            self.tispawnposition = self.origin;

        wait 0.05;
    }
}

isvalidtispawnposition()
{
    if ( canspawn( self.origin ) && self isonground() )
        return 1;
    else
        return 0;
}

monitortiuse()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "end_monitorTIUse" );
    thread updatetispawnposition();
    thread clearprevioustispawnpoint();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 != "flare_mp" )
            continue;

        if ( isdefined( self.setspawnpoint ) )
            deleteti( self.setspawnpoint );

        if ( !isdefined( self.tispawnposition ) )
            continue;

        if ( maps\mp\_utility::touchingbadtrigger() )
            continue;

        var_2 = playerphysicstrace( self.tispawnposition + ( 0.0, 0.0, 16.0 ), self.tispawnposition - ( 0.0, 0.0, 2048.0 ) ) + ( 0.0, 0.0, 1.0 );
        var_3 = spawn( "script_model", var_2 );
        var_3.angles = self.angles;
        var_3.team = self.team;
        var_3.owner = self;
        var_3.enemytrigger = spawn( "script_origin", var_2 );
        var_3 thread glowsticksetupandwaitfordeath( self );
        var_3.playerspawnpos = self.tispawnposition;
        var_3 thread maps\mp\gametypes\_weapons::createbombsquadmodel( "weapon_light_stick_tactical_bombsquad", "tag_fire_fx", level.otherteam[self.team], self );
        self.setspawnpoint = var_3;
        return;
    }
}

glowsticksetupandwaitfordeath( var_0 )
{
    self setmodel( level.precachemodel["enemy"] );

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( self.team, ( 0.0, 0.0, 20.0 ) );
    else
        maps\mp\_entityheadicons::setplayerheadicon( var_0, ( 0.0, 0.0, 20.0 ) );

    thread glowstickdamagelistener( var_0 );
    thread glowstickenemyuselistener( var_0 );
    thread glowstickuselistener( var_0 );
    thread glowstickteamupdater( level.otherteam[self.team], level.spawnglow["enemy"], var_0 );
    var_1 = spawn( "script_model", self.origin + ( 0.0, 0.0, 0.0 ) );
    var_1.angles = self.angles;
    var_1 setmodel( level.precachemodel["friendly"] );
    var_1 setcontents( 0 );
    var_1 thread glowstickteamupdater( self.team, level.spawnglow["friendly"], var_0 );
    var_1 playloopsound( "emt_road_flare_burn" );
    self waittill( "death" );
    var_1 stoploopsound();
    var_1 delete();
}

glowstickteamupdater( var_0, var_1, var_2 )
{
    self endon( "death" );
    wait 0.05;
    var_3 = self gettagangles( "tag_fire_fx" );
    var_4 = spawnfx( var_1, self gettagorigin( "tag_fire_fx" ), anglestoforward( var_3 ), anglestoup( var_3 ) );
    triggerfx( var_4 );
    thread deleteondeath( var_4 );

    for (;;)
    {
        self hide();
        var_4 hide();

        foreach ( var_6 in level.players )
        {
            if ( var_6.team == var_0 && level.teambased )
            {
                self showtoplayer( var_6 );
                var_4 showtoplayer( var_6 );
                continue;
            }

            if ( !level.teambased && var_6 == var_2 && var_1 == level.spawnglow["friendly"] )
            {
                self showtoplayer( var_6 );
                var_4 showtoplayer( var_6 );
                continue;
            }

            if ( !level.teambased && var_6 != var_2 && var_1 == level.spawnglow["enemy"] )
            {
                self showtoplayer( var_6 );
                var_4 showtoplayer( var_6 );
            }
        }

        level common_scripts\utility::waittill_either( "joined_team", "player_spawned" );
    }
}

deleteondeath( var_0 )
{
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

glowstickdamagelistener( var_0 )
{
    self endon( "death" );
    self setcandamage( 1 );
    self.health = 999999;
    self.maxhealth = 100;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
        {
            switch ( var_10 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( var_5 == "MOD_MELEE" )
            self.damagetaken += self.maxhealth;

        if ( isdefined( var_9 ) && var_9 & level.idflags_penetration )
            self.wasdamagedfrombulletpenetration = 1;

        self.wasdamaged = 1;
        self.damagetaken += var_1;

        if ( isplayer( var_2 ) )
            var_2 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "tactical_insertion" );

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
            {
                var_2 notify( "destroyed_insertion", var_0 );
                var_2 notify( "destroyed_explosive" );
                var_0 thread maps\mp\_utility::leaderdialogonplayer( "ti_destroyed" );
            }

            var_2 thread deleteti( self );
        }
    }
}

glowstickuselistener( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"MP_PATCH_PICKUP_TI" );
    thread updateenemyuse( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_1 playsound( "chemlight_pu" );
        var_1 thread settacticalinsertion();
        var_1 thread deleteti( self );
    }
}

updateenemyuse( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        maps\mp\_utility::setselfusable( var_0 );
        level common_scripts\utility::waittill_either( "joined_team", "player_spawned" );
    }
}

deleteti( var_0 )
{
    if ( isdefined( var_0.enemytrigger ) )
        var_0.enemytrigger delete();

    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_0 delete();
    var_3 = spawn( "script_model", var_1 );
    var_3.angles = var_2;
    var_3 setmodel( level.precachemodel["friendly"] );
    var_3 setcontents( 0 );
    thread dummyglowstickdelete( var_3 );
}

dummyglowstickdelete( var_0 )
{
    wait 2.5;
    var_0 delete();
}

glowstickenemyuselistener( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self.enemytrigger setcursorhint( "HINT_NOICON" );
    self.enemytrigger sethintstring( &"MP_PATCH_DESTROY_TI" );
    self.enemytrigger maps\mp\_utility::makeenemyusable( var_0 );

    for (;;)
    {
        self.enemytrigger waittill( "trigger", var_1 );
        var_1 notify( "destroyed_insertion", var_0 );
        var_1 notify( "destroyed_explosive" );

        if ( isdefined( var_0 ) && var_1 != var_0 )
            var_0 thread maps\mp\_utility::leaderdialogonplayer( "ti_destroyed" );

        var_1 thread deleteti( self );
    }
}

setlittlebirdsupport()
{
    thread killstreakthink( "littlebird_support", 2, "end_littlebird_support_think" );
}

unsetlittlebirdsupport()
{
    self notify( "end_littlebird_support_think" );
}

setpainted()
{
    if ( isplayer( self ) )
    {
        var_0 = 10.0;

        if ( maps\mp\_utility::_hasperk( "specialty_quieter" ) )
            var_0 *= 0.5;

        self.painted = 1;
        self setperk( "specialty_radararrow", 1, 0 );
        thread unsetpainted( var_0 );
        thread watchpainteddeath();
    }
}

watchpainteddeath()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    self.painted = 0;
}

unsetpainted( var_0 )
{
    self notify( "painted_again" );
    self endon( "painted_again" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self.painted = 0;
    self unsetperk( "specialty_radararrow", 1 );
}

ispainted()
{
    return isdefined( self.painted ) && self.painted;
}

setfinalstand()
{
    maps\mp\_utility::giveperk( "specialty_pistoldeath", 0 );
}

unsetfinalstand()
{
    maps\mp\_utility::_unsetperk( "specialty_pistoldeath" );
}

setcarepackage()
{
    thread maps\mp\killstreaks\_killstreaks::givekillstreak( "airdrop_assault", 0, 0, self, 1 );
}

unsetcarepackage()
{

}

setuav()
{
    thread maps\mp\killstreaks\_killstreaks::givekillstreak( "uav", 0, 0, self, 1 );
}

unsetuav()
{

}

setstoppingpower()
{
    maps\mp\_utility::giveperk( "specialty_bulletdamage", 0 );
    thread watchstoppingpowerkill();
}

watchstoppingpowerkill()
{
    self notify( "watchStoppingPowerKill" );
    self endon( "watchStoppingPowerKill" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "killed_enemy" );
    unsetstoppingpower();
}

unsetstoppingpower()
{
    maps\mp\_utility::_unsetperk( "specialty_bulletdamage" );
    self notify( "watchStoppingPowerKill" );
}

setc4death()
{
    if ( !maps\mp\_utility::_hasperk( "specialty_pistoldeath" ) )
        maps\mp\_utility::giveperk( "specialty_pistoldeath", 0 );
}

unsetc4death()
{
    if ( maps\mp\_utility::_hasperk( "specialty_pistoldeath" ) )
        maps\mp\_utility::_unsetperk( "specialty_pistoldeath" );
}

setjuiced()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    level endon( "end_game" );
    self.isjuiced = 1;
    self.movespeedscaler = 1.25;
    maps\mp\gametypes\_weapons::updatemovespeedscale();

    if ( level.splitscreen )
    {
        var_0 = 56;
        var_1 = 21;
    }
    else
    {
        var_0 = 80;
        var_1 = 32;
    }

    self.juicedtimer = maps\mp\gametypes\_hud_util::createtimer( "hudsmall", 1.0 );
    self.juicedtimer maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, var_0 );
    self.juicedtimer settimer( 7.0 );
    self.juicedtimer.color = ( 0.8, 0.8, 0.0 );
    self.juicedtimer.archived = 0;
    self.juicedtimer.foreground = 1;
    self.juicedicon = maps\mp\gametypes\_hud_util::createicon( "specialty_juiced", var_1, var_1 );
    self.juicedicon.alpha = 0;
    self.juicedicon maps\mp\gametypes\_hud_util::setparent( self.juicedtimer );
    self.juicedicon maps\mp\gametypes\_hud_util::setpoint( "BOTTOM", "TOP" );
    self.juicedicon.archived = 1;
    self.juicedicon.sort = 1;
    self.juicedicon.foreground = 1;
    self.juicedicon fadeovertime( 1.0 );
    self.juicedicon.alpha = 0.85;
    thread unsetjuicedondeath();
    thread unsetjuicedonride();
    wait 5;

    if ( isdefined( self.juicedicon ) )
    {
        self.juicedicon fadeovertime( 2.0 );
        self.juicedicon.alpha = 0.0;
    }

    if ( isdefined( self.juicedtimer ) )
    {
        self.juicedtimer fadeovertime( 2.0 );
        self.juicedtimer.alpha = 0.0;
    }

    wait 2;
    unsetjuiced();
}

unsetjuiced( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( maps\mp\_utility::isjuggernaut() )
            self.movespeedscaler = self.juggmovespeedscaler;
        else
        {
            self.movespeedscaler = 1;

            if ( maps\mp\_utility::_hasperk( "specialty_lightweight" ) )
                self.movespeedscaler = maps\mp\_utility::lightweightscalar();
        }

        maps\mp\gametypes\_weapons::updatemovespeedscale();
    }

    if ( isdefined( self.juicedicon ) )
        self.juicedicon destroy();

    if ( isdefined( self.juicedtimer ) )
        self.juicedtimer destroy();

    self.isjuiced = undefined;
    self notify( "unset_juiced" );
}

unsetjuicedonride()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );

    for (;;)
    {
        wait 0.05;

        if ( maps\mp\_utility::isusingremote() )
        {
            thread unsetjuiced();
            break;
        }
    }
}

unsetjuicedondeath()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    common_scripts\utility::waittill_any( "death", "faux_spawn" );
    thread unsetjuiced( 1 );
}

setcombathigh()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unset_combathigh" );
    level endon( "end_game" );
    self.damageblockedtotal = 0;

    if ( level.splitscreen )
    {
        var_0 = 56;
        var_1 = 21;
    }
    else
    {
        var_0 = 112;
        var_1 = 32;
    }

    if ( isdefined( self.juicedtimer ) )
        self.juicedtimer destroy();

    if ( isdefined( self.juicedicon ) )
        self.juicedicon destroy();

    self.combathighoverlay = newclienthudelem( self );
    self.combathighoverlay.x = 0;
    self.combathighoverlay.y = 0;
    self.combathighoverlay.alignx = "left";
    self.combathighoverlay.aligny = "top";
    self.combathighoverlay.horzalign = "fullscreen";
    self.combathighoverlay.vertalign = "fullscreen";
    self.combathighoverlay setshader( "combathigh_overlay", 640, 480 );
    self.combathighoverlay.sort = -10;
    self.combathighoverlay.archived = 1;
    self.combathightimer = maps\mp\gametypes\_hud_util::createtimer( "hudsmall", 1.0 );
    self.combathightimer maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, var_0 );
    self.combathightimer settimer( 10.0 );
    self.combathightimer.color = ( 0.8, 0.8, 0.0 );
    self.combathightimer.archived = 0;
    self.combathightimer.foreground = 1;
    self.combathighicon = maps\mp\gametypes\_hud_util::createicon( "specialty_painkiller", var_1, var_1 );
    self.combathighicon.alpha = 0;
    self.combathighicon maps\mp\gametypes\_hud_util::setparent( self.combathightimer );
    self.combathighicon maps\mp\gametypes\_hud_util::setpoint( "BOTTOM", "TOP" );
    self.combathighicon.archived = 1;
    self.combathighicon.sort = 1;
    self.combathighicon.foreground = 1;
    self.combathighoverlay.alpha = 0.0;
    self.combathighoverlay fadeovertime( 1.0 );
    self.combathighicon fadeovertime( 1.0 );
    self.combathighoverlay.alpha = 1.0;
    self.combathighicon.alpha = 0.85;
    thread unsetcombathighondeath();
    thread unsetcombathighonride();
    wait 8;
    self.combathighicon fadeovertime( 2.0 );
    self.combathighicon.alpha = 0.0;
    self.combathighoverlay fadeovertime( 2.0 );
    self.combathighoverlay.alpha = 0.0;
    self.combathightimer fadeovertime( 2.0 );
    self.combathightimer.alpha = 0.0;
    wait 2;
    self.damageblockedtotal = undefined;
    maps\mp\_utility::_unsetperk( "specialty_combathigh" );
}

unsetcombathighondeath()
{
    self endon( "disconnect" );
    self endon( "unset_combathigh" );
    self waittill( "death" );
    thread maps\mp\_utility::_unsetperk( "specialty_combathigh" );
}

unsetcombathighonride()
{
    self endon( "disconnect" );
    self endon( "unset_combathigh" );

    for (;;)
    {
        wait 0.05;

        if ( maps\mp\_utility::isusingremote() )
        {
            thread maps\mp\_utility::_unsetperk( "specialty_combathigh" );
            break;
        }
    }
}

unsetcombathigh()
{
    self notify( "unset_combathigh" );
    self.combathighoverlay destroy();
    self.combathighicon destroy();
    self.combathightimer destroy();
}

setlightarmor()
{
    thread givelightarmor();
}

givelightarmor()
{
    self notify( "give_light_armor" );
    self endon( "give_light_armor" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "end_game" );

    if ( isdefined( self.haslightarmor ) && self.haslightarmor == 1 )
        removelightarmor( self.previousmaxhealth );

    var_0 = 200;
    thread removelightarmorondeath();
    self.haslightarmor = 1;
    self.combathighoverlay = newclienthudelem( self );
    self.combathighoverlay.x = 0;
    self.combathighoverlay.y = 0;
    self.combathighoverlay.alignx = "left";
    self.combathighoverlay.aligny = "top";
    self.combathighoverlay.horzalign = "fullscreen";
    self.combathighoverlay.vertalign = "fullscreen";
    self.combathighoverlay setshader( "combathigh_overlay", 640, 480 );
    self.combathighoverlay.sort = -10;
    self.combathighoverlay.archived = 1;
    self.previousmaxhealth = self.maxhealth;
    self.maxhealth = var_0;
    self.health = self.maxhealth;
    var_1 = 50;
    var_2 = self.health;

    for (;;)
    {
        if ( self.maxhealth != var_0 )
        {
            removelightarmor();
            break;
        }

        if ( self.health < 100 )
        {
            removelightarmor( self.previousmaxhealth );
            break;
        }

        if ( self.health < var_2 )
        {
            var_1 -= ( var_2 - self.health );
            var_2 = self.health;

            if ( var_1 <= 0 )
            {
                removelightarmor( self.previousmaxhealth );
                break;
            }
        }

        wait 0.5;
    }
}

removelightarmorondeath()
{
    self endon( "disconnect" );
    self endon( "give_light_armor" );
    self endon( "remove_light_armor" );
    self waittill( "death" );
    removelightarmor();
}

removelightarmor( var_0 )
{
    if ( isdefined( var_0 ) )
        self.maxhealth = var_0;

    if ( isdefined( self.combathighoverlay ) )
        self.combathighoverlay destroy();

    self.haslightarmor = undefined;
    self notify( "remove_light_armor" );
}

unsetlightarmor()
{
    thread removelightarmor( self.previousmaxhealth );
}

setrevenge()
{
    self notify( "stopRevenge" );
    wait 0.05;

    if ( !isdefined( self.lastkilledby ) )
        return;

    if ( level.teambased && self.team == self.lastkilledby.team )
        return;

    var_0 = spawnstruct();
    var_0.showto = self;
    var_0.icon = "compassping_revenge";
    var_0.offset = ( 0.0, 0.0, 64.0 );
    var_0.width = 10;
    var_0.height = 10;
    var_0.archived = 0;
    var_0.delay = 1.5;
    var_0.constantsize = 0;
    var_0.pintoscreenedge = 1;
    var_0.fadeoutpinnedicon = 0;
    var_0.is3d = 0;
    self.revengeparams = var_0;
    self.lastkilledby maps\mp\_entityheadicons::setheadicon( var_0.showto, var_0.icon, var_0.offset, var_0.width, var_0.height, var_0.archived, var_0.delay, var_0.constantsize, var_0.pintoscreenedge, var_0.fadeoutpinnedicon, var_0.is3d );
    thread watchrevengedeath();
    thread watchrevengekill();
    thread watchrevengedisconnected();
    thread watchrevengevictimdisconnected();
    thread watchstoprevenge();
}

watchrevengedeath()
{
    self endon( "stopRevenge" );
    self endon( "disconnect" );
    var_0 = self.lastkilledby;

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        var_0 maps\mp\_entityheadicons::setheadicon( self.revengeparams.showto, self.revengeparams.icon, self.revengeparams.offset, self.revengeparams.width, self.revengeparams.height, self.revengeparams.archived, self.revengeparams.delay, self.revengeparams.constantsize, self.revengeparams.pintoscreenedge, self.revengeparams.fadeoutpinnedicon, self.revengeparams.is3d );
    }
}

watchrevengekill()
{
    self endon( "stopRevenge" );
    self waittill( "killed_enemy" );
    self notify( "stopRevenge" );
}

watchrevengedisconnected()
{
    self endon( "stopRevenge" );
    self.lastkilledby waittill( "disconnect" );
    self notify( "stopRevenge" );
}

watchstoprevenge()
{
    var_0 = self.lastkilledby;
    self waittill( "stopRevenge" );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_3, var_2 in var_0.entityheadicons )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2 destroy();
    }
}

watchrevengevictimdisconnected()
{
    var_0 = self.objidfriendly;
    var_1 = self.lastkilledby;
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stopRevenge" );
    self waittill( "disconnect" );

    if ( !isdefined( var_1 ) )
        return;

    foreach ( var_4, var_3 in var_1.entityheadicons )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_3 destroy();
    }
}

unsetrevenge()
{
    self notify( "stopRevenge" );
}
