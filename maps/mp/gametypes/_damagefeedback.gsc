// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "damage_feedback" );
    precacheshader( "damage_feedback_j" );
    precacheshader( "damage_feedback_lightarmor" );
    precacheshader( "damage_feedback_juggernaut" );
    precacheshader( "scavenger_pickup" );
    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.hud_damagefeedback = newclienthudelem( var_0 );
        var_0.hud_damagefeedback.horzalign = "center";
        var_0.hud_damagefeedback.vertalign = "middle";
        var_0.hud_damagefeedback.x = -12;
        var_0.hud_damagefeedback.y = -12;
        var_0.hud_damagefeedback.alpha = 0;
        var_0.hud_damagefeedback.archived = 1;
        var_0.hud_damagefeedback setshader( "damage_feedback", 24, 48 );
    }
}

updatedamagefeedback( var_0 )
{
    if ( !isplayer( self ) )
        return;

    var_1 = -12;
    var_2 = -12;

    if ( getdvarint( "camera_thirdPerson" ) )
        var_3 = self getthirdpersoncrosshairoffset() * 240;
    else
        var_3 = getdvarfloat( "cg_crosshairVerticalOffset" ) * 240;

    if ( level.splitscreen || self issplitscreenplayer() )
        var_3 *= 0.5;

    var_4 = 0;
    var_5 = 1;

    if ( var_0 == "hitBodyArmor" )
    {
        self.hud_damagefeedback setshader( "damage_feedback_j", 24, 48 );
        self playlocalsound( "MP_hit_alert" );
    }
    else if ( var_0 == "hitLightArmor" )
    {
        self.hud_damagefeedback setshader( "damage_feedback_lightarmor", 24, 48 );
        self playlocalsound( "MP_hit_alert" );
    }
    else if ( var_0 == "hitJuggernaut" )
    {
        self.hud_damagefeedback setshader( "damage_feedback_juggernaut", 24, 48 );
        self playlocalsound( "MP_hit_alert" );
    }
    else if ( var_0 == "none" )
        return;
    else if ( var_0 == "scavenger" && !level.hardcoremode )
    {
        var_1 = -36;
        var_2 = 32;
        self.hud_damagefeedback setshader( "scavenger_pickup", 64, 32 );
        var_4 = 2.5;
    }
    else
    {
        self.hud_damagefeedback setshader( "damage_feedback", 24, 48 );
        self playlocalsound( "MP_hit_alert" );
    }

    self.hud_damagefeedback.alpha = var_5;

    if ( var_4 != 0 )
        self.hud_damagefeedback fadeovertime( var_4 );
    else
        self.hud_damagefeedback fadeovertime( 1 );

    self.hud_damagefeedback.alpha = 0;

    if ( self.hud_damagefeedback.x != var_1 )
        self.hud_damagefeedback.x = var_1;

    var_2 -= int( var_3 );

    if ( self.hud_damagefeedback.y != var_2 )
        self.hud_damagefeedback.y = var_2;
}
