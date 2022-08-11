// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

init()
{
    precachemodel( "prop_molotov_cocktail" );
    precacheitem( "molotov" );
    level._effect["molotov_trail_F"] = loadfx( "fire/molotov_fire_grow_runner" );
    level._effect["molotov_throw"] = loadfx( "fire/molotov_bottle_fire" );
    level._id_0C59["generic"]["molotov_throw"] = %exposed_fast_grenade_b2;
}

_id_528C( var_0, var_1 )
{
    self endon( "death" );
    thread maps\_anim::_id_11C1( self, "molotov_throw" );
    self waittillmatch( "single anim", "grenade_right" );
    var_2 = self gettagorigin( "tag_inhand" );
    var_3 = spawn( "script_model", var_2 );
    var_3 setmodel( "prop_molotov_cocktail" );
    var_3 linkto( self, "tag_inhand" );
    self waittillmatch( "single anim", "fire" );
    var_3 delete();
    var_2 = self gettagorigin( "tag_inhand" );
    childthread _id_528D( var_2, var_0, var_1 );
}

_id_528D( var_0, var_1, var_2 )
{
    var_3 = magicgrenade( "molotov", var_0, var_1.origin, 5 );

    if ( !isdefined( var_3 ) )
        return;

    var_3 waittill( "death" );

    if ( isdefined( var_1.script_exploder ) )
        common_scripts\utility::exploder( var_1.script_exploder );

    if ( isdefined( var_2 ) )
    {
        var_4 = vectortoangles( var_1.origin - var_0 );
        var_5 = var_3.origin;
        var_6 = bullettrace( var_5, var_5 - ( 0.0, 0.0, 5000.0 ), 0 );
        var_5 = var_6["position"];
        var_7 = spawn( "script_model", var_5 );
        var_7 setmodel( "tag_origin" );
        var_7.angles = ( 270.0, 180.0, 180.0 );
        var_8 = spawn( "script_model", var_5 );
        var_8 setmodel( "tag_origin" );
        var_8.angles = ( 0.0, 0.0, 0.0 );
        var_7 linkto( var_8 );
        var_8.angles = ( 0.0, 180.0, 0.0 ) + ( 0, var_4[1], 0 );
        playfxontag( common_scripts\utility::getfx( "molotov_trail_F" ), var_7, "tag_origin" );

        for ( var_9 = 0; var_9 < 20; var_9++ )
        {
            var_10 = anglestoforward( var_4 );
            var_11 = var_5 + var_10 * ( var_9 * 10 ) + ( 0.0, 0.0, 4.0 );
            radiusdamage( var_11, 32, 100, 100 );
            wait 0.05;
        }
    }
}
