// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.perkfuncs = [];
    precacheshader( "combathigh_overlay" );
    precacheshader( "specialty_juiced" );
    precacheshader( "compassping_revenge" );
    precacheshader( "specialty_c4death" );
    precacheshader( "specialty_finalstand" );
    precachemodel( "weapon_riot_shield_mp" );
    precachemodel( "viewmodel_riot_shield_mp" );
    precachestring( &"MPUI_CHANGING_KIT" );
    level.precachemodel["enemy"] = "mil_emergency_flare_mp";
    level.precachemodel["friendly"] = "mil_emergency_flare_mp";
    level.spawnglow["enemy"] = loadfx( "misc/flare_ambient" );
    level.spawnglow["friendly"] = loadfx( "misc/flare_ambient_green" );
    level.c4death = loadfx( "explosions/javelin_explosion" );
    level.spawnfire = loadfx( "props/barrelexp" );
    precachemodel( level.precachemodel["friendly"] );
    precachemodel( level.precachemodel["enemy"] );
    precachestring( &"MP_DESTROY_TI" );
    precacheshaders();
    level._effect["ricochet"] = loadfx( "impacts/large_metalhit_1" );
    level.scriptperks = [];
    level.perksetfuncs = [];
    level.perkunsetfuncs = [];
    level.fauxperks = [];
    level.scriptperks["specialty_blastshield"] = 1;
    level.scriptperks["_specialty_blastshield"] = 1;
    level.scriptperks["specialty_akimbo"] = 1;
    level.scriptperks["specialty_siege"] = 1;
    level.scriptperks["specialty_falldamage"] = 1;
    level.scriptperks["specialty_shield"] = 1;
    level.scriptperks["specialty_feigndeath"] = 1;
    level.scriptperks["specialty_shellshock"] = 1;
    level.scriptperks["specialty_delaymine"] = 1;
    level.scriptperks["specialty_localjammer"] = 1;
    level.scriptperks["specialty_thermal"] = 1;
    level.scriptperks["specialty_blackbox"] = 1;
    level.scriptperks["specialty_steelnerves"] = 1;
    level.scriptperks["specialty_flashgrenade"] = 1;
    level.scriptperks["specialty_smokegrenade"] = 1;
    level.scriptperks["specialty_concussiongrenade"] = 1;
    level.scriptperks["specialty_challenger"] = 1;
    level.scriptperks["specialty_saboteur"] = 1;
    level.scriptperks["specialty_endgame"] = 1;
    level.scriptperks["specialty_rearview"] = 1;
    level.scriptperks["specialty_hardline"] = 1;
    level.scriptperks["specialty_ac130"] = 1;
    level.scriptperks["specialty_sentry_minigun"] = 1;
    level.scriptperks["specialty_predator_missile"] = 1;
    level.scriptperks["specialty_helicopter_minigun"] = 1;
    level.scriptperks["specialty_tank"] = 1;
    level.scriptperks["specialty_precision_airstrike"] = 1;
    level.scriptperks["specialty_onemanarmy"] = 1;
    level.scriptperks["specialty_littlebird_support"] = 1;
    level.scriptperks["specialty_primarydeath"] = 1;
    level.scriptperks["specialty_secondarybling"] = 1;
    level.scriptperks["specialty_explosivedamage"] = 1;
    level.scriptperks["specialty_laststandoffhand"] = 1;
    level.scriptperks["specialty_dangerclose"] = 1;
    level.scriptperks["specialty_luckycharm"] = 1;
    level.scriptperks["specialty_hardjack"] = 1;
    level.scriptperks["specialty_extraspecialduration"] = 1;
    level.scriptperks["specialty_rollover"] = 1;
    level.scriptperks["specialty_armorpiercing"] = 1;
    level.scriptperks["specialty_omaquickchange"] = 1;
    level.scriptperks["_specialty_rearview"] = 1;
    level.scriptperks["_specialty_onemanarmy"] = 1;
    level.scriptperks["specialty_steadyaimpro"] = 1;
    level.scriptperks["specialty_stun_resistance"] = 1;
    level.scriptperks["specialty_double_load"] = 1;
    level.scriptperks["specialty_hard_shell"] = 1;
    level.scriptperks["specialty_regenspeed"] = 1;
    level.scriptperks["specialty_twoprimaries"] = 1;
    level.scriptperks["specialty_autospot"] = 1;
    level.scriptperks["specialty_overkillpro"] = 1;
    level.scriptperks["specialty_anytwo"] = 1;
    level.scriptperks["specialty_assists"] = 1;
    level.scriptperks["specialty_fasterlockon"] = 1;
    level.scriptperks["specialty_paint"] = 1;
    level.scriptperks["specialty_paint_pro"] = 1;
    level.fauxperks["specialty_shield"] = 1;
    level.scriptperks["specialty_marksman"] = 1;
    level.scriptperks["specialty_sharp_focus"] = 1;
    level.scriptperks["specialty_bling"] = 1;
    level.scriptperks["specialty_moredamage"] = 1;
    level.scriptperks["specialty_copycat"] = 1;
    level.scriptperks["specialty_combathigh"] = 1;
    level.scriptperks["specialty_finalstand"] = 1;
    level.scriptperks["specialty_c4death"] = 1;
    level.scriptperks["specialty_juiced"] = 1;
    level.scriptperks["specialty_revenge"] = 1;
    level.scriptperks["specialty_light_armor"] = 1;
    level.scriptperks["specialty_carepackage"] = 1;
    level.scriptperks["specialty_stopping_power"] = 1;
    level.scriptperks["specialty_uav"] = 1;
    level.scriptperks["bouncingbetty_mp"] = 1;
    level.scriptperks["c4_mp"] = 1;
    level.scriptperks["claymore_mp"] = 1;
    level.scriptperks["frag_grenade_mp"] = 1;
    level.scriptperks["semtex_mp"] = 1;
    level.scriptperks["throwingknife_mp"] = 1;
    level.scriptperks["concussion_grenade_mp"] = 1;
    level.scriptperks["flash_grenade_mp"] = 1;
    level.scriptperks["smoke_grenade_mp"] = 1;
    level.scriptperks["specialty_portable_radar"] = 1;
    level.scriptperks["specialty_scrambler"] = 1;
    level.scriptperks["specialty_tacticalinsertion"] = 1;
    level.scriptperks["trophy_mp"] = 1;
    level.scriptperks["specialty_null"] = 1;
    level.perksetfuncs["specialty_blastshield"] = maps\mp\perks\_perkfunctions::setblastshield;
    level.perkunsetfuncs["specialty_blastshield"] = maps\mp\perks\_perkfunctions::unsetblastshield;
    level.perksetfuncs["specialty_siege"] = maps\mp\perks\_perkfunctions::setsiege;
    level.perkunsetfuncs["specialty_siege"] = maps\mp\perks\_perkfunctions::unsetsiege;
    level.perksetfuncs["specialty_falldamage"] = maps\mp\perks\_perkfunctions::setfreefall;
    level.perkunsetfuncs["specialty_falldamage"] = maps\mp\perks\_perkfunctions::unsetfreefall;
    level.perksetfuncs["specialty_localjammer"] = maps\mp\perks\_perkfunctions::setlocaljammer;
    level.perkunsetfuncs["specialty_localjammer"] = maps\mp\perks\_perkfunctions::unsetlocaljammer;
    level.perksetfuncs["specialty_thermal"] = maps\mp\perks\_perkfunctions::setthermal;
    level.perkunsetfuncs["specialty_thermal"] = maps\mp\perks\_perkfunctions::unsetthermal;
    level.perksetfuncs["specialty_blackbox"] = maps\mp\perks\_perkfunctions::setblackbox;
    level.perkunsetfuncs["specialty_blackbox"] = maps\mp\perks\_perkfunctions::unsetblackbox;
    level.perksetfuncs["specialty_lightweight"] = maps\mp\perks\_perkfunctions::setlightweight;
    level.perkunsetfuncs["specialty_lightweight"] = maps\mp\perks\_perkfunctions::unsetlightweight;
    level.perksetfuncs["specialty_steelnerves"] = maps\mp\perks\_perkfunctions::setsteelnerves;
    level.perkunsetfuncs["specialty_steelnerves"] = maps\mp\perks\_perkfunctions::unsetsteelnerves;
    level.perksetfuncs["specialty_delaymine"] = maps\mp\perks\_perkfunctions::setdelaymine;
    level.perkunsetfuncs["specialty_delaymine"] = maps\mp\perks\_perkfunctions::unsetdelaymine;
    level.perksetfuncs["specialty_challenger"] = maps\mp\perks\_perkfunctions::setchallenger;
    level.perkunsetfuncs["specialty_challenger"] = maps\mp\perks\_perkfunctions::unsetchallenger;
    level.perksetfuncs["specialty_saboteur"] = maps\mp\perks\_perkfunctions::setsaboteur;
    level.perkunsetfuncs["specialty_saboteur"] = maps\mp\perks\_perkfunctions::unsetsaboteur;
    level.perksetfuncs["specialty_endgame"] = maps\mp\perks\_perkfunctions::setendgame;
    level.perkunsetfuncs["specialty_endgame"] = maps\mp\perks\_perkfunctions::unsetendgame;
    level.perksetfuncs["specialty_rearview"] = maps\mp\perks\_perkfunctions::setrearview;
    level.perkunsetfuncs["specialty_rearview"] = maps\mp\perks\_perkfunctions::unsetrearview;
    level.perksetfuncs["specialty_ac130"] = maps\mp\perks\_perkfunctions::setac130;
    level.perkunsetfuncs["specialty_ac130"] = maps\mp\perks\_perkfunctions::unsetac130;
    level.perksetfuncs["specialty_sentry_minigun"] = maps\mp\perks\_perkfunctions::setsentryminigun;
    level.perkunsetfuncs["specialty_sentry_minigun"] = maps\mp\perks\_perkfunctions::unsetsentryminigun;
    level.perksetfuncs["specialty_predator_missile"] = maps\mp\perks\_perkfunctions::setpredatormissile;
    level.perkunsetfuncs["specialty_predator_missile"] = maps\mp\perks\_perkfunctions::unsetpredatormissile;
    level.perksetfuncs["specialty_tank"] = maps\mp\perks\_perkfunctions::settank;
    level.perkunsetfuncs["specialty_tank"] = maps\mp\perks\_perkfunctions::unsettank;
    level.perksetfuncs["specialty_precision_airstrike"] = maps\mp\perks\_perkfunctions::setprecision_airstrike;
    level.perkunsetfuncs["specialty_precision_airstrike"] = maps\mp\perks\_perkfunctions::unsetprecision_airstrike;
    level.perksetfuncs["specialty_helicopter_minigun"] = maps\mp\perks\_perkfunctions::sethelicopterminigun;
    level.perkunsetfuncs["specialty_helicopter_minigun"] = maps\mp\perks\_perkfunctions::unsethelicopterminigun;
    level.perksetfuncs["specialty_onemanarmy"] = maps\mp\perks\_perkfunctions::setonemanarmy;
    level.perkunsetfuncs["specialty_onemanarmy"] = maps\mp\perks\_perkfunctions::unsetonemanarmy;
    level.perksetfuncs["specialty_littlebird_support"] = maps\mp\perks\_perkfunctions::setlittlebirdsupport;
    level.perkunsetfuncs["specialty_littlebird_support"] = maps\mp\perks\_perkfunctions::unsetlittlebirdsupport;
    level.perksetfuncs["specialty_tacticalinsertion"] = maps\mp\perks\_perkfunctions::settacticalinsertion;
    level.perkunsetfuncs["specialty_tacticalinsertion"] = maps\mp\perks\_perkfunctions::unsettacticalinsertion;
    level.perksetfuncs["specialty_scrambler"] = maps\mp\gametypes\_scrambler::setscrambler;
    level.perkunsetfuncs["specialty_scrambler"] = maps\mp\gametypes\_scrambler::unsetscrambler;
    level.perksetfuncs["specialty_portable_radar"] = maps\mp\gametypes\_portable_radar::setportableradar;
    level.perkunsetfuncs["specialty_portable_radar"] = maps\mp\gametypes\_portable_radar::unsetportableradar;
    level.perksetfuncs["specialty_steadyaimpro"] = maps\mp\perks\_perkfunctions::setsteadyaimpro;
    level.perkunsetfuncs["specialty_steadyaimpro"] = maps\mp\perks\_perkfunctions::unsetsteadyaimpro;
    level.perksetfuncs["specialty_stun_resistance"] = maps\mp\perks\_perkfunctions::setstunresistance;
    level.perkunsetfuncs["specialty_stun_resistance"] = maps\mp\perks\_perkfunctions::unsetstunresistance;
    level.perksetfuncs["specialty_marksman"] = maps\mp\perks\_perkfunctions::setmarksman;
    level.perkunsetfuncs["specialty_marksman"] = maps\mp\perks\_perkfunctions::unsetmarksman;
    level.perksetfuncs["specialty_double_load"] = maps\mp\perks\_perkfunctions::setdoubleload;
    level.perkunsetfuncs["specialty_double_load"] = maps\mp\perks\_perkfunctions::unsetdoubleload;
    level.perksetfuncs["specialty_sharp_focus"] = maps\mp\perks\_perkfunctions::setsharpfocus;
    level.perkunsetfuncs["specialty_sharp_focus"] = maps\mp\perks\_perkfunctions::unsetsharpfocus;
    level.perksetfuncs["specialty_hard_shell"] = maps\mp\perks\_perkfunctions::sethardshell;
    level.perkunsetfuncs["specialty_hard_shell"] = maps\mp\perks\_perkfunctions::unsethardshell;
    level.perksetfuncs["specialty_regenspeed"] = maps\mp\perks\_perkfunctions::setregenspeed;
    level.perkunsetfuncs["specialty_regenspeed"] = maps\mp\perks\_perkfunctions::unsetregenspeed;
    level.perksetfuncs["specialty_autospot"] = maps\mp\perks\_perkfunctions::setautospot;
    level.perkunsetfuncs["specialty_autospot"] = maps\mp\perks\_perkfunctions::unsetautospot;
    level.perksetfuncs["specialty_empimmune"] = maps\mp\perks\_perkfunctions::setempimmune;
    level.perkunsetfuncs["specialty_empimmune"] = maps\mp\perks\_perkfunctions::unsetempimmune;
    level.perksetfuncs["specialty_overkill_pro"] = maps\mp\perks\_perkfunctions::setoverkillpro;
    level.perkunsetfuncs["specialty_overkill_pro"] = maps\mp\perks\_perkfunctions::unsetoverkillpro;
    level.perksetfuncs["specialty_combathigh"] = maps\mp\perks\_perkfunctions::setcombathigh;
    level.perkunsetfuncs["specialty_combathigh"] = maps\mp\perks\_perkfunctions::unsetcombathigh;
    level.perksetfuncs["specialty_light_armor"] = maps\mp\perks\_perkfunctions::setlightarmor;
    level.perkunsetfuncs["specialty_light_armor"] = maps\mp\perks\_perkfunctions::unsetlightarmor;
    level.perksetfuncs["specialty_revenge"] = maps\mp\perks\_perkfunctions::setrevenge;
    level.perkunsetfuncs["specialty_revenge"] = maps\mp\perks\_perkfunctions::unsetrevenge;
    level.perksetfuncs["specialty_c4death"] = maps\mp\perks\_perkfunctions::setc4death;
    level.perkunsetfuncs["specialty_c4death"] = maps\mp\perks\_perkfunctions::unsetc4death;
    level.perksetfuncs["specialty_finalstand"] = maps\mp\perks\_perkfunctions::setfinalstand;
    level.perkunsetfuncs["specialty_finalstand"] = maps\mp\perks\_perkfunctions::unsetfinalstand;
    level.perksetfuncs["specialty_juiced"] = maps\mp\perks\_perkfunctions::setjuiced;
    level.perkunsetfuncs["specialty_juiced"] = maps\mp\perks\_perkfunctions::unsetjuiced;
    level.perksetfuncs["specialty_carepackage"] = maps\mp\perks\_perkfunctions::setcarepackage;
    level.perkunsetfuncs["specialty_carepackage"] = maps\mp\perks\_perkfunctions::unsetcarepackage;
    level.perksetfuncs["specialty_stopping_power"] = maps\mp\perks\_perkfunctions::setstoppingpower;
    level.perkunsetfuncs["specialty_stopping_power"] = maps\mp\perks\_perkfunctions::unsetstoppingpower;
    level.perksetfuncs["specialty_uav"] = maps\mp\perks\_perkfunctions::setuav;
    level.perkunsetfuncs["specialty_uav"] = maps\mp\perks\_perkfunctions::unsetuav;
    initperkdvars();
    level thread onplayerconnect();
}

precacheshaders()
{
    precacheshader( "specialty_blastshield" );
}

validateperk( var_0, var_1 )
{
    if ( getdvarint( "scr_game_perks" ) == 0 )
    {
        if ( tablelookup( "mp/perkTable.csv", 1, var_1, 5 ) != "equipment" )
            return "specialty_null";
    }

    return var_1;
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    self.perks = [];
    self.weaponlist = [];
    self.omaclasschanged = 0;

    for (;;)
    {
        self waittill( "spawned_player" );
        self.omaclasschanged = 0;
        thread playerproximitytracker();
        thread maps\mp\gametypes\_scrambler::scramblerproximitytracker();
    }
}

playerproximitytracker()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    self.proximityactive = 0;

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            wait 0.05;

            if ( !isdefined( var_1 ) )
                continue;

            if ( var_1.team != self.team )
                continue;

            if ( var_1 == self )
                continue;

            if ( !maps\mp\_utility::isreallyalive( var_1 ) )
                continue;

            if ( !maps\mp\_utility::isreallyalive( self ) )
                continue;

            var_2 = distancesquared( var_1.origin, self.origin );

            if ( var_2 < 262144 )
            {
                self.proximityactive = 1;
                break;
            }
        }

        wait 0.25;
    }
}

drawline( var_0, var_1, var_2 )
{
    var_3 = int( var_2 * 20 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

cac_modified_damage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 0;

    if ( maps\mp\_utility::isbulletdamage( var_3 ) )
    {
        if ( isplayer( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_paint_pro" ) && !maps\mp\_utility::iskillstreakweapon( var_4 ) )
        {
            if ( !var_0 maps\mp\perks\_perkfunctions::ispainted() )
                var_1 maps\mp\gametypes\_missions::processchallenge( "ch_bulletpaint" );

            var_0 thread maps\mp\perks\_perkfunctions::setpainted();
        }

        if ( isplayer( var_1 ) && isdefined( var_4 ) && maps\mp\_utility::getweaponclass( var_4 ) == "weapon_sniper" && issubstr( var_4, "silencer" ) )
            var_2 *= 0.75;

        if ( isplayer( var_1 ) && ( var_1 maps\mp\_utility::_hasperk( "specialty_stopping_power" ) && var_1 maps\mp\_utility::_hasperk( "specialty_bulletdamage" ) || var_1 maps\mp\_utility::_hasperk( "specialty_moredamage" ) ) )
            var_2 += var_2 * level.bulletdamagemod;

        if ( var_0 maps\mp\_utility::isjuggernaut() )
            var_2 *= level.armorvestmod;
    }
    else if ( isexplosivedamagemod( var_3 ) )
    {
        if ( isplayer( var_1 ) && var_1 != var_0 && var_1 isitemunlocked( "specialty_paint" ) && var_1 maps\mp\_utility::_hasperk( "specialty_paint" ) && !maps\mp\_utility::iskillstreakweapon( var_4 ) )
        {
            if ( !var_0 maps\mp\perks\_perkfunctions::ispainted() )
                var_1 maps\mp\gametypes\_missions::processchallenge( "ch_paint_pro" );

            var_0 thread maps\mp\perks\_perkfunctions::setpainted();
        }

        if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && var_1 maps\mp\_utility::_hasperk( "specialty_explosivedamage" ) && var_0 maps\mp\_utility::_hasperk( "_specialty_blastshield" ) )
            var_8 += 0;
        else if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && var_1 maps\mp\_utility::_hasperk( "specialty_explosivedamage" ) )
            var_8 += var_2 * level.explosivedamagemod;
        else if ( var_0 maps\mp\_utility::_hasperk( "_specialty_blastshield" ) && ( var_4 != "semtex_mp" || var_2 != 120 ) )
            var_8 -= int( var_2 * ( 1 - level.blastshieldmod ) );

        if ( maps\mp\_utility::iskillstreakweapon( var_4 ) && isplayer( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_dangerclose" ) )
            var_8 += var_2 * level.dangerclosemod;

        if ( var_0 maps\mp\_utility::isjuggernaut() )
        {
            switch ( var_4 )
            {
                case "ac130_25mm_mp":
                    var_2 *= level.armorvestmod;
                    break;
                case "remote_mortar_missile_mp":
                    var_2 *= 0.2;
                    break;
                default:
                    if ( var_2 < 1000 )
                    {
                        if ( var_2 > 1 )
                            var_2 *= level.armorvestmod;
                    }

                    break;
            }
        }

        if ( 10 - ( level.graceperiod - level.ingraceperiod ) > 0 )
            var_2 *= level.armorvestmod;
    }
    else if ( var_3 == "MOD_FALLING" )
    {
        if ( var_0 isitemunlocked( "specialty_falldamage" ) && var_0 maps\mp\_utility::_hasperk( "specialty_falldamage" ) )
        {
            if ( var_2 > 0 )
                var_0 maps\mp\gametypes\_missions::processchallenge( "ch_falldamage" );

            var_8 = 0;
            var_2 = 0;
        }
    }
    else if ( var_3 == "MOD_MELEE" )
    {
        if ( isdefined( var_0.haslightarmor ) && var_0.haslightarmor )
        {
            if ( issubstr( var_4, "riotshield" ) )
                var_2 = int( var_0.maxhealth * 0.66 );
            else
                var_2 = var_0.maxhealth + 1;
        }

        if ( var_0 maps\mp\_utility::isjuggernaut() )
        {
            var_2 = 20;
            var_8 = 0;
        }
    }
    else if ( var_3 == "MOD_IMPACT" )
    {
        if ( var_0 maps\mp\_utility::isjuggernaut() )
        {
            switch ( var_4 )
            {
                case "concussion_grenade_mp":
                case "frag_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                case "semtex_mp":
                    var_2 = 5;
                    break;
                default:
                    if ( var_2 < 1000 )
                        var_2 = 25;

                    break;
            }

            var_8 = 0;
        }
    }

    if ( var_0 maps\mp\_utility::_hasperk( "specialty_combathigh" ) )
    {
        if ( isdefined( self.damageblockedtotal ) && ( !level.teambased || isdefined( var_1 ) && isdefined( var_1.team ) && var_0.team != var_1.team ) )
        {
            var_9 = var_2 + var_8;
            var_10 = var_9 - var_9 / 3;
            self.damageblockedtotal += var_10;

            if ( self.damageblockedtotal >= 101 )
            {
                self notify( "combathigh_survived" );
                self.damageblockedtotal = undefined;
            }
        }

        if ( var_4 != "throwingknife_mp" )
        {
            switch ( var_3 )
            {
                case "MOD_MELEE":
                case "MOD_FALLING":
                    break;
                default:
                    var_2 = int( var_2 / 3 );
                    var_8 = int( var_8 / 3 );
                    break;
            }
        }
    }

    if ( isdefined( var_0.haslightarmor ) && var_0.haslightarmor && var_4 == "throwingknife_mp" )
    {
        var_2 = var_0.health;
        var_8 = 0;
    }

    if ( var_2 <= 1 )
    {
        var_2 = 1;
        return var_2;
    }
    else
        return int( var_2 + var_8 );
}

initperkdvars()
{
    level.bulletdamagemod = maps\mp\_utility::getintproperty( "perk_bulletDamage", 40 ) / 100;
    level.armorvestmod = 0.08;
    level.armorvestdefmod = 0.08;
    level.armorpiercingmod = 1.5;
    level.explosivedamagemod = maps\mp\_utility::getintproperty( "perk_explosiveDamage", 40 ) / 100;
    level.blastshieldmod = maps\mp\_utility::getintproperty( "perk_blastShield", 45 ) / 100;
    level.riotshieldmod = maps\mp\_utility::getintproperty( "perk_riotShield", 100 ) / 100;
    level.dangerclosemod = maps\mp\_utility::getintproperty( "perk_dangerClose", 100 ) / 100;
}

cac_selector()
{
    var_0 = self.specialty;
}

gambitusetracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( getdvarint( "scr_game_perks" ) != 1 )
        return;

    maps\mp\_utility::gameflagwait( "prematch_done" );
    self notifyonplayercommand( "gambit_on", "+frag" );
}

giveblindeyeafterspawn()
{
    self endon( "death" );
    self endon( "disconnect" );
    maps\mp\_utility::giveperk( "specialty_blindeye", 0 );
    self.spawnperk = 1;

    while ( self.avoidkillstreakonspawntimer > 0 )
    {
        self.avoidkillstreakonspawntimer -= 0.05;
        wait 0.05;
    }

    maps\mp\_utility::_unsetperk( "specialty_blindeye" );
    self.spawnperk = 0;
}
