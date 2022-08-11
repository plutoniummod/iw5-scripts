// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

attachmentgroup( var_0 )
{
    return tablelookup( "mp/attachmentTable.csv", 4, var_0, 2 );
}

getattachmentlist()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookup( "mp/attachmentTable.csv", 9, var_1, 4 ); var_2 != ""; var_2 = tablelookup( "mp/attachmentTable.csv", 9, var_1, 4 ) )
    {
        var_0[var_0.size] = var_2;
        var_1++;
    }

    return common_scripts\utility::alphabetize( var_0 );
}

init()
{
    level.scavenger_altmode = 1;
    level.scavenger_secondary = 1;
    level.maxperplayerexplosives = max( maps\mp\_utility::getintproperty( "scr_maxPerPlayerExplosives", 2 ), 1 );
    level.riotshieldxpbullets = maps\mp\_utility::getintproperty( "scr_riotShieldXPBullets", 15 );

    switch ( maps\mp\_utility::getintproperty( "perk_scavengerMode", 0 ) )
    {
        case 1:
            level.scavenger_altmode = 0;
            break;
        case 2:
            level.scavenger_secondary = 0;
            break;
        case 3:
            level.scavenger_altmode = 0;
            level.scavenger_secondary = 0;
            break;
    }

    var_0 = getattachmentlist();
    var_1 = 149;
    level.weaponlist = [];

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = tablelookup( "mp/statstable.csv", 0, var_2, 4 );

        if ( var_3 == "" )
            continue;

        if ( !issubstr( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ), "weapon_" ) )
            continue;

        if ( issubstr( var_3, "iw5_" ) )
        {
            var_4 = strtok( var_3, "_" );
            var_3 = var_4[0] + "_" + var_4[1] + "_mp";
            level.weaponlist[level.weaponlist.size] = var_3;
            continue;
        }
        else
            level.weaponlist[level.weaponlist.size] = var_3 + "_mp";

        var_5 = [];

        for ( var_6 = 0; var_6 < 10; var_6++ )
        {
            var_7 = tablelookup( "mp/statStable.csv", 0, var_2, var_6 + 11 );

            if ( var_7 == "" )
                break;

            var_5[var_7] = 1;
        }

        var_8 = [];

        foreach ( var_7 in var_0 )
        {
            if ( !isdefined( var_5[var_7] ) )
                continue;

            level.weaponlist[level.weaponlist.size] = var_3 + "_" + var_7 + "_mp";
            var_8[var_8.size] = var_7;
        }

        var_11 = [];

        for ( var_12 = 0; var_12 < var_8.size - 1; var_12++ )
        {
            var_13 = tablelookuprownum( "mp/attachmentCombos.csv", 0, var_8[var_12] );

            for ( var_14 = var_12 + 1; var_14 < var_8.size; var_14++ )
            {
                if ( tablelookup( "mp/attachmentCombos.csv", 0, var_8[var_14], var_13 ) == "no" )
                    continue;

                var_11[var_11.size] = var_8[var_12] + "_" + var_8[var_14];
            }
        }

        foreach ( var_16 in var_11 )
            level.weaponlist[level.weaponlist.size] = var_3 + "_" + var_16 + "_mp";
    }

    foreach ( var_19 in level.weaponlist )
        precacheitem( var_19 );

    precacheitem( "flare_mp" );
    precacheitem( "scavenger_bag_mp" );
    precacheitem( "frag_grenade_short_mp" );
    precacheitem( "c4death_mp" );
    precacheitem( "destructible_car" );
    precacheitem( "destructible_toy" );
    precacheitem( "bouncingbetty_mp" );
    precacheitem( "scrambler_mp" );
    precacheitem( "portable_radar_mp" );
    precacheshellshock( "default" );
    precacheshellshock( "concussion_grenade_mp" );
    thread maps\mp\_flashgrenades::main();
    thread maps\mp\_entityheadicons::init();
    thread maps\mp\_empgrenade::init();
    var_22 = 70;
    level.claymoredetectiondot = cos( var_22 );
    level.claymoredetectionmindist = 20;
    level.claymoredetectiongraceperiod = 0.75;
    level.claymoredetonateradius = 192;
    level.minedetectiongraceperiod = 0.3;
    level.minedetectionradius = 100;
    level.minedetectionheight = 20;
    level.minedamageradius = 256;
    level.minedamagemin = 70;
    level.minedamagemax = 210;
    level.minedamagehalfheight = 46;
    level.mineselfdestructtime = 120;
    level.mine_launch = loadfx( "impacts/bouncing_betty_launch_dirt" );
    level.mine_spin = loadfx( "dust/bouncing_betty_swirl" );
    level.mine_explode = loadfx( "explosions/bouncing_betty_explosion" );
    level.mine_beacon["enemy"] = loadfx( "misc/light_c4_blink" );
    level.mine_beacon["friendly"] = loadfx( "misc/light_mine_blink_friendly" );
    level.empgrenadeexplode = loadfx( "explosions/emp_grenade" );
    level.delayminetime = 3.0;
    level.sentry_fire = loadfx( "muzzleflashes/shotgunflash" );
    level.stingerfxid = loadfx( "explosions/aerial_explosion_large" );
    level.primary_weapon_array = [];
    level.side_arm_array = [];
    level.grenade_array = [];
    level.missile_array = [];
    level.inventory_array = [];
    level.mines = [];
    precachemodel( "weapon_claymore_bombsquad" );
    precachemodel( "weapon_c4_bombsquad" );
    precachemodel( "projectile_m67fraggrenade_bombsquad" );
    precachemodel( "projectile_semtex_grenade_bombsquad" );
    precachemodel( "weapon_light_stick_tactical_bombsquad" );
    precachemodel( "projectile_bouncing_betty_grenade" );
    precachemodel( "projectile_bouncing_betty_grenade_bombsquad" );
    precachemodel( "projectile_bouncing_betty_trigger" );
    precachemodel( "weapon_jammer" );
    precachemodel( "weapon_jammer_bombsquad" );
    precachemodel( "weapon_radar" );
    precachemodel( "weapon_radar_bombsquad" );
    precachemodel( "mp_trophy_system" );
    precachemodel( "mp_trophy_system_bombsquad" );
    level._effect["equipment_explode"] = loadfx( "explosions/sparks_a" );
    level._effect["sniperDustLarge"] = loadfx( "dust/sniper_dust_kickup" );
    level._effect["sniperDustSmall"] = loadfx( "dust/sniper_dust_kickup_minimal" );
    level._effect["sniperDustLargeSuppress"] = loadfx( "dust/sniper_dust_kickup_accum_suppress" );
    level._effect["sniperDustSmallSuppress"] = loadfx( "dust/sniper_dust_kickup_accum_supress_minimal" );
    level thread onplayerconnect();
    level.c4explodethisframe = 0;
    common_scripts\utility::array_thread( getentarray( "misc_turret", "classname" ), ::turret_monitoruse );
}

dumpit()
{
    wait 5.0;
}

bombsquadwaiter()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = level.otherteam[self.team];

        if ( var_1 == "c4_mp" )
        {
            var_0 thread createbombsquadmodel( "weapon_c4_bombsquad", "tag_origin", var_2, self );
            continue;
        }

        if ( var_1 == "claymore_mp" )
        {
            var_0 thread createbombsquadmodel( "weapon_claymore_bombsquad", "tag_origin", var_2, self );
            continue;
        }

        if ( var_1 == "frag_grenade_mp" )
        {
            var_0 thread createbombsquadmodel( "projectile_m67fraggrenade_bombsquad", "tag_weapon", var_2, self );
            continue;
        }

        if ( var_1 == "frag_grenade_short_mp" )
        {
            var_0 thread createbombsquadmodel( "projectile_m67fraggrenade_bombsquad", "tag_weapon", var_2, self );
            continue;
        }

        if ( var_1 == "semtex_mp" )
            var_0 thread createbombsquadmodel( "projectile_semtex_grenade_bombsquad", "tag_weapon", var_2, self );
    }
}

createbombsquadmodel( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_4 hide();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_4 thread bombsquadvisibilityupdater( var_2, var_3 );
    var_4 setmodel( var_0 );
    var_4 linkto( self, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 setcontents( 0 );
    self waittill( "death" );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    var_4 delete();
}

bombsquadvisibilityupdater( var_0, var_1 )
{
    self endon( "death" );

    foreach ( var_3 in level.players )
    {
        if ( level.teambased )
        {
            if ( var_3.team == var_0 && var_3 maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
                self showtoplayer( var_3 );

            continue;
        }

        if ( isdefined( var_1 ) && var_3 == var_1 )
            continue;

        if ( !var_3 maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
            continue;

        self showtoplayer( var_3 );
    }

    for (;;)
    {
        level common_scripts\utility::waittill_any( "joined_team", "player_spawned", "changed_kit", "update_bombsquad" );
        self hide();

        foreach ( var_3 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_3.team == var_0 && var_3 maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
                    self showtoplayer( var_3 );

                continue;
            }

            if ( isdefined( var_1 ) && var_3 == var_1 )
                continue;

            if ( !var_3 maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
                continue;

            self showtoplayer( var_3 );
        }
    }
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.hits = 0;
        var_0.hasdonecombat = 0;
        var_0 kc_regweaponforfxremoval( "remotemissile_projectile_mp" );
        var_0 thread onplayerspawned();
        var_0 thread bombsquadwaiter();
        var_0 thread watchmissileusage();
        var_0 thread sniperdustwatcher();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self.currentweaponatspawn = self getcurrentweapon();
        self.empendtime = 0;
        self.concussionendtime = 0;
        self.hits = 0;
        self.hasdonecombat = 0;

        if ( !isdefined( self.trackingweaponname ) )
        {
            self.trackingweaponname = "";
            self.trackingweaponname = "none";
            self.trackingweaponshots = 0;
            self.trackingweaponkills = 0;
            self.trackingweaponhits = 0;
            self.trackingweaponheadshots = 0;
            self.trackingweapondeaths = 0;
        }

        thread watchweaponusage();
        thread watchgrenadeusage();
        thread watchweaponchange();
        thread watchstingerusage();
        thread watchjavelinusage();
        thread watchsentryusage();
        thread watchweaponreload();
        thread watchmineusage();
        thread maps\mp\gametypes\_class::trackriotshield();
        thread maps\mp\_equipment::watchtrophyusage();
        thread stancerecoiladjuster();
        self.lasthittime = [];
        self.droppeddeathweapon = undefined;
        self.tookweaponfrom = [];
        thread updatesavedlastweapon();
        thread updateweaponrank();

        if ( self hasweapon( "semtex_mp" ) )
            thread monitorsemtex();

        self.currentweaponatspawn = undefined;
        self.trophyremainingammo = undefined;
    }
}

sniperdustwatcher()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = undefined;

    for (;;)
    {
        self waittill( "weapon_fired" );

        if ( maps\mp\_utility::getweaponclass( self getcurrentweapon() ) != "weapon_sniper" )
            continue;

        if ( self getstance() != "prone" )
            continue;

        var_1 = anglestoforward( self.angles );

        if ( !isdefined( var_0 ) || gettime() - var_0 > 2000 )
        {
            playfx( level._effect["sniperDustLarge"], self.origin + ( 0.0, 0.0, 10.0 ) + var_1 * 50, var_1 );
            var_0 = gettime();
            continue;
        }

        playfx( level._effect["sniperDustLargeSuppress"], self.origin + ( 0.0, 0.0, 10.0 ) + var_1 * 50, var_1 );
    }
}

watchstingerusage()
{
    maps\mp\_stinger::stingerusageloop();
}

watchjavelinusage()
{
    maps\mp\_javelin::javelinusageloop();
}

watchweaponchange()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    thread watchstartweaponchange();
    self.lastdroppableweapon = self.currentweaponatspawn;
    self.hitsthismag = [];
    var_0 = self getcurrentweapon();

    if ( maps\mp\_utility::iscacprimaryweapon( var_0 ) && !isdefined( self.hitsthismag[var_0] ) )
        self.hitsthismag[var_0] = weaponclipsize( var_0 );

    self.bothbarrels = undefined;

    if ( issubstr( var_0, "ranger" ) )
        thread watchrangerusage( var_0 );

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_1 == "none" )
            continue;

        if ( var_1 == "briefcase_bomb_mp" || var_1 == "briefcase_bomb_defuse_mp" )
            continue;

        if ( maps\mp\_utility::iskillstreakweapon( var_1 ) )
        {
            if ( maps\mp\_utility::isjuggernaut() )
                self.changingweapon = undefined;

            continue;
        }

        var_2 = strtok( var_1, "_" );
        self.bothbarrels = undefined;

        if ( issubstr( var_1, "ranger" ) )
            thread watchrangerusage( var_1 );

        if ( var_2[0] == "alt" )
        {
            var_3 = getsubstr( var_1, 4 );
            var_1 = var_3;
            var_2 = strtok( var_1, "_" );
        }
        else if ( var_2[0] != "iw5" )
            var_1 = var_2[0];

        if ( var_1 != "none" && var_2[0] != "iw5" )
        {
            if ( maps\mp\_utility::iscacprimaryweapon( var_1 ) && !isdefined( self.hitsthismag[var_1 + "_mp"] ) )
                self.hitsthismag[var_1 + "_mp"] = weaponclipsize( var_1 + "_mp" );
        }
        else if ( var_1 != "none" && var_2[0] == "iw5" )
        {
            if ( maps\mp\_utility::iscacprimaryweapon( var_1 ) && !isdefined( self.hitsthismag[var_1] ) )
                self.hitsthismag[var_1] = weaponclipsize( var_1 );
        }

        self.changingweapon = undefined;

        if ( var_2[0] == "iw5" )
            self.lastdroppableweapon = var_1;
        else if ( var_1 != "none" && maydropweapon( var_1 + "_mp" ) )
            self.lastdroppableweapon = var_1 + "_mp";

        if ( isdefined( self.class_num ) )
        {
            if ( var_2[0] != "iw5" )
                var_1 += "_mp";

            if ( isdefined( self.loadoutprimarybuff ) && self.loadoutprimarybuff != "specialty_null" )
            {
                if ( var_1 == self.primaryweapon && !maps\mp\_utility::_hasperk( self.loadoutprimarybuff ) )
                    maps\mp\_utility::giveperk( self.loadoutprimarybuff, 1 );

                if ( var_1 != self.primaryweapon && maps\mp\_utility::_hasperk( self.loadoutprimarybuff ) )
                    maps\mp\_utility::_unsetperk( self.loadoutprimarybuff );
            }

            if ( isdefined( self.loadoutsecondarybuff ) && self.loadoutsecondarybuff != "specialty_null" )
            {
                if ( var_1 == self.secondaryweapon && !maps\mp\_utility::_hasperk( self.loadoutsecondarybuff ) )
                    maps\mp\_utility::giveperk( self.loadoutsecondarybuff, 1 );

                if ( var_1 != self.secondaryweapon && maps\mp\_utility::_hasperk( self.loadoutsecondarybuff ) )
                    maps\mp\_utility::_unsetperk( self.loadoutsecondarybuff );
            }
        }
    }
}

watchstartweaponchange()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.changingweapon = undefined;

    for (;;)
    {
        self waittill( "weapon_switch_started", var_0 );
        self.changingweapon = var_0;

        if ( var_0 == "none" && isdefined( self.iscapturingcrate ) && self.iscapturingcrate )
        {
            while ( self.iscapturingcrate )
                wait 0.05;

            self.changingweapon = undefined;
        }
    }
}

watchweaponreload()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self getcurrentweapon();
        self.bothbarrels = undefined;

        if ( !issubstr( var_0, "ranger" ) )
            continue;

        thread watchrangerusage( var_0 );
    }
}

watchrangerusage( var_0 )
{
    var_1 = self getweaponammoclip( var_0, "right" );
    var_2 = self getweaponammoclip( var_0, "left" );
    self endon( "reload" );
    self endon( "weapon_change" );

    for (;;)
    {
        self waittill( "weapon_fired", var_3 );

        if ( var_3 != var_0 )
            continue;

        self.bothbarrels = undefined;

        if ( issubstr( var_0, "akimbo" ) )
        {
            var_4 = self getweaponammoclip( var_0, "left" );
            var_5 = self getweaponammoclip( var_0, "right" );

            if ( var_2 != var_4 && var_1 != var_5 )
                self.bothbarrels = 1;

            if ( !var_4 || !var_5 )
                return;

            var_2 = var_4;
            var_1 = var_5;
            continue;
        }

        if ( var_1 == 2 && !self getweaponammoclip( var_0, "right" ) )
        {
            self.bothbarrels = 1;
            return;
        }
    }
}

ishackweapon( var_0 )
{
    if ( var_0 == "radar_mp" || var_0 == "airstrike_mp" || var_0 == "helicopter_mp" )
        return 1;

    if ( var_0 == "briefcase_bomb_mp" )
        return 1;

    return 0;
}

maydropweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( issubstr( var_0, "ac130" ) )
        return 0;

    if ( issubstr( var_0, "uav" ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 0;

    var_1 = weaponinventorytype( var_0 );

    if ( var_1 != "primary" )
        return 0;

    return 1;
}

dropweaponfordeath( var_0 )
{
    if ( isdefined( level.blockweapondrops ) )
        return;

    if ( isdefined( self.droppeddeathweapon ) )
        return;

    if ( level.ingraceperiod )
        return;

    var_1 = self.lastdroppableweapon;

    if ( !isdefined( var_1 ) )
        return;

    if ( var_1 == "none" )
        return;

    if ( !self hasweapon( var_1 ) )
        return;

    if ( maps\mp\_utility::isjuggernaut() )
        return;

    var_2 = strtok( var_1, "_" );

    if ( var_2[0] == "alt" )
    {
        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( var_3 > 0 && var_3 < 2 )
            {
                var_1 += var_2[var_3];
                continue;
            }

            if ( var_3 > 0 )
            {
                var_1 += ( "_" + var_2[var_3] );
                continue;
            }

            var_1 = "";
        }
    }

    if ( var_1 != "riotshield_mp" )
    {
        if ( !self anyammoforweaponmodes( var_1 ) )
            return;

        var_4 = self getweaponammoclip( var_1, "right" );
        var_5 = self getweaponammoclip( var_1, "left" );

        if ( !var_4 && !var_5 )
            return;

        var_6 = self getweaponammostock( var_1 );
        var_7 = weaponmaxammo( var_1 );

        if ( var_6 > var_7 )
            var_6 = var_7;

        var_8 = self dropitem( var_1 );

        if ( !isdefined( var_8 ) )
            return;

        var_8 itemweaponsetammo( var_4, var_6, var_5 );
    }
    else
    {
        var_8 = self dropitem( var_1 );

        if ( !isdefined( var_8 ) )
            return;

        var_8 itemweaponsetammo( 1, 1, 0 );
    }

    self.droppeddeathweapon = 1;
    var_8.owner = self;
    var_8.ownersattacker = var_0;
    var_8 thread watchpickup();
    var_8 thread deletepickupafterawhile();
}

detachifattached( var_0, var_1 )
{
    var_2 = self getattachsize();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self getattachmodelname( var_3 );

        if ( var_4 != var_0 )
            continue;

        var_5 = self getattachtagname( var_3 );
        self detach( var_0, var_5 );

        if ( var_5 != var_1 )
        {
            var_2 = self getattachsize();

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                var_5 = self getattachtagname( var_3 );

                if ( var_5 != var_1 )
                    continue;

                var_0 = self getattachmodelname( var_3 );
                self detach( var_0, var_5 );
                break;
            }
        }

        return 1;
    }

    return 0;
}

deletepickupafterawhile()
{
    self endon( "death" );
    wait 60;

    if ( !isdefined( self ) )
        return;

    self delete();
}

getitemweaponname()
{
    var_0 = self.classname;
    var_1 = getsubstr( var_0, 7 );
    return var_1;
}

watchpickup()
{
    self endon( "death" );
    var_0 = getitemweaponname();

    for (;;)
    {
        self waittill( "trigger", var_1, var_2 );

        if ( isdefined( var_2 ) )
            break;
    }

    var_3 = var_2 getitemweaponname();

    if ( isdefined( var_1.tookweaponfrom[var_3] ) )
    {
        var_2.owner = var_1.tookweaponfrom[var_3];
        var_2.ownersattacker = var_1;
        var_1.tookweaponfrom[var_3] = undefined;
    }

    var_2 thread watchpickup();

    if ( isdefined( self.ownersattacker ) && self.ownersattacker == var_1 )
        var_1.tookweaponfrom[var_0] = self.owner;
    else
        var_1.tookweaponfrom[var_0] = undefined;
}

itemremoveammofromaltmodes()
{
    var_0 = getitemweaponname();
    var_1 = weaponaltweaponname( var_0 );

    for ( var_2 = 1; var_1 != "none" && var_1 != var_0; var_2++ )
    {
        self itemweaponsetammo( 0, 0, 0, var_2 );
        var_1 = weaponaltweaponname( var_1 );
    }
}

handlescavengerbagpickup( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "scavenger", var_1 );
    var_1 notify( "scavenger_pickup" );
    var_1 playlocalsound( "scavenger_pack_pickup" );
    var_2 = var_1 getweaponslistoffhands();

    foreach ( var_4 in var_2 )
    {
        if ( var_4 != "throwingknife_mp" )
            continue;

        var_5 = var_1 getweaponammoclip( var_4 );
        var_1 setweaponammoclip( var_4, var_5 + 1 );
    }

    var_7 = var_1 getweaponslistprimaries();

    foreach ( var_9 in var_7 )
    {
        if ( !maps\mp\_utility::iscacprimaryweapon( var_9 ) && !level.scavenger_secondary )
            continue;

        if ( issubstr( var_9, "alt" ) && ( issubstr( var_9, "m320" ) || issubstr( var_9, "gl" ) || issubstr( var_9, "gp25" ) || issubstr( var_9, "hybrid" ) ) )
            continue;

        if ( maps\mp\_utility::getweaponclass( var_9 ) == "weapon_projectile" )
            continue;

        var_10 = var_1 getweaponammostock( var_9 );
        var_11 = weaponclipsize( var_9 );
        var_1 setweaponammostock( var_9, var_10 + var_11 );
    }

    var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "scavenger" );
}

dropscavengerfordeath( var_0 )
{
    if ( level.ingraceperiod )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == self )
        return;

    var_1 = self dropscavengerbag( "scavenger_bag_mp" );
    var_1 thread handlescavengerbagpickup( self );
}

getweaponbasedgrenadecount( var_0 )
{
    return 2;
}

getweaponbasedsmokegrenadecount( var_0 )
{
    return 1;
}

getfraggrenadecount()
{
    var_0 = "frag_grenade_mp";
    var_1 = self getammocount( var_0 );
    return var_1;
}

getsmokegrenadecount()
{
    var_0 = "smoke_grenade_mp";
    var_1 = self getammocount( var_0 );
    return var_1;
}

setweaponstat( var_0, var_1, var_2 )
{
    maps\mp\gametypes\_gamelogic::setweaponstat( var_0, var_1, var_2 );
}

watchweaponusage( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        self.hasdonecombat = 1;

        if ( !isprimaryweapon( var_1 ) && !issidearm( var_1 ) )
            continue;

        if ( isdefined( self.hitsthismag[var_1] ) )
            thread updatemagshots( var_1 );

        var_2 = maps\mp\gametypes\_persistence::statgetbuffered( "totalShots" ) + 1;
        var_3 = maps\mp\gametypes\_persistence::statgetbuffered( "hits" );
        var_4 = clamp( float( var_3 ) / float( var_2 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::statsetbuffered( "totalShots", var_2 );
        maps\mp\gametypes\_persistence::statsetbuffered( "accuracy", int( var_4 ) );
        maps\mp\gametypes\_persistence::statsetbuffered( "misses", int( var_2 - var_3 ) );

        if ( isdefined( self.laststandparams ) && self.laststandparams.laststandstarttime == gettime() )
        {
            self.hits = 0;
            return;
        }

        var_5 = 1;
        setweaponstat( var_1, var_5, "shots" );
        setweaponstat( var_1, self.hits, "hits" );
        self.hits = 0;
    }
}

updatemagshots( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "updateMagShots_" + var_0 );
    self.hitsthismag[var_0]--;
    wait 0.05;
    self.hitsthismag[var_0] = weaponclipsize( var_0 );
}

checkhitsthismag( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "updateMagShots_" + var_0 );
    waittillframeend;

    if ( isdefined( self.hitsthismag[var_0] ) && self.hitsthismag[var_0] == 0 )
    {
        var_1 = maps\mp\_utility::getweaponclass( var_0 );
        maps\mp\gametypes\_missions::genericchallenge( var_1 );
        self.hitsthismag[var_0] = weaponclipsize( var_0 );
    }
}

checkhit( var_0, var_1 )
{
    if ( maps\mp\_utility::isstrstart( var_0, "alt_" ) )
    {
        var_2 = strtok( var_0, "_" );

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == "shotgun" )
            {
                var_5 = getsubstr( var_0, 0, 4 );

                if ( !isprimaryweapon( var_5 ) && !issidearm( var_5 ) )
                    self.hits = 1;

                continue;
            }

            if ( var_4 == "hybrid" )
            {
                var_6 = getsubstr( var_0, 4 );
                var_0 = var_6;
            }
        }
    }

    if ( !isprimaryweapon( var_0 ) && !issidearm( var_0 ) )
        return;

    switch ( weaponclass( var_0 ) )
    {
        case "rifle":
        case "smg":
        case "mg":
        case "pistol":
            self.hits++;
            break;
        case "spread":
            self.hits = 1;
            break;
        default:
            break;
    }

    waittillframeend;

    if ( isdefined( self.hitsthismag[var_0] ) )
        thread checkhitsthismag( var_0 );

    if ( !isdefined( self.lasthittime[var_0] ) )
        self.lasthittime[var_0] = 0;

    if ( self.lasthittime[var_0] == gettime() )
        return;

    self.lasthittime[var_0] = gettime();
    var_8 = maps\mp\gametypes\_persistence::statgetbuffered( "totalShots" );
    var_9 = maps\mp\gametypes\_persistence::statgetbuffered( "hits" ) + 1;

    if ( var_9 <= var_8 )
    {
        maps\mp\gametypes\_persistence::statsetbuffered( "hits", var_9 );
        maps\mp\gametypes\_persistence::statsetbuffered( "misses", int( var_8 - var_9 ) );
        maps\mp\gametypes\_persistence::statsetbuffered( "accuracy", int( var_9 * 10000 / var_8 ) );
    }
}

attackercandamageitem( var_0, var_1 )
{
    return friendlyfirecheck( var_1, var_0 );
}

friendlyfirecheck( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( !level.teambased )
        return 1;

    var_3 = var_1.team;
    var_4 = level.friendlyfire;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( var_4 != 0 )
        return 1;

    if ( var_1 == var_0 )
        return 1;

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 != var_0.team )
        return 1;

    return 0;
}

watchgrenadeusage()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self.throwinggrenade = undefined;
    self.gotpullbacknotify = 0;

    if ( maps\mp\_utility::getintproperty( "scr_deleteexplosivesonspawn", 1 ) == 1 )
    {
        if ( isdefined( self.c4array ) )
        {
            for ( var_0 = 0; var_0 < self.c4array.size; var_0++ )
            {
                if ( isdefined( self.c4array[var_0] ) )
                {
                    if ( isdefined( self.c4array[var_0].trigger ) )
                        self.c4array[var_0].trigger delete();

                    self.c4array[var_0] delete();
                }
            }
        }

        self.c4array = [];

        if ( isdefined( self.claymorearray ) )
        {
            for ( var_0 = 0; var_0 < self.claymorearray.size; var_0++ )
            {
                if ( isdefined( self.claymorearray[var_0] ) )
                {
                    if ( isdefined( self.claymorearray[var_0].trigger ) )
                        self.claymorearray[var_0].trigger delete();

                    self.claymorearray[var_0] delete();
                }
            }
        }

        self.claymorearray = [];

        if ( isdefined( self.bouncingbettyarray ) )
        {
            for ( var_0 = 0; var_0 < self.bouncingbettyarray.size; var_0++ )
            {
                if ( isdefined( self.bouncingbettyarray[var_0] ) )
                {
                    if ( isdefined( self.bouncingbettyarray[var_0].trigger ) )
                        self.bouncingbettyarray[var_0].trigger delete();

                    self.bouncingbettyarray[var_0] delete();
                }
            }
        }

        self.bouncingbettyarray = [];
    }
    else
    {
        if ( !isdefined( self.c4array ) )
            self.c4array = [];

        if ( !isdefined( self.claymorearray ) )
            self.claymorearray = [];

        if ( !isdefined( self.bouncingbettyarray ) )
            self.bouncingbettyarray = [];
    }

    thread watchc4();
    thread watchc4detonation();
    thread watchc4altdetonation();
    thread watchclaymores();
    thread deletec4andclaymoresondisconnect();
    thread watchforthrowbacks();

    for (;;)
    {
        self waittill( "grenade_pullback", var_1 );
        setweaponstat( var_1, 1, "shots" );
        self.hasdonecombat = 1;

        if ( var_1 == "claymore_mp" )
            continue;

        self.throwinggrenade = var_1;
        self.gotpullbacknotify = 1;

        if ( var_1 == "c4_mp" )
            beginc4tracking();
        else
            begingrenadetracking();

        self.throwinggrenade = undefined;
    }
}

begingrenadetracking()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "offhand_end" );
    self endon( "weapon_change" );
    var_0 = gettime();
    self waittill( "grenade_fire", var_1, var_2 );

    if ( gettime() - var_0 > 1000 && var_2 == "frag_grenade_mp" )
        var_1.iscooked = 1;

    self.changingweapon = undefined;
    var_1.owner = self;

    switch ( var_2 )
    {
        case "frag_grenade_mp":
        case "semtex_mp":
            var_1 thread maps\mp\gametypes\_shellshock::grenade_earthquake();
            var_1.originalowner = self;
            break;
        case "concussion_grenade_mp":
        case "flash_grenade_mp":
            var_1 thread empexplodewaiter();
            break;
        case "smoke_grenade_mp":
            var_1 thread watchsmokeexplode();
            break;
    }
}

watchsmokeexplode()
{
    level endon( "smokeTimesUp" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self waittill( "explode", var_1 );
    var_2 = 128;
    var_3 = 8;
    level thread waitsmoketime( var_3, var_2, var_1 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        foreach ( var_5 in level.players )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( level.teambased && var_5.team == var_0.team )
                continue;

            if ( distancesquared( var_5.origin, var_1 ) < var_2 * var_2 )
            {
                var_5.inplayersmokescreen = var_0;
                continue;
            }

            var_5.inplayersmokescreen = undefined;
        }

        wait 0.05;
    }
}

waitsmoketime( var_0, var_1, var_2 )
{
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    level notify( "smokeTimesUp" );
    waittillframeend;

    foreach ( var_4 in level.players )
    {
        if ( isdefined( var_4 ) )
            var_4.inplayersmokescreen = undefined;
    }
}

addmissiletosighttraces( var_0 )
{
    self.team = var_0;
    level.missilesforsighttraces[level.missilesforsighttraces.size] = self;
    self waittill( "death" );
    var_1 = [];

    foreach ( var_3 in level.missilesforsighttraces )
    {
        if ( var_3 != self )
            var_1[var_1.size] = var_3;
    }

    level.missilesforsighttraces = var_1;
}

watchmissileusage()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );

        if ( issubstr( var_1, "gl_" ) )
        {
            var_0.primaryweapon = self getcurrentprimaryweapon();
            var_0 thread maps\mp\gametypes\_shellshock::grenade_earthquake();
        }

        switch ( var_1 )
        {
            case "stinger_mp":
            case "iw5_smaw_mp":
            case "at4_mp":
                level notify( "stinger_fired", self, var_0, self.stingertarget );
                thread maps\mp\_utility::setaltsceneobj( var_0, "tag_origin", 65 );
                break;
            case "uav_strike_projectile_mp":
            case "remote_mortar_missile_mp":
            case "javelin_mp":
                level notify( "stinger_fired", self, var_0, self.javelintarget );
                thread maps\mp\_utility::setaltsceneobj( var_0, "tag_origin", 65 );
                break;
            default:
                break;
        }

        switch ( var_1 )
        {
            case "ac130_105mm_mp":
            case "ac130_40mm_mp":
            case "remotemissile_projectile_mp":
            case "uav_strike_projectile_mp":
            case "remote_mortar_missile_mp":
            case "iw5_smaw_mp":
            case "javelin_mp":
            case "at4_mp":
            case "rpg_mp":
                var_0 thread maps\mp\gametypes\_shellshock::grenade_earthquake();
            default:
                continue;
        }
    }
}

watchsentryusage()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sentry_placement_finished", var_0 );
        thread maps\mp\_utility::setaltsceneobj( var_0, "tag_flash", 65 );
    }
}

empexplodewaiter()
{
    thread maps\mp\gametypes\_shellshock::endondeath();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    var_1 = getempdamageents( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.owner ) && !friendlyfirecheck( self.owner, var_3.owner ) )
            continue;

        var_3 notify( "emp_damage", self.owner, 8.0 );
    }
}

beginc4tracking()
{
    self endon( "death" );
    self endon( "disconnect" );
    common_scripts\utility::waittill_any( "grenade_fire", "weapon_change", "offhand_end" );
    self.changingweapon = undefined;
}

watchforthrowbacks()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( self.gotpullbacknotify )
        {
            self.gotpullbacknotify = 0;
            continue;
        }

        if ( !issubstr( var_1, "frag_" ) && !issubstr( var_1, "semtex_" ) )
            continue;

        var_0.threwback = 1;
        thread maps\mp\_utility::incplayerstat( "throwbacks", 1 );
        var_0 thread maps\mp\gametypes\_shellshock::grenade_earthquake();
        var_0.originalowner = self;
    }
}

watchc4()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "c4" || var_1 == "c4_mp" )
        {
            if ( !self.c4array.size )
                thread watchc4altdetonate();

            if ( self.c4array.size )
            {
                self.c4array = common_scripts\utility::array_removeundefined( self.c4array );

                if ( self.c4array.size >= level.maxperplayerexplosives )
                    self.c4array[0] detonate();
            }

            self.c4array[self.c4array.size] = var_0;
            var_0.owner = self;
            var_0.team = self.team;
            var_0.activated = 0;
            var_0.weaponname = var_1;
            var_0 thread maps\mp\gametypes\_shellshock::c4_earthquake();
            var_0 thread c4activate();
            var_0 thread c4damage();
            var_0 thread c4empdamage();
            var_0 thread c4empkillstreakwait();
            var_0 waittill( "missile_stuck" );
            var_0.trigger = spawn( "script_origin", var_0.origin );
            var_0 thread equipmentwatchuse( self );
        }
    }
}

c4empdamage()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_origin" );
        self.disabled = 1;
        self notify( "disabled" );
        wait(var_1);
        self.disabled = undefined;
        self notify( "enabled" );
    }
}

c4empkillstreakwait()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( level.teambased && level.teamemped[self.team] || !level.teambased && isdefined( level.empplayer ) && level.empplayer != self.owner )
        {
            self.disabled = 1;
            self notify( "disabled" );
            continue;
        }

        self.disabled = undefined;
        self notify( "enabled" );
    }
}

setclaymoreteamheadicon( var_0 )
{
    self endon( "death" );
    wait 0.05;

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( var_0, ( 0.0, 0.0, 20.0 ) );
    else if ( isdefined( self.owner ) )
        maps\mp\_entityheadicons::setplayerheadicon( self.owner, ( 0.0, 0.0, 20.0 ) );
}

watchclaymores()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self.claymorearray = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "claymore" || var_1 == "claymore_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            var_0 hide();
            var_0 waittill( "missile_stuck" );
            var_2 = 40;

            if ( var_2 * var_2 < distancesquared( var_0.origin, self.origin ) )
            {
                var_3 = bullettrace( self.origin, self.origin - ( 0, 0, var_2 ), 0, self );

                if ( var_3["fraction"] == 1 )
                {
                    var_0 delete();
                    self setweaponammostock( "claymore_mp", self getweaponammostock( "claymore_mp" ) + 1 );
                    continue;
                }

                var_0.origin = var_3["position"];
            }

            var_0 show();
            self.claymorearray = common_scripts\utility::array_removeundefined( self.claymorearray );

            if ( self.claymorearray.size >= level.maxperplayerexplosives )
                self.claymorearray[0] detonate();

            self.claymorearray[self.claymorearray.size] = var_0;
            var_0.owner = self;
            var_0.team = self.team;
            var_0.weaponname = var_1;
            var_0.trigger = spawn( "script_origin", var_0.origin );
            level.mines[level.mines.size] = var_0;
            var_0 thread c4damage();
            var_0 thread c4empdamage();
            var_0 thread c4empkillstreakwait();
            var_0 thread claymoredetonation();
            var_0 thread equipmentwatchuse( self );
            var_0 thread setclaymoreteamheadicon( self.pers["team"] );
            self.changingweapon = undefined;
        }
    }
}

equipmentwatchuse( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self.trigger setcursorhint( "HINT_NOICON" );

    if ( self.weaponname == "c4_mp" )
        self.trigger sethintstring( &"MP_PICKUP_C4" );
    else if ( self.weaponname == "claymore_mp" )
        self.trigger sethintstring( &"MP_PICKUP_CLAYMORE" );
    else if ( self.weaponname == "bouncingbetty_mp" )
        self.trigger sethintstring( &"MP_PICKUP_BOUNCING_BETTY" );

    self.trigger maps\mp\_utility::setselfusable( var_0 );
    self.trigger thread maps\mp\_utility::notusableforjoiningplayers( self );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );
        var_0 playlocalsound( "scavenger_pack_pickup" );
        var_0 setweaponammostock( self.weaponname, var_0 getweaponammostock( self.weaponname ) + 1 );
        self.trigger delete();
        self delete();
        self notify( "death" );
    }
}

claymoredetonation()
{
    self endon( "death" );
    var_0 = spawn( "trigger_radius", self.origin + ( 0, 0, 0 - level.claymoredetonateradius ), 0, level.claymoredetonateradius, level.claymoredetonateradius * 2 );
    thread deleteondeath( var_0 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( getdvarint( "scr_claymoredebug" ) != 1 )
        {
            if ( isdefined( self.owner ) && var_1 == self.owner )
                continue;

            if ( !friendlyfirecheck( self.owner, var_1, 0 ) )
                continue;
        }

        if ( lengthsquared( var_1 getentityvelocity() ) < 10 )
            continue;

        var_2 = abs( var_1.origin[2] - self.origin[2] );

        if ( var_2 > 128 )
            continue;

        if ( !var_1 shouldaffectclaymore( self ) )
            continue;

        if ( var_1 damageconetrace( self.origin, self ) > 0 )
            break;
    }

    self playsound( "claymore_activated" );

    if ( isplayer( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_claymore" );
        wait(level.delayminetime);
    }
    else
        wait(level.claymoredetectiongraceperiod);

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    self detonate();
}

shouldaffectclaymore( var_0 )
{
    if ( isdefined( var_0.disabled ) )
        return 0;

    var_1 = self.origin + ( 0.0, 0.0, 32.0 );
    var_2 = var_1 - var_0.origin;
    var_3 = anglestoforward( var_0.angles );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 < level.claymoredetectionmindist )
        return 0;

    var_2 = vectornormalize( var_2 );
    var_5 = vectordot( var_2, var_3 );
    return var_5 > level.claymoredetectiondot;
}

deleteondeath( var_0 )
{
    self waittill( "death" );
    wait 0.05;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.trigger ) )
            var_0.trigger delete();

        var_0 delete();
    }
}

c4activate()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    wait 0.05;
    self notify( "activated" );
    self.activated = 1;
}

watchc4altdetonate()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "detonated" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_0 = 0;

            while ( self usebuttonpressed() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self usebuttonpressed() && var_0 < 0.5 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            if ( !self.c4array.size )
                return;

            self notify( "alt_detonate" );
        }

        wait 0.05;
    }
}

watchc4detonation()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittillmatch( "detonate", "c4_mp" );
        var_0 = [];

        for ( var_1 = 0; var_1 < self.c4array.size; var_1++ )
        {
            var_2 = self.c4array[var_1];

            if ( isdefined( self.c4array[var_1] ) )
                var_2 thread waitanddetonate( 0.1 );
        }

        self.c4array = var_0;
        self notify( "detonated" );
    }
}

watchc4altdetonation()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "alt_detonate" );
        var_0 = self getcurrentweapon();

        if ( var_0 != "c4_mp" )
        {
            var_1 = [];

            for ( var_2 = 0; var_2 < self.c4array.size; var_2++ )
            {
                var_3 = self.c4array[var_2];

                if ( isdefined( self.c4array[var_2] ) )
                    var_3 thread waitanddetonate( 0.1 );
            }

            self.c4array = var_1;
            self notify( "detonated" );
        }
    }
}

waitanddetonate( var_0 )
{
    self endon( "death" );
    wait(var_0);
    waittillenabled();
    self detonate();
}

deletec4andclaymoresondisconnect()
{
    self endon( "death" );
    self waittill( "disconnect" );
    var_0 = self.c4array;
    var_1 = self.claymorearray;
    wait 0.05;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2] ) )
            var_0[var_2] delete();
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) )
            var_1[var_2] delete();
    }
}

c4damage()
{
    self endon( "death" );
    self setcandamage( 1 );
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isplayer( var_0 ) )
            continue;

        if ( !friendlyfirecheck( self.owner, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                    continue;
            }
        }

        break;
    }

    if ( level.c4explodethisframe )
        wait(0.1 + randomfloat( 0.4 ));
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level.c4explodethisframe = 1;
    thread resetc4explodethisframe();

    if ( isdefined( var_4 ) && ( issubstr( var_4, "MOD_GRENADE" ) || issubstr( var_4, "MOD_EXPLOSIVE" ) ) )
        self.waschained = 1;

    if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
        self.wasdamagedfrombulletpenetration = 1;

    self.wasdamaged = 1;

    if ( isplayer( var_0 ) )
        var_0 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "c4" );

    if ( level.teambased )
    {
        if ( isdefined( var_0 ) && isdefined( var_0.pers["team"] ) && isdefined( self.owner ) && isdefined( self.owner.pers["team"] ) )
        {
            if ( var_0.pers["team"] != self.owner.pers["team"] )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self.owner ) && isdefined( var_0 ) && var_0 != self.owner )
        var_0 notify( "destroyed_explosive" );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    self detonate( var_0 );
}

resetc4explodethisframe()
{
    wait 0.05;
    level.c4explodethisframe = 0;
}

saydamaged( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

waittillenabled()
{
    if ( !isdefined( self.disabled ) )
        return;

    self waittill( "enabled" );
}

c4detectiontrigger( var_0 )
{
    self waittill( "activated" );
    var_1 = spawn( "trigger_radius", self.origin - ( 0.0, 0.0, 128.0 ), 0, 512, 256 );
    var_1.detectid = "trigger" + gettime() + randomint( 1000000 );
    var_1.owner = self;
    var_1 thread detecticonwaiter( level.otherteam[var_0] );
    self waittill( "death" );
    var_1 notify( "end_detection" );

    if ( isdefined( var_1.bombsquadicon ) )
        var_1.bombsquadicon destroy();

    var_1 delete();
}

claymoredetectiontrigger( var_0 )
{
    var_1 = spawn( "trigger_radius", self.origin - ( 0.0, 0.0, 128.0 ), 0, 512, 256 );
    var_1.detectid = "trigger" + gettime() + randomint( 1000000 );
    var_1.owner = self;
    var_1 thread detecticonwaiter( level.otherteam[var_0] );
    self waittill( "death" );
    var_1 notify( "end_detection" );

    if ( isdefined( var_1.bombsquadicon ) )
        var_1.bombsquadicon destroy();

    var_1 delete();
}

detecticonwaiter( var_0 )
{
    self endon( "end_detection" );
    level endon( "game_ended" );

    while ( !level.gameended )
    {
        self waittill( "trigger", var_1 );

        if ( !var_1.detectexplosives )
            continue;

        if ( level.teambased && var_1.team != var_0 )
            continue;
        else if ( !level.teambased && var_1 == self.owner.owner )
            continue;

        if ( isdefined( var_1.bombsquadids[self.detectid] ) )
            continue;

        var_1 thread showheadicon( self );
    }
}

setupbombsquad()
{
    self.bombsquadids = [];

    if ( self.detectexplosives && !self.bombsquadicons.size )
    {
        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            self.bombsquadicons[var_0] = newclienthudelem( self );
            self.bombsquadicons[var_0].x = 0;
            self.bombsquadicons[var_0].y = 0;
            self.bombsquadicons[var_0].z = 0;
            self.bombsquadicons[var_0].alpha = 0;
            self.bombsquadicons[var_0].archived = 1;
            self.bombsquadicons[var_0] setshader( "waypoint_bombsquad", 14, 14 );
            self.bombsquadicons[var_0] setwaypoint( 0, 0 );
            self.bombsquadicons[var_0].detectid = "";
        }
    }
    else if ( !self.detectexplosives )
    {
        for ( var_0 = 0; var_0 < self.bombsquadicons.size; var_0++ )
            self.bombsquadicons[var_0] destroy();

        self.bombsquadicons = [];
    }
}

showheadicon( var_0 )
{
    var_1 = var_0.detectid;
    var_2 = -1;

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_4 = self.bombsquadicons[var_3].detectid;

        if ( var_4 == var_1 )
            return;

        if ( var_4 == "" )
            var_2 = var_3;
    }

    if ( var_2 < 0 )
        return;

    self.bombsquadids[var_1] = 1;
    self.bombsquadicons[var_2].x = var_0.origin[0];
    self.bombsquadicons[var_2].y = var_0.origin[1];
    self.bombsquadicons[var_2].z = var_0.origin[2] + 24 + 128;
    self.bombsquadicons[var_2] fadeovertime( 0.25 );
    self.bombsquadicons[var_2].alpha = 1;
    self.bombsquadicons[var_2].detectid = var_0.detectid;

    while ( isalive( self ) && isdefined( var_0 ) && self istouching( var_0 ) )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    self.bombsquadicons[var_2].detectid = "";
    self.bombsquadicons[var_2] fadeovertime( 0.25 );
    self.bombsquadicons[var_2].alpha = 0;
    self.bombsquadids[var_1] = undefined;
}

getdamageableents( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = var_1 * var_1;
    var_6 = level.players;

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( !isalive( var_6[var_7] ) || var_6[var_7].sessionstate != "playing" )
            continue;

        var_8 = maps\mp\_utility::get_damageable_player_pos( var_6[var_7] );
        var_9 = distancesquared( var_0, var_8 );

        if ( var_9 < var_5 && ( !var_2 || weapondamagetracepassed( var_0, var_8, var_3, var_6[var_7] ) ) )
            var_4[var_4.size] = maps\mp\_utility::get_damageable_player( var_6[var_7], var_8 );
    }

    var_10 = getentarray( "grenade", "classname" );

    for ( var_7 = 0; var_7 < var_10.size; var_7++ )
    {
        var_11 = maps\mp\_utility::get_damageable_grenade_pos( var_10[var_7] );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || weapondamagetracepassed( var_0, var_11, var_3, var_10[var_7] ) ) )
            var_4[var_4.size] = maps\mp\_utility::get_damageable_grenade( var_10[var_7], var_11 );
    }

    var_12 = getentarray( "destructible", "targetname" );

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
    {
        var_11 = var_12[var_7].origin;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || weapondamagetracepassed( var_0, var_11, var_3, var_12[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13.isplayer = 0;
            var_13.isadestructable = 0;
            var_13.entity = var_12[var_7];
            var_13.damagecenter = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_14 = getentarray( "destructable", "targetname" );

    for ( var_7 = 0; var_7 < var_14.size; var_7++ )
    {
        var_11 = var_14[var_7].origin;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || weapondamagetracepassed( var_0, var_11, var_3, var_14[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13.isplayer = 0;
            var_13.isadestructable = 1;
            var_13.entity = var_14[var_7];
            var_13.damagecenter = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_15 = getentarray( "misc_turret", "classname" );

    foreach ( var_17 in var_15 )
    {
        var_11 = var_17.origin + ( 0.0, 0.0, 32.0 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || weapondamagetracepassed( var_0, var_11, var_3, var_17 ) ) )
        {
            switch ( var_17.model )
            {
                case "sentry_minigun_weak":
                case "mp_sam_turret":
                case "mp_remote_turret":
                case "vehicle_ugv_talon_gun_mp":
                    var_4[var_4.size] = maps\mp\_utility::get_damageable_sentry( var_17, var_11 );
                    continue;
            }
        }
    }

    var_19 = getentarray( "script_model", "classname" );

    foreach ( var_21 in var_19 )
    {
        if ( var_21.model != "projectile_bouncing_betty_grenade" && var_21.model != "ims_scorpion_body" )
            continue;

        var_11 = var_21.origin + ( 0.0, 0.0, 32.0 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || weapondamagetracepassed( var_0, var_11, var_3, var_21 ) ) )
            var_4[var_4.size] = maps\mp\_utility::get_damageable_mine( var_21, var_11 );
    }

    return var_4;
}

getempdamageents( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = getentarray( "grenade", "classname" );

    foreach ( var_7 in var_5 )
    {
        var_8 = var_7.origin;
        var_9 = distance( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || weapondamagetracepassed( var_0, var_8, var_3, var_7 ) ) )
            var_4[var_4.size] = var_7;
    }

    var_11 = getentarray( "misc_turret", "classname" );

    foreach ( var_13 in var_11 )
    {
        var_8 = var_13.origin;
        var_9 = distance( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || weapondamagetracepassed( var_0, var_8, var_3, var_13 ) ) )
            var_4[var_4.size] = var_13;
    }

    return var_4;
}

weapondamagetracepassed( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( lengthsquared( var_5 ) < var_2 * var_2 )
        return 1;

    var_6 = vectornormalize( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = bullettrace( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 || getdvarint( "scr_debugMines" ) != 0 )
    {
        thread debugprint( var_0, ".dmg" );

        if ( isdefined( var_3 ) )
            thread debugprint( var_1, "." + var_3.classname );
        else
            thread debugprint( var_1, ".undefined" );

        if ( var_7["fraction"] == 1 )
            thread debugline( var_4, var_1, ( 1.0, 1.0, 1.0 ) );
        else
        {
            thread debugline( var_4, var_7["position"], ( 1.0, 0.9, 0.8 ) );
            thread debugline( var_7["position"], var_1, ( 1.0, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

damageent( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self.isplayer )
    {
        self.damageorigin = var_5;
        self.entity thread [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self.isadestructable && ( var_4 == "artillery_mp" || var_4 == "claymore_mp" || var_4 == "stealth_bomb_mp" ) )
            return;

        self.entity notify( "damage", var_2, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "MOD_EXPLOSIVE", "", "", "", undefined, var_4 );
    }
}

debugline( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

debugcircle( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 16;

    var_4 = 360 / var_3;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        var_7 = var_4 * var_6;
        var_8 = cos( var_7 ) * var_1;
        var_9 = sin( var_7 ) * var_1;
        var_10 = var_0[0] + var_8;
        var_11 = var_0[1] + var_9;
        var_12 = var_0[2];
        var_5[var_5.size] = ( var_10, var_11, var_12 );
    }

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_13 = var_5[var_6];

        if ( var_6 + 1 >= var_5.size )
            var_14 = var_5[0];
        else
            var_14 = var_5[var_6 + 1];

        thread debugline( var_13, var_14, var_2 );
    }
}

debugprint( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 600; var_2++ )
        wait 0.05;
}

onweapondamage( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "disconnect" );

    switch ( var_1 )
    {
        case "concussion_grenade_mp":
            if ( !isdefined( var_0 ) )
                return;
            else if ( var_2 == "MOD_IMPACT" )
                return;

            var_5 = 1;

            if ( isdefined( var_0.owner ) && var_0.owner == var_4 )
                var_5 = 0;

            var_6 = 512;
            var_7 = 1 - distance( self.origin, var_0.origin ) / var_6;

            if ( var_7 < 0 )
                var_7 = 0;

            var_8 = 2 + 4 * var_7;

            if ( isdefined( self.stunscaler ) )
                var_8 *= self.stunscaler;

            wait 0.05;
            var_4 notify( "stun_hit" );
            self notify( "concussed", var_4 );

            if ( var_4 != self )
                var_4 maps\mp\gametypes\_missions::processchallenge( "ch_alittleconcussed" );

            self shellshock( "concussion_grenade_mp", var_8 );
            self.concussionendtime = gettime() + var_8 * 1000;

            if ( var_5 )
                var_4 thread maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "stun" );

            break;
        case "weapon_cobra_mk19_mp":
            break;
        default:
            maps\mp\gametypes\_shellshock::shellshockondamage( var_2, var_3 );
            break;
    }
}

isprimaryweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( weaponinventorytype( var_0 ) != "primary" )
        return 0;

    switch ( weaponclass( var_0 ) )
    {
        case "rifle":
        case "smg":
        case "mg":
        case "spread":
        case "pistol":
        case "rocketlauncher":
        case "sniper":
            return 1;
        default:
            return 0;
    }
}

isaltmodeweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "altmode";
}

isinventoryweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "item";
}

isriotshield( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weapontype( var_0 ) == "riotshield";
}

isoffhandweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "offhand";
}

issidearm( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( weaponinventorytype( var_0 ) != "primary" )
        return 0;

    return weaponclass( var_0 ) == "pistol";
}

isgrenade( var_0 )
{
    var_1 = weaponclass( var_0 );
    var_2 = weaponinventorytype( var_0 );

    if ( var_1 != "grenade" )
        return 0;

    if ( var_2 != "offhand" )
        return 0;
}

updatesavedlastweapon()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self.currentweaponatspawn;
    self.saved_lastweapon = var_0;

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_1 == "none" )
        {
            self.saved_lastweapon = var_0;
            continue;
        }

        var_2 = weaponinventorytype( var_1 );

        if ( var_2 != "primary" && var_2 != "altmode" )
        {
            self.saved_lastweapon = var_0;
            continue;
        }

        updatemovespeedscale();
        self.saved_lastweapon = var_0;
        var_0 = var_1;
    }
}

updateweaponrank()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self.currentweaponatspawn;
    var_1 = strtok( var_0, "_" );

    if ( var_1[0] == "iw5" )
        var_1[0] = var_1[0] + "_" + var_1[1];
    else if ( var_1[0] == "alt" )
        var_1[0] = var_1[1] + "_" + var_1[2];

    self.pers["weaponRank"] = maps\mp\gametypes\_rank::getweaponrank( var_1[0] );

    for (;;)
    {
        self waittill( "weapon_change", var_2 );

        if ( var_2 == "none" || maps\mp\_utility::isjuggernaut() || maps\mp\_utility::isdeathstreakweapon( var_2 ) )
            continue;

        var_3 = weaponinventorytype( var_2 );

        if ( var_3 == "primary" )
        {
            var_1 = strtok( var_2, "_" );

            if ( var_1[0] == "iw5" )
            {
                self.pers["weaponRank"] = maps\mp\gametypes\_rank::getweaponrank( var_1[0] + "_" + var_1[1] );
                continue;
            }

            if ( var_1[0] == "alt" )
            {
                self.pers["weaponRank"] = maps\mp\gametypes\_rank::getweaponrank( var_1[1] + "_" + var_1[2] );
                continue;
            }

            self.pers["weaponRank"] = maps\mp\gametypes\_rank::getweaponrank( var_1[0] );
        }
    }
}

empplayer( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    thread clearempondeath();
}

clearempondeath()
{
    self endon( "disconnect" );
    self waittill( "death" );
}

updatemovespeedscale()
{
    self.weaponlist = self getweaponslistprimaries();

    if ( self.weaponlist.size )
    {
        var_0 = 1000;

        foreach ( var_2 in self.weaponlist )
        {
            var_3 = maps\mp\_utility::getbaseweaponname( var_2 );
            var_4 = int( tablelookup( "mp/statstable.csv", 4, var_3, 8 ) );

            if ( var_4 == 0 )
                continue;

            if ( var_4 < var_0 )
                var_0 = var_4;
        }

        if ( var_0 > 10 )
            var_0 = 10;
    }
    else
        var_0 = 8;

    var_6 = var_0 / 10;
    self.weaponspeed = var_6;
    self setmovespeedscale( var_6 * self.movespeedscaler );
}

stancerecoiladjuster()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notifyonplayercommand( "adjustedStance", "+stance" );
    self notifyonplayercommand( "adjustedStance", "+goStand" );

    for (;;)
    {
        common_scripts\utility::waittill_any( "adjustedStance", "sprint_begin" );
        var_0 = maps\mp\_utility::getweaponclass( self getcurrentprimaryweapon() );

        if ( var_0 != "weapon_lmg" && var_0 != "weapon_sniper" )
            continue;

        wait 0.5;
        self.stance = self getstance();

        if ( self.stance == "prone" )
        {
            if ( var_0 == "weapon_lmg" )
                maps\mp\_utility::setrecoilscale( 0, 40 );
            else if ( var_0 == "weapon_sniper" )
                maps\mp\_utility::setrecoilscale( 0, 60 );
            else
                maps\mp\_utility::setrecoilscale();

            continue;
        }

        if ( self.stance == "crouch" )
        {
            if ( var_0 == "weapon_lmg" )
                maps\mp\_utility::setrecoilscale( 0, 10 );
            else if ( var_0 == "weapon_sniper" )
                maps\mp\_utility::setrecoilscale( 0, 30 );
            else
                maps\mp\_utility::setrecoilscale();

            continue;
        }

        maps\mp\_utility::setrecoilscale();
    }
}

buildweapondata( var_0 )
{
    var_1 = getattachmentlist();
    var_2 = 149;
    var_3 = [];

    for ( var_4 = 0; var_4 <= var_2; var_4++ )
    {
        var_5 = tablelookup( "mp/statstable.csv", 0, var_4, 4 );

        if ( var_5 == "" )
            continue;

        var_6 = var_5 + "_mp";

        if ( !issubstr( tablelookup( "mp/statsTable.csv", 0, var_4, 2 ), "weapon_" ) )
            continue;

        if ( weaponinventorytype( var_6 ) != "primary" )
            continue;

        var_7 = spawnstruct();
        var_7.basename = var_5;
        var_7.assetname = var_6;
        var_7.variants = [];
        var_7.variants[0] = var_6;
        var_8 = [];

        for ( var_9 = 0; var_9 < 6; var_9++ )
        {
            var_10 = tablelookup( "mp/statStable.csv", 0, var_4, var_9 + 11 );

            if ( var_0 )
            {
                switch ( var_10 )
                {
                    case "fmj":
                    case "rof":
                    case "xmags":
                        continue;
                }
            }

            if ( var_10 == "" )
                break;

            var_8[var_10] = 1;
        }

        var_11 = [];

        foreach ( var_10 in var_1 )
        {
            if ( !isdefined( var_8[var_10] ) )
                continue;

            var_7.variants[var_7.variants.size] = var_5 + "_" + var_10 + "_mp";
            var_11[var_11.size] = var_10;
        }

        for ( var_14 = 0; var_14 < var_11.size - 1; var_14++ )
        {
            var_15 = tablelookuprownum( "mp/attachmentCombos.csv", 0, var_11[var_14] );

            for ( var_16 = var_14 + 1; var_16 < var_11.size; var_16++ )
            {
                if ( tablelookup( "mp/attachmentCombos.csv", 0, var_11[var_16], var_15 ) == "no" )
                    continue;

                var_7.variants[var_7.variants.size] = var_5 + "_" + var_11[var_14] + "_" + var_11[var_16] + "_mp";
            }
        }

        var_3[var_5] = var_7;
    }

    return var_3;
}

monitorsemtex()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0 );

        if ( !issubstr( var_0.model, "semtex" ) )
            continue;

        var_0 waittill( "missile_stuck", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( level.teambased && isdefined( var_1.team ) && var_1.team == self.team )
        {
            var_0.isstuck = "friendly";
            continue;
        }

        var_0.isstuck = "enemy";
        var_0.stuckenemyentity = var_1;
        var_1 maps\mp\gametypes\_hud_message::playercardsplashnotify( "semtex_stuck", self );
        thread maps\mp\gametypes\_hud_message::splashnotify( "stuck_semtex", 100 );
        self notify( "process", "ch_bullseye" );
    }
}

turret_monitoruse()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread turret_playerthread( var_0 );
    }
}

turret_playerthread( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 notify( "weapon_change", "none" );
    self waittill( "turret_deactivate" );
    var_0 notify( "weapon_change", var_0 getcurrentweapon() );
}

spawnmine( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, randomfloat( 360 ), 0 );

    var_4 = "projectile_bouncing_betty_grenade";
    var_5 = spawn( "script_model", var_0 );
    var_5.angles = var_3;
    var_5 setmodel( var_4 );
    var_5.owner = var_1;
    var_5.weaponname = "bouncingbetty_mp";
    level.mines[level.mines.size] = var_5;
    var_5.killcamoffset = ( 0.0, 0.0, 4.0 );
    var_5.killcament = spawn( "script_model", var_5.origin + var_5.killcamoffset );
    var_5.killcament setscriptmoverkillcam( "explosive" );

    if ( !isdefined( var_2 ) || var_2 == "equipment" )
    {
        var_1.equipmentmines = common_scripts\utility::array_removeundefined( var_1.equipmentmines );

        if ( var_1.equipmentmines.size >= level.maxperplayerexplosives )
            var_1.equipmentmines[0] delete();

        var_1.equipmentmines[var_1.equipmentmines.size] = var_5;
    }
    else
        var_1.killstreakmines[var_1.killstreakmines.size] = var_5;

    var_5 thread createbombsquadmodel( "projectile_bouncing_betty_grenade_bombsquad", "tag_origin", level.otherteam[var_1.team], var_1 );
    var_5 thread minebeacon();
    var_5 thread setclaymoreteamheadicon( var_1.pers["team"] );
    var_5 thread minedamagemonitor();
    var_5 thread mineproximitytrigger();
    return var_5;
}

minedamagemonitor()
{
    self endon( "mine_triggered" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self setcandamage( 1 );
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isplayer( var_0 ) || isdefined( var_9 ) && var_9 == "bouncingbetty_mp" )
            continue;

        if ( !friendlyfirecheck( self.owner, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "smoke_grenade_mp":
                    continue;
            }
        }

        break;
    }

    self notify( "mine_destroyed" );

    if ( isdefined( var_4 ) && ( issubstr( var_4, "MOD_GRENADE" ) || issubstr( var_4, "MOD_EXPLOSIVE" ) ) )
        self.waschained = 1;

    if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
        self.wasdamagedfrombulletpenetration = 1;

    self.wasdamaged = 1;

    if ( isplayer( var_0 ) )
        var_0 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "bouncing_betty" );

    if ( level.teambased )
    {
        if ( isdefined( var_0 ) && isdefined( var_0.pers["team"] ) && isdefined( self.owner ) && isdefined( self.owner.pers["team"] ) )
        {
            if ( var_0.pers["team"] != self.owner.pers["team"] )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self.owner ) && isdefined( var_0 ) && var_0 != self.owner )
        var_0 notify( "destroyed_explosive" );

    thread mineexplode( var_0 );
}

mineproximitytrigger()
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    wait 2;
    var_0 = spawn( "trigger_radius", self.origin, 0, level.minedetectionradius, level.minedetectionheight );
    thread minedeletetrigger( var_0 );
    var_1 = undefined;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self.owner ) && var_1 == self.owner )
                continue;

            if ( !friendlyfirecheck( self.owner, var_1, 0 ) )
                continue;
        }

        if ( lengthsquared( var_1 getentityvelocity() ) < 10 )
            continue;

        if ( var_1 damageconetrace( self.origin, self ) > 0 )
            break;
    }

    self notify( "mine_triggered" );
    self playsound( "mine_betty_click" );

    if ( isplayer( var_1 ) && var_1 maps\mp\_utility::_hasperk( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_mine" );
        wait(level.delayminetime);
    }
    else
        wait(level.minedetectiongraceperiod);

    thread minebounce();
}

minedeletetrigger( var_0 )
{
    common_scripts\utility::waittill_any( "mine_triggered", "mine_destroyed", "mine_selfdestruct", "death" );
    var_0 delete();
}

mineselfdestruct()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );
    wait(level.mineselfdestructtime);
    wait(randomfloat( 0.4 ));
    self notify( "mine_selfdestruct" );
    thread mineexplode();
}

minebounce()
{
    self playsound( "mine_betty_spin" );
    playfx( level.mine_launch, self.origin );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    var_0 = self.origin + ( 0.0, 0.0, 64.0 );
    self moveto( var_0, 0.7, 0, 0.65 );
    self.killcament moveto( var_0 + self.killcamoffset, 0.7, 0, 0.65 );
    self rotatevelocity( ( 0.0, 750.0, 32.0 ), 0.7, 0, 0.65 );
    thread playspinnerfx();
    wait 0.65;
    thread mineexplode();
}

mineexplode( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self.owner;

    self playsound( "grenade_explode_metal" );
    playfxontag( level.mine_explode, self, "tag_fx" );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    self hide();
    self radiusdamage( self.origin, level.minedamageradius, level.minedamagemax, level.minedamagemin, var_0, "MOD_EXPLOSIVE", "bouncingbetty_mp" );
    wait 0.2;

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    self.killcament delete();
    self delete();
}

playspinnerfx()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( level.mine_spin, self, "tag_fx_spin1" );
        playfxontag( level.mine_spin, self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( level.mine_spin, self, "tag_fx_spin2" );
        playfxontag( level.mine_spin, self, "tag_fx_spin4" );
    }
}

minedamagedebug( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6[0] = ( 1.0, 0.0, 0.0 );
    var_6[1] = ( 0.0, 1.0, 0.0 );

    if ( var_1[2] < var_5 )
        var_7 = 0;
    else
        var_7 = 1;

    var_8 = ( var_0[0], var_0[1], var_5 );
    var_9 = ( var_1[0], var_1[1], var_5 );
    thread debugcircle( var_8, level.minedamageradius, var_6[var_7], 32 );
    var_10 = distancesquared( var_0, var_1 );

    if ( var_10 > var_2 )
        var_7 = 0;
    else
        var_7 = 1;

    thread debugline( var_8, var_9, var_6[var_7] );
}

minedamageheightpassed( var_0, var_1 )
{
    if ( isplayer( var_1 ) && isalive( var_1 ) && var_1.sessionstate == "playing" )
        var_2 = var_1 maps\mp\_utility::getstancecenter();
    else if ( var_1.classname == "misc_turret" )
        var_2 = var_1.origin + ( 0.0, 0.0, 32.0 );
    else
        var_2 = var_1.origin;

    var_3 = 0;
    var_4 = var_0.origin[2] + var_3 + level.minedamagehalfheight;
    var_5 = var_0.origin[2] + var_3 - level.minedamagehalfheight;

    if ( var_2[2] > var_4 || var_2[2] < var_5 )
        return 0;

    return 1;
}

watchmineusage()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );

    if ( isdefined( self.equipmentmines ) )
    {
        if ( maps\mp\_utility::getintproperty( "scr_deleteexplosivesonspawn", 1 ) == 1 )
        {
            self.equipmentmines = common_scripts\utility::array_removeundefined( self.equipmentmines );

            foreach ( var_1 in self.equipmentmines )
            {
                if ( isdefined( var_1.trigger ) )
                    var_1.trigger delete();

                var_1 delete();
            }
        }
    }
    else
        self.equipmentmines = [];

    if ( !isdefined( self.killstreakmines ) )
        self.killstreakmines = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_3, var_4 );

        if ( var_4 == "bouncingbetty" || var_4 == "bouncingbetty_mp" )
        {
            if ( !isalive( self ) )
            {
                var_3 delete();
                return;
            }

            self.hasdonecombat = 1;
            var_3 thread minethrown( self );
        }
    }
}

minethrown( var_0 )
{
    self.owner = var_0;
    self waittill( "missile_stuck" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = bullettrace( self.origin + ( 0.0, 0.0, 4.0 ), self.origin - ( 0.0, 0.0, 4.0 ), 0, self );
    var_2 = var_1["position"];

    if ( var_1["fraction"] == 1 )
    {
        var_2 = getgroundposition( self.origin, 12, 0, 32 );
        var_1["normal"] *= -1;
    }

    var_3 = vectornormalize( var_1["normal"] );
    var_4 = vectortoangles( var_3 );
    var_4 += ( 90.0, 0.0, 0.0 );
    var_5 = spawnmine( var_2, var_0, "equipment", var_4 );
    var_5.trigger = spawn( "script_origin", var_5.origin + ( 0.0, 0.0, 25.0 ) );
    var_5 thread equipmentwatchuse( var_0 );
    var_0 thread minewatchowner( var_5 );
    self delete();
}

minewatchowner( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );

    if ( isdefined( var_0.trigger ) )
        var_0.trigger delete();

    var_0 delete();
}

minebeacon()
{
    var_0["friendly"] = spawnfx( level.mine_beacon["friendly"], self gettagorigin( "tag_fx" ) );
    var_0["enemy"] = spawnfx( level.mine_beacon["enemy"], self gettagorigin( "tag_fx" ) );
    thread minebeaconteamupdater( var_0 );
    self waittill( "death" );
    var_0["friendly"] delete();
    var_0["enemy"] delete();
}

minebeaconteamupdater( var_0 )
{
    self endon( "death" );
    var_1 = self.owner.team;
    wait 0.05;
    triggerfx( var_0["friendly"] );
    triggerfx( var_0["enemy"] );

    for (;;)
    {
        var_0["friendly"] hide();
        var_0["enemy"] hide();

        foreach ( var_3 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_3.team == var_1 )
                    var_0["friendly"] showtoplayer( var_3 );
                else
                    var_0["enemy"] showtoplayer( var_3 );

                continue;
            }

            if ( var_3 == self.owner )
            {
                var_0["friendly"] showtoplayer( var_3 );
                continue;
            }

            var_0["enemy"] showtoplayer( var_3 );
        }

        level common_scripts\utility::waittill_either( "joined_team", "player_spawned" );
    }
}
