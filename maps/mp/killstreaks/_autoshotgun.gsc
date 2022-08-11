// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["auto_shotgun"] = ::tryuseautoshotgun;
    level.killstreaksetupfuncs["auto_shotgun"] = ::shotgunsetup;
    level.killstreakfuncs["thumper"] = ::tryusethumper;
    level.killstreaksetupfuncs["thumper"] = ::thumpersetup;
    thread onplayerconnect();
}

shotgunsetup()
{
    self givemaxammo( "aa12_mp" );
    thread saveweaponammoondeath( "aa12_mp" );
}

tryuseautoshotgun( var_0 )
{
    thread removeweapononoutofammo( "aa12_mp" );
    return 1;
}

thumpersetup()
{
    self givemaxammo( "m79_mp" );
    thread saveweaponammoondeath( "m79_mp" );
}

tryusethumper()
{
    thread removeweapononoutofammo( "m79_mp" );
    return 1;
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

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( !isdefined( self.pers["ksWeapon_clip_ammo"] ) || !isdefined( self.pers["ksWeapon_name"] ) )
            continue;

        var_0 = self.pers["ksWeapon_name"];

        if ( isdefined( self.pers["killstreak"] ) && maps\mp\killstreaks\_killstreaks::getkillstreakweapon( self.pers["killstreak"] ) != var_0 )
        {
            self.pers["ksWeapon_name"] = undefined;
            self.pers["ksWeapon_clip_ammo"] = undefined;
            self.pers["ksWeapon_stock_ammo"] = undefined;
            continue;
        }

        maps\mp\killstreaks\_killstreaks::givekillstreakweapon( var_0 );
        self setweaponammostock( var_0, self.pers["ksWeapon_stock_ammo"] );
        self setweaponammoclip( var_0, self.pers["ksWeapon_clip_ammo"] );
        thread removeweapononoutofammo( var_0 );
        thread saveweaponammoondeath( var_0 );
    }
}

saveweaponammoondeath( var_0 )
{
    self endon( "disconnect" );
    self endon( "got_killstreak" );
    self notify( "saveWeaponAmmoOnDeath" );
    self endon( "saveWeaponAmmoOnDeath" );
    self.pers["ksWeapon_name"] = undefined;
    self.pers["ksWeapon_clip_ammo"] = undefined;
    self.pers["ksWeapon_stock_ammo"] = undefined;
    self waittill( "death" );

    if ( !self hasweapon( var_0 ) )
        return;

    self.pers["ksWeapon_name"] = var_0;
    self.pers["ksWeapon_clip_ammo"] = self getweaponammoclip( var_0 );
    self.pers["ksWeapon_stock_ammo"] = self getweaponammostock( var_0 );
}

removeweapononoutofammo( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self notify( var_0 + "_ammo_monitor" );
    self endon( var_0 + "_ammo_monitor" );

    for (;;)
    {
        self waittill( "end_firing" );

        if ( self getcurrentweapon() != var_0 )
            continue;

        var_1 = self getweaponammoclip( var_0 ) + self getweaponammostock( var_0 );

        if ( var_1 )
            continue;

        self takeweapon( var_0 );
        return;
    }
}
