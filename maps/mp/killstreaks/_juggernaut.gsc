// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.juggsettings = [];
    level.juggsettings["juggernaut"] = spawnstruct();
    level.juggsettings["juggernaut"].splashusedname = "used_juggernaut";
    level.juggsettings["juggernaut"].overlay = "goggles_overlay";
    level.juggsettings["juggernaut_recon"] = spawnstruct();
    level.juggsettings["juggernaut_recon"].splashusedname = "used_juggernaut";
    level.juggsettings["juggernaut_recon"].overlay = "goggles_overlay";

    foreach ( var_1 in level.juggsettings )
        precacheshader( var_1.overlay );
}

givejuggernaut( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.05;

    if ( isdefined( self.haslightarmor ) && self.haslightarmor == 1 )
        maps\mp\perks\_perkfunctions::removelightarmor( self.previousmaxhealth );

    if ( maps\mp\_utility::_hasperk( "specialty_explosivebullets" ) )
        maps\mp\_utility::_unsetperk( "specialty_explosivebullets" );

    switch ( var_0 )
    {
        case "juggernaut":
            self.isjuggernaut = 1;
            self.juggmovespeedscaler = 0.65;
            maps\mp\gametypes\_class::giveloadout( self.pers["team"], var_0, 0, 0 );
            self.movespeedscaler = 0.65;
            break;
        case "juggernaut_recon":
            self.isjuggernautrecon = 1;
            self.juggmovespeedscaler = 0.75;
            maps\mp\gametypes\_class::giveloadout( self.pers["team"], var_0, 0, 0 );
            self.movespeedscaler = 0.75;
            var_1 = spawn( "script_model", self.origin );
            var_1.team = self.team;
            var_1 makeportableradar( self );
            self.personalradar = var_1;
            thread radarmover( var_1 );
            break;
    }

    maps\mp\gametypes\_weapons::updatemovespeedscale();
    self disableweaponpickup();

    if ( !getdvarint( "camera_thirdPerson" ) )
    {
        self.juggernautoverlay = newclienthudelem( self );
        self.juggernautoverlay.x = 0;
        self.juggernautoverlay.y = 0;
        self.juggernautoverlay.alignx = "left";
        self.juggernautoverlay.aligny = "top";
        self.juggernautoverlay.horzalign = "fullscreen";
        self.juggernautoverlay.vertalign = "fullscreen";
        self.juggernautoverlay setshader( level.juggsettings[var_0].overlay, 640, 480 );
        self.juggernautoverlay.sort = -10;
        self.juggernautoverlay.archived = 1;
        self.juggernautoverlay.hidein3rdperson = 1;
    }

    thread juggernautsounds();
    self setperk( "specialty_radarjuggernaut", 1, 0 );
    thread maps\mp\_utility::teamplayercardsplash( level.juggsettings[var_0].splashusedname, self );

    if ( self.streaktype == "specialist" )
        thread maps\mp\killstreaks\_killstreaks::clearkillstreaks();
    else
        thread maps\mp\killstreaks\_killstreaks::updatekillstreaks( 1 );

    thread juggremover();

    if ( isdefined( self.carryflag ) )
    {
        wait 0.05;
        self attach( self.carryflag, "J_spine4", 1 );
    }

    level notify( "juggernaut_equipped", self );
    maps\mp\_matchdata::logkillstreakevent( "juggernaut", self.origin );
}

juggernautsounds()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );

    for (;;)
    {
        wait 3.0;
        self playsound( "juggernaut_breathing_sound" );
    }
}

radarmover( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    self endon( "jugdar_removed" );

    for (;;)
    {
        var_0 moveto( self.origin, 0.05 );
        wait 0.05;
    }
}

juggremover()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    thread juggremoveongameended();
    thread juggremoveradarongameended();
    common_scripts\utility::waittill_any( "death", "joined_team", "joined_spectators", "lost_juggernaut" );
    self enableweaponpickup();
    self.isjuggernaut = 0;
    self.isjuggernautdef = 0;
    self.isjuggernautgl = 0;
    self.isjuggernautrecon = 0;

    if ( isdefined( self.juggernautoverlay ) )
        self.juggernautoverlay destroy();

    self unsetperk( "specialty_radarjuggernaut", 1 );

    if ( isdefined( self.personalradar ) )
    {
        self notify( "jugdar_removed" );
        level maps\mp\gametypes\_portable_radar::deleteportableradar( self.personalradar );
        self.personalradar = undefined;
    }

    self notify( "jugg_removed" );
}

juggremoveongameended()
{
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    level waittill( "game_ended" );

    if ( isdefined( self.juggernautoverlay ) )
        self.juggernautoverlay destroy();
}

juggremoveradarongameended()
{
    self endon( "jugg_removed" );
    level endon( "game_ended" );
    var_0 = self.personalradar;
    self waittill( "disconnect" );

    if ( isdefined( var_0 ) )
        level maps\mp\gametypes\_portable_radar::deleteportableradar( var_0 );
}
