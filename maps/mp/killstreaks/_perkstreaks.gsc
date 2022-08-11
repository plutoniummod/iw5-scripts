// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["specialty_longersprint_ks"] = ::tryuseextremeconditioning;
    level.killstreakfuncs["specialty_fastreload_ks"] = ::tryusesleightofhand;
    level.killstreakfuncs["specialty_scavenger_ks"] = ::tryusescavenger;
    level.killstreakfuncs["specialty_blindeye_ks"] = ::tryuseblindeye;
    level.killstreakfuncs["specialty_paint_ks"] = ::tryusepaint;
    level.killstreakfuncs["specialty_hardline_ks"] = ::tryusehardline;
    level.killstreakfuncs["specialty_coldblooded_ks"] = ::tryusecoldblooded;
    level.killstreakfuncs["specialty_quickdraw_ks"] = ::tryusequickdraw;
    level.killstreakfuncs["specialty_assists_ks"] = ::tryuseassists;
    level.killstreakfuncs["_specialty_blastshield_ks"] = ::tryuseblastshield;
    level.killstreakfuncs["specialty_detectexplosive_ks"] = ::tryusesitrep;
    level.killstreakfuncs["specialty_autospot_ks"] = ::tryuseironlungs;
    level.killstreakfuncs["specialty_bulletaccuracy_ks"] = ::tryusesteadyaim;
    level.killstreakfuncs["specialty_quieter_ks"] = ::tryusedeadsilence;
    level.killstreakfuncs["specialty_stalker_ks"] = ::tryusestalker;
    level.killstreakfuncs["all_perks_bonus"] = ::tryuseallperks;
}

tryuseallperks()
{

}

tryuseblindeye( var_0 )
{
    doperkfunctions( "specialty_blindeye" );
}

tryusepaint( var_0 )
{
    doperkfunctions( "specialty_paint" );
}

tryuseassists( var_0 )
{
    doperkfunctions( "specialty_assists" );
}

tryusesteadyaim( var_0 )
{
    doperkfunctions( "specialty_bulletaccuracy" );
}

tryusestalker( var_0 )
{
    doperkfunctions( "specialty_stalker" );
}

tryuseextremeconditioning( var_0 )
{
    doperkfunctions( "specialty_longersprint" );
}

tryusesleightofhand( var_0 )
{
    doperkfunctions( "specialty_fastreload" );
}

tryusescavenger( var_0 )
{
    doperkfunctions( "specialty_scavenger" );
}

tryusehardline( var_0 )
{
    doperkfunctions( "specialty_hardline" );
    maps\mp\killstreaks\_killstreaks::setstreakcounttonext();
}

tryusecoldblooded( var_0 )
{
    doperkfunctions( "specialty_coldblooded" );
}

tryusequickdraw( var_0 )
{
    doperkfunctions( "specialty_quickdraw" );
}

tryuseblastshield( var_0 )
{
    doperkfunctions( "_specialty_blastshield" );
}

tryusesitrep( var_0 )
{
    doperkfunctions( "specialty_detectexplosive" );
}

tryuseironlungs( var_0 )
{
    doperkfunctions( "specialty_autospot" );
}

tryuseassassin( var_0 )
{
    doperkfunctions( "specialty_heartbreaker" );
}

tryusedeadsilence( var_0 )
{
    doperkfunctions( "specialty_quieter" );
}

doperkfunctions( var_0 )
{
    maps\mp\_utility::giveperk( var_0, 0 );
    thread watchdeath( var_0 );
    thread checkforperkupgrade( var_0 );
    maps\mp\_matchdata::logkillstreakevent( var_0 + "_ks", self.origin );
}

watchdeath( var_0 )
{
    self endon( "disconnect" );
    self waittill( "death" );
    maps\mp\_utility::_unsetperk( var_0 );
    maps\mp\_utility::_unsetextraperks( var_0 );
}

checkforperkupgrade( var_0 )
{
    var_1 = maps\mp\gametypes\_class::getperkupgrade( var_0 );

    if ( var_1 != "specialty_null" )
    {
        maps\mp\_utility::giveperk( var_1, 0 );
        thread watchdeath( var_1 );
    }
}

isperkstreakon( var_0 )
{
    for ( var_1 = 1; var_1 < 4; var_1++ )
    {
        if ( isdefined( self.pers["killstreaks"][var_1].streakname ) && self.pers["killstreaks"][var_1].streakname == var_0 )
        {
            if ( self.pers["killstreaks"][var_1].available )
                return 1;
        }
    }

    return 0;
}
