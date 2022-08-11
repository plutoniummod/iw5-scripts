// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["ims"] = ::tryuseims;
    level.imssettings = [];
    level.imssettings["ims"] = spawnstruct();
    level.imssettings["ims"].weaponinfo = "ims_projectile_mp";
    level.imssettings["ims"].modelbase = "ims_scorpion_body";
    level.imssettings["ims"].modelplacement = "ims_scorpion_body_placement";
    level.imssettings["ims"].modelplacementfailed = "ims_scorpion_body_placement_failed";
    level.imssettings["ims"].modeldestroyed = "ims_scorpion_body";
    level.imssettings["ims"].modelbombsquad = "ims_scorpion_body_bombsquad";
    level.imssettings["ims"].hintstring = &"MP_IMS_PICKUP";
    level.imssettings["ims"].placestring = &"MP_IMS_PLACE";
    level.imssettings["ims"].cannotplacestring = &"MP_IMS_CANNOT_PLACE";
    level.imssettings["ims"].streakname = "ims";
    level.imssettings["ims"].splashname = "used_ims";
    level.imssettings["ims"].lifespan = 90.0;
    level.imssettings["ims"].graceperiod = 0.4;
    level.imssettings["ims"].attacks = 4;
    level.imssettings["ims"].modelexplosive1 = "ims_scorpion_explosive1";
    level.imssettings["ims"].modelexplosive2 = "ims_scorpion_explosive2";
    level.imssettings["ims"].modelexplosive3 = "ims_scorpion_explosive3";
    level.imssettings["ims"].modelexplosive4 = "ims_scorpion_explosive4";
    level.imssettings["ims"].modellid1 = "ims_scorpion_lid1";
    level.imssettings["ims"].modellid2 = "ims_scorpion_lid2";
    level.imssettings["ims"].modellid3 = "ims_scorpion_lid3";
    level.imssettings["ims"].modellid4 = "ims_scorpion_lid4";
    level.imssettings["ims"].tagexplosive1 = "tag_explosive1";
    level.imssettings["ims"].tagexplosive2 = "tag_explosive2";
    level.imssettings["ims"].tagexplosive3 = "tag_explosive3";
    level.imssettings["ims"].tagexplosive4 = "tag_explosive4";
    level.imssettings["ims"].taglid1 = "tag_lid1";
    level.imssettings["ims"].taglid2 = "tag_lid2";
    level.imssettings["ims"].taglid3 = "tag_lid3";
    level.imssettings["ims"].taglid4 = "tag_lid4";

    foreach ( var_1 in level.imssettings )
    {
        precacheitem( var_1.weaponinfo );
        precachemodel( var_1.modelbase );
        precachemodel( var_1.modelplacement );
        precachemodel( var_1.modelplacementfailed );
        precachemodel( var_1.modeldestroyed );
        precachemodel( var_1.modelbombsquad );
        precachemodel( var_1.modelexplosive1 );
        precachemodel( var_1.modelexplosive2 );
        precachemodel( var_1.modelexplosive3 );
        precachemodel( var_1.modelexplosive4 );
        precachemodel( var_1.modellid1 );
        precachemodel( var_1.modellid2 );
        precachemodel( var_1.modellid3 );
        precachemodel( var_1.modellid4 );
        precachestring( var_1.hintstring );
        precachestring( var_1.placestring );
        precachestring( var_1.cannotplacestring );
    }

    precachestring( &"PLATFORM_HOLD_TO_USE" );
    level._effect["ims_explode_mp"] = loadfx( "explosions/sentry_gun_explosion" );
    level._effect["ims_smoke_mp"] = loadfx( "smoke/car_damage_blacksmoke" );
    level._effect["ims_sensor_trail"] = loadfx( "smoke/smoke_geotrail_rpg" );
    level._effect["ims_sensor_explode"] = loadfx( "explosions/generator_sparks_d" );
    level._effect["ims_antenna_light_mp"] = loadfx( "lights/light_detonator_blink" );
}

tryuseims( var_0 )
{
    var_1 = [];

    if ( isdefined( self.imslist ) )
        var_1 = self.imslist;

    var_2 = giveims( "ims" );

    if ( !isdefined( var_2 ) )
    {
        var_2 = 0;

        if ( isdefined( self.imslist ) )
        {
            if ( !var_1.size && self.imslist.size )
                var_2 = 1;

            if ( var_1.size && var_1[0] != self.imslist[0] )
                var_2 = 1;
        }
    }

    if ( var_2 )
        maps\mp\_matchdata::logkillstreakevent( level.imssettings["ims"].streakname, self.origin );

    self.iscarrying = 0;
    return var_2;
}

giveims( var_0 )
{
    var_1 = createimsforplayer( var_0, self );
    removeperks();
    var_2 = setcarryingims( var_1, 1 );
    thread restoreperks();
    return var_2;
}

setcarryingims( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 thread ims_setcarried( self );
    common_scripts\utility::_disableweapon();
    self notifyonplayercommand( "place_ims", "+attack" );
    self notifyonplayercommand( "place_ims", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_ims", "+actionslot 4" );

    for (;;)
    {
        var_2 = common_scripts\utility::waittill_any_return( "place_ims", "cancel_ims", "force_cancel_placement" );

        if ( var_2 == "cancel_ims" || var_2 == "force_cancel_placement" )
        {
            if ( !var_1 && var_2 == "cancel_ims" )
                continue;

            var_3 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( level.imssettings[var_0.imstype].streakname );

            if ( isdefined( self.killstreakindexweapon ) && var_3 == maps\mp\killstreaks\_killstreaks::getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) && !self getweaponslistitems().size )
            {
                maps\mp\_utility::_giveweapon( var_3, 0 );
                maps\mp\_utility::_setactionslot( 4, "weapon", var_3 );
            }

            var_0 ims_setcancelled();
            common_scripts\utility::_enableweapon();
            return 0;
        }

        if ( !var_0.canbeplaced )
            continue;

        var_0 thread ims_setplaced();
        common_scripts\utility::_enableweapon();
        return 1;
    }
}

removeweapons()
{
    if ( self hasweapon( "riotshield_mp" ) )
    {
        self.restoreweapon = "riotshield_mp";
        self takeweapon( "riotshield_mp" );
    }
}

removeperks()
{
    if ( maps\mp\_utility::_hasperk( "specialty_explosivebullets" ) )
    {
        self.restoreperk = "specialty_explosivebullets";
        maps\mp\_utility::_unsetperk( "specialty_explosivebullets" );
    }
}

restoreweapons()
{
    if ( isdefined( self.restoreweapon ) )
    {
        maps\mp\_utility::_giveweapon( self.restoreweapon );
        self.restoreweapon = undefined;
    }
}

restoreperks()
{
    if ( isdefined( self.restoreperk ) )
    {
        maps\mp\_utility::giveperk( self.restoreperk, 0 );
        self.restoreperk = undefined;
    }
}

waitrestoreperks()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    restoreperks();
}

createimsforplayer( var_0, var_1 )
{
    var_2 = spawnturret( "misc_turret", var_1.origin + ( 0.0, 0.0, 25.0 ), "sentry_minigun_mp" );
    var_2.angles = var_1.angles;
    var_2.imstype = var_0;
    var_2.owner = var_1;
    var_2 setmodel( level.imssettings[var_0].modelbase );
    var_2 maketurretinoperable();
    var_2 setturretmodechangewait( 1 );
    var_2 setmode( "sentry_offline" );
    var_2 makeunusable();
    var_2 setsentryowner( var_1 );
    return var_2;
}

createims( var_0 )
{
    var_1 = var_0.owner;
    var_2 = var_0.imstype;
    var_3 = spawn( "script_model", var_0.origin );
    var_3 setmodel( level.imssettings[var_2].modelbase );
    var_3.scale = 3;
    var_3.health = 1000;
    var_3.angles = var_1.angles;
    var_3.imstype = var_2;
    var_3.owner = var_1;
    var_3.team = var_1.team;
    var_3.shouldsplash = 0;
    var_3.hidden = 0;
    var_3.attacks = level.imssettings[var_2].attacks;
    var_3.lid1 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].taglid1 + "_attach" ) );
    var_3.lid1 setmodel( level.imssettings[var_2].modellid1 );
    var_3.lid1.tag = level.imssettings[var_2].taglid1;
    var_3.lid1 linkto( var_3 );
    var_3.lid2 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].taglid2 + "_attach" ) );
    var_3.lid2 setmodel( level.imssettings[var_2].modellid2 );
    var_3.lid2.tag = level.imssettings[var_2].taglid2;
    var_3.lid2 linkto( var_3 );
    var_3.lid3 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].taglid3 + "_attach" ) );
    var_3.lid3 setmodel( level.imssettings[var_2].modellid3 );
    var_3.lid3.tag = level.imssettings[var_2].taglid3;
    var_3.lid3 linkto( var_3 );
    var_3.lid4 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].taglid4 + "_attach" ) );
    var_3.lid4 setmodel( level.imssettings[var_2].modellid4 );
    var_3.lid4.tag = level.imssettings[var_2].taglid4;
    var_3.lid4 linkto( var_3 );
    var_3.explosive1 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].tagexplosive1 + "_attach" ) );
    var_3.explosive1 setmodel( level.imssettings[var_2].modelexplosive1 );
    var_3.explosive1.tag = level.imssettings[var_2].tagexplosive1;
    var_3.explosive1 linkto( var_3 );
    var_3.explosive2 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].tagexplosive2 + "_attach" ) );
    var_3.explosive2 setmodel( level.imssettings[var_2].modelexplosive2 );
    var_3.explosive2.tag = level.imssettings[var_2].tagexplosive2;
    var_3.explosive2 linkto( var_3 );
    var_3.explosive3 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].tagexplosive3 + "_attach" ) );
    var_3.explosive3 setmodel( level.imssettings[var_2].modelexplosive3 );
    var_3.explosive3.tag = level.imssettings[var_2].tagexplosive3;
    var_3.explosive3 linkto( var_3 );
    var_3.explosive4 = spawn( "script_model", var_3 gettagorigin( level.imssettings[var_2].tagexplosive4 + "_attach" ) );
    var_3.explosive4 setmodel( level.imssettings[var_2].modelexplosive4 );
    var_3.explosive4.tag = level.imssettings[var_2].tagexplosive4;
    var_3.explosive4 linkto( var_3 );
    var_3 ims_setinactive();
    var_3 thread ims_handleownerdisconnect();
    var_3 thread ims_handledeath();
    var_3 thread ims_handleuse();
    var_3 thread ims_handledamage();
    var_3 thread ims_timeout();
    var_3 thread ims_createbombsquadmodel();
    return var_3;
}

ims_createbombsquadmodel()
{
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 hide();
    var_1 = level.otherteam[self.team];
    var_0 thread maps\mp\gametypes\_weapons::bombsquadvisibilityupdater( var_1, self.owner );
    var_0 setmodel( level.imssettings[self.imstype].modelbombsquad );
    var_0 linkto( self );
    var_0 setcontents( 0 );
    self.imsbombsquadmodel = var_0;
    self waittill( "death" );
    var_0 delete();
}

ims_handledamage()
{
    self endon( "death" );
    level endon( "game_ended" );
    self.health = 999999;
    self.maxhealth = 300;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_1 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                case "ims_projectile_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( self.hidden )
            return;

        if ( var_4 == "MOD_MELEE" )
            self.damagetaken += self.maxhealth;

        if ( isexplosivedamagemod( var_4 ) )
            var_0 *= 1.5;

        if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
            self.wasdamagedfrombulletpenetration = 1;

        self.wasdamaged = 1;
        var_10 = var_0;

        if ( isplayer( var_1 ) )
        {
            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "ims" );

            if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                var_10 = var_0 * level.armorpiercingmod;
        }

        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "ims" );

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "ac130_105mm_mp":
                case "ac130_40mm_mp":
                case "remotemissile_projectile_mp":
                case "remote_mortar_missile_mp":
                case "stinger_mp":
                case "javelin_mp":
                    self.largeprojectiledamage = 1;
                    var_10 = self.maxhealth + 1;
                    break;
                case "artillery_mp":
                case "stealth_bomb_mp":
                    self.largeprojectiledamage = 0;
                    var_10 += var_0 * 4;
                    break;
                case "emp_grenade_mp":
                case "bomb_site_mp":
                    self.largeprojectiledamage = 0;
                    var_10 = self.maxhealth + 1;
                    break;
            }
        }

        self.damagetaken += var_10;

        if ( self.damagetaken >= self.maxhealth )
        {
            thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_1, var_0, var_4, var_9 );

            if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
            {
                var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 100, var_9, var_4 );
                var_1 notify( "destroyed_killstreak" );
            }

            if ( isdefined( self.owner ) )
                self.owner thread maps\mp\_utility::leaderdialogonplayer( "ims_destroyed" );

            self notify( "death" );
            return;
        }
    }
}

ims_handledeath()
{
    var_0 = self getentitynumber();
    addtoimslist( var_0 );
    self waittill( "death" );
    removefromimslist( var_0 );

    if ( !isdefined( self ) )
        return;

    self setmodel( level.imssettings[self.imstype].modeldestroyed );
    ims_setinactive();
    self playsound( "ims_destroyed" );

    if ( isdefined( self.inuseby ) )
    {
        playfx( common_scripts\utility::getfx( "ims_explode_mp" ), self.origin + ( 0.0, 0.0, 10.0 ) );
        playfx( common_scripts\utility::getfx( "ims_smoke_mp" ), self.origin );
        self.inuseby restoreperks();
        self.inuseby restoreweapons();
        self notify( "deleting" );
        wait 1.0;
    }
    else
    {
        playfx( common_scripts\utility::getfx( "ims_explode_mp" ), self.origin + ( 0.0, 0.0, 10.0 ) );
        wait 1.5;
        self playsound( "ims_fire" );

        for ( var_1 = 8; var_1 > 0; var_1 -= 0.4 )
        {
            playfx( common_scripts\utility::getfx( "ims_smoke_mp" ), self.origin );
            wait 0.4;
        }

        self notify( "deleting" );
    }

    if ( isdefined( self.objidfriendly ) )
        maps\mp\_utility::_objective_delete( self.objidfriendly );

    if ( isdefined( self.objidenemy ) )
        maps\mp\_utility::_objective_delete( self.objidenemy );

    if ( isdefined( self.lid1 ) )
        self.lid1 delete();

    if ( isdefined( self.lid2 ) )
        self.lid2 delete();

    if ( isdefined( self.lid3 ) )
        self.lid3 delete();

    if ( isdefined( self.lid4 ) )
        self.lid4 delete();

    if ( isdefined( self.explosive1 ) )
    {
        if ( isdefined( self.explosive1.killcament ) )
            self.explosive1.killcament delete();

        self.explosive1 delete();
    }

    if ( isdefined( self.explosive2 ) )
    {
        if ( isdefined( self.explosive2.killcament ) )
            self.explosive2.killcament delete();

        self.explosive2 delete();
    }

    if ( isdefined( self.explosive3 ) )
    {
        if ( isdefined( self.explosive3.killcament ) )
            self.explosive3.killcament delete();

        self.explosive3 delete();
    }

    if ( isdefined( self.explosive4 ) )
    {
        if ( isdefined( self.explosive4.killcament ) )
            self.explosive4.killcament delete();

        self.explosive4 delete();
    }

    self delete();
}

ims_handleuse()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            continue;

        var_1 = createimsforplayer( self.imstype, var_0 );
        var_1.ims = self;
        ims_setinactive();
        ims_hideallparts();
        var_0 setcarryingims( var_1, 0 );
    }
}

ims_handleownerdisconnect()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "ims_handleOwner" );
    self endon( "ims_handleOwner" );
    self.owner common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

ims_setplaced()
{
    self endon( "death" );
    level endon( "game_ended" );
    self.carriedby forceusehintoff();
    self.carriedby = undefined;

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    var_0 = undefined;

    if ( isdefined( self.ims ) )
    {
        var_0 = self.ims;
        var_0 endon( "death" );
        var_0.origin = self.origin;
        var_0.angles = self.angles;
        var_0.carriedby = undefined;
        wait 0.05;
        var_0 ims_showallparts();

        if ( isdefined( var_0.imsbombsquadmodel ) )
        {
            var_0.imsbombsquadmodel show();
            level notify( "update_bombsquad" );
        }
    }
    else
        var_0 = createims( self );

    var_0 setcandamage( 1 );
    self playsound( "ims_plant" );
    self notify( "placed" );
    var_0 thread ims_setactive();
    self delete();
}

ims_setcancelled()
{
    if ( isdefined( self.carriedby ) )
        self.carriedby forceusehintoff();

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    if ( isdefined( self.lid1 ) )
        self.lid1 delete();

    if ( isdefined( self.lid2 ) )
        self.lid2 delete();

    if ( isdefined( self.lid3 ) )
        self.lid3 delete();

    if ( isdefined( self.lid4 ) )
        self.lid4 delete();

    if ( isdefined( self.explosive1 ) )
        self.explosive1 delete();

    if ( isdefined( self.explosive2 ) )
        self.explosive2 delete();

    if ( isdefined( self.explosive3 ) )
        self.explosive3 delete();

    if ( isdefined( self.explosive4 ) )
        self.explosive4 delete();

    self delete();
}

ims_setcarried( var_0 )
{
    self setmodel( level.imssettings[self.imstype].modelplacement );
    self setsentrycarrier( var_0 );
    self setcontents( 0 );
    self setcandamage( 0 );
    self.carriedby = var_0;
    var_0.iscarrying = 1;
    var_0 thread updateimsplacement( self );
    thread ims_oncarrierdeath( var_0 );
    thread ims_oncarrierdisconnect( var_0 );
    thread ims_ongameended();
    self notify( "carried" );

    if ( isdefined( self.ims ) )
    {
        self.ims notify( "carried" );
        self.ims.carriedby = var_0;

        if ( isdefined( self.ims.imsbombsquadmodel ) )
            self.ims.imsbombsquadmodel hide();
    }
}

updateimsplacement( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0.canbeplaced = 1;
    var_1 = -1;

    for (;;)
    {
        var_2 = self canplayerplacesentry();
        var_0.origin = var_2["origin"];
        var_0.angles = var_2["angles"];
        var_0.canbeplaced = self isonground() && var_2["result"] && abs( var_0.origin[2] - self.origin[2] ) < 10;

        if ( var_0.canbeplaced != var_1 )
        {
            if ( var_0.canbeplaced )
            {
                var_0 setmodel( level.imssettings[var_0.imstype].modelplacement );
                self forceusehinton( level.imssettings[var_0.imstype].placestring );
            }
            else
            {
                var_0 setmodel( level.imssettings[var_0.imstype].modelplacementfailed );
                self forceusehinton( level.imssettings[var_0.imstype].cannotplacestring );
            }
        }

        var_1 = var_0.canbeplaced;
        wait 0.05;
    }
}

ims_oncarrierdeath( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "death" );

    if ( self.canbeplaced )
        thread ims_setplaced();
    else
        ims_setcancelled();
}

ims_oncarrierdisconnect( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    ims_setcancelled();
}

ims_ongameended( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    ims_setcancelled();
}

ims_setactive()
{
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( level.imssettings[self.imstype].hintstring );
    var_0 = self.owner;
    var_0 forceusehintoff();

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( self.team, ( 0.0, 0.0, 45.0 ) );
    else
        maps\mp\_entityheadicons::setplayerheadicon( var_0, ( 0.0, 0.0, 45.0 ) );

    self makeusable();
    self setcandamage( 1 );

    if ( isdefined( var_0.imslist ) )
    {
        foreach ( var_2 in var_0.imslist )
        {
            if ( var_2 == self )
                continue;

            var_2 notify( "death" );
        }
    }

    var_0.imslist = [];
    var_0.imslist[0] = self;

    foreach ( var_5 in level.players )
    {
        if ( var_5 == var_0 )
        {
            self enableplayeruse( var_5 );
            continue;
        }

        self disableplayeruse( var_5 );
    }

    if ( self.shouldsplash )
    {
        level thread maps\mp\_utility::teamplayercardsplash( level.imssettings[self.imstype].splashname, var_0 );
        self.shouldsplash = 0;
    }

    var_7 = ( 0.0, 0.0, 20.0 );
    var_8 = ( 0.0, 0.0, 256.0 );
    var_9 = [];
    var_10 = self gettagorigin( level.imssettings[self.imstype].tagexplosive1 ) + var_7;
    var_9[0] = bullettrace( var_10, var_10 + var_8 - var_7, 0, self );
    var_10 = self gettagorigin( level.imssettings[self.imstype].tagexplosive2 ) + var_7;
    var_9[1] = bullettrace( var_10, var_10 + var_8 - var_7, 0, self );
    var_10 = self gettagorigin( level.imssettings[self.imstype].tagexplosive3 ) + var_7;
    var_9[2] = bullettrace( var_10, var_10 + var_8 - var_7, 0, self );
    var_10 = self gettagorigin( level.imssettings[self.imstype].tagexplosive4 ) + var_7;
    var_9[3] = bullettrace( var_10, var_10 + var_8 - var_7, 0, self );
    var_11 = var_9[0];

    for ( var_12 = 0; var_12 < var_9.size; var_12++ )
    {
        if ( var_9[var_12]["position"][2] < var_11["position"][2] )
            var_11 = var_9[var_12];
    }

    self.attackheightpos = var_11["position"] - ( 0.0, 0.0, 20.0 );
    var_13 = spawn( "trigger_radius", self.origin, 0, 256, 100 );
    self.attacktrigger = var_13;
    self.attackmovetime = distance( self.origin, self.attackheightpos ) / 200;
    self.killcamoffset = ( 0.0, 0.0, 12.0 );

    if ( isdefined( self.explosive1.killcament ) )
        self.explosive1.killcament delete();

    if ( isdefined( self.explosive2.killcament ) )
        self.explosive2.killcament delete();

    if ( isdefined( self.explosive3.killcament ) )
        self.explosive3.killcament delete();

    if ( isdefined( self.explosive4.killcament ) )
        self.explosive4.killcament delete();

    var_0.imskillcament = undefined;

    if ( isdefined( self.explosive1 ) )
    {
        self.explosive1.killcament = spawn( "script_model", self.explosive1.origin + self.killcamoffset );
        self.explosive1.killcament setscriptmoverkillcam( "explosive" );

        if ( !isdefined( var_0.imskillcament ) )
            var_0.imskillcament = self.explosive1.killcament;
    }

    if ( isdefined( self.explosive2 ) )
    {
        self.explosive2.killcament = spawn( "script_model", self.explosive2.origin + self.killcamoffset );
        self.explosive2.killcament setscriptmoverkillcam( "explosive" );

        if ( !isdefined( var_0.imskillcament ) )
            var_0.imskillcament = self.explosive2.killcament;
    }

    if ( isdefined( self.explosive3 ) )
    {
        self.explosive3.killcament = spawn( "script_model", self.explosive3.origin + self.killcamoffset );
        self.explosive3.killcament setscriptmoverkillcam( "explosive" );

        if ( !isdefined( var_0.imskillcament ) )
            var_0.imskillcament = self.explosive3.killcament;
    }

    if ( isdefined( self.explosive4 ) )
    {
        self.explosive4.killcament = spawn( "script_model", self.explosive4.origin + self.killcamoffset );
        self.explosive4.killcament setscriptmoverkillcam( "explosive" );

        if ( !isdefined( var_0.imskillcament ) )
            var_0.imskillcament = self.explosive4.killcament;
    }

    thread ims_blinky_light();
    thread ims_attacktargets();
    thread ims_playerconnected();

    foreach ( var_5 in level.players )
        thread ims_playerjoinedteam( var_5 );
}

ims_playerconnected()
{
    self endon( "death" );
    level waittill( "connected", var_0 );
    var_0 waittill( "spawned_player" );
    self disableplayeruse( var_0 );
}

ims_playerjoinedteam( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "joined_team" );
        self disableplayeruse( var_0 );
    }
}

ims_blinky_light()
{
    self endon( "death" );
    self endon( "carried" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "ims_antenna_light_mp" ), self, "tag_fx" );
        wait 1.0;
        stopfxontag( common_scripts\utility::getfx( "ims_antenna_light_mp" ), self, "tag_fx" );
    }
}

ims_setinactive()
{
    self makeunusable();

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( "none", ( 0.0, 0.0, 0.0 ) );
    else if ( isdefined( self.owner ) )
        maps\mp\_entityheadicons::setplayerheadicon( undefined, ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( self.attacktrigger ) )
        self.attacktrigger delete();
}

isfriendlytoims( var_0 )
{
    if ( level.teambased && self.team == var_0.team )
        return 1;

    return 0;
}

ims_attacktargets()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( !isdefined( self.attacktrigger ) )
            break;

        self.attacktrigger waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
        {
            if ( isdefined( self.owner ) && var_0 == self.owner )
                continue;

            if ( level.teambased && var_0.pers["team"] == self.team )
                continue;

            if ( !maps\mp\_utility::isreallyalive( var_0 ) )
                continue;
        }
        else if ( isdefined( var_0.owner ) )
        {
            if ( isdefined( self.owner ) && var_0.owner == self.owner )
                continue;

            if ( level.teambased && var_0.owner.pers["team"] == self.team )
                continue;
        }

        if ( !sighttracepassed( self.attackheightpos, var_0.origin + ( 0.0, 0.0, 50.0 ), 0, self ) || !sighttracepassed( self gettagorigin( level.imssettings[self.imstype].taglid1 ) + ( 0.0, 0.0, 5.0 ), var_0.origin + ( 0.0, 0.0, 50.0 ), 0, self ) && !sighttracepassed( self gettagorigin( level.imssettings[self.imstype].taglid2 ) + ( 0.0, 0.0, 5.0 ), var_0.origin + ( 0.0, 0.0, 50.0 ), 0, self ) && !sighttracepassed( self gettagorigin( level.imssettings[self.imstype].taglid3 ) + ( 0.0, 0.0, 5.0 ), var_0.origin + ( 0.0, 0.0, 50.0 ), 0, self ) && !sighttracepassed( self gettagorigin( level.imssettings[self.imstype].taglid4 ) + ( 0.0, 0.0, 5.0 ), var_0.origin + ( 0.0, 0.0, 50.0 ), 0, self ) )
            continue;

        self playsound( "ims_trigger" );

        if ( isplayer( var_0 ) && var_0 maps\mp\_utility::_hasperk( "specialty_delaymine" ) )
        {
            var_0 notify( "triggered_ims" );
            wait(level.delayminetime);

            if ( !isdefined( self.attacktrigger ) )
                break;
        }
        else
            wait(level.imssettings[self.imstype].graceperiod);

        if ( isdefined( self.explosive1 ) && !isdefined( self.explosive1.fired ) )
            fire_sensor( var_0, self.explosive1, self.lid1 );
        else if ( isdefined( self.explosive2 ) && !isdefined( self.explosive2.fired ) )
            fire_sensor( var_0, self.explosive2, self.lid2 );
        else if ( isdefined( self.explosive3 ) && !isdefined( self.explosive3.fired ) )
            fire_sensor( var_0, self.explosive3, self.lid3 );
        else if ( isdefined( self.explosive4 ) && !isdefined( self.explosive4.fired ) )
            fire_sensor( var_0, self.explosive4, self.lid4 );

        self.attacks--;

        if ( self.attacks <= 0 )
            break;

        wait 2.0;

        if ( !isdefined( self.owner ) )
            break;
    }

    if ( isdefined( self.carriedby ) && isdefined( self.owner ) && self.carriedby == self.owner )
        return;

    self notify( "death" );
}

fire_sensor( var_0, var_1, var_2 )
{
    playfx( level._effect["ims_sensor_explode"], var_2.origin );
    var_2 hide();
    var_1.fired = 1;
    var_1 unlink();
    var_1 rotateyaw( 3600, self.attackmovetime );
    var_1 moveto( self.attackheightpos, self.attackmovetime, self.attackmovetime * 0.25, self.attackmovetime * 0.25 );

    if ( isdefined( var_1.killcament ) )
    {
        if ( isdefined( self.owner ) )
            self.owner.imskillcament = var_1.killcament;

        var_1.killcament moveto( self.attackheightpos + self.killcamoffset, self.attackmovetime, self.attackmovetime * 0.25, self.attackmovetime * 0.25 );
        var_1.killcament thread deleteaftertime( 5.0 );
    }

    var_1 playsound( "ims_launch" );
    var_1 waittill( "movedone" );
    playfx( level._effect["ims_sensor_explode"], var_1.origin );
    var_3 = [];
    var_3[0] = var_0.origin;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( isdefined( self.owner ) )
        {
            magicbullet( "ims_projectile_mp", var_1.origin, var_3[var_4], self.owner );
            continue;
        }

        magicbullet( "ims_projectile_mp", var_1.origin, var_3[var_4] );
    }

    var_2 delete();
    var_1 delete();
}

deleteaftertime( var_0 )
{
    self endon( "death" );
    level maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );

    if ( isdefined( self ) )
        self delete();
}

ims_timeout()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level.imssettings[self.imstype].lifespan;

    while ( var_0 )
    {
        wait 1.0;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self.carriedby ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    self notify( "death" );
}

addtoimslist( var_0 )
{
    level.ims[var_0] = self;
}

removefromimslist( var_0 )
{
    level.ims[var_0] = undefined;
}

ims_hideallparts()
{
    if ( isdefined( self.lid1 ) )
        self.lid1 hide();

    if ( isdefined( self.lid2 ) )
        self.lid2 hide();

    if ( isdefined( self.lid3 ) )
        self.lid3 hide();

    if ( isdefined( self.lid4 ) )
        self.lid4 hide();

    if ( isdefined( self.explosive1 ) )
        self.explosive1 hide();

    if ( isdefined( self.explosive2 ) )
        self.explosive2 hide();

    if ( isdefined( self.explosive3 ) )
        self.explosive3 hide();

    if ( isdefined( self.explosive4 ) )
        self.explosive4 hide();

    self hide();
    self.hidden = 1;
}

ims_showallparts()
{
    if ( isdefined( self.lid1 ) )
        self.lid1 show();

    if ( isdefined( self.lid2 ) )
        self.lid2 show();

    if ( isdefined( self.lid3 ) )
        self.lid3 show();

    if ( isdefined( self.lid4 ) )
        self.lid4 show();

    if ( isdefined( self.explosive1 ) )
        self.explosive1 show();

    if ( isdefined( self.explosive2 ) )
        self.explosive2 show();

    if ( isdefined( self.explosive3 ) )
        self.explosive3 show();

    if ( isdefined( self.explosive4 ) )
        self.explosive4 show();

    self show();
    self.hidden = 0;
}
